#pragma once
#ifndef PBKDF2_H
#define PBKDF2_H


#include <stddef.h>
#include <stdint.h>

//below uses SHA2-512 from libsodium. would like to use SHA3-512 at some point but oh well
#define   SHA1_DIGEST_SIZE  20
#define SHA512_DIGEST_SIZE  64

#define HASH_BLKSIZE SHA512_DIGEST_SIZE
#define HASH_OUTSIZE SHA512_DIGEST_SIZE
#define KEY_IOPAD_SIZE 64
#define KEY_IOPAD_SIZE128 128


#define KDF_OUTSIZE HASH_OUTSIZE //the desired output size of the derived key. equal to hash output size.
#define KDF_ITER 4096 //this needs to go up alot lol
#define KDF_SALTSIZE 16 //gets padded, all good

/*
computes a sha2-512 hmac of <msg> using <key> into <out>
*/
void hmac(uint8_t key[HASH_BLKSIZE], const uint8_t* msg, size_t msgsize, uint8_t out[SHA512_DIGEST_SIZE]);
void hmac_sha1(uint8_t key[HASH_BLKSIZE], const uint8_t* msg, size_t msgsize, uint8_t out[SHA1_DIGEST_SIZE]);

#endif // !PBKDF2_H
