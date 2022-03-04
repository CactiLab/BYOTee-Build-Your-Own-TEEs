#include "untrusted_app.h"

#include <stdio.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <linux/gpio.h>
#include <string.h>
#include <time.h>
volatile cmd_channel *c;
/*Bench mark start*/
/* BEEBS slre benchmark

   Copyright (c) 2004-2013 Sergey Lyubka <valenok@gmail.com>
   Copyright (c) 2013 Cesanta Software Limited All rights reserved

   This version, copyright (C) 2014-2019 Embecosm Limited and University of
   Bristol

   Contributor James Pallister <james.pallister@bristol.ac.uk>
   Contributor Jeremy Bennett <jeremy.bennett@embecosm.com>

   This file is part of Embench and was formerly part of the Bristol/Embecosm
   Embedded Benchmark Suite.

   SPDX-License-Identifier: GPL-3.0-or-later */


/* This scale factor will be changed to equalise the runtime of the
   benchmarks. */
#define LOCAL_SCALE_FACTOR 110

#include <stdio.h>
#include <ctype.h>
#include <string.h>

#include "slre.h"

#define MAX_BRANCHES 100
#define MAX_BRACKETS 100
#define ARRAY_SIZE(ar) (int) (sizeof(ar) / sizeof((ar)[0]))
#define FAIL_IF(condition, error_code) if (condition) return (error_code)

#ifdef SLRE_DEBUG
#define DBG(x) printf x
#else
#define DBG(x)
#endif

struct bracket_pair
{
  const char *ptr;		/* Points to the first char after '(' in regex  */
  int len;			/* Length of the text between '(' and ')'       */
  int branches;			/* Index in the branches array for this pair    */
  int num_branches;		/* Number of '|' in this bracket pair           */
};

struct branch
{
  int bracket_index;		/* index for 'struct bracket_pair brackets' */
  /* array defined below                      */
  const char *schlong;		/* points to the '|' character in the regex */
};

struct regex_info
{
  /*
   * Describes all bracket pairs in the regular expression.
   * First entry is always present, and grabs the whole regex.
   */
  struct bracket_pair brackets[MAX_BRACKETS];
  int num_brackets;

  /*
   * Describes alternations ('|' operators) in the regular expression.
   * Each branch falls into a specific branch pair.
   */
  struct branch branches[MAX_BRANCHES];
  int num_branches;

  /* Array of captures provided by the user */
  struct slre_cap *caps;
  int num_caps;

  /* E.g. IGNORE_CASE. See enum below */
  int flags;
};
enum
{ IGNORE_CASE = 1 };

static int
is_metacharacter (const unsigned char *s)
{
  static const char *metacharacters = "^$().[]*+?|\\Ssd";
  return strchr (metacharacters, *s) != NULL;
}

static int
op_len (const char *re)
{
  return re[0] == '\\' && re[1] == 'x' ? 4 : re[0] == '\\' ? 2 : 1;
}

static int
set_len (const char *re, int re_len)
{
  int len = 0;

  while (len < re_len && re[len] != ']')
    {
      len += op_len (re + len);
    }

  return len <= re_len ? len + 1 : -1;
}

static int
get_op_len (const char *re, int re_len)
{
  return re[0] == '[' ? set_len (re + 1, re_len - 1) + 1 : op_len (re);
}

static int
is_quantifier (const char *re)
{
  return re[0] == '*' || re[0] == '+' || re[0] == '?';
}

static int
toi (int x)
{
  return isdigit (x) ? x - '0' : x - 'W';
}

static int
hextoi (const unsigned char *s)
{
  return (toi (tolower (s[0])) << 4) | toi (tolower (s[1]));
}

static int
match_op (const unsigned char *re, const unsigned char *s,
	  struct regex_info *info)
{
  int result = 0;
  switch (*re)
    {
    case '\\':
      /* Metacharacters */
      switch (re[1])
	{
	case 'S':
	  FAIL_IF (isspace (*s), SLRE_NO_MATCH);
	  result++;
	  break;

	case 's':
	  FAIL_IF (!isspace (*s), SLRE_NO_MATCH);
	  result++;
	  break;

	case 'd':
	  FAIL_IF (!isdigit (*s), SLRE_NO_MATCH);
	  result++;
	  break;

	case 'x':
	  /* Match byte, \xHH where HH is hexadecimal byte representaion */
	  FAIL_IF (hextoi (re + 2) != *s, SLRE_NO_MATCH);
	  result++;
	  break;

	default:
	  /* Valid metacharacter check is done in bar() */
	  FAIL_IF (re[1] != s[0], SLRE_NO_MATCH);
	  result++;
	  break;
	}
      break;

    case '|':
      FAIL_IF (1, SLRE_INTERNAL_ERROR);
      break;
    case '$':
      FAIL_IF (1, SLRE_NO_MATCH);
      break;
    case '.':
      result++;
      break;

    default:
      if (info->flags & IGNORE_CASE)
	{
	  FAIL_IF (tolower (*re) != tolower (*s), SLRE_NO_MATCH);
	}
      else
	{
	  FAIL_IF (*re != *s, SLRE_NO_MATCH);
	}
      result++;
      break;
    }

