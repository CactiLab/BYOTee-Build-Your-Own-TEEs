//int global_mul = 11;
int global_add = 5;
#include "test.h"

void _start(){
	(*pfw_add)();
	add();
}
int add () {
	return mul (4 + global_add);
}
