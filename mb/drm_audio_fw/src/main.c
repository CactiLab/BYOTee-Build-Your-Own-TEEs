// #include <stdint.h>
#include <stdbool.h>

#include "secrets.h"
#include "constants.h"
#include "memops.h"
#include "hmac.h"
#include "pbkdf2-hmac-sha512.h"

#include "xdecrypt.h"

#include "xparameters.h"
#include "platform.h"
#include "xstatus.h"
#include "xaxidma.h"
#include "xil_mem.h"
#include "util.h"
#include "xintc.h"
#include "sha512.h"

//HW global state stuff
static XAxiDma sAxiDma;

// static drm_header current_song_header;
volatile mipod_buffer *mipod_in = (mipod_buffer *)SHARED_DDR_BASE;  //this ends up as a constant address
volatile static int InterruptProcessed = false;
static XIntc InterruptController;
static uint8_t segment_buffer[SEGMENT_BUF_SIZE + sizeof(struct segment_trailer)]; //the memory buffer that we copy our data to (either constant address or array, idk yet)
int DMA_flag = 0;

internal_state mb_state;
void initialize_mb_State () {
	mb_state.current_uid = INVALID_UID;
	mb_state.logged_in_user = false;
	mb_state.shared_current_song = false;
	mb_state.own_current_song = false;
	mb_state.working = false;
	mb_state.music_op = MIPOD_STOP;
}

static bool play_song(void);
static bool login_user(void);
static bool logout_user(void);
static bool startup_query(void);
static bool query_song(void);
static bool digitize_song(void);
static bool share_song(void);

// interrupt handler
void gpio_entry(void) {
    InterruptProcessed = true;
}

int main() {
    uint32_t status = XST_FAILURE;
    bool res = true;
    init_platform();

    mb_printf("Setup our interrupt handler\r\n");
    //Setup our interrupt handler
    microblaze_register_handler((XInterruptHandler)gpio_entry, (void *)0);
    microblaze_enable_interrupts();

    // Initialize the interrupt controller driver so that it is ready to use.
    status = XIntc_Initialize(&InterruptController, XPAR_INTC_0_DEVICE_ID);
    if (status != XST_SUCCESS) {
        mb_printf("Initialize interruption ERROR\r\n");
        return XST_FAILURE;
    }

    // Set up the Interrupt System.
    status = SetUpInterruptSystem(&InterruptController, (XInterruptHandler)gpio_entry);
    if (status != XST_SUCCESS) {
        mb_printf("Setup interruptsystem ERROR\r\n");
        return XST_FAILURE;
    }

    initialize_mb_State();
    mipod_in->operation = MIPOD_STOP;

    // clear mipod_buffer channel
    memset((void *)mipod_in, 0, sizeof(mipod_buffer));

    // Handle commands forever
    while(1){
        if (InterruptProcessed)
        {
            InterruptProcessed = false;

            res = true;
            mipod_in->status = STATE_WORKING;
            mb_state.current_operation = mipod_in->operation;
            switch (mipod_in->operation) {
                case MIPOD_PLAY: res = play_song(); break;
                case MIPOD_LOGIN: res = login_user(); break;
                case MIPOD_LOGOUT: res = logout_user(); break;
                case MIPOD_QUERY: 
                    res = startup_query(); 
                    break;
                case MIPOD_QUERY_SONG:
                    res = query_song();
                    break;
                case MIPOD_DIGITAL: res = digitize_song(); break;
                case MIPOD_SHARE: res = share_song(); break;
                default: goto fail;
                // default: break;
            }
            if (!res) {
                fail:;
                    mipod_in->status = STATE_FAILED;
            }
            else mipod_in->status = STATE_SUCCESS;
            usleep(500);
            mipod_in->operation = MIPOD_STOP;
        }
        
    }

    clear_obj(mipod_in);
    cleanup_platform();
    return 0;
}

/*
check to see if the region rid is provisioned for the player
returns true/false for success/fail
*/
static bool valid_region(uint8_t rid) {
    for (int i = 0; i < NUM_PROVISIONED_REGIONS; ++i) 
        if (PROVISIONED_RIDS[i] == rid)
            return true;
    return false;
}

