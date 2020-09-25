#ifndef CONSTANTS_H
#define CONSTANTS_H

#include <stdbool.h>
#include "xil_printf.h"
#include "hmac.h"



// crypto
#define PKEY_SIZE 64 //see: hmac keygen
#define UNAME_SIZE 16 //see: ectf requirements
#define SALT_SIZE 16 //see: common sense
#define PIN_SIZE 64 //see: ectf requirement

#define HASH_SIZE 64
#define CIPHER_BLOCKSIZE 64 
#define ARGON2_THREADS 1
#define ARGON2_LANES 1
#define HMAC_SIG_SIZE 64

#define SHARED_DDR_BASE (0x20000000 + 0x1CC00000)

// definition of sizes
#define SONGID_LEN 16
#define TOTAL_USERS 64
#define MAX_SHARED_USERS 64 
#define MAX_SHARED_REGIONS 32
#define REGION_NAME_SZ 64
#define MAX_QUERY_REGIONS MAX_SHARED_REGIONS /*TOTAL_REGIONS*/
#define INVALID_UID -1
#define INVALID_RID -1

// song stuffs
#define MAX_SONG_SZ (1<<25) //33554432 == 32 mib
#define SEGMENT_BUF_SIZE 32000 //32000 + 128 KB
#define CHUNK_SZ 16000
#define SONGLEN_30S (mb_state.current_song_header.len_250ms * 4 * 30)
#define SONGLEN_5S (mb_state.current_song_header.len_250ms * 4 * 5)

#define PCM_DRV_BUFFER_SIZE 16000  // 0x3e80
#define FIFO_CAP 4096*4

/*
checks to see if the shared user entry at <idx_> is in use.
*/
#define CURRENT_DRM_SHARED_EMPTY_SLOT(idx_) (mb_state.current_song_header.shared_users[idx_][0] == '\0')
#define SONG_OWNER 1 //the song is owned by the current user
#define SONG_SHARED 2 //the song is shared with the current user
#define SONG_BADREGION -1 //the region is not allowed to play the song (a 30s preview should be done instead)
#define SONG_BADUSER -2 //the user is not allowed to play the song (a 30s preview should be done instead)
#define SONG_BADSIG 0 //the song fails signature validation and should not be played.


// ADC/DAC sampling rate in Hz
#define AUDIO_SAMPLING_RATE 48000
#define BYTES_PER_SAMP 2
#define PREVIEW_SZ (PREVIEW_TIME_SEC * AUDIO_SAMPLING_RATE * BYTES_PER_SAMP)

// printing utility
#define MB_PROMPT "\r\nMB> "
#define mb_printf(...) xil_printf(MB_PROMPT __VA_ARGS__)
#define mb_printf_none() xil_printf(MB_PROMPT)
#define MB_PROMPT_DEBUG "\r\nMB_DEBUG> "
#define mb_debug(...) xil_printf(MB_PROMPT_DEBUG __VA_ARGS__)

// simulate array of 64B names without pointer indirection
#define q_region_lookup(q, i) (q.regions + (i * REGION_NAME_SZ))
#define q_user_lookup(q, i) (q.users_list + (i * UNAME_SIZE))
#define q_song_region_lookup(q,i) (q.song_regions + (i * REGION_NAME_SZ))
#define q_song_user_lookup(q, i) (q.shared_users[UNAME_SIZE][i])

#define PCM_SUBCH1_SIZE 16 //subchunk1_size for PCM audio
#define AUDIO_FMT_PCM 1 //audio_fmts


#ifndef offsetof
#define offsetof(st, m) ((size_t)&(((st *)0)->m))
#endif
#ifndef min
#define min(a,b) (((a)<(b))?(a):(b))
#endif // !min
#ifndef max
#define max(a,b) (((a)>(b))?(a):(b))
#endif // !max


#ifdef __GNUC__ //using inline asm ensures that the memset calls won't be optimized away.
#define clear_buffer(buf_) do{ memset((buf_), 0, sizeof(buf_)); __asm__ volatile ("" ::: "memory"); }while(0)
#define clear_obj(obj_) do{ memset(&(obj_), 0, sizeof(obj_)); __asm__ volatile ("" ::: "memory"); }while(0)
#else
#define clear_buffer(buf_) memset(buf_, 0, sizeof(buf_))
#define clear_obj(obj_) memset(&(obj_), 0, sizeof(obj_))
#endif

#define swap_bytes(a, b) {\
	uint8_t tmp; \
	tmp = *((uint8_t *)a); \
	*((uint8_t *)a) = *((uint8_t *)b); \
	*((uint8_t *)b) = tmp; \
}

// used for AES decryption
#define Transpose(block) {\
        swap_bytes(block + 1, block + 4); \
        swap_bytes(block + 2, block + 8); \
        swap_bytes(block + 3, block + 12); \
        swap_bytes(block + 6, block + 9); \
        swap_bytes(block + 7, block + 13); \
        swap_bytes(block + 11, block + 14); \
}

enum mipod_ops {
    MIPOD_PLAY=0,
    MIPOD_PAUSE,
    MIPOD_RESUME,
    MIPOD_STOP,
    MIPOD_RESTART,
    MIPOD_FORWARD,
    MIPOD_REWIND,

    MIPOD_LOGIN,
    MIPOD_LOGOUT,