  return result;
}

static int
match_set (const char *re, int re_len, const char *s, struct regex_info *info)
{
  int len = 0, result = -1, invert = re[0] == '^';

  if (invert)
    re++, re_len--;

  while (len <= re_len && re[len] != ']' && result <= 0)
    {
      /* Support character range */
      if (re[len] != '-' && re[len + 1] == '-' && re[len + 2] != ']' &&
	  re[len + 2] != '\0')
	{
	  result = info->flags && IGNORE_CASE ?
	    *s >= re[len] && *s <= re[len + 2] :
	    tolower ((int) *s) >= tolower ((int) re[len])
	    && tolower ((int) *s) <= tolower ((int) re[len + 2]);
	  len += 3;
	}
      else
	{
	  result =
	    match_op ((unsigned char *) re + len, (unsigned char *) s, info);
	  len += op_len (re + len);
	}
    }
  return (!invert && result > 0) || (invert && result <= 0) ? 1 : -1;
}

static int doh (const char *s, int s_len, struct regex_info *info, int bi);

static int
bar (const char *re, int re_len, const char *s, int s_len,
     struct regex_info *info, int bi)
{
  /* i is offset in re, j is offset in s, bi is brackets index */
  int i, j, n, step;

  for (i = j = 0; i < re_len && j <= s_len; i += step)
    {

      /* Handle quantifiers. Get the length of the chunk. */
      step = re[i] == '(' ? info->brackets[bi + 1].len + 2 :
	get_op_len (re + i, re_len - i);

      DBG (("%s [%.*s] [%.*s] re_len=%d step=%d i=%d j=%d\n", __func__,
	    re_len - i, re + i, s_len - j, s + j, re_len, step, i, j));

      FAIL_IF (is_quantifier (&re[i]), SLRE_UNEXPECTED_QUANTIFIER);
      FAIL_IF (step <= 0, SLRE_INVALID_CHARACTER_SET);

      if (i + step < re_len && is_quantifier (re + i + step))
	{
	  DBG (("QUANTIFIER: [%.*s]%c [%.*s]\n", step, re + i,
		re[i + step], s_len - j, s + j));
	  if (re[i + step] == '?')
	    {
	      int result = bar (re + i, step, s + j, s_len - j, info, bi);
	      j += result > 0 ? result : 0;
	      i++;
	    }
	  else if (re[i + step] == '+' || re[i + step] == '*')
	    {
	      int j2 = j, nj = j, n1, n2 = -1, ni, non_greedy = 0;

	      /* Points to the regexp code after the quantifier */
	      ni = i + step + 1;
	      if (ni < re_len && re[ni] == '?')
		{
		  non_greedy = 1;
		  ni++;
		}

	      do
		{
		  if ((n1 =
		       bar (re + i, step, s + j2, s_len - j2, info, bi)) > 0)
		    {
		      j2 += n1;
		    }
		  if (re[i + step] == '+' && n1 < 0)
		    break;

		  if (ni >= re_len)
		    {
		      /* After quantifier, there is nothing */
		      nj = j2;
		    }
		  else if ((n2 = bar (re + ni, re_len - ni, s + j2,
				      s_len - j2, info, bi)) >= 0)
		    {
		      /* Regex after quantifier matched */
		      nj = j2 + n2;
		    }
		  if (nj > j && non_greedy)
		    break;
		}
	      while (n1 > 0);

	      if (n1 < 0 && re[i + step] == '*' &&
		  (n2 =
		   bar (re + ni, re_len - ni, s + j, s_len - j, info,
			bi)) > 0)
		{
		  nj = j + n2;
		}

	      DBG (("STAR/PLUS END: %d %d %d %d %d\n", j, nj, re_len - ni, n1,
		    n2));
	      FAIL_IF (re[i + step] == '+' && nj == j, SLRE_NO_MATCH);

	      /* If while loop body above was not executed for the * quantifier,  */
	      /* make sure the rest of the regex matches                          */
	      FAIL_IF (nj == j && ni < re_len && n2 < 0, SLRE_NO_MATCH);

	      /* Returning here cause we've matched the rest of RE already */
	      return nj;
	    }
	  continue;
	}

      if (re[i] == '[')
	{
	  n = match_set (re + i + 1, re_len - (i + 2), s + j, info);
	  DBG (("SET %.*s [%.*s] -> %d\n", step, re + i, s_len - j, s + j,
		n));
	  FAIL_IF (n <= 0, SLRE_NO_MATCH);
	  j += n;
	}
      else if (re[i] == '(')
	{
	  n = SLRE_NO_MATCH;
	  bi++;
	  FAIL_IF (bi >= info->num_brackets, SLRE_INTERNAL_ERROR);
	  DBG (("CAPTURING [%.*s] [%.*s] [%s]\n",
		step, re + i, s_len - j, s + j, re + i + step));

	  if (re_len - (i + step) <= 0)
	    {
	      /* Nothing follows brackets */
	      n = doh (s + j, s_len - j, info, bi);
	    }
	  else
	    {
	      int j2;
	      for (j2 = 0; j2 <= s_len - j; j2++)
		{
		  if ((n = doh (s + j, s_len - (j + j2), info, bi)) >= 0 &&
		      bar (re + i + step, re_len - (i + step),
			   s + j + n, s_len - (j + n), info, bi) >= 0)
		    break;
		}
	    }

	  DBG (("CAPTURED [%.*s] [%.*s]:%d\n", step, re + i, s_len - j, s + j,
		n));
	  FAIL_IF (n < 0, n);
	  if (info->caps != NULL)
	    {
	      info->caps[bi - 1].ptr = s + j;
	      info->caps[bi - 1].len = n;
	    }
	  j += n;
	}
      else if (re[i] == '^')
	{
	  FAIL_IF (j != 0, SLRE_NO_MATCH);
	}
      else if (re[i] == '$')
	{
	  FAIL_IF (j != s_len, SLRE_NO_MATCH);
	}
      else
	{
	  FAIL_IF (j >= s_len, SLRE_NO_MATCH);
	  n =
	    match_op ((unsigned char *) (re + i), (unsigned char *) (s + j),
		      info);
	  FAIL_IF (n <= 0, n);
	  j += n;
	}
    }

