#ifndef UTIL_H
#define UTIL_H
#include "xintc.h"
#include "constants.h"

void enableLED(u32 *led);
void setLED(u32 *led, struct color c);
int SetUpInterruptSystem(XIntc *XIntcInstancePtr, XInterruptHandler hdlr);
#endif