// looks up the region name corresponding to the rid
static bool rid_to_region_name(char rid, char **region_name, int provisioned_only) {
    for (int i = 0; i < NUM_REGIONS; i++) {
        if (rid == REGION_IDS[i] &&
            (!provisioned_only || valid_region(rid))) {
            *region_name = (char *)REGION_NAMES[i];
            return true;
        }
    }

    mb_printf("Could not find region ID '%d'\r\n", rid);
    *region_name = "<unknown region>";
    return false;
}

// looks up the rid corresponding to the region name
static bool region_name_to_rid(char *region_name, char *rid, int provisioned_only) {
    for (int i = 0; i < NUM_REGIONS; i++) {
        if (!strcmp(region_name, REGION_NAMES[i]) &&
            (!provisioned_only || valid_region(REGION_IDS[i]))) {
            *rid = REGION_IDS[i];
            return true;
        }
    }

    mb_printf("Could not find region name '%s'\r\n", region_name);
    *rid = INVALID_RID;
    return false;
}

static bool valid_user(uint8_t uid) {
    for (int i = 0; i < NUM_PROVISIONED_USERS; ++i) 
        if (PROVISIONED_UIDS[i] == uid)
            return true;
    return false;
}

// looks up the username corresponding to the uid
int uid_to_username(char uid, char **username, int provisioned_only) {
    for (int i = 0; i < NUM_USERS; i++) {
        if (uid == USER_IDS[i] &&
            (!provisioned_only || valid_user(uid))) {
            *username = (char *)users[i].name;
            return TRUE;
        }
    }

    mb_printf("Could not find uid '%d'\r\n", uid);
    uid = INVALID_UID;
    *username = "<unknown user>";
    return FALSE;
}

// looks up the uid corresponding to the username
int username_to_uid(char *username, char *uid, int provisioned_only) {
    for (int i = 0; i < NUM_USERS; i++) {
        if (!strcmp(username, users[USER_IDS[i]].name) &&
            (!provisioned_only || valid_user(USER_IDS[i]))) {
            *uid = USER_IDS[i];
            return TRUE;
        }
    }

    mb_printf("Could not find username '%s'\r\n", username);
    *uid = INVALID_UID;
    return FALSE;
}

static bool verify_seg_blocksig(void *data_start, size_t sig_offset) {
    uint8_t sig[SHA1_DIGEST_SIZE];
    memset(sig, 0, SHA1_DIGEST_SIZE);
    hmac_sha1(mipod_key, data_start, sig_offset, sig);

    return !memcmp(sig, (uint8_t *)data_start + sig_offset, SHA1_DIGEST_SIZE);
}

/*
verify a data signature using the MIPOD public key.
returns true if it is valid.
data layout looks like:
[....data....][signature]
^-data_start  ^-sig_offset
*/
static bool verify_mp_blocksig(void *data_start, size_t sig_offset) {
    uint8_t sig[HASH_OUTSIZE];

    memset(sig, 0, HASH_OUTSIZE);
    hmac(mipod_key, data_start, sig_offset, sig);
    
    return !memcmp(sig, (uint8_t *)data_start + sig_offset, HASH_OUTSIZE);
}

/*
verify a data signature using the USER <uid> public key.
returns true if it is valid.
data layout looks like:
[....data....][signature]
^-data_start  ^-sig_offset
*/
static bool verify_user_blocksig(void *data_start, size_t sig_offset, uint8_t uid) {
    uint8_t sig[HASH_OUTSIZE];

    for (int i = 0; i < NUM_PROVISIONED_USERS; i++)
    {
        if (uid == PROVISIONED_UIDS[i])
        {
            memset(sig, 0, HASH_OUTSIZE);
            hmac(users[uid].hash, data_start, sig_offset, sig);

            return !memcmp(sig, (uint8_t *)data_start + sig_offset, HASH_OUTSIZE);
        }
    }
    return false;
}

/*
sign data using the CURRENT USER's private key.
returns true on success.
data layout looks like:
[....data....][signature]
^-data_start  ^-sig_offset
*/
static bool sign_user_block(void *data_start, size_t sig_offset) {
    hmac(users[mb_state.current_uid].hash, data_start, sig_offset, (uint8_t *)data_start + sig_offset);
    return true;
}


