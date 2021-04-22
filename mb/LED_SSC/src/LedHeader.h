#ifndef __TEST_H_
#define __TEST_H
/*
int _test() __attribute__ ((section (".ssc")));
int main() __attribute__ ((section (".ssc")));
int fw_add() __attribute__ ((section (".fw_add")));*/

int _test();
int main() __attribute__ ((section (".text.ssc_entry")));
int fw_add();
int dummpy();
//void xil_printf( const char8 *ctrl1, ...) __attribute__ ((section (".xfwLib")));
//int add();
//int mul(int);

//int (*pfw_add)() = 0x30e0;

#endif