  return j;
}

/* Process branch points */
static int
doh (const char *s, int s_len, struct regex_info *info, int bi)
{
  const struct bracket_pair *b = &info->brackets[bi];
  int i = 0, len, result;
  const char *p;

  do
    {
      p = i == 0 ? b->ptr : info->branches[b->branches + i - 1].schlong + 1;
      len = b->num_branches == 0 ? b->len :
	i == b->num_branches ? b->ptr + b->len - p :
	info->branches[b->branches + i].schlong - p;
      DBG (("%s %d %d [%.*s] [%.*s]\n", __func__, bi, i, len, p, s_len, s));
      result = bar (p, len, s, s_len, info, bi);
      DBG (("%s <- %d\n", __func__, result));
    }
  while (result <= 0 && i++ < b->num_branches);	/* At least 1 iteration */

  return result;
}

static int
baz (const char *s, int s_len, struct regex_info *info)
{
  int i, result = -1, is_anchored = info->brackets[0].ptr[0] == '^';

  for (i = 0; i <= s_len; i++)
    {
      result = doh (s + i, s_len - i, info, 0);
      if (result >= 0)
	{
	  result += i;
	  break;
	}
      if (is_anchored)
	break;
    }

  return result;
}

static void
setup_branch_points (struct regex_info *info)
{
  int i, j;
  struct branch tmp;

  /* First, sort branches. Must be stable, no qsort. Use bubble algo. */
  for (i = 0; i < info->num_branches; i++)
    {
      for (j = i + 1; j < info->num_branches; j++)
	{
	  if (info->branches[i].bracket_index >
	      info->branches[j].bracket_index)
	    {
	      tmp = info->branches[i];
	      info->branches[i] = info->branches[j];
	      info->branches[j] = tmp;
	    }
	}
    }

  /*
   * For each bracket, set their branch points. This way, for every bracket
   * (i.e. every chunk of regex) we know all branch points before matching.
   */
  for (i = j = 0; i < info->num_brackets; i++)
    {
      info->brackets[i].num_branches = 0;
      info->brackets[i].branches = j;
      while (j < info->num_branches && info->branches[j].bracket_index == i)
	{
	  info->brackets[i].num_branches++;
	  j++;
	}
    }
}

static int
foo (const char *re, int re_len, const char *s, int s_len,
     struct regex_info *info)
{
  int i, step, depth = 0;

  /* First bracket captures everything */
  info->brackets[0].ptr = re;
  info->brackets[0].len = re_len;
  info->num_brackets = 1;

  /* Make a single pass over regex string, memorize brackets and branches */
  for (i = 0; i < re_len; i += step)
    {
      step = get_op_len (re + i, re_len - i);

      if (re[i] == '|')
	{
	  FAIL_IF (info->num_branches >= ARRAY_SIZE (info->branches),
		   SLRE_TOO_MANY_BRANCHES);
	  info->branches[info->num_branches].bracket_index =
	    info->brackets[info->num_brackets - 1].len == -1 ?
	    info->num_brackets - 1 : depth;
	  info->branches[info->num_branches].schlong = &re[i];
	  info->num_branches++;
	}
      else if (re[i] == '\\')
	{
	  FAIL_IF (i >= re_len - 1, SLRE_INVALID_METACHARACTER);
	  if (re[i + 1] == 'x')
	    {
	      /* Hex digit specification must follow */
	      FAIL_IF (re[i + 1] == 'x' && i >= re_len - 3,
		       SLRE_INVALID_METACHARACTER);
	      FAIL_IF (re[i + 1] == 'x'
		       && !(isxdigit ((unsigned char) re[i + 2])
			    && isxdigit ((unsigned char) re[i + 3])),
		       SLRE_INVALID_METACHARACTER);
	    }
	  else
	    {
	      FAIL_IF (!is_metacharacter ((unsigned char *) re + i + 1),
		       SLRE_INVALID_METACHARACTER);
	    }
	}
      else if (re[i] == '(')
	{
	  FAIL_IF (info->num_brackets >= ARRAY_SIZE (info->brackets),
		   SLRE_TOO_MANY_BRACKETS);
	  depth++;		/* Order is important here. Depth increments first. */
	  info->brackets[info->num_brackets].ptr = re + i + 1;
	  info->brackets[info->num_brackets].len = -1;
	  info->num_brackets++;
	  FAIL_IF (info->num_caps > 0
		   && info->num_brackets - 1 > info->num_caps,
		   SLRE_CAPS_ARRAY_TOO_SMALL);
	}
      else if (re[i] == ')')
	{
	  int ind = info->brackets[info->num_brackets - 1].len == -1 ?
	    info->num_brackets - 1 : depth;
	  info->brackets[ind].len = &re[i] - info->brackets[ind].ptr;
	  DBG (("SETTING BRACKET %d [%.*s]\n",
		ind, info->brackets[ind].len, info->brackets[ind].ptr));
	  depth--;
	  FAIL_IF (depth < 0, SLRE_UNBALANCED_BRACKETS);
	  FAIL_IF (i > 0 && re[i - 1] == '(', SLRE_NO_MATCH);
	}
    }