/*
decrypts <len> bytes at <start> using the hardware-stored keys.
returns the actual length of the decrypted data (removing padding, for example)
<len> = size of segment, including trailer and padding.
<start> = start of segment.
*/
static size_t decrypt_segment_data(void *start, size_t len) {

    //Initialize the AES module
	int status = 0, block_offset = 0, count = 0;
    uint8_t *block_start = NULL;
    XDecrypt myDecrypt;
    XDecrypt_Config *myDecrypt_cfg;

    myDecrypt_cfg = XDecrypt_LookupConfig(XPAR_DECRYPT_0_DEVICE_ID);
    if (!myDecrypt_cfg) {
        mb_printf("Error loading configuration for component XDecrypt\r\n");
        return status;
    }

    status = XDecrypt_CfgInitialize(&myDecrypt, myDecrypt_cfg);
    if (status != XST_SUCCESS) {
        mb_printf("Error initializing configuration for component XDecrypt\r\n");
        return status;
    }
    else {
        status = XDecrypt_Initialize(&myDecrypt, XPAR_DECRYPT_0_DEVICE_ID);
        if (status != XST_SUCCESS) {
            mb_printf("Error initializing component XDecrypt\r\n");
            return status;
        }
    }

    count = len/16;  //55936

    for (int i = 0; i < count; i++)
    {
        block_offset = i*16;
        block_start = start + block_offset;

        Transpose(block_start);
           
        XDecrypt_Write_CipherText_Bytes(&myDecrypt, 0, block_start, 16);
        XDecrypt_Start(&myDecrypt);
        while (!XDecrypt_IsDone(&myDecrypt));
        XDecrypt_Read_PlainText_Bytes(&myDecrypt, 0, block_start, 16);
    }
    return len;
}

/*
perform the pbkdf2 function on the key and copy it to 
uid is the user to do so on. IDK if uid is actually something that we will use.
returns true/false for if the user is OK or not.
*/
bool gen_check_user_secret(uint8_t uid) {
    uint8_t kb[KDF_OUTSIZE]; //derived key buffer
    pbkdf2_hmac_sha512(kb, KDF_OUTSIZE, mb_state.pin_buffer, sizeof(mb_state.pin_buffer), users[uid].salt, sizeof(users[uid].salt), 120);

    return !memcmp(kb, users[uid].hash, HASH_OUTSIZE);
}

/*
attempts to logon a user
returns true for success
returns false for failure
*/
bool login_user(void)
{
    char tmpnam[UNAME_SIZE];
    uint8_t user = NULL;
    if (mb_state.logged_in_user) {
        mb_printf("Already logged in. Please logout first.\r\n");
        return true;
    } else {
        memcpy(tmpnam, mipod_in->login_data.name, UNAME_SIZE);
        mb_printf("User Name is: %s\r\n", tmpnam);
        // username_to_uid(tmpnam, &user, TRUE);
        // mb_printf("%x \r\n", user);
        // mb_state.current_uid == INVALID_UID &&
        if (! username_to_uid(tmpnam, &user, TRUE)) {
            mb_printf("Invalid user!\r\n");
            return false;
        }
        memcpy(mb_state.pin_buffer, (void *)mipod_in->login_data.pin, sizeof(mb_state.pin_buffer));
        if (!gen_check_user_secret(user)) {
            mb_printf("Wrong PIN!\r\n");
            return false;
        } else
        {
            mb_state.logged_in_user = true;
            mb_printf("User %s logged in.\r\n", tmpnam);
            mb_state.current_uid = user;
            return true;
        }
    }
}

/*
logs out the current user and clears their current key.
*/
bool logout_user(void) {
    if (mb_state.current_uid != INVALID_UID) {
        mb_state.current_uid = INVALID_UID;
        mb_state.logged_in_user = false;
        mb_printf("User logout.\r\n");
        memset((void*)mipod_in->login_data.name, 0, UNAME_SIZE);
        memset((void*)mipod_in->login_data.pin, 0, PIN_SIZE);
        return true;
    }
    else {
        mb_printf("No user logged in. Please login first.\r\n");
        return true;
    }
}



