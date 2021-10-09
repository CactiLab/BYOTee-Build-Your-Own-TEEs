#include "util.h"
#include "constants.h"

/*
 * This function enables the PWM module and sets its period so it can drive the RGB LED
 */
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


void get_unsigned_int(unsigned char *loc_buffer, ssc_meta_data *result)
{
	result->ssc_code_address = (*(loc_buffer) << 24 | *(loc_buffer + 1) << 16 | *(loc_buffer + 2) << 8 | *(loc_buffer + 3));
	result->data_sec_address = (*(loc_buffer + 4) << 24 | *(loc_buffer + 5) << 16 | *(loc_buffer + 6) << 8 | *(loc_buffer + 7));
	result->ro_data_sec_address = (*(loc_buffer + 8) << 24 | *(loc_buffer + 9) << 16 | *(loc_buffer + 10) << 8 | *(loc_buffer + 11));
	result->sss_code_size = (*(loc_buffer + 12) << 24 | *(loc_buffer + 13) << 16 | *(loc_buffer + 14) << 8 | *(loc_buffer + 15));
	result->data_sec_size = (*(loc_buffer + 16) << 24 | *(loc_buffer + 17) << 16 | *(loc_buffer + 18) << 8 | *(loc_buffer + 19));
	result->ro_data_size = (*(loc_buffer + 20) << 24 | *(loc_buffer + 21) << 16 | *(loc_buffer + 22) << 8 | *(loc_buffer + 23));
}
