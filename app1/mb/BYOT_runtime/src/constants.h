#ifndef SRC_CONSTANTS_H_
#define SRC_CONSTANTS_H_

#include "xil_printf.h"

// shared DDR address
#define SHARED_DDR_BASE (0x20000000 + 0x1CC00000)

// printing utility
#define MB_PROMPT "\r\nBYOT_Runtime> "
#define mb_printf(...) xil_printf(MB_PROMPT __VA_ARGS__)

// protocol constants
#define CODE_SIZE 15000
#define DATA_SIZE 2000
#define RO_DATA_SIZE 2000
#define ATTESTION_CAP 2000
#define USERNAME_SZ 64
#define MAX_PIN_SZ 64
#define PADING_SZ 2
#define MEASUREMENT_SIZE 32
//AES SSC CONSTANTS
#define ENC_DEC_DATA_SIZE 64
#define SIG_LEN 64
#define AUTH_KEY_SIZE 64
//#define KEEP_STATE
#define TOTAL_REGISTERS 32
static const uint8_t auth_key[AUTH_KEY_SIZE] = {124, 73, 204, 35, 31, 248, 199, 135, 157, 91, 95, 40, 62, 136, 208, 25, 153, 121, 155, 100, 31, 67, 202, 205, 135, 118, 191, 117, 171, 144, 170, 188, 47, 139, 28, 64, 254, 159, 226, 14, 147, 17, 58, 224, 216, 14, 107, 172, 249, 70, 243, 62, 61, 127, 228, 33, 248, 189, 246, 212, 37, 187, 197, 169 };

#ifdef KEEP_STATE

enum commands
{
	LOAD_CODE,
	QUERY_DRM,
	SSC_COMMAND,
	EXIT,
	EXECUTE,
	SAVE,
	RELOAD
};
#endif

#ifndef KEEP_STATE

enum commands
{
	LOAD_CODE,
	QUERY_DRM,
	SSC_COMMAND,
	EXIT,
	EXECUTE,
	SAVE,
	RELOAD
};
#endif

enum states
{
	STOPPED,
	WORKING,
	PLAYING,
	PAUSED
};

unsigned int challenge_number;

// struct to interpret shared command channel
typedef volatile struct __attribute__((__packed__))
{
	char cmd;
	char drm_state;
	char padding[PADING_SZ];
	unsigned int challenge_number;
	unsigned char preExehash[MEASUREMENT_SIZE];
	unsigned char postExehash[MEASUREMENT_SIZE];
	char code[CODE_SIZE];
	uint8_t enc_dec_data[ENC_DEC_DATA_SIZE];
	int file_size;
	//drm_audio_channel drm_chnl;
} cmd_channel;

// store of internal state

typedef struct
{
	char code[CODE_SIZE];
} internal_state;

typedef struct
{
	char data[DATA_SIZE];
} data_content;

typedef struct
{
	char ro_data[RO_DATA_SIZE];
} ro_data_content;

typedef struct
{
	unsigned int ssc_code_address;
	unsigned int data_sec_address;
	unsigned int ro_data_sec_address;
	unsigned int sss_code_size;
	unsigned int data_sec_size;
	unsigned int ro_data_size;
} ssc_meta_data;

typedef struct
{
	unsigned int input_att_size;
	unsigned int output_att_size;
	unsigned char att_input_data[ATTESTION_CAP];
	unsigned char att_output_data[ATTESTION_CAP];
} attestation_md;
#endif /* SRC_CONSTANTS_H_ */