/*
loads the drm header from arm shared memory into fpga-only bram and ensures that it is valid.
returns one of the SONG_xyz constants
OWNER => the header is valid, and the current user owns it.
SHARED => the song is valid, and the current user has it shared with them.
BADREGION => the song may not be played in the current region, but appears to be a valid song.
BADUSER => the song is neither owned by or shared with the current user, but appears to be a valid song.
BADSIG => the song is invalid and may be discarded (mb_state.current_song_header and other state will be cleared).
*/
int32_t load_song_header(drm_header *arm_drm) {
    memcpy(&mb_state.current_song_header, arm_drm, sizeof(drm_header));

    //check the edc signature of the mipod application
    if (!verify_mp_blocksig(&mb_state.current_song_header, offsetof(drm_header, mp_sig))) {
        mb_printf("Invalid song!\r\n");
        clear_obj(mb_state.current_song_header);
        return SONG_BADSIG;
    }

    //check each region in the song to see if it is a valid region that we can play.
    for (size_t i = 0; i < MAX_SHARED_REGIONS; ++i) {
        uint32_t _rid = mb_state.current_song_header.regions[i];
        if (valid_region(_rid))
            goto region_success;
        if (_rid == INVALID_RID)
            break;
    }
    mb_printf("Bad region.\r\n");
    return SONG_BADREGION;
region_success:;

    //check to see if the owner exists
    uint8_t uid = mb_state.current_song_header.ownerID;
    if (uid == INVALID_UID){
        mb_printf("Invalid user. You don't have the access to the full song, only 30s.\r\n");
        return SONG_BADUSER;
    }
        
    //check the edc signature of the shared section against the owners key
    if (!verify_user_blocksig(&mb_state.current_song_header, offsetof(drm_header, owner_sig), uid)) {
        clear_obj(mb_state.current_song_header);
        mb_printf("User verify faild!\r\n");
        return SONG_BADSIG;
    }

    //check to see if we own the current song
    if (uid == mb_state.current_uid) {
        mb_state.own_current_song = true;
        mb_printf("You have the access to this song.\r\n");
        return SONG_OWNER;
    }

    //check to see if we have the song shared with us
    for (size_t i = 0; i < MAX_SHARED_USERS; ++i) {
    	uid = INVALID_UID;
    	if (mb_state.current_song_header.shared_users[i]==1)
    		uid = i;
        if (uid == INVALID_UID)
            break;
        if (uid == mb_state.current_uid){
            mb_printf("You have the access to this song.\r\n");
            return SONG_SHARED;
        }        
    }

    //the song is total valid, but the user isn't allowed to play it
    mb_printf("Invalid user!  You don't have the access to the full song, only 30s.\r\n");
    return SONG_BADUSER;
}

/*
unloads the current song drm header, clears the song owners
*/
void unload_song_header(void) {
    clear_obj(mb_state.current_song_header);
    mb_state.own_current_song = false;
    mb_state.shared_current_song = false;
}

/*
loads a segment of the current song from arm shared memory to fpga memory and ensures it is valid.
segidx is the index in the file of the loaded segment (ie the 5th segment would have segidx==5).
the function currently assumes a static buffer somewhere (either defined in the file or a reserved hardware block)
rather than one being passed in.
*/
static bool load_song_segment(void *arm_start, size_t segsize, uint32_t segidx) {
    size_t sdata_size = segsize - sizeof(struct segment_trailer);
    if (sdata_size > SEGMENT_BUF_SIZE) {
        return *(char *)NULL;
    }

    //load the segment
    Xil_MemCpy(segment_buffer, arm_start, segsize);  
    struct segment_trailer *trailer = (struct segment_trailer *) ((uint8_t *)segment_buffer + sdata_size);

    //if there is an index mismatch or the segment does not belong to the current song, somebody is being naughty
    if (trailer->idx != segidx || memcmp(mb_state.current_song_header.song_id, trailer->id, SONGID_LEN)) {
        mb_printf("Error song segment.\r\n");
        return false;
    }

    //make sure the segment is something we actually signed and hasn't been swapped around
   if (verify_seg_blocksig(segment_buffer, sdata_size + offsetof(struct segment_trailer, sig))) {
       return true;
   }
   else {
       mb_printf("Invalid segment.\r\n");
       return false;
   }
}