  FAIL_IF (depth != 0, SLRE_UNBALANCED_BRACKETS);
  setup_branch_points (info);

  return baz (s, s_len, info);
}

int
slre_match (const char *regexp, const char *s, int s_len,
	    struct slre_cap *caps, int num_caps)
{
  struct regex_info info;

  /* Initialize info structure */
  info.flags = info.num_brackets = info.num_branches = 0;
  info.num_caps = num_caps;
  info.caps = caps;

  DBG (("========================> [%s] [%.*s]\n", regexp, s_len, s));

  /* Handle regexp flags. At the moment, only 'i' is supported */
  if (memcmp (regexp, "(?i)", 4) == 0)
    {
      info.flags |= IGNORE_CASE;
      regexp += 4;
    }

  return foo (regexp, strlen (regexp), s, s_len, &info);
}

char text[] = "abbbababaabccababcacbcbcbabbabcbabcabcbbcbbac";
char *regexes[] = { "(ab)+", "(b.+)+", "a[ab]*", "([ab^c][ab^c])+" };

void
initialise_benchmark (void)
{
}


static int benchmark_body (int  rpt);

void
warm_caches (int  heat)
{
  int  res = benchmark_body (heat);

  return;
}
#define CPU_MHZ 1

int
benchmark (void)
{
  return benchmark_body (LOCAL_SCALE_FACTOR * CPU_MHZ);
}


static int __attribute__ ((noinline))
benchmark_body (int rpt)
{
  volatile int ret;
  int j;

  for (j = 0; j < rpt; j++)
    {
      int i;
      int len = strlen (text);
      struct slre_cap captures;
      ret = 0;

      for (i = 0; i < 4; ++i)
	{
	  ret += slre_match (regexes[i], text, len, &captures, 1);
	}
    }

  return ret;
}


int
verify_benchmark (int r)
{
  return 102 == r;
}


/*
   Local Variables:
   mode: C
   c-file-style: "gnu"
   End:
*/

/*end bench mark*/
//////////////////////// UTILITY FUNCTIONS ////////////////////////
int secure_drm_load = 0;
// sends a command to the CTEE using the shared command channel and interrupt
void send_command(int cmd)
{
    memcpy((void *)&c->cmd, &cmd, 1);

    //trigger gpio interrupt
    system("devmem 0x41200000 32 0");
    system("devmem 0x41200000 32 1");
}

void specify_ssc_command(int cmd)
{
    memcpy((void *)&c->drm_chnl.ssc_cmd, &cmd, 1);
}

void specify_aes_ssc_command(int cmd)
{
    memcpy((void *)&c->aes_cmd, &cmd, 1);
}

void parse_input(char *input, char **cmd, char **arg1, char **arg2)
{
    *cmd = strtok(input, " \r\n");
    *arg1 = strtok(NULL, " \r\n");
    *arg2 = strtok(NULL, " \r\n");
}

// prints the help message while not in playback
void print_help()
{
    mp_printf("Untrusted Application options:\r\n");
    mp_printf("  load <fileName>: load SSC module to be executed in CTEE\r\n");
    mp_printf("  exe: Execute the loaded SSC module\r\n");
    mp_printf("  exit: Clean the loaded SSC module from CTEE\r\n");
    mp_printf("  quit: To quit the untrusted application\r\n");
}

void secure_drm_print_help()
{
    mp_printf("Secure_DRM SSC options:\r\n");
    mp_printf("  login <userName> <pin>: Secure_DRM-> Loging with <userName> and <pin>\r\n");
    mp_printf("  logout: Secure_DRM-> Logout current logged in user\r\n");
    mp_printf("  Query <fileName>: Secure_DRM-> Query Song information\r\n");
    mp_printf("  Share <fileName> <userName>: Secure_DRM-> Share <fileName> with <userName>\r\n");
    mp_printf("  Play <fileName>: Secure_DRM-> Play the <fileName> media file\r\n");
    mp_printf("  digital_out <song.drm>: play the song to digital out\r\n");
}

