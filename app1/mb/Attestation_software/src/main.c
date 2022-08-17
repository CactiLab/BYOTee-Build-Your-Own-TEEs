#include "aes.h"
#include "constants.h"
#include "hmac.h"
#include "blake2s.h"

hw_att_md __attribute__((section(".ssc.att.module.data"))) current_att_md;

internal_state __attribute__((section(".ssc.code.buffer"))) local_state;

ssc_meta_data __attribute__((section(".received.meta.info"))) received_metadata;
ro_data_content __attribute__((section(".ssc.ro.data.buffer"))) ssc_ro_data;
data_content __attribute__((section(".ssc.data.buffer"))) ssc_data;

uint8_t preExeResult[MEASUREMENT_SIZE];
/*
int verify_ssa_signature(void *data_start) {

	uint8_t sig[HASH_OUTSIZE];

	memset(sig, 0, HASH_OUTSIZE);
	hmac(AES_CBC_key, data_start, current_att_md.ssa_size - SIG_LEN, sig);

	return !memcmp(sig, (uint8_t *)data_start , SIG_LEN);
}
*/

int adjust_block_size(int data_size)
{
	int remainder = data_size % BLAKE2S_BLOCKBYTES;

	if (remainder != 0)
	{
		data_size += (BLAKE2S_BLOCKBYTES - remainder);
	}

	return data_size;
}

//void input_attestation(char flag)
//{
//	if (att_md.input_att_size == 0)
//		return;
//
//	int data_size = adjust_block_size(att_md.input_att_size + MEASUREMENT_SIZE);
//	//Input to SSC data attestation
//	memcpy(att_md.att_input_data + att_md.input_att_size, preExeResult, MEASUREMENT_SIZE);
//	//memset(att_md.att_input_data + att_md.input_att_size + MEASUREMENT_SIZE, 0, data_size - (att_md.input_att_size + MEASUREMENT_SIZE));
//	blake2s(preExeResult, att_md.att_input_data, data_size);
//
//	if (flag == 1)
//		//copy the hash to DRAM
//		memcpy((void *)&c->preExehash, &preExeResult, MEASUREMENT_SIZE);
//}
//void output_attestation()
//{
//	if (att_md.output_att_size == 0)
//		return;
//
//	int data_size = adjust_block_size(att_md.output_att_size + MEASUREMENT_SIZE);
//	//Input to SSC data attestation
//	memcpy(att_md.att_output_data + att_md.output_att_size, preExeResult, MEASUREMENT_SIZE);
//	//memset(att_md.att_output_data + att_md.output_att_size + MEASUREMENT_SIZE, 0, data_size - (att_md.output_att_size + MEASUREMENT_SIZE));
//	blake2s(preExeResult, att_md.att_output_data, data_size);
//	//copy the hash to DRAM
//	memcpy((void *)&c->postExehash, &preExeResult, MEASUREMENT_SIZE);
//}
//This functions performs measurements on code section, data section and readonly data section before and after SSC execution
void preExeAtt()
{
	int data_size;

	data_size = adjust_block_size(received_metadata.ro_data_size);
	// hash the read only data section + input hash
	blake2s(preExeResult, ssc_ro_data.ro_data, data_size);
	data_size = adjust_block_size(received_metadata.data_sec_size + MEASUREMENT_SIZE);
	memcpy((ssc_data.data + received_metadata.data_sec_size), preExeResult, MEASUREMENT_SIZE);
	// hash the data section + previous hash
	blake2s(preExeResult, ssc_data.data, data_size);
	data_size = adjust_block_size(received_metadata.sss_code_size + MEASUREMENT_SIZE + sizeof(current_att_md.challenge_number));
	memcpy((local_state.code + received_metadata.sss_code_size), &current_att_md.challenge_number, sizeof(current_att_md.challenge_number));
	memcpy((local_state.code + received_metadata.sss_code_size + sizeof(current_att_md.challenge_number)), preExeResult, MEASUREMENT_SIZE);
	// hash the code text section + previous hash + challenge number
	blake2s(preExeResult, local_state.code, data_size);
}
//void postExeAtt()
//{
//	preExeAtt();
//	input_attestation(0);
//	output_attestation();
//}

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

//			if (verify_ssa_signature(local_state.code[SIG_LEN]) != 0)
//			{
//				current_att_md.sig_vrf = 0x0;
//			}
//			else
//				current_att_md.sig_vrf = 0x2;
		}
		else if (current_att_md.cmd == 0xD)
		{
			preExeAtt();
			memcpy(current_att_md.attestation_output, preExeResult, MEASUREMENT_SIZE);
		}
		current_att_md.cmd = 0;

	}

}
