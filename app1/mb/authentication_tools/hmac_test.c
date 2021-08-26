/*
---------------------------------------------------------------------------
Copyright (c) 1998-2010, Brian Gladman, Worcester, UK. All rights reserved.

The redistribution and use of this software (with or without changes)
is allowed without the payment of fees or royalties provided that:

  source code distributions include the above copyright notice, this
  list of conditions and the following disclaimer;

  binary distributions include the above copyright notice, this list
  of conditions and the following disclaimer in their documentation.

This software is provided 'as is' with no explicit or implied warranties
in respect of its operation, including, but not limited to, correctness
and fitness for purpose.
---------------------------------------------------------------------------
Issue Date: 20/12/2007
*/

#include "hmac.h"
#include <errno.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#include <stdlib.h>
#define SHA2_TESTS   1

 struct
{   unsigned int key_len;
    unsigned int txt_len;
    unsigned int mac_len[4];
    unsigned char key[20];
    unsigned char text[160];
    unsigned char r224[28];
    unsigned char r256[32];
    unsigned char r384[48];
    unsigned char r512[64];
} t_s2[SHA2_TESTS] =
{
    {   20, 8, { 28, 32, 48, 64 },
    { 0x01, 0xab, 0xcb, 0xdb, 0x4b, 0x7b, 0xaa, 0xca,
      0x8b, 0x8b, 0x35, 0xcb, 0x3b, 0x0c, 0x4b, 0xfb,
      0x01, 0xee, 0xfc, 0xcc},
    { 0x48, 0x69, 0x20, 0x54, 0x68, 0x65, 0x72, 0x65 },
    { 0x89, 0x6f, 0xb1, 0x12, 0x8a, 0xbb, 0xdf, 0x19,
      0x68, 0x32, 0x10, 0x7c, 0xd4, 0x9d, 0xf3, 0x3f,
      0x47, 0xb4, 0xb1, 0x16, 0x99, 0x12, 0xba, 0x4f,
      0x53, 0x68, 0x4b, 0x22 },
    { 0xb0, 0x34, 0x4c, 0x61, 0xd8, 0xdb, 0x38, 0x53,
      0x5c, 0xa8, 0xaf, 0xce, 0xaf, 0x0b, 0xf1, 0x2b,
      0x88, 0x1d, 0xc2, 0x00, 0xc9, 0x83, 0x3d, 0xa7,
      0x26, 0xe9, 0x37, 0x6c, 0x2e, 0x32, 0xcf, 0xf7 },
    { 0xaf, 0xd0, 0x39, 0x44, 0xd8, 0x48, 0x95, 0x62,
      0x6b, 0x08, 0x25, 0xf4, 0xab, 0x46, 0x90, 0x7f,
      0x15, 0xf9, 0xda, 0xdb, 0xe4, 0x10, 0x1e, 0xc6,
      0x82, 0xaa, 0x03, 0x4c, 0x7c, 0xeb, 0xc5, 0x9c,
      0xfa, 0xea, 0x9e, 0xa9, 0x07, 0x6e, 0xde, 0x7f,
      0x4a, 0xf1, 0x52, 0xe8, 0xb2, 0xfa, 0x9c, 0xb6 },
    { 0x87, 0xaa, 0x7c, 0xde, 0xa5, 0xef, 0x61, 0x9d,
      0x4f, 0xf0, 0xb4, 0x24, 0x1a, 0x1d, 0x6c, 0xb0,
      0x23, 0x79, 0xf4, 0xe2, 0xce, 0x4e, 0xc2, 0x78,
      0x7a, 0xd0, 0xb3, 0x05, 0x45, 0xe1, 0x7c, 0xde,
      0xda, 0xa8, 0x33, 0xb7, 0xd6, 0xb8, 0xa7, 0x02,
      0x03, 0x8b, 0x27, 0x4e, 0xae, 0xa3, 0xf4, 0xe4,
      0xbe, 0x9d, 0x91, 0x4e, 0xeb, 0x61, 0xf1, 0x70,
      0x2e, 0x69, 0x6c, 0x20, 0x3a, 0x12, 0x68, 0x54}
  }
};

#include <stdio.h>

void generate_hamc_sha_512(char *fname)
{
    int fd;
    struct stat sb;
    ssize_t written, wrote;
    unsigned int    i, j, k, key_len = 64;
    unsigned char   mac[HMAC_MAX_OUTPUT_SIZE];
    unsigned char SSA [50000];
    fd = open(fname, O_RDWR);

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

    read(fd, SSA,  sb.st_size);
    printf("Loaded file into shared buffer (%dB)\r\n", sb.st_size);

    for(i = 0; i < SHA2_TESTS; ++i)
    {   hmac_ctx cx[1];
        hmac_sha_begin(HMAC_SHA512, cx);
        hmac_sha_key(t_s2[i].key, t_s2[i].key_len / 2, cx);
        hmac_sha_key(t_s2[i].key + t_s2[i].key_len / 2,
                    t_s2[i].key_len - t_s2[i].key_len / 2, cx);
        hmac_sha_data(t_s2[i].text, t_s2[i].txt_len / 2, cx);
        hmac_sha_data(t_s2[i].text + t_s2[i].txt_len / 2,
                        t_s2[i].txt_len - t_s2[i].txt_len / 2, cx);

        hmac_sha_end(mac, t_s2[i].mac_len[3], cx);

        printf("\nHMAC-SHA512 test %i, ", i + 1);
        printf("mac %s", memcmp(t_s2[i].r512, mac, t_s2[i].mac_len[3])
                                                ? "is bad" : "is good");
        for(k = 0; k < t_s2[i].mac_len[3]; k += 4)
        {
            if(k % 16 == 0)
                printf("\n");
            printf("0x%02x%02x%02x%02x ", mac[k], mac[k + 1], mac[k + 2], mac[k + 3]);
        }
        printf("\n");
    }

    printf("\n\n");
}
int main(int argc, char *argv[])
{   
    if (argc != 2) {
        printf("Need one argument FILE NAME.\n");
        return 0;     
    }
    generate_hamc_sha_512(argv[1]);
    return 0;
}
