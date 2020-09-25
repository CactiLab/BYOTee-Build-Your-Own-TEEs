/*
 * utils - various helper functions for venom
 *
 * Written by Philipp Lay <philipp.lay@illunis.net>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 */

#define _GNU_SOURCE

#include <sys/types.h>
#include <sys/stat.h>

#include <limits.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <libgen.h>
#include <ctype.h>

#include "utils2.h"



#ifdef HAVE_GETRANDOM
#include <linux/random.h>
#else

#define GRND_NONBLOCK	1
#define GRND_RANDOM	2

/*
 * getrandom - very simple emulation of linux syscall until i get the
 * real thing.
 */
int
getrandom(void *buf, size_t buflen, unsigned int flags)
{
	const char *devname = (flags & GRND_RANDOM) ? "/dev/random" : "/dev/urandom";
	int devflag = 0;
	int dev;
	int rval;

	if (flags & GRND_NONBLOCK)
		devflag |= O_NONBLOCK;

	dev = open(devname, devflag);
	if (dev == -1)
		return -1;

	rval = read(dev, buf, buflen);

	close(dev);

	return rval;
}
#endif

bool
secrand(void *buf, size_t len)
{
	uint8_t *ptr = (uint8_t *)buf;
	int n;
	int rc;

	if (len > 256)
		return false;

	/* try to read all random data without blocking */
	n = getrandom(ptr, len, GRND_NONBLOCK /*|GRND_RANDOM */);
	if (n == -1)
		return false;
	if (n == len)
		return true;

	/*
	 * we did'nt get everything on the first try... inform user
	 * and read more random now WITH blocking
	 */

	fprintf(stderr, "waiting for random... ");
	while (n < len) {
		rc = getrandom(ptr+n, len-n, GRND_RANDOM);
		if (rc == -1) {
			fprintf(stderr, "error\n");
			return false;
		}

		n += rc;
	}
	fprintf(stderr, "done\n");

	return true;
}

