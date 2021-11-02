#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include "platform.h"
#include "xil_printf.h"
#include "BYOT_header.h"
#include "constants.h"
//#include "blake2s.h"

// Enable ECB, CTR and CBC mode. Note this can be done before including aes.h or at compile-time.
// E.g. with GCC by using the -D flag: gcc -c aes.c -DCBC=0 -DCTR=1 -DECB=1
#define CBC 1
#define CTR 1
#define ECB 1


volatile cmd_channel *cmd_chnl = (cmd_channel *)SHARED_DDR_BASE;
int prev_calulated_value = 1;
int result = 1;
attestation_md __attribute__((section(".ssc.attestation.md"))) att_md;

int dummy_for_Frac_SSA()
{
    u32 t, s;
    char *str1 = NULL, *str2;

    usleep(500);
    sleep(50);
    MB_Sleep(10);
    init_platform();
    cleanup_platform();
    memmove(str1, str2, 10);
    memcpy(str1, str2,10);
    if (!memcmp(str1, str2, 10))
    {

    }
    
    memset(str1, str2, 10);
    strncpy(str1, str2, 10);

    if (!strncmp(str1, NULL, 10))
    {
        *str1 = NULL;
    }
    __mulsi3();
    Xil_MemCpy(str1, str2, 10);
    //memcmp(str1, str2, 10);
}

int main()
{
    xil_printf("!!!!!!!!!!I will keep States!!!!!!!\r\n");
    for (int i = 0; i < 10000; i++)
    {
    	/*if (i != 1)
    	{
    		mb_printf("Invoking previous state\r\n");
    		return;
    	}
    	if (cmd_chnl->factorial == 0)
    	{
    		mb_printf("Stop execution");
    		return;
    	}
    	else {
    		mb_printf("Iterating over %d\r\n", i);
    		result = result * i;
    	}*/
    	//xil_printf("Printing value 0x%x\r\n", i);
    	usleep(10000);
    }
}

