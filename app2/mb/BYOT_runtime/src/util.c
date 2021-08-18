#include "util.h"
#include "constants.h"
#include "PWM.h"
#include "xil_exception.h"
#include "xgpio.h"
#define GPIO_DEVICE_ID XPAR_GPIO_0_DEVICE_ID
#define INTC_GPIO_INTERRUPT_ID XPAR_INTC_0_GPIO_0_VEC_ID
XGpio Gpio;

#define GPIO_CHANNEL1 1
static u16 GlobalIntrMask;
void GpioHandler(void *CallBackRef);
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
	u16 IntrMask = GPIO_CHANNEL1;
	//test_button_interrupt(XIntcInstancePtr);
	Status = XGpio_Initialize(&Gpio, GPIO_DEVICE_ID);

	if (Status != XST_SUCCESS)
	{
		return XST_FAILURE;
	}
	else
	{
		xil_printf("GPIO initialize success\r\n");
	}

	Status = XIntc_Connect(XIntcInstancePtr, XPAR_INTC_0_DEVICE_ID,
						   hdlr,
						   (void *)0);

	if (Status != XST_SUCCESS)
	{
		return XST_FAILURE;
	}

	XIntc_Connect(XIntcInstancePtr, INTC_GPIO_INTERRUPT_ID,
				  (Xil_ExceptionHandler)GpioHandler, &Gpio);

	if (Status != XST_SUCCESS)
	{
		return XST_FAILURE;
	}
	else
	{
		xil_printf("x intc connect success\r\n");
	}

	Status = XIntc_Start(XIntcInstancePtr, XIN_REAL_MODE);

	if (Status != XST_SUCCESS)
	{
		return XST_FAILURE;
	}

	XIntc_Enable(XIntcInstancePtr, XPAR_INTC_0_DEVICE_ID);

	GlobalIntrMask = IntrMask;
	XGpio_InterruptEnable(&Gpio, IntrMask);
	XGpio_InterruptGlobalEnable(&Gpio);

	int t = XGpio_SelfTest(&Gpio);
	
	if (t == XST_SUCCESS)
	{
		xil_printf("\r\n\r\n\r\nSELF TEST OK\r\n\r\n\r\n");
	}
	else
	{
		xil_printf("\r\n\r\n\r\nFailed\r\n");
	}

	Xil_ExceptionInit();

	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
								 (Xil_ExceptionHandler)XIntc_InterruptHandler,
								 XIntcInstancePtr);

	/*Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
				 (Xil_ExceptionHandler)XIntc_InterruptHandler, XIntcInstancePtr);*/

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

void get_unsigned_int(unsigned char *loc_buffer, ssc_meta_data *result)
{

	result->ssc_code_address = (*(loc_buffer) << 24 | *(loc_buffer + 1) << 16 | *(loc_buffer + 2) << 8 | *(loc_buffer + 3));
	result->data_sec_address = (*(loc_buffer + 4) << 24 | *(loc_buffer + 5) << 16 | *(loc_buffer + 6) << 8 | *(loc_buffer + 7));
	result->ro_data_sec_address = (*(loc_buffer + 8) << 24 | *(loc_buffer + 9) << 16 | *(loc_buffer + 10) << 8 | *(loc_buffer + 11));
	result->sss_code_size = (*(loc_buffer + 12) << 24 | *(loc_buffer + 13) << 16 | *(loc_buffer + 14) << 8 | *(loc_buffer + 15));
	result->data_sec_size = (*(loc_buffer + 16) << 24 | *(loc_buffer + 17) << 16 | *(loc_buffer + 18) << 8 | *(loc_buffer + 19));
	result->ro_data_size = (*(loc_buffer + 20) << 24 | *(loc_buffer + 21) << 16 | *(loc_buffer + 22) << 8 | *(loc_buffer + 23));
}
