#ifndef SRC_MIPOD_H_
#define SRC_MIPOD_H_


// miPod constants
#define USR_CMD_SZ 64

#define CODE_SIZE 50000
#define INPUT_SIZE 2000
#define OUTPUT_SIZE 2000
#define USERNAME_SZ 64
#define MAX_PIN_SZ 64
#define COMMAND_SIZE 10
#define MAX_REGIONS 64
#define REGION_NAME_SZ 64
#define MAX_USERS 64
#define USERNAME_SZ 64
#define MAX_PIN_SZ 64
#define MAX_SONG_SZ (1<<25)
// printing utility
#define MP_PROMPT "mP> "
#define mp_printf(...) printf(MP_PROMPT __VA_ARGS__)
#define USER_PROMPT "miPod %s# "
#define print_prompt() printf(USER_PROMPT, "")
#define print_prompt_msg(...) printf(USER_PROMPT, __VA_ARGS__)

// shared buffer values
//enum commands { QUERY_PLAYER, QUERY_SONG, LOGIN, LOGOUT, SHARE, PLAY, STOP, DIGITAL_OUT, PAUSE, RESTART, FF, RW };
enum commands { LOAD_CODE, QUERY_DRM, SSC_COMMAND, EXIT,  EXECUTE};
enum states   { STOPPED, WORKING, PLAYING, PAUSED };
enum ssc_command {LOGIN, LOGOUT, QUERY, SHARE, PLAY, PAUSE, STOP, RESTART };

#define q_region_lookup(q, i) (q.regions + (i * REGION_NAME_SZ))
#define q_user_lookup(q, i) (q.users + (i * USERNAME_SZ))

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

typedef struct __attribute__((__packed__)) {
    char ssc_cmd;                   // from commands enum
    char drm_state;             // from states enum
    char login_status;          // 0 = logged off, 1 = logged on
    char padding;               // not used
    char username[USERNAME_SZ]; // stores logged in or attempted username
	char pin[MAX_PIN_SZ];       // stores logged in or attempted pin
    // shared buffer is either a drm song or a query
    union {
        song song;
        query query;
        char buf[MAX_SONG_SZ]; // sets correct size of cmd_channel for allocation
    };
} drm_audio_channel;
// struct to interpret shared command channel
typedef volatile struct __attribute__((__packed__)) {
   char cmd;
   char drm_state;
   char padding[2];
   char code [CODE_SIZE];
   char input[INPUT_SIZE];
   drm_audio_channel drm_chnl;
} cmd_channel;


#endif /* SRC_MIPOD_H_ */
