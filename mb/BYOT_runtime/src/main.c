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


//////////////////////// GLOBALS ////////////////////////


// audio DMA access
static XAxiDma sAxiDma;

// LED colors and controller
u32 *led = (u32*) XPAR_RGB_PWM_0_PWM_AXI_BASEADDR;
const struct color RED =    {0x01ff, 0x0000, 0x0000};
const struct color YELLOW = {0x01ff, 0x01ff, 0x0000};
const struct color GREEN =  {0x0000, 0x01ff, 0x0000};
const struct color BLUE =   {0x0000, 0x0000, 0x01ff};

// change states
#define change_state(state, color) c->drm_state = state; setLED(led, color);
#define set_stopped() change_state(STOPPED, RED)
#define set_working() change_state(WORKING, YELLOW)
#define set_playing() change_state(PLAYING, GREEN)
#define set_paused()  change_state(PAUSED, BLUE)

// shared command channel -- read/write for both PS and PL
volatile cmd_channel *c = (cmd_channel*)SHARED_DDR_BASE;

// internal state store
internal_state __attribute__((section (".ssc.code.buffer"))) local_state;
data_content __attribute__((section (".ssc.data.buffer"))) ssc_data;
//char __attribute__((section (".ssc.data.buffer"))) ssc_data [2000];


//////////////////////// INTERRUPT HANDLING ////////////////////////


// shared variable between main thread and interrupt processing thread
volatile static int InterruptProcessed = FALSE;
static XIntc InterruptController;

void myISR(void) {
    InterruptProcessed = TRUE;
}

//////////////////////// MAIN ////////////////////////
void query_drm(){
	mb_printf("Dummy: Check if calling procedure is ok \r\n");
}
void load_from_shared_to_local() {
    memcpy(local_state.code, (void*)c->code, CODE_SIZE);
}

void format_SSC_code() {
	unsigned int ssc_code_address = 0, data_sec_address = 0, ro_data_sec_address= 0;
	unsigned int sss_code_size = 0, data_sec_size = 0, ro_data_size = 0;
	unsigned char temp_buffer [4];
	unsigned char data_bf[2000];
	unsigned char rodata_bf[2000];

	memcpy(temp_buffer, (void*)c->code , 4);
	ssc_code_address = get_unsigned_int(temp_buffer);

	memcpy(temp_buffer, (void*)c->code + 4, 4);
	data_sec_address = get_unsigned_int(temp_buffer);

	memcpy(temp_buffer, (void*)c->code + 8, 4);
	ro_data_sec_address = get_unsigned_int(temp_buffer);

	memcpy(temp_buffer, (void*)c->code + 12, 4);
	sss_code_size = get_unsigned_int(temp_buffer);

	memcpy(temp_buffer, (void*)c->code + 16, 4);
	data_sec_size = get_unsigned_int(temp_buffer);

	memcpy(temp_buffer, (void*)c->code + 20, 4);
	ro_data_size = get_unsigned_int(temp_buffer);

	memcpy(local_state.code, ((void*)c->code + 24), sss_code_size);
	memcpy(data_bf, ((void*)c->code + 24 + sss_code_size), data_sec_size);
	memcpy(rodata_bf, ((void*)c->code + 24 + sss_code_size + data_sec_size), ro_data_size);
}
void load_code(){
	mb_printf("Inside Load Code Funciton\r\n");
	int i;
	format_SSC_code();
	//load_from_shared_to_local();
    //copy_input_from_shared_to_local();
	mb_printf("-----Read code data-----\r\n");
    i = ((int (*) (void))local_state.code)();
	mb_printf("Code to be executed value returned: '%d'\r\n",  i);
}

int fw_add() {
	return 5 + 3;
}

int main() {
    u32 status;

    init_platform();
    microblaze_register_handler((XInterruptHandler)myISR, (void *)0);
    microblaze_enable_interrupts();

    // Initialize the interrupt controller driver so that it is ready to use.
    status = XIntc_Initialize(&InterruptController, XPAR_INTC_0_DEVICE_ID);
    if (status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    // Set up the Interrupt System.
    status = SetUpInterruptSystem(&InterruptController, (XInterruptHandler)myISR);
    if (status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    // Congigure the DMA
    status = fnConfigDma(&sAxiDma);
    if(status != XST_SUCCESS) {
        mb_printf("DMA configuration ERROR\r\n");
        return XST_FAILURE;
    }

    // Start the LED
    enableLED(led);
    set_stopped();

    // clear command channel
    memset((void*)c, 0, sizeof(cmd_channel));

    mb_printf("--Audio DRM Module has Booted--\n\r");
    fw_add();
    // Handle commands forever
    while(1) {
        // wait for interrupt to start
        if (InterruptProcessed) {
            InterruptProcessed = FALSE;
            set_working();

            // c->cmd is set by the miPod player
            switch (c->cmd) {
            case LOAD_CODE:
            	load_code();
                break;
            case QUERY_DRM:
            	query_drm();
            default:
                break;
            }
            usleep(500);
            set_stopped();
        }
    }

    cleanup_platform();
    return 0;
}