void print_playback_help()
{
    mp_printf("Secure DRM Player play back options:\r\n");
    mp_printf("  stop: stop playing the song\r\n");
    mp_printf("  pause: pause the song\r\n");
    mp_printf("  resume: resume the paused song\r\n");
    mp_printf("  restart: restart the song\r\n");
    mp_printf("  help: display this message\r\n");
}

void query_BYOT_runtime()
{
    send_command(QUERY_DRM);

    while (c->drm_state == STOPPED)
        continue; // wait for DRM to start working

    while (c->drm_state == WORKING)
        continue; // wait for DRM to dump file

    mp_printf("Initialization Done!!\r\n");
}

// loads a file into the song buffer with the associate
// returns the size of the file or 0 on error
size_t load_file(char *fname, char *file_buf)
{
    int fd;
    struct stat sb;

    fd = open(fname, O_RDONLY);

    if (fd == -1)
    {
        mp_printf("Failed to open file! Error = %d\r\n", errno);
        return 0;
    }

    if (fstat(fd, &sb) == -1)
    {
        mp_printf("Failed to stat file! Error = %d\r\n", errno);
        return 0;
    }

    read(fd, file_buf, sb.st_size);
    close(fd);

    mp_printf("Loaded file into shared buffer (%dB)\r\n", sb.st_size);
    return sb.st_size;
}

void login(char *username, char *pin)
{

    if (!username || !pin)
    {
        mp_printf("Invalid user name/PIN\r\n");
        print_help();
        return;
    }

    specify_ssc_command(LOGIN);
    strncpy((void *)c->drm_chnl.username, username, USERNAME_SZ);
    strncpy((void *)c->drm_chnl.pin, pin, MAX_PIN_SZ);
    send_command(SSC_COMMAND);

    while (c->drm_state == STOPPED)
        continue; // wait for DRM to start working

    while (c->drm_state == WORKING)
        continue; // wait for DRM to dump file
}

void logout()
{
    specify_ssc_command(LOGOUT);
    send_command(SSC_COMMAND);
}
//////////////////////// MAIN ////////////////////////
void load_code(char *fileName)
{
    c->file_size = (int)load_file(fileName, (void *)&c->code);
    // load file into shared buffer
    if (!c->file_size)
    {
        mp_printf("Failed to load code!\r\n");
        return -1;
    }

    send_command(LOAD_CODE);

    while (c->drm_state == STOPPED)
        continue; // wait for DRM to start working

    while (c->drm_state == WORKING)
        continue; // wait for DRM to dump file

    mp_printf("Finished loading file\r\n");

    if (!strncmp(fileName, "Secure_DRM", sizeof("Secure_DRM")))
    {
        secure_drm_load = 1;
        secure_drm_print_help();
    }
}

void execute_SSC()
{
    send_command(EXECUTE);

    while (c->drm_state == STOPPED)
        continue; // wait for DRM to start working

    while (c->drm_state == WORKING)
        continue; // wait for DRM to dump file

    mp_printf("Finished Executing SSC file\r\n");
}

