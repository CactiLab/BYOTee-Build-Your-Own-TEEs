#include <stdio.h>
#include "platform.h"
#include "xparameters.h"
#include "xil_exception.h"
#include "xstatus.h"
#include "xil_mem.h"
#include "util.h"
#include "xintc.h"
#include "constants.h"
#include "sleep.h"
#include "blake2s.h"
#include "aes.h"

#define change_state(state) c->drm_state = state;
#define set_stopped() change_state(STOPPED)
#define set_working() change_state(WORKING)
#define set_playing() change_state(PLAYING)
#define set_paused() change_state(PAUSED)

// shared command channel -- read/write for both PS and PL
volatile cmd_channel *c = (cmd_channel *)SHARED_DDR_BASE;

// internal state store
internal_state __attribute__((section(".ssc.code.buffer"))) local_state;
data_content __attribute__((section(".ssc.data.buffer"))) ssc_data;
ro_data_content __attribute__((section(".ssc.ro.data.buffer"))) ssc_ro_data;
attestation_md __attribute__((section(".ssc.attestation.md"))) att_md;
ssc_meta_data received_metadata;

char ssc_module_loaded = 0;
uint8_t preExeResult[MEASUREMENT_SIZE];
//////////////////////// INTERRUPT HANDLING ////////////////////////

// shared variable between main thread and interrupt processing thread
volatile static int InterruptProcessed = FALSE;
static XIntc InterruptController;
struct AES_ctx ctx;
//uint8_t AES_BLOCK_BUFFER [ENC_DEC_DATA_SIZE];
void myISR(void)
{
	InterruptProcessed = TRUE;
}

//////////////////////// MAIN ////////////////////////
void query_BYOT_runtime()
{
	mb_printf("BYOT_Runtime Initialized!!\r\n");
}

void load_from_shared_to_local()
{
	memcpy(local_state.code, (void *)c->code, CODE_SIZE);
}

void dummy()
{
	char *str1 = NULL, *str2;
	
	memmove(str1, str2, 10);
	strncpy(str1, str2, 10);

	if (!strncmp(str1, NULL, 10))
	{
		format_SSC_code();
	}

	if (!memcmp(str1, str2, 10))
	{
		format_SSC_code();
	}
	Xil_MemCpy(str1, str2, 10);
}

void format_SSC_code()
{
	uint8_t AES_CBC_key[] = {(uint8_t)0x2b, (uint8_t)0x7e, (uint8_t)0x15, (uint8_t)0x16, (uint8_t)0x28, (uint8_t)0xae, (uint8_t)0xd2, (uint8_t)0xa6, (uint8_t)0xab, (uint8_t)0xf7, (uint8_t)0x15, (uint8_t)0x88, (uint8_t)0x09, (uint8_t)0xcf, (uint8_t)0x4f, (uint8_t)0x3c};
	uint8_t AES_CBC_IV[] = {(uint8_t)0x00, (uint8_t)0x01, (uint8_t)0x02, (uint8_t)0x03, (uint8_t)0x04, (uint8_t)0x05, (uint8_t)0x06, (uint8_t)0x07, (uint8_t)0x08, (uint8_t)0x09, (uint8_t)0x0a, (uint8_t)0x0b, (uint8_t)0x0c, (uint8_t)0x0d, (uint8_t)0x0e, (uint8_t)0x0f};

	memcpy(local_state.code, (void *)c->code, c->file_size);
	AES_init_ctx_iv(&ctx, AES_CBC_key, AES_CBC_IV);
	AES_CBC_decrypt_buffer(&ctx, local_state.code, c->file_size);
	unsigned char temp_buffer[sizeof(ssc_meta_data)];

	memset(&received_metadata, 0, sizeof(ssc_meta_data));
	memcpy(temp_buffer, local_state.code, sizeof(ssc_meta_data));

	get_unsigned_int(temp_buffer, &received_metadata);

	memcpy(ssc_data.data, (local_state.code + sizeof(ssc_meta_data) + received_metadata.sss_code_size), received_metadata.data_sec_size);
	memcpy(ssc_ro_data.ro_data, (local_state.code + sizeof(ssc_meta_data) + received_metadata.sss_code_size + received_metadata.data_sec_size), received_metadata.ro_data_size);
	memmove(local_state.code, (local_state.code + sizeof(ssc_meta_data)), received_metadata.sss_code_size);
	//memset(local_state.code + received_metadata.sss_code_size, 0, CODE_SIZE - received_metadata.sss_code_size);
}

void load_code()
{
	remove_ssc_module();
	mb_printf("Reading code & data modules\r\n");
	format_SSC_code();
	mb_printf("SSC Code & data loaded to BRAM\r\n");
}

void execute_SSC()
{
	if (ssc_module_loaded == 0)
	{
		mb_printf("No SSC module present in BRAM\r\n");
		return;
	}
	mb_printf("Triggering execution\r\n");

	((int (*)(void))local_state.code)();

	mb_printf("Finished SSC code executed from BRAM\r\n");
}

void forward_to_ssc()
{
	/*if (ssc_module_loaded == 0)
	{
		mb_printf("No SSC module present in BRAM\r\n");
		return;
	}*/
	mb_printf("Give execution to SSC\r\n");
	((int (*)(void))local_state.code)();
}

