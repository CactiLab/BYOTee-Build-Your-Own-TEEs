#include "aes.h"
#include "constants.h"

hw_att_md __attribute__((section(".ssc.att.module.data"))) current_att_md;

internal_state __attribute__((section(".ssc.code.buffer"))) local_state;

int main()
{

	while (1)
	{
		while(current_att_md.cmd == 0);
		if (current_att_md.cmd  == 0xA)
		{
			struct AES_ctx ctx;
			AES_init_ctx_iv(&ctx, AES_CBC_key, AES_CBC_IV);

//			int length = current_att_md.ssa_size/AES_BLOCK_SIZE + 1;
//			int rem = current_att_md.ssa_size;

			AES_CBC_decrypt_buffer(&ctx, local_state.code, current_att_md.ssa_size);
//			for (int i = 0; i < length; i++)
//			{
//				AES_CBC_decrypt_buffer(&ctx, local_state.code[i * AES_BLOCK_SIZE], (rem > AES_BLOCK_SIZE) ? AES_BLOCK_SIZE : rem);
//				rem = rem - AES_BLOCK_SIZE;
//			}
		}
		else if (current_att_md.cmd == 0xD)
		{

		}
		current_att_md.cmd = 0;

	}

}
