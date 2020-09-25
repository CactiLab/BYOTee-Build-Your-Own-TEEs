/* This module implements pbkdf2-hmac-sha512.
 *
 * Written by Philipp Lay <philipp.lay@illunis.net>
 */

#include <stdint.h>
#include <stddef.h>
#include "memops.h"


#include "utils2.h"
#include "sha512.h"
#include "pbkdf2-hmac-sha512.h"
#include "constants.h"



/* length of our hash function */
#define HLEN	64

/* block size of the hash */
#define BS	128


/* padding */
#define IPAD	0x36
#define OPAD	0x5c


void
hmac_sha512_init(SHA512_State *ctx, const uint8_t key[BS])
{
	uint8_t pad[BS];
	int i;

	/* apply inner padding */
	for (i = 0; i < BS; i++)
		pad[i] = key[i] ^ IPAD;

	SHA512_Init(ctx);
	SHA512_Bytes(ctx, pad, BS);
}


void
hmac_sha512_done(SHA512_State *ctx, const uint8_t key[BS], uint8_t result[HLEN])
{
	uint8_t pad[BS];
	uint8_t ihash[HLEN];
	int i;

	/* construct outer padding */
	for (i = 0; i < BS; i++)
		pad[i] = key[i] ^ OPAD;

	/* finalize inner hash */
	SHA512_Final(ctx, ihash);

	SHA512_Init(ctx);
	SHA512_Bytes(ctx, pad, BS);
	SHA512_Bytes(ctx, ihash, HLEN);
	SHA512_Final(ctx, result);
}

unsigned int LitToBigEndian(unsigned int x)
{
	return (((x>>24) & 0x000000ff) | ((x>>8) & 0x0000ff00) | ((x<<8) & 0x00ff0000) | ((x<<24) & 0xff000000));
}
void
pbkdf2_hmac_sha512(uint8_t *out, size_t outlen,
		   const uint8_t *passwd, size_t passlen,
		   const uint8_t *salt, size_t saltlen,
		   uint32_t iter)
{	
	//mb_printf(" received iter : %d\r\n",iter);
	SHA512_State hmac, hmac_template;
	uint32_t i, be32i;
	uint32_t j;
	int k;

	uint8_t key[BS];
	uint8_t	F[HLEN], U[HLEN];
	size_t need;

	/*
	 * vartime code to handle password hmac-style
	 */
	if (passlen < BS) {
		memcpy(key, passwd, passlen);
		memset(key + passlen, 0, BS-passlen);
	} else {
		SHA512_Init(&hmac);
		SHA512_Bytes(&hmac, passwd, passlen);
		SHA512_Final(&hmac, key);
		memset(key + HLEN, 0, BS-HLEN);
	}

	hmac_sha512_init(&hmac_template, key);
	SHA512_Bytes(&hmac_template, salt, saltlen);

	for (i = 1; outlen > 0; i++) {
		memcpy(&hmac, &hmac_template, sizeof(SHA512_State));
		//mb_printf("%d \r\n",i);
		be32i = LitToBigEndian(i);
		
		SHA512_Bytes(&hmac, &be32i, sizeof(be32i));
		hmac_sha512_done(&hmac, key, U);
		memcpy(F, U, HLEN);
		//mb_printf("%d\r\n",iter);
		for (uint32_t cnt = 2; cnt <= iter; ++cnt) {
			hmac_sha512_init(&hmac, key);
			SHA512_Bytes(&hmac, U, HLEN);
			hmac_sha512_done(&hmac, key, U);
			//mb_printf("%d limit is %d\r\n",cnt,iter);
			for (k = 0; k < HLEN; k++)
				F[k] ^= U[k];
			if (cnt>=iter) 
				break;
		}
		//mb_printf("Oh god\r\n");
		need = MIN(HLEN, outlen);

		memcpy(out, F, need);
		out += need;
		outlen -= need;
		
	}
}
