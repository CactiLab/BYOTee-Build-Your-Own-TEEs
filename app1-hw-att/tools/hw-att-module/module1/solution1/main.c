#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "blake2s.h"

#define SIZE 32
int main(){

	uint8_t in[SIZE];
	uint8_t out[SIZE];
	uint8_t temp = 1; /* Filling with 1*/

	memset(in, temp, SIZE * sizeof(uint8_t));
	memset(out, temp-1, SIZE * sizeof(uint8_t))


	int x = blake2s (out, in, SIZE);

	if (!x){
		printf ("Output: \n");
		for (int j = 0; j < SIZE; j++){
			printf("\t", out[j]);
		}
	printf("\n");
	}
	return 0;
}


