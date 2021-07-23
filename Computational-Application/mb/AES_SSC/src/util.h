#ifndef UTIL_H
#define UTIL_H
#include "xintc.h"
#include "constants.h"

int SetUpInterruptSystem(XIntc *XIntcInstancePtr, XInterruptHandler hdlr);

#endif
