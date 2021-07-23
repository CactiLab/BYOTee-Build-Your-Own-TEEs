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
#define DATA_SIZE 3000
#define RO_DATA_SIZE 3000
#define USERNAME_SZ 64
#define MAX_PIN_SZ 64
#define PADING_SZ 2
//AES SSC CONSTANTS
#define ENC_DEC_DATA_SIZE 64



enum commands { LOAD_CODE, QUERY_DRM, SSC_COMMAND, EXIT, EXECUTE};
enum states   { STOPPED, WORKING, PLAYING, PAUSED };


// struct to interpret shared command channel

typedef volatile struct __attribute__((__packed__)) {
   char cmd;
   char drm_state;
   char padding[PADING_SZ];
   char code [CODE_SIZE];
} cmd_channel;

// store of internal state

typedef struct {
    char code [CODE_SIZE];
} internal_state;

typedef struct {
    char data [DATA_SIZE];
} data_content;

typedef struct {
    char ro_data [RO_DATA_SIZE];
} ro_data_content;

typedef struct {
	unsigned int ssc_code_address;
	unsigned int data_sec_address;
	unsigned int ro_data_sec_address;
	unsigned int sss_code_size;
	unsigned int data_sec_size;
	unsigned int ro_data_size;
} ssc_meta_data;

#endif /* SRC_CONSTANTS_H_ */

