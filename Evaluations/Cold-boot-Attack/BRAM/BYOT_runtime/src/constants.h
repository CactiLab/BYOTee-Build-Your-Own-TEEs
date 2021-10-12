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
//AES SSC CONSTANTS
#define MAX_SONG_SZ 90040
extern int _end;
enum commands
{
	LOAD_CODE,
	QUERY_DRM,
	SSC_COMMAND,
	EXIT,
	EXECUTE
};
enum states
{
	STOPPED,
	WORKING,
	PLAYING,
	PAUSED
};

typedef struct __attribute__((__packed__))
{
	unsigned char buf[MAX_SONG_SZ];
} drm_audio_channel;

typedef volatile struct __attribute__((__packed__))
{
	char cmd;
	char drm_state;
	char padding[PADING_SZ];
	int file_size;
	drm_audio_channel drm_chnl;
	drm_audio_channel previous_BRAM_data;
} cmd_channel;

typedef volatile struct __attribute__((__packed__))
{
	unsigned char buf[90040]
} bmp_map;
// store of internal state

#endif /* SRC_CONSTANTS_H_ */