size_t
base64enc(char *out, const uint8_t *in, size_t len)
{
	static const char enctbl[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
	char *p = out;

	while (len >= 3) {
		*p++ = enctbl[in[0] >> 2];
		*p++ = enctbl[((in[0] << 4) | (in[1] >> 4)) & 0x3f];
		*p++ = enctbl[((in[1] << 2) | (in[2] >> 6)) & 0x3f];
		*p++ = enctbl[in[2] & 0x3f];

		len -= 3;
		in += 3;
	}

	if (len == 2) {
		*p++ = enctbl[in[0] >> 2];
		*p++ = enctbl[((in[0] << 4) | (in[1] >> 4)) & 0x3f];
		*p++ = enctbl[(in[1] << 2) & 0x3f];
	} else if (len == 1) {
		*p++ = enctbl[in[0] >> 2];
		*p++ = enctbl[(in[0] << 4) & 0x3f];
	}

	*p = '\0';

	return p-out;
}

size_t
base64dec(uint8_t *out, size_t max, const char *in)
{
	static const uint8_t dectbl[] = { 
		62, 0, 62, 0, 63,					/* +,-./	 */
		52, 53, 54, 55, 56, 57, 58, 59, 60, 61,			/* 0123456789	 */
		0, 0, 0, 0, 0, 0, 0, 					/* :;<=>?@	 */ 
		0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,		/* ABCDEFGHIJKLM */
		13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25,	/* NOPQRSTUVWXYZ */
		0, 0, 0, 0, 63, 0,					/* [\]^_`	 */
		26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38,	/* abcdefghijklm */
		39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51,	/* nopqrstuvwxyz */
	};

	uint8_t *p = out;
	uint8_t *endp = out + max;

	uint8_t buf[4];
	int n;

	do {
		for (n = 0; n < 4 && *in; in++) {
			if (isspace(*in)) continue;

			if (*in < '+' || *in > 'z')
				return 0;	/* error */;

			buf[n++] = dectbl[*in - '+'];
		}

		if (n > 1) {
			if (p < endp)
				*p = (buf[0] << 2) | (buf[1] >> 4);
			p++;

			if (n > 2) {
				if (p < endp)
					*p = (buf[1] << 4) | (buf[2] >> 2);
				p++;

				if (n > 3) {
					if (p < endp)
						*p = (buf[2] << 6) | buf[3];
					p++;
				}
			}
		} else if (n == 1)
			return 0;		/* error */

	} while (n == 4);

	return p-out;
}




#if 0

size_t
base64enc(uint8_t *out, const uint8_t *in, size_t len)
{
	static const char enctbl[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
	uint8_t *p = out;

	while (len >= 3) {
		*p++ = enctbl[in[0] >> 2];
		*p++ = enctbl[((in[0] << 4) | (in[1] >> 4)) & 0x3f];
		*p++ = enctbl[((in[1] << 2) | (in[2] >> 6)) & 0x3f];
		*p++ = enctbl[in[2] & 0x3f];

		len -= 3;
		in += 3;
	}

	if (len == 2) {
		*p++ = enctbl[in[0] >> 2];
		*p++ = enctbl[((in[0] << 4) | (in[1] >> 4)) & 0x3f];
		*p++ = enctbl[(in[1] << 2) & 0x3f];
	} else if (len == 1) {
		*p++ = enctbl[in[0] >> 2];
		*p++ = enctbl[(in[0] << 4) & 0x3f];
	}

	return p-out;
}


size_t
base64dec(uint8_t *out, const uint8_t *in, size_t len)
{
	static const uint8_t dectbl[] = { 
		62, 0, 62, 0, 63,					/* +,-./	 */
		52, 53, 54, 55, 56, 57, 58, 59, 60, 61,			/* 0123456789	 */
		0, 0, 0, 0, 0, 0, 0, 					/* :;<=>?@	 */ 
		0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,		/* ABCDEFGHIJKLM */
		13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25,	/* NOPQRSTUVWXYZ */
		0, 0, 0, 0, 63, 0,					/* [\]^_`	 */
		26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38,	/* abcdefghijklm */
		39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51,	/* nopqrstuvwxyz */
	};

	const uint8_t * const endp = in + len;
	uint8_t *p = out;

	uint8_t buf[4];
	int n;

	do {
		for (n = 0; n < 4 && in < endp; in++) {
			if (isspace(*in)) continue;

			if (*in < '+' || *in > 'z')
				return 0;	/* error */;

			buf[n++] = dectbl[*in - '+'];
		}

		if (n > 1) {
			*p++ = (buf[0] << 2) | (buf[1] >> 4);
			if (n > 2) {
				*p++ = (buf[1] << 4) | (buf[2] >> 2);
				if (n > 3)
					*p++ = (buf[2] << 6) | buf[3];
			}
		} else if (n == 1)
			return 0;		/* error */

	} while (n == 4);

	return p-out;
}
#endif

size_t
fromhex(uint8_t *out, size_t max, const char *in)
{
	uint32_t state = 1;
	size_t cnt = 0;

#if 0
	if (in[0] == '0' && in[1] == 'x')
		in += 2;
#endif

	for (; *in; in++) {
		if (isspace(*in)) continue;

		if	(*in >= '0' && *in <= '9')
			state = 16*state + *in - '0';
		else if	(*in >= 'A' && *in <= 'F')
			state = 16*state + *in - 'A' + 10;
		else if	(*in >= 'a' && *in <= 'f')
			state = 16*state + *in - 'a' + 10;
		else
			return SIZE_MAX;	/* illegal character */

		if (state >= 0x100) {
			if (cnt == SIZE_MAX)
				return SIZE_MAX;
			if (cnt < max)
				out[cnt] = state;
			state = 1;
			cnt++;
		}
	}

	if (state != 1)
		return SIZE_MAX;		/* uneven number of hex digits */

	return cnt;
}


void
printhex(FILE *fp, const uint8_t *vec, size_t n)
{
	int i;

        if (n > 0) {
                for (i = 0; i < n; i++)
                        fprintf(fp, "%02x", vec[i]);
	} else
                fputc('-', fp);

        fputc('\n', fp);
}