/*
song playing currently depends on the following:
.wav files are able to be separated into chunks based on the time to play them
memory segments contain a multiple of that data size
*/
static void play_segment_bytes(void *start, uint32_t idx, size_t size) {
    u32 cp_xfil_cnt, *fifo_fill, offset, rem, cp_num, counter = 0;
    rem = size;
    fifo_fill = (u32 *)XPAR_FIFO_COUNT_AXI_GPIO_0_BASEADDR;

    while (rem > 0)
    {
        cp_num = (rem > CHUNK_SZ) ? CHUNK_SZ : rem;
        offset = (counter++ % 2 == 0) ? 0 : CHUNK_SZ;

        //load the data into the pcm driver buffer
        Xil_MemCpy((void *)(XPAR_MB_DMA_AXI_BRAM_CTRL_0_S_AXI_BASEADDR + offset), start + size -rem, (u32)(cp_num));
        cp_xfil_cnt = cp_num;
        while (cp_xfil_cnt > 0) {
            if (DMA_flag == 0){
                DMA_flag = 1;
            }
            else
                while (XAxiDma_Busy(&sAxiDma, XAXIDMA_DMA_TO_DEVICE) && *fifo_fill < (FIFO_CAP - 32));
            #pragma message("idk about this....it seems to imply that the dma resets between songs, which seems wrong")

            // do DMA
            u32 dma_cnt = (FIFO_CAP - *fifo_fill > cp_xfil_cnt)
                ? FIFO_CAP - *fifo_fill
                : cp_xfil_cnt;
            fnAudioPlay(sAxiDma, offset, dma_cnt);
            cp_xfil_cnt -= dma_cnt;
        }
    	if (mipod_in->operation == MIPOD_RESTART)
    		rem = 0;
    	else
    		rem -= cp_num;
    } 
    return;
}

