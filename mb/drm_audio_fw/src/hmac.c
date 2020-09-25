
#include <stddef.h>
#include <stdint.h>
#include "memops.h"
#include "hmac.h"
#include "sha512.h"
#include "sha1.h"
#include "constants.h"

#define KDF_USE_HMAC // <- use with length-extension vulnerable hashes (md-based like SHA2)

void hmac_sha1(uint8_t key[HASH_BLKSIZE],
    const uint8_t* msg, size_t msgsize, uint8_t out[SHA1_DIGEST_SIZE]) {
    SHA_State context;
    unsigned char k_ipad[KEY_IOPAD_SIZE];    /* inner padding - key XORd with ipad  */
    unsigned char k_opad[KEY_IOPAD_SIZE];    /* outer padding - key XORd with opad */
    int i;

    /* start out by storing key in pads */
    memset(k_ipad, 0, sizeof(k_ipad));
    memset(k_opad, 0, sizeof(k_opad));
    memcpy(k_ipad, key, HASH_BLKSIZE);
    memcpy(k_opad, key, HASH_BLKSIZE);

    /* XOR key with ipad and opad values */
    for (i = 0; i < KEY_IOPAD_SIZE; i++) {
        k_ipad[i] ^= 0x36;
        k_opad[i] ^= 0x5c;
    }

    // perform inner SHA
    SHA_Init(&context);                    /* init context for 1st pass */
    SHA_Bytes(&context, k_ipad, KEY_IOPAD_SIZE);      /* start with inner pad */
    SHA_Bytes(&context, msg, msgsize); /* then text of datagram */
    SHA_Final(&context, out);             /* finish up 1st pass */

    // perform outer SHA
    SHA_Init(&context);                   /* init context for 2nd pass */
    SHA_Bytes(&context, k_opad, KEY_IOPAD_SIZE);     /* start with outer pad */
    SHA_Bytes(&context, out, SHA1_DIGEST_SIZE);     /* then results of 1st hash */
    SHA_Final(&context, out);          /* finish up 2nd pass */
}

void hmac(uint8_t key[HASH_BLKSIZE], const uint8_t* msg, size_t msgsize, uint8_t out[SHA512_DIGEST_SIZE]) {
	SHA512_State state;
    // uint8_t tmp[SHA512_DIGEST_SIZE];
    unsigned char k_ipad[KEY_IOPAD_SIZE128];
    unsigned char k_opad[KEY_IOPAD_SIZE128];

    // return hash(o_key_pad || hash(i_key_pad || message))

    memset(k_ipad, 0, sizeof(k_ipad));
    memset(k_opad, 0, sizeof(k_opad));
    memcpy(k_ipad, key, HASH_BLKSIZE);
    memcpy(k_opad, key, HASH_BLKSIZE);

    //get i_key_pad
    for (int i = 0; i < KEY_IOPAD_SIZE128; ++i) {
        k_ipad[i] ^= 0x36;
        k_opad[i] ^= 0x5c;
    }

    //get inner hash
    SHA512_Init(&state);
    SHA512_Bytes(&state, k_ipad, KEY_IOPAD_SIZE128);
    SHA512_Bytes(&state, msg, msgsize);
    SHA512_Final(&state, out);

    //get outer hash
    SHA512_Init(&state);
    SHA512_Bytes(&state, k_opad, KEY_IOPAD_SIZE128);
    SHA512_Bytes(&state, out, SHA512_DIGEST_SIZE);

    // get final output
    SHA512_Final(&state, out);
}

