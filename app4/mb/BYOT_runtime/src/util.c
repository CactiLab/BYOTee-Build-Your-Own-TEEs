#include "util.h"
#include "constants.h"
#include "PWM.h"
#include "xparameters.h"
#include "xbram.h"
/*
 * This function enables the PWM module and sets its period so it can drive the RGB LED
 */
XBram Bram;	/* The Instance of the BRAM Driver */
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

int BramExample(u16 DeviceId)
{
	int Status;
	XBram_Config *ConfigPtr;

	ConfigPtr = XBram_LookupConfig(DeviceId);
	if (ConfigPtr == (XBram_Config *) NULL) {
		return XST_FAILURE;
	}

	Status = XBram_CfgInitialize(&Bram, ConfigPtr,
				     ConfigPtr->CtrlBaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	InitializeECC(ConfigPtr, ConfigPtr->CtrlBaseAddress);

	Status = XBram_SelfTest(&Bram, 0);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

void InitializeECC(XBram_Config *ConfigPtr, u32 EffectiveAddr)
{
	u32 Addr;
	volatile u32 Data;

	if (ConfigPtr->EccPresent &&
	    ConfigPtr->EccOnOffRegister &&
	    ConfigPtr->EccOnOffResetValue == 0 &&
	    ConfigPtr->WriteAccess != 0) {
		for (Addr = ConfigPtr->MemBaseAddress;
		     Addr < ConfigPtr->MemHighAddress; Addr+=4) {
			Data = XBram_In32(Addr);
			XBram_Out32(Addr, Data);
		}
		XBram_WriteReg(EffectiveAddr, XBRAM_ECC_ON_OFF_OFFSET, 1);
	}
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
