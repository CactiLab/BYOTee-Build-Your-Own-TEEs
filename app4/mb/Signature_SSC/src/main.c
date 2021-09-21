#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include "constants.h"
#include "xparameters.h"
#include "xbram.h"
#include "hmac.h"

volatile bram_channel *bram_chnl = (bram_channel *) SHARED_BRAM_BASE;

void generate_signature()
{
	uint8_t sig[HASH_OUTPUT_SIZE];

	memset(sig, 0, HASH_OUTPUT_SIZE);
	hmac(auth_key, (void *)bram_chnl->input_data, bram_chnl->input_len, sig);

	memcpy((void *)bram_chnl->output_data, sig, HASH_OUTPUT_SIZE);
}


int main()
{
	while(1)
	{
		if (bram_chnl->input_available == 1)
		{
			bram_chnl->input_available = 0;
			//generate_signature();
			usleep(1000);
			//bram_chnl->input_available = 0;
			//break;
		}


	}
}
