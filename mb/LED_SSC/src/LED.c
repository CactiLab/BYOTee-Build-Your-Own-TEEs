

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xil_exception.h"
#include "xstatus.h"
#include "xaxidma.h"
#include "xil_mem.h"
#include "util.h"
#include "xintc.h"
#include "constants.h"
#include "sleep.h"

#include "BYOT_header.h"

const struct color RED = {0x01ff, 0x0000, 0x0000};
const struct color YELLOW = {0x01ff, 0x01ff, 0x0000};
const struct color GREEN = {0x0000, 0x01ff, 0x0000};
const struct color BLUE = {0x0000, 0x0000, 0x01ff};

int temp = 0xf1; /* attribute golbal variables*/

int dummy()
{
    char *str1 = NULL, *str2;
    usleep(500);
    init_platform();
    cleanup_platform();
	memmove(str1, str2, 10);
	strcpy(str1, str2);
	if (!strcmp(str1, NULL))
	{
		*str1 = NULL;
	}
	Xil_MemCpy(str1, str2, 10);
}

int fw_add()
{
    return 5 + 3;
}
int main()
{
    u32 *led = (u32 *)XPAR_RGB_PWM_0_PWM_AXI_BASEADDR;
    xil_printf("LED_SSC> Setting LED color blue from SSC \r\n");
    setLED(led, BLUE);
    usleep(10);
    temp = temp + 1;
    return fw_add() + temp;
}
