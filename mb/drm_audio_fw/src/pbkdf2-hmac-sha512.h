#ifndef PBKDF2_SHA512
#define PBKDF2_SHA512

#include <stddef.h>
#include <stdint.h>

void
pbkdf2_hmac_sha512(uint8_t *out, size_t outlen,
		   const uint8_t *passwd, size_t passlen,
		   const uint8_t *salt, size_t saltlen,
		   uint32_t iter);

#endif
