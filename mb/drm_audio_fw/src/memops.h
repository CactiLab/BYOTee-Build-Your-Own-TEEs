#pragma once
#ifndef MEMOPS_H
#define MEMOPS_H
//see memops.c for implementation
#include <stdint.h>
#include <stddef.h>

/*
returns buf.
*/
void* memset(void* buf, int c, size_t n);
/*
returns dest.
src and dest MAY NOT overlap.
*/
void* memcpy(void* dest, const void* src, size_t n);
/*
returns dest.
src and dest MAY overlap.
*/
void* memmove(void* dest, const void* src, size_t n);
/*
returns:
    + if s1>s2
    0 if s1==s2
    - if s1<s2
*/
int memcmp(const void* s1, const void* s2, size_t n);
/*
returns buf.
zeroes the memory at buf
*/
void* memzero(void* buf, size_t n);
/*
copies memory from fpga-only memory to a shared memory section the arm processor can access.
*/
void* copyfromlocal(void* arm_dest, const void* fpga_src, size_t n);
/*
copies memory from shared arm-accessible space to fpga-only ram.
*/
void* copytolocal(void* fpga_dest, const void* arm_src, size_t n);

#endif // !MEMOPS_H
