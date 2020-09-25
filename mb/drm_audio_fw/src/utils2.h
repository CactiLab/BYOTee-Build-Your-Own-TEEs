#ifndef UTILS_H
#define UTILS_H

#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>

#ifndef MIN
#define MIN(a, b)	((a) < (b)) ? (a) : (b)
#endif

#ifndef MAX
#define MAX(a, b)	((a) > (b)) ? (a) : (b)
#endif

#define B64LEN(a)	(4*(1+(a)/3))

bool	 secrand(void *buf, size_t len);

size_t	 base64enc(char *out, const uint8_t *in, size_t len);
size_t	 base64dec(uint8_t *out, size_t max, const char *in);

size_t	 fromhex(uint8_t *out, size_t max, const char *in);
void	 printhex(FILE *fp, const uint8_t *vec, size_t n);

#endif