static void phex(unsigned char *str)
{

    unsigned char len = 16;
    unsigned char i;

    for (i = 0; i < len; ++i)
        printf("%.2x", str[i]);

    printf("\n");
}
void encrypt_SSC()
{
    unsigned char test_plain_text[64] = {(unsigned char)0x6b, (unsigned char)0xc1, (unsigned char)0xbe, (unsigned char)0xe2, (unsigned char)0x2e, (unsigned char)0x40, (unsigned char)0x9f, (unsigned char)0x96, (unsigned char)0xe9, (unsigned char)0x3d, (unsigned char)0x7e, (unsigned char)0x11, (unsigned char)0x73, (unsigned char)0x93, (unsigned char)0x17, (unsigned char)0x2a,
                                         (unsigned char)0xae, (unsigned char)0x2d, (unsigned char)0x8a, (unsigned char)0x57, (unsigned char)0x1e, (unsigned char)0x03, (unsigned char)0xac, (unsigned char)0x9c, (unsigned char)0x9e, (unsigned char)0xb7, (unsigned char)0x6f, (unsigned char)0xac, (unsigned char)0x45, (unsigned char)0xaf, (unsigned char)0x8e, (unsigned char)0x51,
                                         (unsigned char)0x30, (unsigned char)0xc8, (unsigned char)0x1c, (unsigned char)0x46, (unsigned char)0xa3, (unsigned char)0x5c, (unsigned char)0xe4, (unsigned char)0x11, (unsigned char)0xe5, (unsigned char)0xfb, (unsigned char)0xc1, (unsigned char)0x19, (unsigned char)0x1a, (unsigned char)0x0a, (unsigned char)0x52, (unsigned char)0xef,
                                         (unsigned char)0xf6, (unsigned char)0x9f, (unsigned char)0x24, (unsigned char)0x45, (unsigned char)0xdf, (unsigned char)0x4f, (unsigned char)0x9b, (unsigned char)0x17, (unsigned char)0xad, (unsigned char)0x2b, (unsigned char)0x41, (unsigned char)0x7b, (unsigned char)0xe6, (unsigned char)0x6c, (unsigned char)0x37, (unsigned char)0x10};

    memcpy((void *)&c->enc_dec_data, &test_plain_text, ENC_DEC_DATA_SIZE);
    mp_printf("plain text:\r\n");

    for (unsigned char i = (unsigned char)0; i < (unsigned char)4; ++i)
    {
        phex((void *)&c->enc_dec_data + i * (unsigned char)ENC_DEC_BLOCK_SIZE);
    }

    printf("\n");

    specify_aes_ssc_command(ENC);
    send_command(SSC_COMMAND);

    while (c->drm_state == STOPPED)
        continue; // wait for DRM to start working

    while (c->drm_state == WORKING)
        continue; // wait for DRM to dump file

    mp_printf("Cipher text received:\r\n");

    for (unsigned char i = (unsigned char)0; i < (unsigned char)4; ++i)
    {
        phex((void *)&c->enc_dec_data + i * (unsigned char)ENC_DEC_BLOCK_SIZE);
    }
    printf("\n");
}
void decrypt_SSC()
{
    unsigned char test_cipher_text[64] = {(unsigned char)0x3a, (unsigned char)0xd7, (unsigned char)0x7b, (unsigned char)0xb4, (unsigned char)0x0d, (unsigned char)0x7a, (unsigned char)0x36, (unsigned char)0x60, (unsigned char)0xa8, (unsigned char)0x9e, (unsigned char)0xca, (unsigned char)0xf3, (unsigned char)0x24, (unsigned char)0x66, (unsigned char)0xef, (unsigned char)0x97,
                                          (unsigned char)0xf5, (unsigned char)0xd3, (unsigned char)0xd5, (unsigned char)0x85, (unsigned char)0x03, (unsigned char)0xb9, (unsigned char)0x69, (unsigned char)0x9d, (unsigned char)0xe7, (unsigned char)0x85, (unsigned char)0x89, (unsigned char)0x5a, (unsigned char)0x96, (unsigned char)0xfd, (unsigned char)0xba, (unsigned char)0xaf,
                                          (unsigned char)0x43, (unsigned char)0xb1, (unsigned char)0xcd, (unsigned char)0x7f, (unsigned char)0x59, (unsigned char)0x8e, (unsigned char)0xce, (unsigned char)0x23, (unsigned char)0x88, (unsigned char)0x1b, (unsigned char)0x00, (unsigned char)0xe3, (unsigned char)0xed, (unsigned char)0x03, (unsigned char)0x06, (unsigned char)0x88,
                                          (unsigned char)0x7b, (unsigned char)0x0c, (unsigned char)0x78, (unsigned char)0x5e, (unsigned char)0x27, (unsigned char)0xe8, (unsigned char)0xad, (unsigned char)0x3f, (unsigned char)0x82, (unsigned char)0x23, (unsigned char)0x20, (unsigned char)0x71, (unsigned char)0x04, (unsigned char)0x72, (unsigned char)0x5d, (unsigned char)0xd4};

    memcpy((void *)&c->enc_dec_data, &test_cipher_text, ENC_DEC_DATA_SIZE);
    mp_printf("Cipher text:\r\n");

    for (unsigned char i = (unsigned char)0; i < (unsigned char)4; ++i)
    {
        phex((void *)&c->enc_dec_data + i * (unsigned char)ENC_DEC_BLOCK_SIZE);
    }
    printf("\n");

    specify_aes_ssc_command(DEC);
    send_command(SSC_COMMAND);

    while (c->drm_state == STOPPED)
        continue; // wait for DRM to start working

    while (c->drm_state == WORKING)
        continue; // wait for DRM to dump file

    mp_printf("Plain text received:\r\n");

    for (unsigned char i = (unsigned char)0; i < (unsigned char)4; ++i)
    {
        phex((void *)&c->enc_dec_data + i * (unsigned char)ENC_DEC_BLOCK_SIZE);
    }
    printf("\n");
}
void exit_SSC()
{
    send_command(EXIT);

    while (c->drm_state == STOPPED)
        continue; // wait for DRM to start working

    while (c->drm_state == WORKING)
        continue; // wait for DRM to dump file

    secure_drm_load = 0;
    mp_printf("Cleaned UP SSC\r\n");
}
// attempts to share a song with a user
void share_song(char *song_name, char *username)
{
    int fd;
    unsigned int length;
    ssize_t wrote, written = 0;

    specify_ssc_command(SHARE);

    if (!username)
    {
        mp_printf("Need song name and username\r\n");
        print_help();
        return;
    }
    // load the song into the shared buffer
    if (!load_file(song_name, (void *)&c->drm_chnl.song))
    {
        mp_printf("Failed to load song!\r\n");
        return;
    }

    strncpy((char *)c->drm_chnl.username, username, USERNAME_SZ);

    // drive DRM
    send_command(SSC_COMMAND);

    while (c->drm_state == STOPPED)
        continue; // wait for DRM to start working

    while (c->drm_state == WORKING)
        continue; // wait for DRM to share song

    // request was rejected if WAV length is 0
    length = c->drm_chnl.song.wav_size;

    if (length == 0)
    {
        mp_printf("Share rejected\r\n");
        return;
    }

    // open output file
    fd = open(song_name, O_WRONLY);

    if (fd == -1)
    {
        mp_printf("Failed to open file! Error = %d\r\n", errno);
        return;
    }
    // write song dump to file
    mp_printf("Writing song to file '%s' (%dB)\r\n", song_name, length);

    while (written < length)
    {
        wrote = write(fd, (char *)&c->drm_chnl.song + written, length - written);

        if (wrote == -1)
        {
            mp_printf("Error in writing file! Error = %d\r\n", errno);
            return;
        }

        written += wrote;
    }
    close(fd);
    mp_printf("Finished writing file\r\n");
}

