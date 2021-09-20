#ifndef SRC_CONSTANTS_H_
#define SRC_CONSTANTS_H_

#define SHARED_BRAM_BASE (0x4B00000)
#define HASH_DATA_SIZE 64
typedef volatile struct __attribute__((__packed__))
{
	char input_available;
	uint8_t input_data[HASH_DATA_SIZE];
} bram_channel;

#endif /* SRC_CONSTANTS_H_ */
