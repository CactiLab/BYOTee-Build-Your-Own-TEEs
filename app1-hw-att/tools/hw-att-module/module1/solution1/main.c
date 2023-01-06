#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include "blake2s.h"

#define SIZE_t 64

int main(){

	uint8_t in[SIZE_t];
	uint8_t out[SIZE_t];

	memset(in, 1 , SIZE_t);
	memset(out, 0 , SIZE_t);


	int x = blake2s (out, in, SIZE_t);

	if (!x)
	{
		printf ("Output: \n");
		for (int j = 0; j < SIZE_t/2; j++)
		{
			printf("%hhu\t", out[j]);
		}
	printf("\n");
	}
	return 0;
}
