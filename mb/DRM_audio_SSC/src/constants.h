#ifndef SRC_CONSTANTS_H_
#define SRC_CONSTANTS_H_
// struct to interpret shared command channel
#define SHARED_DDR_BASE (0x20000000 + 0x1CC00000)
#define MAX_REGIONS 64
#define REGION_NAME_SZ 64
#define MAX_USERS 64
#define USERNAME_SZ 64
#define MAX_PIN_SZ 64
#define MAX_SONG_SZ (1<<25)
#define CHUNK_SZ 16000
#define FIFO_CAP 4096*4
#define CODE_SIZE 50000
#define SAXI_DMA_POINTER_ADDRESS 0x00017640
#define INTERRUPT_POINTER_ADDRESS 0x00017d94
#define PREVIEW_TIME_SEC 30
#define PADING_SZ 2
#define PACKAGING_SZ1 4
#define PACKAGING_SZ2 32
#define MB_PROMPT "\r\nDRM_SSC> "
#define mb_printf(...) xil_printf(MB_PROMPT __VA_ARGS__)
// ADC/DAC sampling rate in Hz
#define AUDIO_SAMPLING_RATE 48000
#define BYTES_PER_SAMP 2
#define PREVIEW_SZ (PREVIEW_TIME_SEC * AUDIO_SAMPLING_RATE * BYTES_PER_SAMP)


#define get_drm_rids(d) (d.md.buf)
#define get_drm_uids(d) (d.md.buf + d.md.num_regions)
#define get_drm_song(d) ((char *)(&d.md) + d.md.md_size)

#define q_region_lookup(q, i) (q.regions + (i * REGION_NAME_SZ))
#define q_user_lookup(q, i) (q.users + (i * USERNAME_SZ))

enum ssc_command {LOGIN, LOGOUT, QUERY, SHARE, PLAY, PAUSE, STOP, RESTART, DIGITAL_OUT };
enum states   { STOPPED, WORKING, PLAYING, PAUSED };
struct color {
    u32 r;
    u32 g;
    u32 b;
};

// struct to interpret shared buffer as a query
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
    char packing1[PACKAGING_SZ1];
    int file_size;
    char packing2[PACKAGING_SZ2];
    int wav_size;
    drm_md md;
} song;

typedef struct {
    u8 md_size;
    u8 owner_id;
    u8 num_regions;
    u8 rids[64];
    u8 num_users;
    u8 uids[64];
} song_md;

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
    };
} drm_audio_channel;

typedef volatile struct __attribute__((__packed__)) {
   char cmd;
   char drm_state;
   char padding[PADING_SZ];
   char code [CODE_SIZE];
   drm_audio_channel audio_data;
} drm_channel;

typedef struct
{
    char logged_in;             // whether or not a user is logged on
    u8 uid;                     // logged on user id
    char username[USERNAME_SZ]; // logged on username
    char pin[MAX_PIN_SZ];       // logged on pin
    song_md song_md;            // current song metadata
} drm_internal_state;

#endif /* SRC_CONSTANTS_H_ */