    MIPOD_QUERY,
    MIPOD_QUERY_SONG,
    MIPOD_DIGITAL,
    MIPOD_SHARE
};

enum mipod_state {
    STATE_NONE=0, //set by the client application
    STATE_WORKING, //set by the client application
    STATE_SUCCESS, //indicates an operation has completed successfully
    STATE_FAILED, //indicates an operation has failed
    STATE_PLAYING, //indicates that the firmware has started playing audio
    STATE_PAUSED
};

typedef struct __attribute__((__packed__)) {
    //riff header
    char chunkID[4]; //"RIFF"
    uint32_t chunk_size; //size of the rest of the header + any data ie rest of file
    char format[4]; //"WAVE"
    char subchunk1ID[4]; //"fmt "
    uint32_t subchunk1_size; //should be 16 for PCM
    uint16_t audio_fmt; //should be 1 for PCM
    uint16_t n_channels; //mono=1, stereo=2, I doubt we care about others
    uint32_t samplerate; //eg 44.1 khz
    uint32_t byterate; // == samplerate * n_channels * bps/8
    uint16_t blk_align; // == n_channels * bps/8
    uint16_t bits_per_sample; //bits per sample (usually 8 or 16)
    char subchunk2ID[4]; //"data"
    uint32_t subchunk2_size; //number of data bytes
} wav_header;

typedef struct __attribute__((__packed__)) { //sizeof() 297
    uint8_t song_id[SONGID_LEN]; //size should be macroized. a per-song unique ID.
    uint8_t ownerID; //the owner's name.
    uint8_t pad[3]; // alignmet
    uint8_t regions[MAX_SHARED_REGIONS];
    //song metadata
    uint32_t len_250ms; //the length, in bytes, that playing 250 milliseconds of audio will take. (the polling interval while playing).
    uint32_t nr_segments; //the number of segments in the song
    uint32_t first_segment_size; //the size of the first song segment (which may not be the full SEGMENT_BUF_SIZE), INcluding trailer.
    wav_header wavdata;
    //validation and sharing
    uint8_t mp_sig[HMAC_SIG_SIZE]; //a signature (using the mipod private key) for all preceeding data
    uint8_t shared_users[MAX_SHARED_USERS]; //users that the owner has shared the song with.
    uint8_t owner_sig[HMAC_SIG_SIZE]; //a signature (using the owner's private key) for all preceeding data. resets whenever new user is shared with.
} drm_header;

typedef struct {
    bool logged_in_user; // whether or not a user is logged on
    bool shared_current_song;
    bool own_current_song;
    bool working;
    uint8_t pin_buffer[PIN_SIZE];   // logged on pin
    int32_t current_uid;
    uint32_t current_operation;
    drm_header current_song_header; // current song metadata
    uint8_t music_op;
} internal_state;

struct segment_trailer {  //sizeof() 84
    uint8_t id[SONGID_LEN]; //16
    uint32_t idx;           //4
    uint32_t next_segment_size; //4
    uint8_t sig[SHA1_DIGEST_SIZE]; //20
    char _pad_[40]; //do not use this. for cryptographic padding purposes only. //40
};

struct {
    char a[0-!(sizeof(struct segment_trailer) == 84 && CIPHER_BLOCKSIZE == 64)]; //if the segment trailer requirements fail, this will break.
};

typedef struct {
    char name[UNAME_SIZE]; //the username of the requested user
    uint8_t pin[PIN_SIZE]; //the entered pin of the requested user
    uint32_t uid;
    char logged_in;  // the status of the user
} mipod_login_data;

typedef struct __attribute__((__packed__)) {
    drm_header drm; //this is the file header.
    uint8_t filedata[]; //this is the encrypted and signed song data.
} mipod_play_data;

typedef struct {
    char regions[MAX_SHARED_REGIONS * REGION_NAME_SZ];
    char song_regions[MAX_SHARED_REGIONS * REGION_NAME_SZ];
    char users_list[TOTAL_USERS][UNAME_SIZE]; //holds all valid users.
    /*
    Initial boot output :
        mP> Regions: USA, Canada, Mexico\r\n` `mP> Authorized users: alice, bob, charlie, donna\r\n
    Song Query (do in arm mipod, since it can actually just print this mostly verbatim from drm_header structs):
        `mP> Regions: USA, Canada, Mexico\r\n` `mP> Owner: alice\r\n` `mP> Authorized users: bob, charlie, donna\r\n` 
    song querying should be done client-side, since all that data is stored plaintext in the song header.
    */
} mipod_query_data;

typedef struct __attribute__((__packed__)) {
    uint32_t wav_size; //OUT: the used size. will always be <= the file size.
    mipod_play_data play_data;
} mipod_digital_data ;

typedef struct __attribute__((__packed__)) {
    char target_name[UNAME_SIZE];
    drm_header drm; //we don't actually need anything but the file header for this.
} mipod_share_data;

typedef volatile struct __attribute__((__packed__)) {
    uint32_t operation; //IN, the operation id from enum mipod_ops
    uint32_t status; //OUT, the completion status of the command. DO NOT read this field.
    char shared_user[UNAME_SIZE];
    union {
        mipod_login_data login_data;
        mipod_query_data query_data;
        mipod_digital_data digital_data;
        char buf[MAX_SONG_SZ];
    };
}mipod_buffer;


#endif // !CONSTANTS_H
