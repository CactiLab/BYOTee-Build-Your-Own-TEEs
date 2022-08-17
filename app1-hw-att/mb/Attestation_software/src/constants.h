#ifndef SRC_CONSTANTS_H_
#define SRC_CONSTANTS_H_


#define AES_BLOCK_SIZE 128
#define CODE_SIZE 15000
#define DATA_SIZE 2000
#define RO_DATA_SIZE 2000
#define SSA_BASE (0xC0000050)
#define ATT_BASE (0xC0008D98)
#define MEASUREMENT_SIZE 32
#define SIG_LEN 64
#define ENC_DEC_DATA_SIZE 64

uint8_t AES_CBC_key[] = {(uint8_t)0x2b, (uint8_t)0x7e, (uint8_t)0x15, (uint8_t)0x16, (uint8_t)0x28, (uint8_t)0xae, (uint8_t)0xd2, (uint8_t)0xa6, (uint8_t)0xab, (uint8_t)0xf7, (uint8_t)0x15, (uint8_t)0x88, (uint8_t)0x09, (uint8_t)0xcf, (uint8_t)0x4f, (uint8_t)0x3c};
uint8_t AES_CBC_IV[] = {(uint8_t)0x00, (uint8_t)0x01, (uint8_t)0x02, (uint8_t)0x03, (uint8_t)0x04, (uint8_t)0x05, (uint8_t)0x06, (uint8_t)0x07, (uint8_t)0x08, (uint8_t)0x09, (uint8_t)0x0a, (uint8_t)0x0b, (uint8_t)0x0c, (uint8_t)0x0d, (uint8_t)0x0e, (uint8_t)0x0f};

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
	char SSA_data[AES_BLOCK_SIZE];
} SSA_loader;

typedef struct
{
	unsigned int cmd;
	unsigned int ssa_size;
	unsigned int challenge_number;
	uint8_t SSA_input[ENC_DEC_DATA_SIZE];
	uint8_t SSA_output[ENC_DEC_DATA_SIZE];
	uint8_t attestation_output[MEASUREMENT_SIZE];
} hw_att_md;

typedef struct
{
	unsigned int ssc_code_address;
	unsigned int data_sec_address;
	unsigned int ro_data_sec_address;
	unsigned int sss_code_size;
	unsigned int data_sec_size;
	unsigned int ro_data_size;
} ssc_meta_data;

#endif /* SRC_CONSTANTS_H_ */
