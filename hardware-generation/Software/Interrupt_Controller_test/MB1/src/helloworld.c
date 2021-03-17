
#include "xparameters.h"
#include "xuartlite.h"
#include "xil_exception.h"

#ifdef XPAR_INTC_0_DEVICE_ID
#include "xintc.h"
#include <stdio.h>
#else
#include "xscugic.h"
#include "xil_printf.h"
#endif


#ifndef TESTAPP_GEN
#define UARTLITE_DEVICE_ID	  XPAR_UARTLITE_0_DEVICE_ID
#define UARTLITE_IRPT_INTR	  XPAR_INTC_0_UARTLITE_0_VEC_ID

#ifdef XPAR_INTC_0_DEVICE_ID
#define INTC_DEVICE_ID		XPAR_INTC_0_DEVICE_ID
#else
#define INTC_DEVICE_ID		XPAR_SCUGIC_SINGLE_DEVICE_ID
#endif
#endif


#define TEST_BUFFER_SIZE		100


#ifdef XPAR_INTC_0_DEVICE_ID
#define INTC		XIntc
#define INTC_HANDLER	XIntc_InterruptHandler
#else
#define INTC		XScuGic
#define INTC_HANDLER	XScuGic_InterruptHandler
#endif



int UartLiteIntrExample(INTC *IntcInstancePtr,
			XUartLite *UartLiteInstancePtr,
			u16 UartLiteDeviceId,
			u16 UartLiteIntrId);

static void UartLiteSendHandler(void *CallBackRef, unsigned int EventData);

static void UartLiteRecvHandler(void *CallBackRef, unsigned int EventData);

static int UartLiteSetupIntrSystem(INTC *IntcInstancePtr,
				XUartLite *UartLiteInstancePtr,
				u16 UartLiteIntrId);

static void UartLiteDisableIntrSystem(INTC *IntrInstancePtr,
				u16 UartLiteIntrId);



#ifndef TESTAPP_GEN
static INTC IntcInstance;
static XUartLite UartLiteInst;
#endif


u8 SendBuffer[TEST_BUFFER_SIZE];


static volatile int TotalSentCount;


#ifndef TESTAPP_GEN
int main(void)
{
	int Status;

	xil_printf("starts");
	xil_printf("%d %d",UARTLITE_DEVICE_ID,UARTLITE_IRPT_INTR);
	Status = UartLiteIntrExample(&IntcInstance,
				 &UartLiteInst,
				 UARTLITE_DEVICE_ID,
				 UARTLITE_IRPT_INTR);
	if (Status != XST_SUCCESS) {
		xil_printf("Uartlite interrupt tapp Example Failed\r\n");
		return XST_FAILURE;
	}

	xil_printf("Successfully ran Uartlite interrupt tapp Example\r\n");
	return XST_SUCCESS;
}
#endif

int UartLiteIntrExample(INTC *IntcInstancePtr,
			XUartLite *UartLiteInstPtr,
			u16 UartLiteDeviceId,
			u16 UartLiteIntrId)

{
	int Status;
	u32 Index;


	Status = XUartLite_Initialize(UartLiteInstPtr, UartLiteDeviceId);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}


	Status = XUartLite_SelfTest(UartLiteInstPtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}


	Status = UartLiteSetupIntrSystem(IntcInstancePtr,
					 UartLiteInstPtr,
					 UartLiteIntrId);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}


	XUartLite_SetSendHandler(UartLiteInstPtr, UartLiteSendHandler,
							 UartLiteInstPtr);
	XUartLite_SetRecvHandler(UartLiteInstPtr, UartLiteRecvHandler,
							 UartLiteInstPtr);

	XUartLite_EnableInterrupt(UartLiteInstPtr);


	for (Index = 0; Index < TEST_BUFFER_SIZE; Index++) {
		SendBuffer[Index] = Index;
	}

	XUartLite_Send(UartLiteInstPtr, SendBuffer, TEST_BUFFER_SIZE);

	while ((TotalSentCount != TEST_BUFFER_SIZE)) {
	}

	UartLiteDisableIntrSystem(IntcInstancePtr, UartLiteIntrId);

	return XST_SUCCESS;
}

static void UartLiteSendHandler(void *CallBackRef, unsigned int EventData)
{
	TotalSentCount = EventData;
}

static void UartLiteRecvHandler(void *CallBackRef, unsigned int EventData)
{

}

int UartLiteSetupIntrSystem(INTC *IntcInstancePtr,
				XUartLite *UartLiteInstPtr,
				u16 UartLiteIntrId)
{
	int Status;

#ifdef XPAR_INTC_0_DEVICE_ID

#ifndef TESTAPP_GEN

	Status = XIntc_Initialize(IntcInstancePtr, INTC_DEVICE_ID);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
#endif


	Status = XIntc_Connect(IntcInstancePtr, UartLiteIntrId,
			(XInterruptHandler)XUartLite_InterruptHandler,
			(void *)UartLiteInstPtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

#ifndef TESTAPP_GEN

	Status = XIntc_Start(IntcInstancePtr, XIN_REAL_MODE);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
#endif


	XIntc_Enable(IntcInstancePtr, UartLiteIntrId);
#else

#ifndef TESTAPP_GEN
	XScuGic_Config *IntcConfig;


	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	if (NULL == IntcConfig) {
		return XST_FAILURE;
	}

	Status = XScuGic_CfgInitialize(IntcInstancePtr, IntcConfig,
					IntcConfig->CpuBaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
#endif

	XScuGic_SetPriorityTriggerType(IntcInstancePtr, UartLiteIntrId,
					0xA0, 0x3);

	Status = XScuGic_Connect(IntcInstancePtr, UartLiteIntrId,
				 (Xil_ExceptionHandler)XUartLite_InterruptHandler,
				 UartLiteInstPtr);
	if (Status != XST_SUCCESS) {
		return Status;
	}

	XScuGic_Enable(IntcInstancePtr, UartLiteIntrId);
#endif



#ifndef TESTAPP_GEN

	Xil_ExceptionInit();

	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			(Xil_ExceptionHandler)INTC_HANDLER,
			IntcInstancePtr);


	Xil_ExceptionEnable();

#endif

	return XST_SUCCESS;
}

static void UartLiteDisableIntrSystem(INTC *IntcInstancePtr,
					  u16 UartLiteIntrId)
{


#ifdef XPAR_INTC_0_DEVICE_ID
	XIntc_Disconnect(IntcInstancePtr, UartLiteIntrId);
#else
	XScuGic_Disable(IntcInstancePtr, UartLiteIntrId);
	XScuGic_Disconnect(IntcInstancePtr, UartLiteIntrId);

#endif

}

