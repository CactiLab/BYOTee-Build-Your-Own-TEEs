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

//#include "blake2s.h"
//#include "aes.h"
//#include "hmac.h"

#define change_state(state) c->drm_state = state;
#define set_stopped() change_state(STOPPED)
#define set_working() change_state(WORKING)
#define set_playing() change_state(PLAYING)
#define set_paused() change_state(PAUSED)

// shared command channel -- read/write for both PS and PL
volatile cmd_channel *c = (cmd_channel *)SHARED_DDR_BASE;


hw_att_md __attribute__((section(".ssc.att.module.data"))) current_att_md;
// internal state store
internal_state __attribute__((section(".ssc.code.buffer"))) local_state;
data_content __attribute__((section(".ssc.data.buffer"))) ssc_data;
ro_data_content __attribute__((section(".ssc.ro.data.buffer"))) ssc_ro_data;
////attestation_md __attribute__((section(".ssc.attestation.md"))) att_md;
ssc_meta_data received_metadata;

char ssc_module_loaded = 0;
uint8_t preExeResult[MEASUREMENT_SIZE];
#ifdef KEEP_STATE
unsigned int register_values[TOTAL_REGISTERS];
#endif
//////////////////////// INTERRUPT HANDLING ////////////////////////

// shared variable between main thread and interrupt processing thread
volatile static int InterruptProcessed = FALSE;
static XIntc InterruptController;
//struct AES_ctx ctx;

#ifdef KEEP_STATE
void RELOAD_SSA()
{
	memset(local_state.code, 0 , MAX_CODE_REGION);
	memset(ssc_data.data, 0 , MAX_DATA_REGION);
	memset(ssc_ro_data.ro_data, 0 , MAX_RODATA_REGION);
	memset(ssa_stack_instance.scode, 0 , MAX_STACK_REGION);

	memcpy(local_state.code, (void *)c->code, MAX_CODE_REGION);
	memcpy(ssc_data.data, (void *)c->state_chnl.data_reg, MAX_DATA_REGION);
	memcpy(ssc_ro_data.ro_data, (void *)c->state_chnl.rodata_reg, MAX_RODATA_REGION);
	memcpy(ssa_stack_instance.scode, (void *)c->state_chnl.stack_reg, MAX_STACK_REGION);

	int z = 0;
	//asm volatile ("add r14, %0, %1": :"r" (z), "r" (register_values[14]));
	//asm volatile ("add r15, %0, %1": :"r" (z), "r" (register_values[15]));
	asm volatile ("add r0, %0, %1": :"r" (z), "r" (register_values[0]));
	//asm volatile ("add r1, %0, %1": :"r" (z), "r" (register_values[1]));
	asm volatile ("add r2, %0, %1": :"r" (z), "r" (register_values[2]));
	asm volatile ("add r3, %0, %1": :"r" (z), "r" (register_values[3]));
	asm volatile ("add r4, %0, %1": :"r" (z), "r" (register_values[4]));
	asm volatile ("add r5, %0, %1": :"r" (z), "r" (register_values[5]));
	asm volatile ("add r6, %0, %1": :"r" (z), "r" (register_values[6]));
	asm volatile ("add r7, %0, %1": :"r" (z), "r" (register_values[7]));
	asm volatile ("add r8, %0, %1": :"r" (z), "r" (register_values[8]));
	asm volatile ("add r9, %0, %1": :"r" (z), "r" (register_values[9]));
	asm volatile ("add r10, %0, %1": :"r" (z), "r" (register_values[10]));
	asm volatile ("add r11, %0, %1": :"r" (z), "r" (register_values[11]));
	asm volatile ("add r12, %0, %1": :"r" (z), "r" (register_values[12]));
	asm volatile ("add r13, %0, %1": :"r" (z), "r" (register_values[13]));
	asm volatile ("add r16, %0, %1": :"r" (z), "r" (register_values[16]));
	asm volatile ("add r17, %0, %1": :"r" (z), "r" (register_values[17]));
	asm volatile ("add r18, %0, %1": :"r" (z), "r" (register_values[18]));
	asm volatile ("add r19, %0, %1": :"r" (z), "r" (register_values[19]));
	asm volatile ("add r20, %0, %1": :"r" (z), "r" (register_values[20]));
	asm volatile ("add r21, %0, %1": :"r" (z), "r" (register_values[21]));
	asm volatile ("add r22, %0, %1": :"r" (z), "r" (register_values[22]));
	asm volatile ("add r23, %0, %1": :"r" (z), "r" (register_values[23]));
	asm volatile ("add r24, %0, %1": :"r" (z), "r" (register_values[24]));
	asm volatile ("add r25, %0, %1": :"r" (z), "r" (register_values[25]));
	asm volatile ("add r26, %0, %1": :"r" (z), "r" (register_values[26]));
	asm volatile ("add r27, %0, %1": :"r" (z), "r" (register_values[27]));
	asm volatile ("add r28, %0, %1": :"r" (z), "r" (register_values[28]));
	asm volatile ("add r29, %0, %1": :"r" (z), "r" (register_values[29]));
	asm volatile ("add r30, %0, %1": :"r" (z), "r" (register_values[30]));
}
#endif

