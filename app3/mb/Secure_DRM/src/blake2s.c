#include <stdint.h>
#include <string.h>
#include <stdio.h>

#include "blake2s.h"

#define NATIVE_LITTLE_ENDIAN (__BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__)

static const uint32_t blake2s_IV[8] = {
    0x6A09E667UL, 0xBB67AE85UL, 0x3C6EF372UL, 0xA54FF53AUL,
    0x510E527FUL, 0x9B05688CUL, 0x1F83D9ABUL, 0x5BE0CD19UL};

// These are the permutations. It packs two permutations per byte, see the
// first row.
static const uint8_t blake2s_sigma[10][8] = {
    {0x01, 0x23, 0x45, 0x67, 0x89, 0xab, 0xcd, 0xef},
    {0xea, 0x48, 0x9f, 0xd6, 0x1c, 0x02, 0xb7, 0x53},
    {0xb8, 0xc0, 0x52, 0xfd, 0xae, 0x36, 0x71, 0x94},
    {0x79, 0x31, 0xdc, 0xbe, 0x26, 0x5a, 0x40, 0xf8},
    {0x90, 0x57, 0x24, 0xaf, 0xe1, 0xbc, 0x68, 0x3d},
    {0x2c, 0x6a, 0x0b, 0x83, 0x4d, 0x75, 0xfe, 0x19},
    {0xc5, 0x1f, 0xed, 0x4a, 0x07, 0x63, 0x92, 0x8b},
    {0xdb, 0x7e, 0xc1, 0x39, 0x50, 0xf4, 0x86, 0x2a},
    {0x6f, 0xe9, 0xb3, 0x08, 0xc2, 0xd7, 0x14, 0xa5},
    {0xa2, 0x84, 0x76, 0x15, 0xfb, 0x9e, 0x3c, 0xd0},
};

static inline uint32_t load32(const void *src)
{
    if (NATIVE_LITTLE_ENDIAN && !BLAKE2S_UNALIGNED)
    {
        return *(uint32_t *)src;
    }

    if (NATIVE_LITTLE_ENDIAN)
    {
        uint32_t w;
        memcpy(&w, src, sizeof w);
        return w;
    }
    // fallback that works for any system
    const uint8_t *p = (const uint8_t *)src;
    return ((uint32_t)(p[0]) << 0) |
           ((uint32_t)(p[1]) << 8) |
           ((uint32_t)(p[2]) << 16) |
           ((uint32_t)(p[3]) << 24);
}

static inline void store32(void *dst, uint32_t w)
{
    if (NATIVE_LITTLE_ENDIAN && !BLAKE2S_UNALIGNED)
    {
        *(uint32_t *)dst = w;
    }
    else if (NATIVE_LITTLE_ENDIAN)
    {
        memcpy(dst, &w, sizeof w);
    }
    else
    { // fallback
        uint8_t *p = (uint8_t *)dst;
        p[0] = (uint8_t)(w >> 0);
        p[1] = (uint8_t)(w >> 8);
        p[2] = (uint8_t)(w >> 16);
        p[3] = (uint8_t)(w >> 24);
    }
}

static inline void store16(void *dst, uint16_t w)
{
    if (NATIVE_LITTLE_ENDIAN && !BLAKE2S_UNALIGNED)
    {
        *(uint16_t *)dst = w;
    }
    else if (NATIVE_LITTLE_ENDIAN)
    {
        memcpy(dst, &w, sizeof w);
    }
    else
    { // fallback
        uint8_t *p = (uint8_t *)dst;
        p[0] = (uint8_t)(w >> 0);
        p[1] = (uint8_t)(w >> 8);
    }
}

// Rotate right by the given amount.
static inline uint32_t rotr32(const uint32_t w, const unsigned c)
{
    return (w >> c) | (w << (32 - c));
}

// Erase memory, even if the compiler would like to optimize it away.
static inline void secure_zero_memory(void *v, size_t n)
{
    static void *(*const volatile memset_v)(void *, int, size_t) = &memset;
    memset_v(v, 0, n);
}

static void blake2s_set_lastnode(blake2s_state *S)
{
    S->f[1] = (uint32_t)-1;
}

static int blake2s_is_lastblock(const blake2s_state *S)
{
    return S->f[0] != 0;
}

static void blake2s_set_lastblock(blake2s_state *S)
{
    if (S->last_node)
        blake2s_set_lastnode(S);

    S->f[0] = (uint32_t)-1;
}

static void blake2s_increment_counter(blake2s_state *S, const size_t inc)
{
    S->t[0] += inc;
    if (BLAKE2S_64BIT)
    {
        S->t[1] += (S->t[0] < inc);
    }
}

static void blake2s_set_IV(uint32_t *buf)
{
    for (size_t i = 0; i < 8; i++)
    {
        buf[i] = blake2s_IV[i];
    }
}

// blake2s initialization without key
static int blake2s_init(blake2s_state *S)
{
    memset(S, 0, sizeof(blake2s_state));

    blake2s_set_IV(S->h);

    // set depth, fanout and digest length
    S->h[0] ^= (1UL << 24) | (1UL << 16) | BLAKE2S_OUTLEN;

    return 0;
}

