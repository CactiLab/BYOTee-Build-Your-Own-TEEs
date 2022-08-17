#include "aes.h"
#include "constants.h"
#include "hmac.h"
#include "blake2s.h"

hw_att_md __attribute__((section(".ssc.att.module.data"))) current_att_md;

internal_state __attribute__((section(".ssc.code.buffer"))) local_state;

ssc_meta_data __attribute__((section(".received.meta.info"))) received_metadata;
ro_data_content __attribute__((section(".ssc.ro.data.buffer"))) ssc_ro_data;
data_content __attribute__((section(".ssc.data.buffer"))) ssc_data;

uint8_t measurement[MEASUREMENT_SIZE];
uint8_t helper[MEASUREMENT_SIZE + SIG_LEN];

int adjust_block_size(int data_size)
{
	int remainder = data_size % BLAKE2S_BLOCKBYTES;

	if (remainder != 0)
	{
		data_size += (BLAKE2S_BLOCKBYTES - remainder);
	}

	return data_size;
}

//This functions performs measurements on code section, data section and readonly data section before and after SSC execution
void preExeAtt()
{
	int data_size;

	data_size = adjust_block_size(received_metadata.ro_data_size);
	// hash the read only data section + input hash
	blake2s(measurement, ssc_ro_data.ro_data, data_size);
	data_size = adjust_block_size(received_metadata.data_sec_size + MEASUREMENT_SIZE);
	memcpy((ssc_data.data + received_metadata.data_sec_size), measurement, MEASUREMENT_SIZE);
	// hash the data section + previous hash
	blake2s(measurement, ssc_data.data, data_size);
	data_size = adjust_block_size(received_metadata.sss_code_size + MEASUREMENT_SIZE + sizeof(current_att_md.challenge_number));
	memcpy((local_state.code + received_metadata.sss_code_size), &current_att_md.challenge_number, sizeof(current_att_md.challenge_number));
	memcpy((local_state.code + received_metadata.sss_code_size + sizeof(current_att_md.challenge_number)), measurement, MEASUREMENT_SIZE);
	// hash the code text section + previous hash + challenge number
	blake2s(measurement, local_state.code, data_size);
	memcpy(helper, current_att_md.SSA_input, SIG_LEN);
	memcpy(helper + SIG_LEN, measurement, MEASUREMENT_SIZE);
	data_size = adjust_block_size(SIG_LEN + MEASUREMENT_SIZE);
	blake2s(measurement, helper, data_size);
}
void postExeAtt()
{
	int data_size;
	preExeAtt();
	memcpy(helper, current_att_md.SSA_output, SIG_LEN);
	memcpy(helper + SIG_LEN, measurement, MEASUREMENT_SIZE);
	data_size = adjust_block_size(SIG_LEN + MEASUREMENT_SIZE);
	blake2s(measurement, helper, data_size);
}

int main()
{

	while (1)
	{
		while(current_att_md.cmd == 0);
		if (current_att_md.cmd  == 0xA)
		{
			struct AES_ctx ctx;
			AES_init_ctx_iv(&ctx, AES_CBC_key, AES_CBC_IV);

			AES_CBC_decrypt_buffer(&ctx, local_state.code, current_att_md.ssa_size);
		}
		else if (current_att_md.cmd == 0xD)
		{
			preExeAtt();
			memcpy(current_att_md.attestation_output, measurement, MEASUREMENT_SIZE);
		}
		else if (current_att_md.cmd == 0xC)
		{
			preExeAtt();
			memcpy(current_att_md.attestation_output, measurement, MEASUREMENT_SIZE);
		}
		current_att_md.cmd = 0;

	}

}
