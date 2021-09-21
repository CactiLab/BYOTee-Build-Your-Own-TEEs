#ifndef SRC_CONSTANTS_H_
#define SRC_CONSTANTS_H_

#define SHARED_BRAM_BASE (0x04B01FFF)
#define HASH_OUTPUT_SIZE 64
#define MAX_INPUT_DATA_SIZE 1024
#define KEY_SIZE 64

static const uint8_t auth_key[KEY_SIZE] = {124, 73, 204, 35, 31, 248, 199, 135, 157, 91, 95, 40, 62, 136, 208, 25, 153, 121, 155, 100, 31, 67, 202, 205, 135, 118, 191, 117, 171, 144, 170, 188, 47, 139, 28, 64, 254, 159, 226, 14, 147, 17, 58, 224, 216, 14, 107, 172, 249, 70, 243, 62, 61, 127, 228, 33, 248, 189, 246, 212, 37, 187, 197, 169 };

typedef volatile struct __attribute__((__packed__))
{
	char input_available;
	uint8_t input_len;
	uint8_t input_data[MAX_INPUT_DATA_SIZE];
	uint8_t output_data [HASH_OUTPUT_SIZE];
} bram_channel;

#endif /* SRC_CONSTANTS_H_ */