void query_song(char *song_file_name)
{
    // load file into shared buffer
    if (!song_file_name)
    {
        mp_printf("Invalid file name\r\n");
        print_help();
        return;
    }

    specify_ssc_command(QUERY);

    if (!load_file(song_file_name, (void *)&c->drm_chnl.song))
    {
        mp_printf("Failed to load song file!\r\n");
        return -1;
    }
    send_command(SSC_COMMAND);

    while (c->drm_state == STOPPED)
        continue; // wait for DRM to start working

    while (c->drm_state == WORKING)
        continue; // wait for DRM to dump file

    mp_printf("Regions: %s", q_region_lookup(c->drm_chnl.query, 0));

    for (int i = 1; i < c->drm_chnl.query.num_regions; i++)
    {
        printf(", %s", q_region_lookup(c->drm_chnl.query, i));
    }

    printf("\r\n");

    mp_printf("Owner: %s", c->drm_chnl.query.owner);
    printf("\r\n");

    mp_printf("Authorized users: ");
    if (c->drm_chnl.query.num_users)
    {
        printf("%s", q_user_lookup(c->drm_chnl.query, 0));

        for (int i = 1; i < c->drm_chnl.query.num_users; i++)
        {
            printf(", %s", q_user_lookup(c->drm_chnl.query, i));
        }
    }
    printf("\r\n");
}

int play_song(char *song_name)
{
    char usr_cmd[USR_CMD_SZ + 1], *cmd = NULL, *arg1 = NULL, *arg2 = NULL;

    // load song into shared buffer
    if (!load_file(song_name, (void *)&c->drm_chnl.song))
    {
        mp_printf("Failed to load song!\r\n");
        return 0;
    }

    // drive the DRM
    specify_ssc_command(PLAY);
    send_command(SSC_COMMAND);

    while (c->drm_state == STOPPED)
        continue; // wait for DRM to start playing

    // play loop
    while (1)
    {
        // get a valid command
        do
        {
            print_prompt_msg(song_name);
            fgets(usr_cmd, USR_CMD_SZ, stdin);

            // exit playback loop if DRM has finished song
            if (c->drm_state == STOPPED)
            {
                mp_printf("Song finished\r\n");
                return 0;
            }
        } while (strlen(usr_cmd) < 2);

        // parse and handle command
        parse_input(usr_cmd, &cmd, &arg1, &arg2);
        if (!cmd)
        {
            continue;
        }
        else if (!strncmp(cmd, "help", sizeof("help")))
        {
            print_playback_help();
        }
        else if (!strncmp(cmd, "resume", sizeof("resume")))
        {
            specify_ssc_command(PLAY);
            send_command(SSC_COMMAND);
            usleep(200000); // wait for DRM to print
        }
        else if (!strncmp(cmd, "pause", sizeof("pause")))
        {
            specify_ssc_command(PAUSE);
            send_command(SSC_COMMAND);
            usleep(200000); // wait for DRM to print
        }
        else if (!strncmp(cmd, "stop", sizeof("stop")))
        {
            specify_ssc_command(STOP);
            send_command(SSC_COMMAND);
            usleep(200000); // wait for DRM to print
            break;
        }
        else if (!strncmp(cmd, "restart", sizeof("restart")))
        {
            specify_ssc_command(RESTART);
            send_command(SSC_COMMAND);
        }
        else if (!strncmp(cmd, "quit", sizeof("quit")))
        {
            mp_printf("Quitting...\r\n");
            specify_ssc_command(STOP);
            send_command(SSC_COMMAND);
            return -1;
        }
        else
        {
            mp_printf("Unrecognized command.\r\n\r\n");
            print_playback_help();
        }
    }

    return 0;
}

