#include <stdio.h>
#include "platform.h"
#include "xparameters.h"
#include "xil_exception.h"
#include "xstatus.h"
#include "xaxidma.h"
#include "xil_mem.h"
#include "util.h"
#include "xintc.h"
#include "constants.h"
#include "sleep.h"
#include "blake2s.h"

//////////////////////// GLOBALS ////////////////////////
static XAxiDma sAxiDma;

// LED colors and controller
u32 *led = (u32 *)XPAR_RGB_PWM_0_PWM_AXI_BASEADDR;
const struct color RED = {0x01ff, 0x0000, 0x0000};
const struct color YELLOW = {0x01ff, 0x01ff, 0x0000};
const struct color GREEN = {0x0000, 0x01ff, 0x0000};
const struct color BLUE = {0x0000, 0x0000, 0x01ff};

// change states
#define change_state(state, color) \
	c->drm_state = state;          \
	setLED(led, color);
#define set_stopped() change_state(STOPPED, RED)
#define set_working() change_state(WORKING, YELLOW)
#define set_playing() change_state(PLAYING, GREEN)
#define set_paused() change_state(PAUSED, BLUE)

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

	unsigned char temp_buffer[sizeof(ssc_meta_data)];

	memset(&received_metadata, 0, sizeof(ssc_meta_data));

	memcpy(temp_buffer, (void *)c->code, sizeof(ssc_meta_data));
	get_unsigned_int(temp_buffer, &received_metadata);

	memcpy(local_state.code, ((void *)c->code + sizeof(ssc_meta_data)), received_metadata.sss_code_size);
	memcpy(ssc_data.data, ((void *)c->code + sizeof(ssc_meta_data) + received_metadata.sss_code_size), received_metadata.data_sec_size);
	memcpy(ssc_ro_data.ro_data, ((void *)c->code + sizeof(ssc_meta_data) + received_metadata.sss_code_size + received_metadata.data_sec_size), received_metadata.ro_data_size);
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
	volatile bram_channel *bram_chnl = (bram_channel *) SHARED_BRAM_BASE;

	mb_printf("Current value: %d", bram_chnl->input_available);
	bram_chnl->input_available += 1;
	usleep(1000);
	mb_printf("Written value: %d", bram_chnl->input_available);
	/*if (ssc_module_loaded == 0)
	{
		mb_printf("No SSC module present in BRAM\r\n");
		return;
	}
	mb_printf("Triggering execution\r\n");

	((int (*)(void))local_state.code)();

	mb_printf("Finished SSC code executed from BRAM\r\n");*/
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
	int data_size = adjust_block_size(att_md.input_att_size + MEASUREMENT_SIZE);

	if (att_md.input_att_size != 0)
	{
		//Input to SSC data attestation
		memcpy(att_md.att_input_data + att_md.input_att_size, preExeResult, MEASUREMENT_SIZE);
		//memset(att_md.att_input_data + att_md.input_att_size + MEASUREMENT_SIZE, 0, data_size - (att_md.input_att_size + MEASUREMENT_SIZE));
		blake2s(preExeResult, att_md.att_input_data, data_size);
	}

	if (flag == 1)
		//copy the hash to DRAM
		memcpy((void *)&c->preExehash, &preExeResult, MEASUREMENT_SIZE);
}

void output_attestation()
{
	int data_size = adjust_block_size(att_md.output_att_size + MEASUREMENT_SIZE);

	if (att_md.output_att_size != 0)
	{
		//Input to SSC data attestation
		memcpy(att_md.att_output_data + att_md.output_att_size, preExeResult, MEASUREMENT_SIZE);
		//memset(att_md.att_output_data + att_md.output_att_size + MEASUREMENT_SIZE, 0, data_size - (att_md.output_att_size + MEASUREMENT_SIZE));
		blake2s(preExeResult, att_md.att_output_data, data_size);
	}
	//copy the hash to DRAM
	memcpy((void *)&c->postExehash, &preExeResult, MEASUREMENT_SIZE);
}

//This functions performs measurements on code section, data section and readonly data section before and after SSC execution
void preExeAtt()
{
	int data_size;
	memset(preExeResult, 0, MEASUREMENT_SIZE);
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

void concat_SSC_attst()
{
	if (att_md.ssc_flag == 0)
		return;

	memcpy(att_md.att_input_data, preExeResult, MEASUREMENT_SIZE);
	memcpy(att_md.att_input_data + MEASUREMENT_SIZE, att_md.ssc_measurement, MEASUREMENT_SIZE);

	if (att_md.ssc_flag == 1)
	{
		blake2s((void *)&c->postExehash, att_md.att_input_data, 2 * MEASUREMENT_SIZE);
	}
	else
	{
		blake2s((void *)&c->preExehash, att_md.att_input_data, 2 * MEASUREMENT_SIZE);
	}
}
void attestation_after_execution()
{
	input_attestation(1);
	concat_SSC_attst();
	postExeAtt();
	concat_SSC_attst();
	cleaup_att_space();
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

	status = fnConfigDma(&sAxiDma);

	if (status != XST_SUCCESS)
	{
		mb_printf("DMA configuration ERROR\r\n");
		return XST_FAILURE;
	}
	// Start the LED
	enableLED(led);
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
				attestation_after_execution();
				break;
			case EXIT:
				remove_ssc_module();
				ssc_module_loaded = 0;
				break;
			case EXECUTE:
				execute_SSC();
				break;
			case PREEXEATT:
				preExeAtt();
				break;
			case POSTEXEATT:
				postExeAtt();
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
