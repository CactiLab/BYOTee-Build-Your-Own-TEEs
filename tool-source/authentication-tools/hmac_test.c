#include "hmac.h"
#include <errno.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

#define SHA2_TESTS   1
#define KEY_LEN 20
#define TEXT_LEN 50000

struct
{   unsigned int key_len;
    unsigned int txt_len;
    unsigned int mac_len;
    unsigned char key[KEY_LEN];
    unsigned char text[TEXT_LEN];
} t_s2[SHA2_TESTS] =
{
    {   KEY_LEN, 8, 64,
    { 0x01, 0xab, 0xcb, 0xdb, 0x4b, 0x7b, 0xaa, 0xca,
      0x8b, 0x8b, 0x35, 0xcb, 0x3b, 0x0c, 0x4b, 0xfb,
      0x01, 0xee, 0xfc, 0xcc }
    }
};

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
    lseek(fd, 0, SEEK_SET);
    
    t_s2->txt_len = sb.st_size;
    memcpy(t_s2->text, SSA, sb.st_size);

    for(i = 0; i < SHA2_TESTS; ++i)
    {   hmac_ctx cx[1];
        hmac_sha_begin(HMAC_SHA512, cx);
        hmac_sha_key(t_s2[i].key, t_s2[i].key_len / 2, cx);
        hmac_sha_key(t_s2[i].key + t_s2[i].key_len / 2,
                    t_s2[i].key_len - t_s2[i].key_len / 2, cx);
        hmac_sha_data(t_s2[i].text, t_s2[i].txt_len / 2, cx);
        hmac_sha_data(t_s2[i].text + t_s2[i].txt_len / 2,
                        t_s2[i].txt_len - t_s2[i].txt_len / 2, cx);

        hmac_sha_end(mac, t_s2[i].mac_len, cx);

        printf("\n------------Begin HMAC-SHA512------------------------\n");
        for(k = 0; k < t_s2[i].mac_len; k += 4)
        {
            if(k % 16 == 0)
                printf("\n");
            printf("0x%02x%02x%02x%02x ", mac[k], mac[k + 1], mac[k + 2], mac[k + 3]);
        }
        printf("\n");
    }

    while (written < t_s2[0].mac_len) {
        wrote = write(fd, mac, t_s2[0].mac_len - written);
        if (wrote == -1) {
            printf("Error in writing file! Error = %d\r\n", errno);
            return;
        }
        written += wrote;
    }

    written = 0;
    wrote = 0;

    while (written < sb.st_size) {
        wrote = write(fd, SSA, sb.st_size - written);
        if (wrote == -1) {
            printf("Error in writing file! Error = %d\r\n", errno);
            return;
        }
        written += wrote;
    }

    close(fd);
    printf("\n------------ADDED AUTHENTICATION SIGNATURE-----------\n");
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