void digital_out(char *song_name)
{
    char fname[64];

    // load file into shared buffer
    if (!load_file(song_name, (void *)&c->drm_chnl.song))
    {
        mp_printf("Failed to load song!\r\n");
        return;
    }

    // drive DRM
    specify_ssc_command(DIGITAL_OUT);
    send_command(SSC_COMMAND);
    while (c->drm_state == STOPPED)
        continue; // wait for DRM to start working

    while (c->drm_state == WORKING)
        continue; // wait for DRM to dump file

    // open digital output file
    int written = 0, wrote, length = c->drm_chnl.song.file_size + 8;
    sprintf(fname, "%s.dout", song_name);
    int fd = open(fname, O_WRONLY | O_CREAT | O_TRUNC);

    if (fd == -1)
    {
        mp_printf("Failed to open file! Error = %d\r\n", errno);
        return;
    }

    // write song dump to file
    mp_printf("Writing song to file '%s' (%dB)\r\n", fname, length);

    while (written < length)
    {
        wrote = write(fd, (char *)&c->drm_chnl.song + written, length - written);

        if (wrote == -1)
        {
            mp_printf("Error in writing file! Error = %d \r\n", errno);
            return;
        }
        written += wrote;
    }
    close(fd);
    mp_printf("Finished writing file\r\n");
}
void generate_challenge_number()
{
    time_t t;
    srand((unsigned)time(&t));
    c->challenge_number = rand();
    mp_printf("Challenge number is %d\n", c->challenge_number);
}
void print_measurement()
{
    mp_printf("Computed preExeAtt measurement: ");

    for (int i = 0; i < MEASUREMENT_SIZE; i++)
    {
        printf("%02x", c->preExehash[i]);
    }
    printf("\r\n");
    mp_printf("Computed postExeAtt measurement: ");

    for (int i = 0; i < MEASUREMENT_SIZE; i++)
    {
        printf("%02x", c->postExehash[i]);
    }
    printf("\r\n");
}
int main(int argc, char **argv)
{
    int mem;
    char usr_cmd[USR_CMD_SZ + 1], *cmd = NULL, *arg1 = NULL, *arg2 = NULL;

    memset(usr_cmd, 0, USR_CMD_SZ + 1);
    // open command channel
    mem = open("/dev/uio0", O_RDWR);
    c = mmap(NULL, sizeof(cmd_channel), PROT_READ | PROT_WRITE, MAP_SHARED, mem, 0);

    if (c == MAP_FAILED)
    {
        mp_printf("MMAP Failed! Error = %d\r\n", errno);
        return -1;
    }
    
    mp_printf("Command channel open at %p (%dB)\r\n", c, sizeof(cmd_channel));

    // dump player information before command loop
    query_BYOT_runtime();
    mp_printf("Calling benchmark function!\n");
    double time_spent = 0.0;
    clock_t begin = clock();

   // int return_value = benchmark_body(1);
    int return_value = benchmark();
	if (verify_benchmark(return_value) == 1)
		mp_printf("Results Verified success \r\n");
	else
		mp_printf("Returnred value %d \r\n", return_value);

    clock_t end = clock();

    time_spent += (double)(end - begin) / CLOCKS_PER_SEC;

    mp_printf("Finished bench mark\n");
    mp_printf("Total execution time %f \r\n", time_spent);
    // go into command loop until quit is requested
    while (1)
    {
        // get command
        print_prompt();
        fgets(usr_cmd, USR_CMD_SZ, stdin);

        // parse and handle command
        parse_input(usr_cmd, &cmd, &arg1, &arg2);
        if (!cmd)
        {
            continue;
        }
        else if (!strncmp(cmd, "help", sizeof("help")))
        {
            print_help();

            if (secure_drm_load)
                secure_drm_print_help();
        }
        else if (!strncmp(cmd, "load", sizeof("load")))
        {
            load_code(arg1);
        }
        else if (!strncmp(cmd, "exe", sizeof("exe")))
        {
            execute_SSC();
        }
        else if (!strncmp(cmd, "exit", sizeof("exit")))
        {
            exit_SSC();
        }
        else if (!strncmp(cmd, "login", sizeof("login")))
        {
            login(arg1, arg2);
        }
        else if (!strncmp(cmd, "logout", sizeof("logout")))
        {
            logout();
        }
        else if (!strncmp(cmd, "query", sizeof("query")))
        {
            query_song(arg1);
        }
        else if (!strncmp(cmd, "share", sizeof("share")))
        {
            share_song(arg1, arg2);
        }
        else if (!strncmp(cmd, "play", sizeof("play")))
        {
            // break if exit was commanded in play loop
            if (play_song(arg1) < 0)
            {
                break;
            }
        }
        else if (!strncmp(cmd, "digital_out", sizeof("digital_out")))
        {
            digital_out(arg1);
        }
        else if (!strncmp(cmd, "encrypt", sizeof("encrypt")))
        {
            generate_challenge_number();
            encrypt_SSC();
            print_measurement();
        }
        else if (!strncmp(cmd, "decrypt", sizeof("decrypt")))
        {
            generate_challenge_number();
            decrypt_SSC();
            print_measurement();
        }
        else if (!strncmp(cmd, "quit", sizeof("quit")))
        {
            mp_printf("Exiting untrusted application.....\r\n");
            break;
        }
        else
        {
            mp_printf("Unrecognized command.\r\n\r\n");
            print_help();

            if (secure_drm_load)
                secure_drm_print_help();
        }
    }

    // unmap the command channel
    munmap((void *)c, sizeof(cmd_channel));

    return 0;
}

