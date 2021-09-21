#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include "platform.h"
#include "xil_printf.h"
#include "BYOT_header.h"
#include "constants.h"
//#include "blake2s.h"

// Enable ECB, CTR and CBC mode. Note this can be done before including aes.h or at compile-time.
// E.g. with GCC by using the -D flag: gcc -c aes.c -DCBC=0 -DCTR=1 -DECB=1
#define CBC 1
#define CTR 1
#define ECB 1

#include "aes.h"

static void phex(uint8_t *str);
static void test_encrypt_ecb_verbose(void);

volatile cmd_channel *cmd_chnl = (cmd_channel *)SHARED_DDR_BASE;
volatile bram_channel *bram_chnl = (bram_channel *) SHARED_BRAM_BASE;

attestation_md __attribute__((section(".ssc.attestation.md"))) att_md;

int dummy_aes_ssc()
{
    u32 t, s;
    char *str1 = NULL, *str2;

    usleep(500);
    sleep(50);
    MB_Sleep(10);
    init_platform();
    cleanup_platform();
    memmove(str1, str2, 10);
    microblaze_flush_cache_ext_range();
    if (!memcmp(str1, str2, 10))
    {
        aes_dec_test();
    }
    
    memset(str1, str2, 10);
    strncpy(str1, str2, 10);

    if (!strncmp(str1, NULL, 10))
    {
        *str1 = NULL;
    }

    Xil_MemCpy(str1, str2, 10);
    microblaze_enable_interrupts();

    microblaze_invalidate_dcache_range();
    //memcmp(str1, str2, 10);
}
void CTEE2_intercommunication()
{
	volatile bram_channel *bram_chnl = (bram_channel *) SHARED_BRAM_BASE;
	uint8_t H_data[64] = {124, 73, 204, 35, 31, 248, 199, 135, 157, 91, 95, 40, 62, 136, 208, 25, 153, 121, 155, 100, 31, 67, 202, 205, 135, 118, 191, 117, 171, 144, 170, 188, 47, 139, 28, 64, 254, 159, 226, 14, 147, 17, 58, 224, 216, 14, 107, 172, 249, 70, 243, 62, 61, 127, 228, 33, 248, 189, 246, 212, 37, 187, 197, 169 };
	bram_chnl->input_len = sizeof(H_data);

	/* Notify CTEE2 to begin execution */
	bram_chnl->input_available = 1;

	mb_printf("Current value: %d", bram_chnl->input_available);
	usleep(100000);

	while(bram_chnl->input_available == 1)
	{
		mb_printf("WAITING ON : %d \r\n",  bram_chnl->input_available);
	}

	usleep(100000);
	mb_printf("CTEE2 calculated Hash: \r\n");
	for (int i = 0; i < HASH_OUTPUT_SIZE; i++)
	{
		xil_printf("%x ", bram_chnl->output_data[i]);
	}
}
int main()
{
    memcpy(received_data, (void *)cmd_chnl->enc_dec_data, ENC_DEC_DATA_SIZE);
    att_md.input_att_size = ENC_DEC_DATA_SIZE;
    memcpy(att_md.att_input_data, received_data, ENC_DEC_DATA_SIZE);

    switch (cmd_chnl->aes_cmd)
    {
    case ENC:
        aes_enc_test();
        memcpy((void *)cmd_chnl->enc_dec_data, received_data, ENC_DEC_DATA_SIZE);
        break;
    case DEC:
        aes_dec_test();
        memcpy((void *)cmd_chnl->enc_dec_data, received_data, ENC_DEC_DATA_SIZE);
        break;
    default:
        xil_printf("SSC> Unrecognized command!!!\r\n");
        break;
    }
    //memset(ptr, 0xff, 80);
    att_md.output_att_size = ENC_DEC_DATA_SIZE;
    memcpy(&att_md.att_output_data, received_data, ENC_DEC_DATA_SIZE);

}

void aes_dec_test()
{
#if defined(AES256)
    xil_printf("\r\nTesting AES256\r\n");
#elif defined(AES192)
    xil_printf("\r\nTesting AES192\r\n");
#elif defined(AES128)
    xil_printf("\r\nTesting AES128\r\n");
#else
    xil_printf("You need to specify a symbol between AES128, AES192 or AES256. Exiting");
    return 0;
#endif

    xil_printf("plain text in main:\r\n");

    for (uint8_t i = (uint8_t)0; i < (uint8_t)4; ++i)
    {
        phex(received_data + i * (uint8_t)ENC_DEC_BLOCK_SIZE);
    }

    xil_printf("\r\n");

    test_decrypt_ecb_verbose();

    xil_printf("Decryption done writing to shared location \r\n");
}

void aes_enc_test()
{
#if defined(AES256)
    xil_printf("\r\nTesting AES256\r\n");
#elif defined(AES192)
    xil_printf("\r\nTesting AES192\r\n");
#elif defined(AES128)
    xil_printf("\r\nTesting AES128\r\n");
#else
    xil_printf("You need to specify a symbol between AES128, AES192 or AES256. Exiting");
    return 0;
#endif

    xil_printf("plain text in SSC:\r\n");

    for (uint8_t i = (uint8_t)0; i < (uint8_t)4; ++i)
    {
        phex(received_data + i * (uint8_t)ENC_DEC_BLOCK_SIZE);
    }

    xil_printf("\r\n");

    test_encrypt_ecb_verbose();

    xil_printf("Encryption done writing to shared location \r\n");
}

// prints string as hex
static void phex(uint8_t *str)
{

#if defined(AES256)
    uint8_t len = 32;
#elif defined(AES192)
    uint8_t len = 24;
#elif defined(AES128)
    uint8_t len = 16;
#endif

    unsigned char i;

    for (i = 0; i < len; ++i)
        xil_printf("%.2x", str[i]);

    xil_printf("\r\n");
}

static void test_encrypt_ecb_verbose(void)
{
    struct AES_ctx ctx;
    uint8_t i;
    // 128bit key
    uint8_t key[16] = {(uint8_t)0x2b, (uint8_t)0x7e, (uint8_t)0x15, (uint8_t)0x16, (uint8_t)0x28, (uint8_t)0xae, (uint8_t)0xd2, (uint8_t)0xa6, (uint8_t)0xab, (uint8_t)0xf7, (uint8_t)0x15, (uint8_t)0x88, (uint8_t)0x09, (uint8_t)0xcf, (uint8_t)0x4f, (uint8_t)0x3c};

    xil_printf("Key:\r\n");

    phex(key);

    xil_printf("\r\n");
    // print the resulting cipher as 4 x 16 byte strings
    xil_printf("Cipher Text:\r\n");
    AES_init_ctx(&ctx, key);

    for (i = 0; i < 4; ++i)
    {
        AES_ECB_encrypt(&ctx, received_data + (i * 16));
        phex(received_data + (i * 16));
    }

    xil_printf("\r\n");
}

int test_decrypt_ecb_verbose(void)
{
    uint8_t key[] = {0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c};
    struct AES_ctx ctx;

    xil_printf("Key:\r\n");
    phex(key);
    xil_printf("\r\n");
    AES_init_ctx(&ctx, key);
    xil_printf("Plain Text:\r\n");

    for (int i = 0; i < 4; ++i)
    {
        AES_ECB_decrypt(&ctx, received_data + (i * 16));
        phex(received_data + (i * 16));
    }

    xil_printf("\r\n");
}
