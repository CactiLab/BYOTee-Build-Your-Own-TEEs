#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/stat.h>
#include <fcntl.h>
// Enable ECB, CTR and CBC mode. Note this can be done before including aes.h or at compile-time.
// E.g. with GCC by using the -D flag: gcc -c aes.c -DCBC=0 -DCTR=1 -DECB=1

#define MAX_SSA_SIZE 50000
#include "aes.h"

static void phex(uint8_t* str);
static int encrypt_cbc();


int main(int argc, char *argv[])
{
    if (argc != 2) {
        printf("Need one argument FILE NAME.\n");
        return 0;     
    }
    int exit;
    
    exit = encrypt_cbc(argv[1]);
    return exit;
}


// prints string as hex
static void phex(uint8_t* str)
{
    uint8_t len = 16;
    unsigned char i;

    for (i = 0; i < len; ++i)
        printf("%.2x", str[i]);
    printf("\n");
}
static int encrypt_cbc(char *fnmae)
{
    uint8_t key[] = { 0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c };
    uint8_t iv[]  = { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f };
    struct AES_ctx ctx;
    int fd;
    struct stat sb;
    ssize_t written, wrote;
    unsigned char SSA [MAX_SSA_SIZE];
    unsigned char encrypted_SSA [MAX_SSA_SIZE];
    
    fd = open(fnmae, O_RDWR);

    if (fd == -1)
    {
        printf("Failed to open file! Error = %d\n", errno);
        return 0;
    }

    if (fstat(fd, &sb) == -1)
    {
        printf("Failed to stat file! Error = %d\n", errno);
        return 0;
    }

    read(fd, encrypted_SSA,  sb.st_size);
    printf("Loaded file into shared buffer (%dB)\r\n", sb.st_size);
    lseek(fd, 0, SEEK_SET);   /* seek to start of file */
    
    memcpy(SSA, encrypted_SSA, sb.st_size);
    printf("----------------CBC encrypting START----------------\n");
    AES_init_ctx_iv(&ctx, key, iv);
    AES_CBC_encrypt_buffer(&ctx, encrypted_SSA, sb.st_size);
    
    while (written < sb.st_size) {
        wrote = write(fd, encrypted_SSA, sb.st_size - written);
        if (wrote == -1) {
            printf("Error in writing file! Error = %d\r\n", errno);
            return;
        }
        written += wrote;
    }
    
    close(fd);
    printf("----------------CBC encrypting DONE-----------------\n");
    /*for TESTING PURPOSE*/
   /*read(fd, encrypted_SSA,  sb.st_size);
    close(fd);
       for (int i = 0; i < 4; ++i)
    {
     
      phex(encrypted_SSA + (i * 16));
    }
    printf("\n");
    AES_init_ctx_iv(&ctx, key, iv);
    AES_CBC_decrypt_buffer(&ctx, encrypted_SSA, 32);
    if (0 == memcmp((char*) encrypted_SSA, (char*) SSA, 32)) {
        printf("SUCCESS!\n");
	//return(0);
    } else {
        printf("FAILURE!\n");
	return(1);
    }
    uint8_t tt [32];
    memset(tt, 0, 32);
    memcpy(tt, encrypted_SSA + 32, 31);
    //AES_init_ctx_iv(&ctx, key, iv);
    AES_CBC_decrypt_buffer(&ctx, tt , 31);
    if (0 == memcmp((char*) tt, (char*) (SSA + 32), 31)) {
        printf("SUCCESS!\n");
	//return(0);
    } else {
        printf("FAILURE!\n");
	return(1);
    }
     for (int i = 0; i < 4; ++i)
    {
     
      phex(encrypted_SSA + (i * 16));
    }
    printf("\n");
     for (int i = 0; i < 4; ++i)
    {
     
      phex(SSA + (i * 16));
    }
    printf("\n");
    fd = open("SSC/AES_SSC_DECRYPTED", O_WRONLY);
     if (fd == -1)
    {
        printf("Failed to open file! Error = %d\n", errno);
        return 0;
    }

    if (fstat(fd, &sb) == -1)
    {
        printf("Failed to stat file! Error = %d\n", errno);
        return 0;
    }
    lseek(fd, 0, SEEK_SET);   
     while (written < sb.st_size) {
        wrote = write(fd, encrypted_SSA, sb.st_size - written);
        if (wrote == -1) {
            printf("Error in writing file! Error = %d\r\n", errno);
            return;
        }
        written += wrote;
    }
    close(fd);*/
}