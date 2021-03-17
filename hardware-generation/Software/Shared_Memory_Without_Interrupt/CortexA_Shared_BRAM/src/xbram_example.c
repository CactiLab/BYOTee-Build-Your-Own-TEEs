
#include "xparameters.h"
#include "xbram.h"
#include <stdio.h>

#define BRAM_DEVICE_ID		XPAR_BRAM_0_DEVICE_ID


int BramExample(u16 DeviceId);
static void InitializeECC(XBram_Config *ConfigPtr, u32 EffectiveAddr);

XBram Bram;

#ifndef TESTAPP_GEN
int main(void)
{
	int Status;

	Status = BramExample(BRAM_DEVICE_ID);
	if (Status != XST_SUCCESS ) {
		xil_printf("Bram Example Failed\r\n");
		return XST_FAILURE;
	}

	WriteOnSharedMemory();
	return XST_SUCCESS;
}
#endif

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

void WriteOnSharedMemory() {
	//sleep(1);
	xil_printf("From Cortex-A -> writing 0x12 on shared memory 0x40000000 \r\n");
	int volatile * const p_reg = (int *) 0x40000000;
	//xil_printf("Before %d\r\n",*p_reg);
	*p_reg = 0x12;
	//xil_printf("after %d\r\n",*p_reg);
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
