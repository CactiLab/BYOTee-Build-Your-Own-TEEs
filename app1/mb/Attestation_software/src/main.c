#include "aes.h"
#include "constants.h"
volatile hw_att_md *current_att_md = (hw_att_md *)ATT_BASE;
volatile SSA_loader *loader = (SSA_loader *)SSA_BASE;

int main()
{
	while (1)
	{
		while(current_att_md->cmd == 0);
		if (current_att_md->cmd  == 0xA)
		{
			struct AES_ctx ctx;
			AES_init_ctx_iv(&ctx, AES_CBC_key, AES_CBC_IV);

			int length = current_att_md->ssa_size/AES_BLOCK_SIZE + 1;
			int rem = current_att_md->ssa_size;

			for (int i = 0; i < length; i++)
			{
				AES_CBC_decrypt_buffer(&ctx, loader->SSA_data[i * AES_BLOCK_SIZE], (rem > AES_BLOCK_SIZE) ? AES_BLOCK_SIZE : rem);
				rem = rem - AES_BLOCK_SIZE;
			}
		}
		else if (current_att_md->cmd == 0xD)
		{

		}

	}

}
