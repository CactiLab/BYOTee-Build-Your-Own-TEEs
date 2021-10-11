
/*
 * This benchmark simulates the search in a TAR archive
 * for a set of filenames
 *
 * Created by Julian Kunkel for Embench-iot
 * Licensed under MIT
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>


#define LOCAL_SCALE_FACTOR 47

// number of files in the archive
#define ARCHIVE_FILES 35

#define N_SEARCHES 5

/* BEEBS heap is just an array */
#define HEAP_SIZE 8996
static char heap[HEAP_SIZE];

static void *heap_ptr = NULL;
static void *heap_end = NULL;
static size_t heap_requested = 0;
static long int seed = 0;

void
initialise_benchmark (void)
{
}

void
free_beebs (void *ptr __attribute__ ((unused)))
{
}

void
init_heap_beebs (void *heap, size_t heap_size)
{
  heap_ptr = (void *) heap;
  heap_end = (void *) ((char *) heap_ptr + heap_size);
  heap_requested = 0;
}

void *
malloc_beebs (size_t size)
{
  if (size == 0)
    return NULL;

  void *next_heap_ptr = (char *)heap_ptr + size;

  heap_requested += size;

  const size_t alignment = sizeof (void *);

  /* Check if the next heap pointer is aligned, otherwise add some padding */
  if (((uintptr_t)next_heap_ptr % alignment) != 0)
    {
      size_t padding = alignment - ((uintptr_t)next_heap_ptr % alignment);

      next_heap_ptr = (char *)next_heap_ptr + padding;

      /* padding is added to heap_requested because otherwise it will break
         check_heap_beebs() */
      heap_requested += padding;
    }

  /* Check if we can "allocate" enough space */
  if (next_heap_ptr > heap_end)
    return NULL;

  void *new_ptr = heap_ptr;
  heap_ptr = next_heap_ptr;

  return new_ptr;
}


int
rand_beebs (void)
{
  seed = (seed * 1103515245L + 12345) & ((1UL << 31) - 1);
  return (int) (seed >> 16);
}

static int benchmark_body (int rpt);

void
warm_caches (int  heat)
{
  benchmark_body (heat);
  return;
}

#define CPU_MHZ 1
int
benchmark (void)
{
  return benchmark_body (LOCAL_SCALE_FACTOR * CPU_MHZ);
}

// this is the basic TAR header format which is in ASCII
typedef struct {
  char filename[100];
  char mode[8];  // file mode
  char uID[8];   // user id
  char gID[8];   // group id
  char size[12]; // in bytes octal base
  char mtime[12]; // numeric Unix time format (octal)
  char checksum[8]; // for the header, ignored herew2
  char isLink;
  char linkedFile[100];
} tar_header_t;


static int __attribute__ ((noinline))
benchmark_body (int rpt)
{
  int i, j, p;
  tar_header_t * hdr;
  int found;

  for (j = 0; j < rpt; j++) {
    init_heap_beebs ((void *) heap, HEAP_SIZE);

    // always create ARCHIVE_FILES files in the archive
    int files = ARCHIVE_FILES;
    hdr = malloc_beebs(sizeof(tar_header_t) * files);
    for (i = 0; i < files; i++){
      // create record
      tar_header_t * c = & hdr[i];
      // initialize here for cache efficiency reasons
      memset(c, 0, sizeof(tar_header_t));
      int flen = 5 + i % 94; // vary file lengths
      c->isLink = '0';
      for(p = 0; p < flen; p++){
        c->filename[p] = rand_beebs() % 26 + 65;
      }
      c->size[0] = '0';
    }

    found = 0; // number of times a file was found
    // actual benchmark, strcmp with a set of N_SEARCHES files
    // the memory access here is chosen inefficiently on purpose
    for (p = 0; p < N_SEARCHES; p++){
      // chose the position of the file to search for from the mid of the list
      char * search = hdr[(p + ARCHIVE_FILES/2) % ARCHIVE_FILES].filename;

      // for each filename iterate through all files until found
      for (i = 0; i < files; i++){
        tar_header_t * cur = & hdr[i];
        // implementation of strcmp
        char *c1;
        char *c2;
        for (c1 = hdr[i].filename, c2 = search; (*c1 != '\0' && *c2 != '\0' && *c1 == *c2) ; c1++, c2++);
        // complete match?
        if(*c1 == '\0' && *c2 == '\0'){
          found++;
          break;
        }
      }
    }
    free_beebs(hdr);
  }

  return found == N_SEARCHES;
}


int
verify_benchmark (int r)
{
  return r == 1;
}