static bool play_song(void) {
    /*
    load the header
    assuming that passes, load each segment,
    then decrypt and play that segment inside bram.
    unload the song.
    every so often we should poll for state changes (pause, stop, restart, etc) and change based on those
    */

    size_t offset = 0, bytes_max = 0; //the maximum number of bytes to play in the song, and the total number we have already played.
    
    // Configure the DMA
    uint32_t status = XST_FAILURE;
    status = fnConfigDma(&sAxiDma);
    if (status != XST_SUCCESS) {
        mb_printf("DMA configuration ERROR\r\n");
        return XST_FAILURE;
    }

    mb_printf("Audio DRM Module has Booted\r\n");

    switch (load_song_header(&mipod_in->digital_data.play_data.drm)) {
    case(SONG_BADUSER):;
    case(SONG_BADREGION):; //we can play 30s, but no more
        bytes_max = SONGLEN_30S;
        mipod_in->status = STATE_PLAYING;
        break;
    case(SONG_BADSIG):;
        unload_song_header();
        mipod_in->status = STATE_FAILED;
        return false;
    case(SONG_OWNER): ;
    case(SONG_SHARED): ; //we can play the full song
        bytes_max = mipod_in->digital_data.wav_size;
        mipod_in->status = STATE_PLAYING;
        break;
    #ifdef __GNUC__
    default:__builtin_unreachable();
    #endif
    }
restart_playing:;
    mipod_in->status = STATE_PLAYING;

    uint8_t *fseg = &(mipod_in->digital_data.play_data.filedata[0]); //a pointer to the start of the segment to load within the shared memory section
    size_t i = 0, ff = 0, rw = 0;
    uint32_t idx = 0, segsize = mb_state.current_song_header.first_segment_size;
    //loop through all the segments in the file, make sure the update size is correct
    DMA_flag = 0;

    for (; i < mb_state.current_song_header.nr_segments; i++) {
    	uint32_t raw = segsize - sizeof(struct segment_trailer);
        // check for interrupt to stop playback
        while (InterruptProcessed){
            InterruptProcessed = false;

            switch (mipod_in->operation) {
                case(MIPOD_PLAY):break; //this is the default, continue playing the song
                case(MIPOD_PAUSE): //stop playing, wait for <!play, !pause> (possibly block on interrupt, but idk if that works with gpio)
                    mipod_in->status == STATE_PAUSED;
                    while(!InterruptProcessed) continue;
                    break;
                case(MIPOD_RESUME): //continue playing
                    mipod_in->status = STATE_PLAYING; //notify caller the resume operation has succeeded.
                    break;
                case(MIPOD_STOP): //we are done playing the song, exit on out of here
                    mipod_in->status = STATE_SUCCESS; 
                    goto unload;
                case(MIPOD_RESTART): //reset the song state to the beginning and then start playing again
                    mipod_in->status = STATE_PLAYING;
                    mipod_in->operation = MIPOD_PLAY;
                    goto restart_playing; //sets state to playing
                case(MIPOD_FORWARD): 
                    mipod_in->status = STATE_PLAYING;
                    mipod_in->operation = MIPOD_PLAY;
                    ff = (size_t)(SONGLEN_5S / raw);
                    i += ff;
                    offset += (size_t)(raw * ff);
                    fseg += segsize * ff;
                    break;
                case(MIPOD_REWIND): 
                    mipod_in->status = STATE_PLAYING;
                    mipod_in->operation = MIPOD_PLAY;
                    rw = (size_t)(SONGLEN_5S / raw);
                    if (i < rw){
                        goto restart_playing;
                    }
                    i -= rw;
                    offset -= (size_t)(raw * rw);
                    fseg -= segsize * rw;
                    break;
            #ifdef __GNUC__
            default:__builtin_unreachable();
            #endif
            }
        }
        
        if (bytes_max && offset >= bytes_max) { //make sure we aren't playing too much audio
            mb_printf("Done playing song.\r\n");
            goto unload;
        }

        if (!load_song_segment(fseg, segsize, i)){
            if (i == 0) {
                unload_song_header();
                return false;
            }
            else
            {
                return true;
            }
        }
        decrypt_segment_data(segment_buffer, raw);

        offset += raw;
        //update our position in the loaded song
        fseg += segsize;
        //get next segment size
        segsize = ((struct segment_trailer *) & (segment_buffer[raw]))->next_segment_size;
        idx = ((struct segment_trailer *) & (segment_buffer[raw]))->idx;
        play_segment_bytes(segment_buffer, idx, raw);
    }

unload:;
    unload_song_header();
    return true;
}

bool startup_query(void) {
    for (int i = 0; i < NUM_PROVISIONED_REGIONS; i++){
        strncpy((char *)q_region_lookup(mipod_in->query_data, i), REGION_NAMES[PROVISIONED_RIDS[i]], UNAME_SIZE);
    } 
    
    for (size_t j = 0; j < NUM_PROVISIONED_USERS; j++) {
        strncpy((char *)q_user_lookup(mipod_in->query_data, j), users[PROVISIONED_UIDS[j]].name, UNAME_SIZE);
    }

    mb_printf("Queried player (%d regions, %d users)\r\n", NUM_PROVISIONED_REGIONS, NUM_PROVISIONED_USERS);
    mipod_in->status = STATE_SUCCESS;
    return true;
}

bool query_song(void) {
    char *name = NULL;
    int count = 0;
    memcpy(&mb_state.current_song_header, &mipod_in->digital_data.play_data.drm, sizeof(drm_header));

    mb_printf("Song Owner: %s \r\n", users[mb_state.current_song_header.ownerID].name);
    rid_to_region_name(mb_state.current_song_header.regions[0], &name, false);
	xil_printf("MB> Regions: %s", name);
    for (int i = 1; i < NUM_REGIONS; i++){
    	if (mb_state.current_song_header.regions[i]) {
        rid_to_region_name(mb_state.current_song_header.regions[i], &name, false);
        xil_printf(", %s", name);
    	}
    } 
    mb_printf("Shared Users: ");
    for (size_t j = 0; j < TOTAL_USERS; j++) {
    	if (mb_state.current_song_header.shared_users[j]) {
    		count++;
    		if (count==1) {
    			xil_printf("%s ", users[j].name);
    		} else {
    			xil_printf(", %s ", users[j].name);
    		}
    	}
    }
    if (!count) {
    	xil_printf("No Shared Users");
    }
    xil_printf("\r\n");
    return true;
}

