#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include "constants.h"
#include "xparameters.h"
#include "xbram.h"
//#include "hmac.h"

volatile bram_channel *bram_chnl = (bram_channel *) SHARED_BRAM_BASE;
XBram Bram;	/* The Instance of the BRAM Driver */
/*void generate_signature()
{
	uint8_t sig[HASH_OUTPUT_SIZE];

	memset(sig, 0, HASH_OUTPUT_SIZE);
	hmac(auth_key, (void *)bram_chnl->input_data, HASH_OUTPUT_SIZE, sig);

	memcpy((void *)bram_chnl->output_data, sig, HASH_OUTPUT_SIZE);
}*/


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


	/*
	 * Execute the BRAM driver selftest.
	 */
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


int main()
{
	int Status;
	Status = BramExample(XPAR_SHARE_AXI_BRAM_CTRL_1_DEVICE_ID);

	if (Status != XST_SUCCESS ) {
		xil_printf("Bram Example Failed\r\n");
		return XST_FAILURE;
	}

	xil_printf("Successfully ran Bram Example\r\n");
	while(1)
	{
		if (bram_chnl->input_available == 1)
		{
			//generate_signature();
			bram_chnl->input_available = 0;
		}

	}
}