void remove_ssc_module()
{
	memset(&local_state.code, 0, CODE_SIZE);
	memset(&ssc_data, 0, DATA_SIZE);
	memset(&ssc_ro_data, 0, RO_DATA_SIZE);
}

int adjust_block_size(int data_size)
{
	int remainder = data_size % BLAKE2S_BLOCKBYTES;

	if (remainder != 0)
	{
		data_size += (BLAKE2S_BLOCKBYTES - remainder);
	}

	return data_size;
}

void input_attestation(char flag)
{
	if (att_md.input_att_size == 0)
		return;

	int data_size = adjust_block_size(att_md.input_att_size + MEASUREMENT_SIZE);
	//Input to SSC data attestation
	memcpy(att_md.att_input_data + att_md.input_att_size, preExeResult, MEASUREMENT_SIZE);
	//memset(att_md.att_input_data + att_md.input_att_size + MEASUREMENT_SIZE, 0, data_size - (att_md.input_att_size + MEASUREMENT_SIZE));
	blake2s(preExeResult, att_md.att_input_data, data_size);

	if (flag == 1)
		//copy the hash to DRAM
		memcpy((void *)&c->preExehash, &preExeResult, MEASUREMENT_SIZE);
}
void output_attestation()
{
	if (att_md.output_att_size == 0)
		return;

	int data_size = adjust_block_size(att_md.output_att_size + MEASUREMENT_SIZE);
	//Input to SSC data attestation
	memcpy(att_md.att_output_data + att_md.output_att_size, preExeResult, MEASUREMENT_SIZE);
	//memset(att_md.att_output_data + att_md.output_att_size + MEASUREMENT_SIZE, 0, data_size - (att_md.output_att_size + MEASUREMENT_SIZE));
	blake2s(preExeResult, att_md.att_output_data, data_size);
	//copy the hash to DRAM
	memcpy((void *)&c->postExehash, &preExeResult, MEASUREMENT_SIZE);
}
//This functions performs measurements on code section, data section and readonly data section before and after SSC execution
void preExeAtt()
{
	int data_size;

	challenge_number = (c->challenge_number);
	mb_printf("postExeAtt for challenge %d\r\n", challenge_number);
	data_size = adjust_block_size(received_metadata.ro_data_size);
	// hash the read only data section + input hash
	blake2s(preExeResult, ssc_ro_data.ro_data, data_size);
	data_size = adjust_block_size(received_metadata.data_sec_size + MEASUREMENT_SIZE);
	memcpy((ssc_data.data + received_metadata.data_sec_size), preExeResult, MEASUREMENT_SIZE);
	// hash the data section + previous hash
	blake2s(preExeResult, ssc_data.data, data_size);
	data_size = adjust_block_size(received_metadata.sss_code_size + MEASUREMENT_SIZE + sizeof(challenge_number));
	memcpy((local_state.code + received_metadata.sss_code_size), &challenge_number, sizeof(challenge_number));
	memcpy((local_state.code + received_metadata.sss_code_size + sizeof(challenge_number)), preExeResult, MEASUREMENT_SIZE);
	// hash the code text section + previous hash + challenge number
	blake2s(preExeResult, local_state.code, data_size);
}
void postExeAtt()
{
	preExeAtt();
	input_attestation(0);
	output_attestation();
}
void cleaup_att_space()
{
	memset(&att_md, 0, sizeof(attestation_md));
}
int main()
{
	u32 status;

	init_platform();
	microblaze_register_handler((XInterruptHandler)myISR, (void *)0);
	microblaze_enable_interrupts();

	// Initialize the interrupt controller driver so that it is ready to use.
	status = XIntc_Initialize(&InterruptController, XPAR_INTC_0_DEVICE_ID);

	if (status != XST_SUCCESS)
	{
		return XST_FAILURE;
	}

	// Set up the Interrupt System.
	status = SetUpInterruptSystem(&InterruptController, (XInterruptHandler)myISR);

	if (status != XST_SUCCESS)
	{
		return XST_FAILURE;
	}

	set_stopped();

	// clear command channel
	memset((void *)c, 0, sizeof(cmd_channel));

	// Handle commands forever
	while (1)
	{
		// wait for interrupt to start
		if (InterruptProcessed)
		{
			InterruptProcessed = FALSE;
			set_working();

			// c->cmd is set by the Untrusted_app player
			switch (c->cmd)
			{
			case LOAD_CODE:
				load_code();
				ssc_module_loaded = 1;
				break;
			case QUERY_DRM:
				query_BYOT_runtime();
				break;
			case SSC_COMMAND:
				preExeAtt();
				forward_to_ssc(); /*Executing SSC*/
				input_attestation(1);
				postExeAtt();
				cleaup_att_space();
				break;
			case EXIT:
				remove_ssc_module();
				ssc_module_loaded = 0;
				break;
			case EXECUTE:
				execute_SSC();
				break;
			default:
				break;
			}
			usleep(1000);
			set_stopped();
		}
	}

	cleanup_platform();
	return 0;
}