static void blake2s_round(size_t r, const uint32_t m[16], uint32_t v[16])
{
    for (size_t i = 0; i < 8; i++)
    {
        size_t bit4 = i / 4; // 0, 0, 0, 0, 1, 1, 1, 1

        // Calculate the following table dynamically:
        //   a:    b:    c:     d:
        //   v[0]  v[4]  v[ 8]  v[12]
        //   v[1]  v[5]  v[ 9]  v[13]
        //   v[2]  v[6]  v[10]  v[14]
        //   v[3]  v[7]  v[11]  v[15]
        //   v[0]  v[5]  v[10]  v[15]
        //   v[1]  v[6]  v[11]  v[12]
        //   v[2]  v[7]  v[ 8]  v[13]
        //   v[3]  v[4]  v[ 9]  v[14]
        uint32_t *a = &v[(i + bit4 * 0) % 4 + 0];
        uint32_t *b = &v[(i + bit4 * 1) % 4 + 4];
        uint32_t *c = &v[(i + bit4 * 2) % 4 + 8];
        uint32_t *d = &v[(i + bit4 * 2 + bit4) % 4 + 12];

        const uint8_t sigma = blake2s_sigma[r][i];
        uint32_t m1 = m[sigma >> 4];
        uint32_t m2 = m[sigma & 0xf];

        *a = *a + *b + m1;
        *d = rotr32(*d ^ *a, 16);
        *c = *c + *d;
        *b = rotr32(*b ^ *c, 12);
        *a = *a + *b + m2;
        *d = rotr32(*d ^ *a, 8);
        *c = *c + *d;
        *b = rotr32(*b ^ *c, 7);
    }
}

static void blake2s_compress(blake2s_state *S, const uint8_t in[BLAKE2S_BLOCKBYTES])
{
#if !BLAKE2S_UNALIGNED
    const uint32_t *m = (const uint32_t *)in;
#else
    uint32_t m[16];
    memcpy(m, in, sizeof(m));
#endif

    uint32_t v[16];
    memcpy(v, S->h, 8 * sizeof(v[0]));

    blake2s_set_IV(&v[8]);
    v[12] ^= S->t[0];
    v[13] ^= S->t[1];
    v[14] ^= S->f[0];
    v[15] ^= S->f[1];

    for (size_t r = 0; r < 10; r++)
    {
        blake2s_round(r, m, v);
    }

    for (size_t i = 0; i < 8; i++)
    {
        S->h[i] = S->h[i] ^ v[i] ^ v[i + 8];
    }
}

static int blake2s_update(blake2s_state *S, const void *pin, size_t inlen)
{
    if (inlen == 0)
        return 0; // nothing to do

    if (BLAKE2S_ERRCHECK && !BLAKE2S_STREAM)
    {
        return -1;
    }

    const uint8_t *in = (const uint8_t *)pin;
    size_t left = S->buflen;
    size_t fill = BLAKE2S_BLOCKBYTES - left;
    if (inlen > fill)
    {
        S->buflen = 0;
        memcpy(S->buf + left, in, fill); // Fill buffer
        blake2s_increment_counter(S, BLAKE2S_BLOCKBYTES);
        blake2s_compress(S, S->buf);
        in += fill;
        inlen -= fill;

        while (inlen > BLAKE2S_BLOCKBYTES)
        {
            blake2s_increment_counter(S, BLAKE2S_BLOCKBYTES);
            blake2s_compress(S, in);
            in += BLAKE2S_BLOCKBYTES;
            inlen -= BLAKE2S_BLOCKBYTES;
        }
    }
    memcpy(S->buf + S->buflen, in, inlen);
    S->buflen += inlen;
    return 0;
}

static int blake2s_final(blake2s_state *S, void *out)
{
    if (BLAKE2S_ERRCHECK && BLAKE2S_STREAM && blake2s_is_lastblock(S))
        return -1;

    if (BLAKE2S_STREAM)
    {
        blake2s_increment_counter(S, S->buflen);
        blake2s_set_lastblock(S);
        memset(S->buf + S->buflen, 0, BLAKE2S_BLOCKBYTES - S->buflen); // Padding
        blake2s_compress(S, S->buf);
    }

    memcpy(out, S->h, BLAKE2S_OUTLEN);
    return 0;
}

int blake2s(void *out, const void *in, size_t inlen)
{
    blake2s_state S[1];

    // Verify parameters
    if (BLAKE2S_ERRCHECK && NULL == in && inlen > 0)
        return -1;

    if (BLAKE2S_ERRCHECK && NULL == out)
        return -1;

    // Initialize hash state.
    int err_init = blake2s_init(S);

    if (BLAKE2S_ERRCHECK && err_init)
        return -1;

    if (BLAKE2S_STREAM)
    {
        // Streaming API, where this function can get data of arbitrary length
        // as input.
        int err_update = blake2s_update(S, (const uint8_t *)in, inlen);
        if (BLAKE2S_ERRCHECK && err_update)
            return -1;
    }
    else
    {
        // Block based API, where the input length MUST be a multiple of the
        // block size.
        if (BLAKE2S_ERRCHECK && inlen % BLAKE2S_BLOCKBYTES != 0)
            return -1;

        const uint8_t *inbuf = in;
        const uint8_t *inend = inbuf + inlen - BLAKE2S_BLOCKBYTES;

        for (;;)
        {
            blake2s_increment_counter(S, BLAKE2S_BLOCKBYTES);
            if (inbuf == inend)
            {
                blake2s_set_lastblock(S);
            }

            blake2s_compress(S, inbuf);

            if (inbuf == inend)
            {
                break;
            }
            inbuf += BLAKE2S_BLOCKBYTES;
        }
    }

    int err_final = blake2s_final(S, out);
    
    if (BLAKE2S_ERRCHECK && err_final)
        return -1;

    // Success!
    return 0;
}

int blake2s_blocks(void *out, const uint8_t in[BLAKE2S_BLOCKBYTES], size_t inblocks)
{
    return blake2s(out, in, inblocks * BLAKE2S_BLOCKBYTES);
}