//client can reassemble wav header
bool digitize_song(void) {
    /*
    load header
    load segment
    decrypt segment
    write decrypted segment back to shm buffer
    load next segment
    reapeat ad infinitum
    */

    size_t offset = 0, bytes_max = 0;

    switch (load_song_header(&mipod_in->digital_data.play_data.drm))
    {
    case(SONG_BADUSER):;
    case(SONG_BADREGION):; //we can play 30s, but no more
        bytes_max = SONGLEN_30S;
        break;
    case(SONG_BADSIG):;
        unload_song_header();
        mipod_in->status = STATE_FAILED;
        return false;
    case(SONG_OWNER): ;
    case(SONG_SHARED): ; //we can play the full song
        bytes_max = mipod_in->digital_data.wav_size;
        break;
    #ifdef __GNUC__
    default:__builtin_unreachable();
    #endif
    }

    uint8_t *fseg = &(mipod_in->digital_data.play_data.filedata[0]); //a pointer to the start of the segment to load within the shared memory section
    uint8_t *arm_decrypted = fseg; //a pointer to the next byte in the shared memory to write decrypted file to
    size_t decrypted_mem = 0, i = 0, raw = 0;
    size_t segsize = mb_state.current_song_header.first_segment_size;

    //load and decrypt all the segments
    mb_printf("Start to load the song, please wait...\r\n");
    
    for (; i < mb_state.current_song_header.nr_segments; i++) {
        if (bytes_max && offset >= bytes_max) {
            // mb_debug("End loading the song.\r\n");
            break;
        }
        if (!load_song_segment(fseg, segsize, i)) {
            if (i == 0)
            {
                // mb_debug("Load song segment failed.\r\n");
                unload_song_header();
                memzero(mipod_in->digital_data.play_data.filedata, decrypted_mem); 
                return false;
            }
            else
            {
                mb_printf("Load song segment ends.\r\n");
            }          
        }
        //decrypt and remove padding/trailers
        raw = segsize - sizeof(struct segment_trailer);
        decrypt_segment_data(segment_buffer, raw);

        offset += raw;
        fseg += segsize;
        segsize = ((struct segment_trailer *)((uint8_t *)segment_buffer + segsize - sizeof(struct segment_trailer)))->next_segment_size;
        Xil_MemCpy(arm_decrypted, segment_buffer, raw);
        decrypted_mem += raw;
        arm_decrypted += raw;
    }
    mb_printf("Song decryption ready, start to write into file.\r\n");
    mipod_in->digital_data.wav_size = decrypted_mem;
    return true;
}

/*
note: assumes that all possible users will exist on the local device (ie no cross-device song sharing, those users will be overwritten).
this seems to be in accordance with the spec, but I am not 100% sure.
*/
bool share_song(void)
{
    bool rcode = false;
    char target[UNAME_SIZE];
    int32_t res = NULL;
    int8_t targetuid = NULL;
    uint8_t tempOwner = NULL;
    if (!mb_state.logged_in_user) {
        mb_printf("Need to login first!!!!\r\n");
        goto fail;
    }
    memcpy(target, mipod_in->shared_user, UNAME_SIZE);
    res = load_song_header(&mipod_in->digital_data.play_data.drm);
    if (res != SONG_OWNER) {
        mb_printf("You are not owner of the song!!!\r\n");
        goto fail;
    }
    // username_to_uid(target, &targetuid, TRUE);
    tempOwner = mb_state.current_song_header.ownerID;
    if ((! username_to_uid(target, &targetuid, TRUE)) || targetuid == tempOwner) {
        mb_printf("Invalid Target.\r\n");
        goto fail;
    }
    if (mb_state.current_song_header.shared_users[targetuid]) {
        mb_printf("Song is already shared with user: %s \r\n", target);
        goto fail;
    }
    mb_state.current_song_header.shared_users[targetuid] = 1;
    sign_user_block(&mb_state.current_song_header, offsetof(drm_header, owner_sig));
    memcpy(&mipod_in->digital_data.play_data.drm, &mb_state.current_song_header, sizeof(mb_state.current_song_header));
    rcode = true;

    fail:;
    unload_song_header();
    return rcode;
}
