#ifndef SRC_CONSTANTS_H_
#define SRC_CONSTANTS_H_

#include "xil_printf.h"

// shared DDR address
#define SHARED_DDR_BASE (0x20000000 + 0x1CC00000)

// printing utility
#define MB_PROMPT "\r\nBYOT_Runtime> "
#define mb_printf(...) xil_printf(MB_PROMPT __VA_ARGS__)

// protocol constants
#define CODE_SIZE 50000
#define PADING_SZ 1 + 68
#define ATTESTION_CAP 2000
//AES SSC CONSTANTS
#define ENC_DEC_DATA_SIZE 64
#define ENC_DEC_BLOCK_SIZE 16


enum commands { LOAD_CODE, QUERY_DRM, SSC_COMMAND, EXIT, EXECUTE};
enum states   { STOPPED, WORKING, PLAYING, PAUSED };
enum aes_command {ENC, DEC};

struct color {
    u32 r;
    u32 g;
    u32 b;
};
// struct to interpret shared command channel

typedef volatile struct __attribute__((__packed__)) {
   char cmd;
   char drm_state;
   char aes_cmd;
   char padding[PADING_SZ];
   char code [CODE_SIZE];
   uint8_t enc_dec_data[ENC_DEC_DATA_SIZE];
} cmd_channel;


typedef struct {
	unsigned int input_att_size;
	unsigned int output_att_size;
	unsigned char att_input_data[ATTESTION_CAP];
	unsigned char att_output_data[ATTESTION_CAP];
} attestation_md;

uint8_t received_data[ENC_DEC_DATA_SIZE];
#endif /* SRC_CONSTANTS_H_ */

