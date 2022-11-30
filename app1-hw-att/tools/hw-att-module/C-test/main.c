#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "blake2s.h"

#define SIZE_t 64

int main(){

	char  in[SIZE_t];
	uint8_t out[32];
	
	for (int i = 0 ; i < SIZE_t; i++)
		in[i] = i *10;
	//memset(in, 1 , SIZE_t);
	memset(out, 0 , SIZE_t);


	int x = blake2s (out, in, SIZE_t);

	if (!x)
	{
		printf ("Output: \n");
		for (int j = 0; j < SIZE_t; j++)
		{
			printf("%d\t", out[j]);
		}
	printf("\n");
	}
	return 0;
}


