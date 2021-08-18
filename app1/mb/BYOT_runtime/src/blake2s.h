#pragma once

#include <stddef.h>
#include <stdint.h>

#if defined(__cplusplus)
extern "C"
{
#endif

// Fixed constant that cannot be changed.
#define BLAKE2S_BLOCKBYTES (64)

// Options that can be set depending on application needs.
// Except for BLAKE2S_OUTLEN, disabling features will improve code size.
#define BLAKE2S_OUTLEN (32)   // Length of digest (32 is the secure/maximum/standard length)
#define BLAKE2S_STREAM (0)    // When disabled, inputs must be aligned to BLAKE2S_BLOCKBYTES and not be zero length
#define BLAKE2S_ERRCHECK (0)  // Enable error checking
#define BLAKE2S_UNALIGNED (0) // Unaligned inputs are accepted.
#define BLAKE2S_64BIT (0)     // Input length may be 4GB or larger (64-bit systems only).

  typedef struct
  {
    uint32_t h[8];
    uint32_t t[2];
    uint32_t f[2];
    uint8_t buf[BLAKE2S_BLOCKBYTES];
    size_t buflen;
    uint8_t last_node;
  } blake2s_state;

  // Simple API.
  // See the options above for the applicable restrictions.
  int blake2s(void *out, const void *in, size_t inlen);
  int blake2s_blocks(void *out, const uint8_t in[BLAKE2S_BLOCKBYTES], size_t inblocks);

#if defined(__cplusplus)
}
#endif
