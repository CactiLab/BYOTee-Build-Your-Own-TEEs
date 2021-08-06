#ifndef SRC_UNTRUSTED_APP_H_
#define SRC_UNTRUSTED_APP_H_


// Untrusted_app constants
#define USR_CMD_SZ 64

#define CODE_SIZE 50000
#define USERNAME_SZ 64
#define MAX_PIN_SZ 64
#define MAX_REGIONS 64
#define REGION_NAME_SZ 64
#define MAX_USERS 64
#define USERNAME_SZ 64
#define MAX_PIN_SZ 64
#define MAX_SONG_SZ (1<<25)
#define PADING_SZ 1
#define PACKAGING_SZ1 4
#define PACKAGING_SZ2 32
#define ENC_DEC_DATA_SIZE 64
#define ENC_DEC_BLOCK_SIZE 16
#define MEASUREMENT_SIZE 32
// printing utility
#define MP_PROMPT "UA> "
#define mp_printf(...) printf(MP_PROMPT __VA_ARGS__)
#define USER_PROMPT "U_app %s# "
#define print_prompt() printf(USER_PROMPT, "")
#define print_prompt_msg(...) printf(USER_PROMPT, __VA_ARGS__)
#define q_region_lookup(q, i) (q.regions + (i * REGION_NAME_SZ))
#define q_user_lookup(q, i) (q.users + (i * USERNAME_SZ))

enum commands { LOAD_CODE, QUERY_DRM, SSC_COMMAND, EXIT,  EXECUTE, PREEXEATT, POSTEXEATT};
enum states   { STOPPED, WORKING, PLAYING, PAUSED };
enum ssc_command {LOGIN, LOGOUT, QUERY, SHARE, PLAY, PAUSE, STOP, RESTART, DIGITAL_OUT };
enum aes_command {ENC, DEC};

typedef struct {
    int num_regions;
    int num_users;
    char owner[USERNAME_SZ];
    char regions[MAX_REGIONS * REGION_NAME_SZ];
    char users[MAX_USERS * USERNAME_SZ];
} query;

typedef struct __attribute__((__packed__)) {
    char md_size;
    char owner_id;
    char num_regions;
    char num_users;
    char buf[];
} drm_md;

typedef struct __attribute__((__packed__)) {
    char packing1[4];
    int file_size;
    char packing2[32];
    int wav_size;
    drm_md md;
} song;

// I/O Structure for Secure DRM SSC
typedef struct __attribute__((__packed__)) {
    char ssc_cmd;
    char drm_state;
    char login_status;
    char padding;
    char username[USERNAME_SZ];
	char pin[MAX_PIN_SZ];
    union {
        song song;
        query query;
        char buf[MAX_SONG_SZ];
    };
} drm_audio_channel;

// I/O Structure for BYOT Runtime and Secure DRM SSC
typedef volatile struct __attribute__((__packed__)) {
   char cmd;
   char drm_state;
   char aes_cmd;
   char padding[PADING_SZ];
   unsigned int challenge_number;
   unsigned char preExehash[MEASUREMENT_SIZE];
   unsigned char postExehash[MEASUREMENT_SIZE];
   char code [CODE_SIZE];
   unsigned char enc_dec_data[ENC_DEC_DATA_SIZE];
   drm_audio_channel drm_chnl;
} cmd_channel;

/*typedef volatile struct __attribute__((__packed__)) {
	char a1;
	int a2;
}testing_channel;*/
#endif /* SRC_UNTRUSTED_APP_H_ */

