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
#include "xgpio.h"

//////////////////////// GLOBALS ////////////////////////

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
/*#define INTC_GPIO_INTERRUPT_ID	XPAR_INTC_0_GPIO_0_VEC_ID
#define GPIO_CHANNEL1		1
#define GPIO_DEVICE_ID		XPAR_GPIO_0_DEVICE_ID
static u16 GlobalIntrMask;
int IntrFlag;*/
// shared command channel -- read/write for both PS and PL
volatile cmd_channel *c = (cmd_channel *)SHARED_DDR_BASE;

// internal state store
internal_state __attribute__((section(".ssc.code.buffer"))) local_state;
data_content __attribute__((section(".ssc.data.buffer"))) ssc_data;
ro_data_content __attribute__((section(".ssc.ro.data.buffer"))) ssc_ro_data;

#ifdef KEEP_STATE
unsigned int register_values[TOTAL_REGISTERS];
#endif
char ssc_module_loaded = 0;
//////////////////////// INTERRUPT HANDLING ////////////////////////

// shared variable between main thread and interrupt processing thread
volatile static int InterruptProcessed = FALSE;
static XIntc InterruptController;
XGpio Gpio;


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
	ssc_meta_data recived_meta_data;
	unsigned char temp_buffer[24];

	memset(&recived_meta_data, 0, sizeof(ssc_meta_data));

	memcpy(temp_buffer, (void *)c->code, 24);
	get_unsigned_int(temp_buffer, &recived_meta_data);

	memcpy(local_state.code, ((void *)c->code + 24), recived_meta_data.sss_code_size);
	memcpy(ssc_data.data, ((void *)c->code + 24 + recived_meta_data.sss_code_size), recived_meta_data.data_sec_size);
	memcpy(ssc_ro_data.ro_data, ((void *)c->code + 24 + recived_meta_data.sss_code_size + recived_meta_data.data_sec_size), recived_meta_data.ro_data_size);
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

/*void GpioHandler(void *CallbackRef)
{

	XGpio *GpioPtr = (XGpio *)CallbackRef;

	IntrFlag = 1;

	/* Clear the Interrupt */
/*XGpio_InterruptClear(GpioPtr, GlobalIntrMask);

}*/
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

	status = SetUpInterruptSystem(&InterruptController, (XInterruptHandler)myISR);

	if (status != XST_SUCCESS)
	{
		return XST_FAILURE;
	}

	// Start the LED
	enableLED(led);
	set_stopped();

	// clear command channel
	memset((void *)c, 0, sizeof(cmd_channel));
	gpio_test();
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
				//setupGPIO();
				break;
			case QUERY_DRM:
				query_BYOT_runtime();
				break;
			case SSC_COMMAND:
				forward_to_ssc();
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
