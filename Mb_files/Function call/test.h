#ifndef __TEST_H_
#define __TEST_H

void _start() __attribute__ ((section (".text.entry")));
int add();
int mul(int);

int (*pfw_add)() = 0x30e0;

#endif
