/*
 * miPod.h
 *
 *  Modified on: March 29, 2020
 *      Author: rit
 */

#ifndef SRC_MIPOD_H_
#define SRC_MIPOD_H_

#include <stdint.h>

#define TOTAL_USERS 64
#define MAX_SONG_SZ (1<<25) //33554432 == 32 mib

#define SONGID_LEN 16
#define REGION_NAME_SZ 64
#define UNAME_SIZE 16 //see: ectf requirements (it is actually 15, but each name is nul-padded to 16 for obvious reasons)
#define PIN_SIZE 64 //see: ectf requirements
#define MAX_SHARED_USERS 64 //see: ectf requirements, 3.3.5
#define HMAC_SIG_SIZE 64

#define MAX_SHARED_REGIONS 32
#define REGION_NAME_SZ 64
#define MAX_QUERY_REGIONS MAX_SHARED_REGIONS /*TOTAL_REGIONS*/

// miPod constants
#define USR_CMD_SZ 100

// printing utility
#define MP_PROMPT "mP> "
#define mp_printf(...) printf(MP_PROMPT __VA_ARGS__)

#define USER_PROMPT "miPod %s# "
#define print_prompt() printf(USER_PROMPT, "")
#define print_prompt_msg(...) printf(USER_PROMPT, __VA_ARGS__)

// simulate array of 64B names without pointer indirection
#define q_region_lookup(q, i) (q.regions + (i * REGION_NAME_SZ))
#define q_user_lookup(q, i) (q.users_list + (i * UNAME_SIZE))

// query information for song (drm)
#define q_song_region_lookup(q,i) (q.song_regions + (i * REGION_NAME_SZ))
#define q_song_user_lookup(q, i) (q.shared_users + (i * UNAME_SIZE))

typedef struct __attribute__((__packed__)) {
    //riff header
    char chunkID[4]; //"RIFF"
    uint32_t chunk_size; //size of the rest of the header + any data ie rest of file
    char format[4]; //"WAVE"
    //wav format subchunk
    char subchunk1ID[4]; //"fmt "
    uint32_t subchunk1_size; //should be 16 for PCM
    uint16_t audio_fmt; //should be 1 for PCM
    uint16_t n_channels; //mono=1, stereo=2, I doubt we care about others
    uint32_t samplerate; //eg 44.1 khz
    uint32_t byterate; // == samplerate * n_channels * bps/8
    uint16_t blk_align; // == n_channels * bps/8
    uint16_t bits_per_sample; //bits per sample (usually 8 or 16)
    //wav data header
    char subchunk2ID[4]; //"data"
    uint32_t subchunk2_size; //number of data bytes
    //uint8_t data[]; //the actual song
} wav_header;



// This is for drm metadata
typedef struct __attribute__((__packed__)) { //sizeof() = 297
    uint8_t song_id[SONGID_LEN]; //size should be macroized. a per-song unique ID.
    uint8_t ownerID; //the owner's name.
    uint8_t pad[3];
    uint8_t regions[MAX_SHARED_REGIONS]; //this is a bit on the large size, but disk is cheap so who cares
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

struct segment_trailer {
    uint8_t id[SONGID_LEN];
    uint32_t idx;
    uint32_t next_segment_size;
    uint8_t sig[HMAC_SIG_SIZE];
    char _pad_[40]; //do not use this. for cryptographic padding purposes only.
};

// struct {
//     char a[0-!(sizeof(struct segment_trailer) == 128 && CIPHER_BLOCKSIZE == 64)]; //if the segment trailer requirements fail, this will break.
// };

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

/*
checks to see if the shared user entry at <idx_> is in use.
*/
#define CURRENT_DRM_SHARED_EMPTY_SLOT(idx_) (current_song_header.shared_users[idx_][0] == '0')

typedef struct {
    char name[UNAME_SIZE]; //the username of the requested user
    uint8_t pin[PIN_SIZE]; //the entered pin of the requested user
    uint32_t uid;
    char logged_in;  // the status of the user
    //no song for this one
} mipod_login_data;

typedef struct __attribute__((__packed__)) {
    drm_header drm; //this is the file header.
    uint8_t filedata[]; //this is the encrypted and signed song data.
} mipod_play_data;

typedef struct {
    char regions[MAX_SHARED_REGIONS * REGION_NAME_SZ];
    char song_regions[MAX_SHARED_REGIONS * REGION_NAME_SZ];
    // uint32_t rids[MAX_QUERY_REGIONS]; //holds all valid region IDS. the actual region strings should be stored client-side.
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
    // drm_header drm;
    // uint8_t filedata[]; //on input, the file that we want to write out. on output, the raw WAV file.
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
        // struct mipod_play_data play_data;
        mipod_query_data query_data;       
      //  mipod_share_data share_data;
        mipod_digital_data digital_data;
        char buf[MAX_SONG_SZ];
    };
}mipod_buffer;

#endif /* SRC_MIPOD_H_ */
