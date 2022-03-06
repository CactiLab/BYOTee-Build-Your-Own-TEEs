#include <stdio.h>
#include "platform.h"
#include "xparameters.h"
#include "xil_exception.h"
#include "xstatus.h"
#include "xintc.h"
#include "constants.h"
#include "sleep.h"


#define change_state(state) c->drm_state = state;
#define set_stopped() change_state(STOPPED)
#define set_working() change_state(WORKING)
#define set_playing() change_state(PLAYING)
#define set_paused() change_state(PAUSED)
// shared command channel -- read/write for both Hardcore System and PL
volatile cmd_channel *c = (cmd_channel *)SHARED_DDR_BASE;
volatile bmp_map *bmp = (bmp_map *)0x7530;
//bmp_map __attribute__((section(".ssc.bmp.buffer"))) bmp;
// internal state store
//////////////////////// INTERRUPT HANDLING ////////////////////////

// shared variable between main thread and interrupt processing thread
volatile static int InterruptProcessed = FALSE;
static XIntc InterruptController;
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

void SRAM_coldBoot(){
	mb_printf("END = %d\r\n", _end);
	mb_printf("FIle Size %d\r\n", c->file_size);
	mb_printf("pointer address 0x%p 0x%p\r\n", &bmp, bmp);

	mb_printf("Before: \r\n");
	for (int i = 0; i < 64; i++){
		xil_printf("%x ", *(bmp->buf + i));
	}
	memcpy((void *)c->previous_BRAM_data.buf, bmp->buf, c->file_size);


	//memcpy(bmp->buf, (void *)c->drm_chnl.buf, c->file_size);
	for (int i = i; i < c->file_size; i++)
	{
		bmp->buf[i] = 0xde;
	}

	mb_printf("\r\n After: \r\n");
	for (int i = 0; i < 64; i++){
		xil_printf("%x ",  *(bmp->buf + i));
	}
}
int main()
{
	u32 status;
	int tic = 0;
	init_platform();
	microblaze_register_handler((XInterruptHandler)myISR, (void *)0);
	microblaze_enable_interrupts();
	//XTmrCtr_Enable(XPAR_TMRCTR_0_BASEADDR, 0);
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

	// clear command channel
	memset((void *)c, 0, sizeof(cmd_channel));

	// Handle commands forever
	while (1)
	{
		// wait for interrupt to start
		if (InterruptProcessed)
		{
			xil_printf("\r\n---------Interuptted-----------\r\n");
			InterruptProcessed = FALSE;
			set_working();
			SRAM_coldBoot();
			usleep(1000);
			xil_printf("\r\nFrmware Done\r\n");
			set_stopped();

		}
	}

	cleanup_platform();
	return 0;
}
