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

/******************************************************************************/
/**
*
* This function connects the interrupt handler of the interrupt controller to
* the processor.  This function is seperate to allow it to be customized for
* each application.  Each processor or RTOS may require unique processing to
* connect the interrupt handler.
*
* @param	None.
*
* @return	None.
*
* @note		None.
*
****************************************************************************/
int SetUpInterruptSystem(XIntc *XIntcInstancePtr, XInterruptHandler hdlr)
{
	int Status;

	/*
	 * Connect a device driver handler that will be called when an interrupt
	 * for the device occurs, the device driver handler performs the
	 * specific interrupt processing for the device.
	 */
	Status = XIntc_Connect(XIntcInstancePtr, XPAR_INTC_0_DEVICE_ID,
						   hdlr,
						   (void *)0);
	if (Status != XST_SUCCESS)
	{
		return XST_FAILURE;
	}

	/*
	 * Start the interrupt controller such that interrupts are enabled for
	 * all devices that cause interrupts, specify simulation mode so that
	 * an interrupt can be caused by software rather than a real hardware
	 * interrupt.
	 */
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

/******************************************************************************
 * Configure the I2S controller to transmit data, which will be read out from
 * the local memory vector (Mem)
 *
 * @param	u32NrSamples is the number of samples to play.
 *
 * @return	none.
 *****************************************************************************/
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

	//Initialize DMA
	//Reads and sets all the available information
	//about the DMA to the AxiDma variable
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

int adjust_block_size(int data_size) {
	int remainder = data_size % BLAKE2S_BLOCKBYTES;
	if (remainder != 0)
	{
		data_size += (BLAKE2S_BLOCKBYTES - remainder);
	}
	return data_size;
}
