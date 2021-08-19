#include "util.h"
#include "constants.h"
#include "PWM.h"

/*
 * This function enables the PWM module and sets its period so it can drive the RGB LED
 */
void enableLED(u32 *led)
{
	PWM_Enable((u32)led);
	PWM_Set_Period((u32)led, (u32)59999);
}

/*
 * This function drives the PWM based upon the input color struct
 * It drives LD0 with the input color struct
 */
void setLED(u32 *led, struct color c)
{
	PWM_Set_Duty((u32)led, c.b, (u32)0);
	PWM_Set_Duty((u32)led, c.g, (u32)1);
	PWM_Set_Duty((u32)led, c.r, (u32)2);
}

int SetUpInterruptSystem(XIntc *XIntcInstancePtr, XInterruptHandler hdlr)
{
	int Status;
	Status = XIntc_Connect(XIntcInstancePtr, XPAR_INTC_0_DEVICE_ID,
						   hdlr,
						   (void *)0);
	if (Status != XST_SUCCESS)
	{
		return XST_FAILURE;
	}

	Status = XIntc_Start(XIntcInstancePtr, XIN_REAL_MODE);
	if (Status != XST_SUCCESS)
	{
		return XST_FAILURE;
	}

	/*
	 * Enable the interrupt for the device
	 */
	XIntc_Enable(XIntcInstancePtr, XPAR_INTC_0_DEVICE_ID);

	/*
	 * Initialize the exception table.
	 */
	Xil_ExceptionInit();

	/*
	 * Register the interrupt controller handler with the exception table.
	 */
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
								 (Xil_ExceptionHandler)XIntc_InterruptHandler,
								 XIntcInstancePtr);

	/*
	 * Enable exceptions.
	 */
	Xil_ExceptionEnable();

	return XST_SUCCESS;
}

u32 fnAudioPlay(XAxiDma AxiDma, u32 offset, u32 u32NrSamples)
{
	u32 status;

	status = XAxiDma_SimpleTransfer(&AxiDma, (u32)(XPAR_MB_DMA_AXI_BRAM_CTRL_0_S_AXI_BASEADDR + offset), u32NrSamples, XAXIDMA_DMA_TO_DEVICE);

	return status;
}

XStatus fnConfigDma(XAxiDma *AxiDma)
{
	int Status;
	XAxiDma_Config *pCfgPtr;

	//Make sure the DMA hardware is present in the project
	//Ensures that the DMA hardware has been loaded
	pCfgPtr = XAxiDma_LookupConfig(XPAR_AXIDMA_0_DEVICE_ID);

	if (!pCfgPtr)
	{

		xil_printf(MB_PROMPT "No config found for %d\r\n", XPAR_AXIDMA_0_DEVICE_ID);

		return XST_FAILURE;
	}

	Status = XAxiDma_CfgInitialize(AxiDma, pCfgPtr);
	if (Status != XST_SUCCESS)
	{

		xil_printf(MB_PROMPT "Initialization failed %d\r\n");

		return XST_FAILURE;
	}

	//Ensures that the Scatter Gather mode is not active
	if (XAxiDma_HasSg(AxiDma))
	{
		xil_printf(MB_PROMPT "Device configured as SG mode\r\n");

		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

void get_unsigned_int(unsigned char *loc_buffer, ssc_meta_data *result)
{

	result->ssc_code_address = (*(loc_buffer) << 24 | *(loc_buffer + 1) << 16 | *(loc_buffer + 2) << 8 | *(loc_buffer + 3));
	result->data_sec_address = (*(loc_buffer + 4) << 24 | *(loc_buffer + 5) << 16 | *(loc_buffer + 6) << 8 | *(loc_buffer + 7));
	result->ro_data_sec_address = (*(loc_buffer + 8) << 24 | *(loc_buffer + 9) << 16 | *(loc_buffer + 10) << 8 | *(loc_buffer + 11));
	result->sss_code_size = (*(loc_buffer + 12) << 24 | *(loc_buffer + 13) << 16 | *(loc_buffer + 14) << 8 | *(loc_buffer + 15));
	result->data_sec_size = (*(loc_buffer + 16) << 24 | *(loc_buffer + 17) << 16 | *(loc_buffer + 18) << 8 | *(loc_buffer + 19));
	result->ro_data_size = (*(loc_buffer + 20) << 24 | *(loc_buffer + 21) << 16 | *(loc_buffer + 22) << 8 | *(loc_buffer + 23));
}
