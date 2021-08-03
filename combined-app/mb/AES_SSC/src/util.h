#ifndef UTIL_H
#define UTIL_H
#include "xaxidma.h"
#include "xintc.h"
#include "constants.h"

void enableLED(u32* led);
void setLED(u32* led, struct color c);
int SetUpInterruptSystem(XIntc *XIntcInstancePtr, XInterruptHandler hdlr);
u32 fnAudioPlay(XAxiDma AxiDma, u32 offset, u32 u32NrSamples);
XStatus fnConfigDma(XAxiDma *AxiDma);

#endif
