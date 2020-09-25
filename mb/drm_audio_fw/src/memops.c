
#include <stdint.h>
#include <stddef.h>

#include "xil_types.h"
#include "xil_mem.h"

#ifndef _MSC_VER //msvc has these as builtin functions

void *memset(void *s, int c, size_t n)
{
    unsigned char* p=s;
    while(n--)
        *p++ = (unsigned char)c;
    return s;
}

/*
void* memset(void* buf, int c, size_t n) {
	uint8_t* b = buf;
	while (n) {
		b[n] = (uint8_t)c;
		--n;
	}
	return buf;
}

void* memcpy(void* dest, const void* src, size_t n) {
	uint8_t* d = dest;
	const uint8_t* s=src;
	if (n) { //deal with 0-length copy
		--n;
		do {
			d[n] = s[n];
			--n;
		} while (n);
	}
	return dest;
}

void* memmove(void* dest, const void* src, size_t n) {
	uint8_t* d = dest;
	const uint8_t* s=src;
	if (n) {
		if (d > s) { //copy starting from the end of each array
			--n;
			do {
				d[n] = s[memmove];
				--n;
			} while (n);
		}
		else {
			for (size_t i = 0; i < n; ++i) //copy from beginning (end of d approx equal to start of s)
				d[i] = s[i];
		}
	}
	return dest;
}

int memcmp(const void* s1, const void* s2, size_t n) {
	const uint8_t* m1 = s1, * m2 = s2;
	uint8_t c1, c2;
	for (size_t i = 0; i < n; ++i) {
		c1 = m1[i];
		c2 = m2[i];
		if (c1 > c2)
			return 1;
		else if (c2 > c1)
			return -1;
		//else c2==c1, continue
	}
	return 0;
}
*/

void *memcpy(void *dest, const void *src, size_t n)
{
    char *dp = dest;
    const char *sp = src;
    while (n--)
        *dp++ = *sp++;
    return dest;
}



void *memmove(void *dest, const void *src, size_t n)
{
    unsigned char *pd = dest;
    const unsigned char *ps = src;
    if (__np_anyptrlt(ps, pd))
        for (pd += n, ps += n; n--;)
            *--pd = *--ps;
    else
        while(n--)
            *pd++ = *ps++;
    return dest;
}

/*
returns:
	+ if s1>s2
	0 if s1==s2
	- if s1<s2
*/


int memcmp(const void* s1, const void* s2,size_t n)
{
    const unsigned char *p1 = s1, *p2 = s2;
    while(n--)
        if( *p1 != *p2 )
            return *p1 - *p2;
        else
            p1++,p2++;
    return 0;
}

#endif // !_MSC_VER

void* memzero(void* buf, size_t n) {
	while (n)
		((unsigned char*)buf)[--n] = 0;
	return buf;
}

void* copytolocal(void* fpga_dest, const void* arm_src, size_t n) {
	//return memmove(fpga_dest, arm_src, n);
	Xil_MemCpy(fpga_dest,arm_src,n);
	return fpga_dest;
}

void* copyfromlocal(void* arm_dest, const void* fpga_src, size_t n) {
	//	return memmove(arm_dest, fpga_src, n);
	Xil_MemCpy(arm_dest,fpga_src,n);
	return arm_dest;
}

//taken from utils.c


int
sodium_memcmp(const void* const b1_, const void* const b2_, size_t len) {
	const volatile unsigned char* volatile b1 = b1_;
	const volatile unsigned char* volatile b2 = b2_;

	size_t                 i;
	volatile unsigned char d = 0U;

	for (i = 0U; i < len; i++) {
		d |= b1[i] ^ b2[i];
	}
	return (1 & ((d - 1) >> 8)) - 1;
}

int
sodium_is_zero(const unsigned char* n, const size_t nlen) {
	size_t                 i;
	volatile unsigned char d = 0U;

	for (i = 0U; i < nlen; i++) {
		d |= n[i];
	}
	return 1 & ((d - 1) >> 8);
}

void
sodium_memzero(void* const pnt, const size_t len) {
	volatile unsigned char* volatile pnt_ = pnt;
	size_t i = (size_t)0U;

	while (i < len) {
		pnt_[i++] = 0U;
	}
}