void myISR(void)
{
	InterruptProcessed = TRUE;
#ifdef KEEP_STATE
	if (c->cmd == SAVE)
		{
			register unsigned int r15 asm("r15");
			register_values[15] = r15;
			register unsigned int r1 asm("r1");
			register_values[1] = r1;
			register unsigned int r14 asm("r14");
			register_values[14] = r14;
			register unsigned int r0 asm("r0");
			register_values[0] = r0;
			register unsigned int r2 asm("r2");
			register_values[2] = r2;
			register unsigned int r3 asm("r3");
			register_values[3] = r3;
			register unsigned int r4 asm("r4");
			register_values[4] = r4;
			register unsigned int r5 asm("r5");
			register_values[5] = r5;
			register unsigned int r6 asm("r6");
			register_values[6] = r6;
			register unsigned int r7 asm("r7");
			register_values[7] = r7;
			register unsigned int r8 asm("r8");
			register_values[8] = r8;
			register unsigned int r9 asm("r9");
			register_values[9] = r9;
			register unsigned int r10 asm("r10");
			register_values[10] = r10;
			register unsigned int r11 asm("r11");
			register_values[11] = r11;
			register unsigned int r12 asm("r12");
			register_values[12] = r12;
			register unsigned int r13 asm("r13");
			register_values[13] = r13;
			register unsigned int r16 asm("r16");
			register_values[16] = r16;
			register unsigned int r17 asm("r17");
			register_values[17] = r17;
			register unsigned int r18 asm("r18");
			register_values[18] = r18;
			register unsigned int r19 asm("r19");
			register_values[19] = r19;
			register unsigned int r20 asm("r20");
			register_values[20] = r20;
			register unsigned int r21 asm("r21");
			register_values[21] = r21;
			register unsigned int r22 asm("r22");
			register_values[22] = r22;
			register unsigned int r23 asm("r23");
			register_values[23] = r23;
			register unsigned int r24 asm("r24");
			register_values[24] = r24;
			register unsigned int r25 asm("r25");
			register_values[25] = r25;
			register unsigned int r26 asm("r26");
			register_values[26] = r26;
			register unsigned int r27 asm("r27");
			register_values[27] = r27;
			register unsigned int r28 asm("r28");
			register_values[28] = r28;
			register unsigned int r29 asm("r29");
			register_values[29] = r29;
			register unsigned int r30 asm("r30");
			register_values[30] = r30;

			/*Get PC */
			asm volatile ("mfs r12, rpc;");
			register unsigned int pc asm("r12");
			register_values[31] = pc;
			memcpy((void *)c->state_chnl.registers, register_values, sizeof(unsigned int) * 32);
			set_working();
			copy_state_data();
			//main_helper();
			int jump = 0x6b2c, z = 0;

			asm volatile ("add r14, %0, %1": :"r" (z), "r" (jump));

			set_stopped();
		}
		if (c->cmd == RELOAD)
		{
			set_working();
			int z = 0;
			RELOAD_SSA();
			set_stopped();
			asm volatile ("add r14, %0, %1": :"r" (z), "r" (register_values[14]));
			asm volatile ("add r1, %0, %1": :"r" (z), "r" (register_values[1]));
			asm volatile ("add r15, %0, %1": :"r" (z), "r" (register_values[15]));
		}
#endif
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

//void dummy()
//{
//	char *str1 = NULL, *str2;
//	microblaze_disable_dcache();
//	memmove(str1, str2, 10);
//	strncpy(str1, str2, 10);
//
//	if (!strncmp(str1, NULL, 10))
//	{
//		format_SSC_code();
//	}
//
//	if (!memcmp(str1, str2, 10))
//	{
//		format_SSC_code();
//	}
//	Xil_MemCpy(str1, str2, 10);
//
//}

void format_SSC_code()
{

	memcpy(local_state.code, (void *)c->code, c->file_size);
	// Invoke the attestation module
	current_att_md.ssa_size = c->file_size;
	current_att_md.cmd = 0xA;
	/* need to wait here until we get the decryption done*/
	while (current_att_md.cmd != 0);
	unsigned char temp_buffer[sizeof(ssc_meta_data)];
	memset(&received_metadata, 0, sizeof(ssc_meta_data));
	memcpy(temp_buffer, local_state.code + SIG_LEN, sizeof(ssc_meta_data));

	get_unsigned_int(temp_buffer, &received_metadata);

	memcpy(ssc_data.data, (local_state.code + sizeof(ssc_meta_data) + received_metadata.sss_code_size + SIG_LEN), received_metadata.data_sec_size);
	memcpy(ssc_ro_data.ro_data, (local_state.code + sizeof(ssc_meta_data) + received_metadata.sss_code_size + received_metadata.data_sec_size + SIG_LEN), received_metadata.ro_data_size);
	memmove(local_state.code, (local_state.code + sizeof(ssc_meta_data) + SIG_LEN), received_metadata.sss_code_size);
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
	if (current_att_md.cmd != 0)
	{
		mb_printf("not zero\r\n");
	}
	else
	{
		mb_printf("not zero\r\n");
	}
	for (int i = 0 ; i < 64; i++)
	{
		mb_printf("%d bit %d\r\n", i, local_state.code[i]);
	}
	//while (current_att_md.cmd != 0);
	mb_printf("Give execution to SSC\r\n");
	((int (*)(void))local_state.code)();
}

void remove_ssc_module()
{
	memset(&local_state.code, 0, CODE_SIZE);
	memset(&ssc_data, 0, DATA_SIZE);
	memset(&ssc_ro_data, 0, RO_DATA_SIZE);
}

/*int adjust_block_size(int data_size)
{
	int remainder = data_size % BLAKE2S_BLOCKBYTES;

	if (remainder != 0)
	{
		data_size += (BLAKE2S_BLOCKBYTES - remainder);
	}

	return data_size;
}*/

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
////This functions performs measurements on code section, data section and readonly data section before and after SSC execution
//void preExeAtt()
//{
//	int data_size;
//
//	challenge_number = (c->challenge_number);
//	mb_printf("Attestation for challenge %d\r\n", challenge_number);
//	data_size = adjust_block_size(received_metadata.ro_data_size);
//	// hash the read only data section + input hash
//	blake2s(preExeResult, ssc_ro_data.ro_data, data_size);
//	data_size = adjust_block_size(received_metadata.data_sec_size + MEASUREMENT_SIZE);
//	memcpy((ssc_data.data + received_metadata.data_sec_size), preExeResult, MEASUREMENT_SIZE);
//	// hash the data section + previous hash
//	blake2s(preExeResult, ssc_data.data, data_size);
//	data_size = adjust_block_size(received_metadata.sss_code_size + MEASUREMENT_SIZE + sizeof(challenge_number));
//	memcpy((local_state.code + received_metadata.sss_code_size), &challenge_number, sizeof(challenge_number));
//	memcpy((local_state.code + received_metadata.sss_code_size + sizeof(challenge_number)), preExeResult, MEASUREMENT_SIZE);
//	// hash the code text section + previous hash + challenge number
//	blake2s(preExeResult, local_state.code, data_size);
//}
//void postExeAtt()
//{
//	preExeAtt();
//	input_attestation(0);
//	output_attestation();
//}
void cleaup_att_space()
{
	//memset(&att_md, 0, sizeof(attestation_md));
}

//int verify_ssa_signature(void *data_start) {
//
//	uint8_t sig[HASH_OUTSIZE];
//
//	memset(sig, 0, HASH_OUTSIZE);
//	hmac(auth_key, data_start, c->file_size - SIG_LEN, sig);
//
//	return !memcmp(sig, (uint8_t *)data_start , SIG_LEN);
//}

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
				//preExeAtt();
				forward_to_ssc(); /*Executing SSC*/
				//input_attestation(1);
				//postExeAtt();
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
