#include <stdio.h>
#include "platform.h"
#include "xparameters.h"
#include "xil_exception.h"
#include "xstatus.h"
#include "xaxidma.h"
#include "xil_mem.h"
#include "util.h"
#include "secrets.h"
#include "xintc.h"
#include "sleep.h"
#include "constants.h"
#include "BYOT_header.h"
//////////////////////// GLOBALS ////////////////////////

u_int8_t measurement[MEASUREMENT_SIZE];
// audio DRM pointer
void *sAxiDma_pointer = (void *)SAXI_DMA_POINTER_ADDRESS;
volatile drm_channel *drm_chnl = (drm_channel *)SHARED_DDR_BASE;
attestation_md __attribute__((section(".ssc.attestation.md"))) att_md;
// internal state store
drm_internal_state s;

void *point_to_runtime_interrrupt = (void *)INTERRUPT_POINTER_ADDRESS;
//void *point_to_runtime_interrrupt = (void *)0x19798;

//////////////////////// INTERRUPT HANDLING ////////////////////////
int dummy_drm()
{
	u32 t, s;
	char *str1 = NULL, *str2;

    usleep(500);
    sleep(50);
    MB_Sleep(10);
    init_platform();
    cleanup_platform();
    if (!memcmp(str1, str2, 10))
	{
    	load_song_md();
	}
    blake2s(str1, str2 , 10);
}
//////////////////////// UTILITY FUNCTIONS ////////////////////////
//Attest the user name and pin
void usr_name_pin_attst(char in)
{
	if (in == 0)
	{
		att_md.input_att_size = adjust_block_size(USERNAME_SZ + MAX_PIN_SZ);
		memcpy(att_md.att_input_data, (void *)drm_chnl->audio_data.username, USERNAME_SZ);
		memcpy(att_md.att_input_data + USERNAME_SZ, (void*)drm_chnl->audio_data.pin, MAX_PIN_SZ);
	}
	else
	{
		att_md.output_att_size = adjust_block_size(USERNAME_SZ + MAX_PIN_SZ);
		memcpy(att_md.att_output_data, (void *)drm_chnl->audio_data.username, USERNAME_SZ);
		memcpy(att_md.att_output_data + USERNAME_SZ, (void*)drm_chnl->audio_data.pin, MAX_PIN_SZ);
	}

}
// returns whether an rid has been provisioned
int is_provisioned_rid(char rid)
{
    for (int i = 0; i < NUM_PROVISIONED_REGIONS; i++)
    {
        if (rid == PROVISIONED_RIDS[i])
        {
            return TRUE;
        }
    }
    return FALSE;
}

// looks up the region name corresponding to the rid
int rid_to_region_name(char rid, char **region_name, int provisioned_only)
{
    for (int i = 0; i < NUM_REGIONS; i++)
    {
        if (rid == REGION_IDS[i] &&
            (!provisioned_only || is_provisioned_rid(rid)))
        {
            *region_name = (char *)REGION_NAMES[i];
            return TRUE;
        }
    }

    mb_printf("Could not find region ID '%d'\r\n", rid);
    *region_name = "<unknown region>";
    return FALSE;
}

// looks up the rid corresponding to the region name
int region_name_to_rid(char *region_name, char *rid, int provisioned_only)
{
    for (int i = 0; i < NUM_REGIONS; i++)
    {
        if (!strncmp(region_name, REGION_NAMES[i], REGION_NAME_SZ) &&
            (!provisioned_only || is_provisioned_rid(REGION_IDS[i])))
        {
            *rid = REGION_IDS[i];
            return TRUE;
        }
    }

    mb_printf("Could not find region name '%s'\r\n", region_name);
    *rid = -1;
    return FALSE;
}

// returns whether a uid has been provisioned
int is_provisioned_uid(char uid)
{
    for (int i = 0; i < NUM_PROVISIONED_USERS; i++)
    {
        if (uid == PROVISIONED_UIDS[i])
        {
            return TRUE;
        }
    }
    return FALSE;
}

// looks up the username corresponding to the uid
int uid_to_username(char uid, char **username, int provisioned_only)
{
    for (int i = 0; i < NUM_USERS; i++)
    {
        if (uid == USER_IDS[i] &&
            (!provisioned_only || is_provisioned_uid(uid)))
        {
            *username = (char *)USERNAMES[i];
            return TRUE;
        }
    }

    mb_printf("Could not find uid '%d'\r\n", uid);
    *username = "<unknown user>";
    return FALSE;
}

// looks up the uid corresponding to the username
int username_to_uid(char *username, char *uid, int provisioned_only)
{
    for (int i = 0; i < NUM_USERS; i++)
    {
        if (!strncmp(username, USERNAMES[USER_IDS[i]], USERNAME_SZ) &&
            (!provisioned_only || is_provisioned_uid(USER_IDS[i])))
        {
            *uid = USER_IDS[i];
            return TRUE;
        }
    }

    mb_printf("Could not find username '%s'\r\n", username);
    *uid = -1;
    return FALSE;
}

void load_song_md() {
	s.song_md.md_size = drm_chnl->audio_data.song.md.md_size;
	s.song_md.owner_id = drm_chnl->audio_data.song.md.owner_id;
	s.song_md.num_regions = drm_chnl->audio_data.song.md.num_regions;
	s.song_md.num_users = drm_chnl->audio_data.song.md.num_users;

	memcpy(s.song_md.rids, (void *)get_drm_rids(drm_chnl->audio_data.song), s.song_md.num_regions);
	memcpy(s.song_md.uids, (void *)get_drm_uids(drm_chnl->audio_data.song), s.song_md.num_users);
}

int gen_song_md(char *buf) {
    buf[0] = ((5 + s.song_md.num_regions + s.song_md.num_users) / 2) * 2; // account for parity
    buf[1] = s.song_md.owner_id;
    buf[2] = s.song_md.num_regions;
    buf[3] = s.song_md.num_users;
    memcpy(buf + 4, s.song_md.rids, s.song_md.num_regions);
    memcpy(buf + 4 + s.song_md.num_regions, s.song_md.uids, s.song_md.num_users);

    return buf[0];
}

void share_song() {
    int new_md_len, shift;
    char new_md[256], uid;

    //Attest the share song input data
    att_md.input_att_size = adjust_block_size(drm_chnl->audio_data.song.md.md_size);
	memcpy(att_md.att_input_data, (void *)&drm_chnl->audio_data.song.md, drm_chnl->audio_data.song.md.md_size);
    // reject non-owner attempts to share
    load_song_md();
    if (!s.logged_in) {
        mb_printf("No user is logged in. Cannot share song\r\n");
        drm_chnl->audio_data.song.wav_size = 0;
        return;
    } else if (s.uid != s.song_md.owner_id) {
        mb_printf("User '%s' is not song's owner. Cannot share song\r\n", s.username);
        drm_chnl->audio_data.song.wav_size = 0;
        return;
    } else if (!username_to_uid((char *)drm_chnl->audio_data.username, &uid, TRUE)) {
        mb_printf("Username not found\r\n");
        drm_chnl->audio_data.song.wav_size = 0;
        return;
    }

    // generate new song metadata
    s.song_md.uids[s.song_md.num_users++] = uid;
    new_md_len = gen_song_md(new_md);
    shift = new_md_len - s.song_md.md_size;

    // shift over song and add new metadata
    if (shift) {
        memmove((void *)get_drm_song(drm_chnl->audio_data.song) + shift, (void *)get_drm_song(drm_chnl->audio_data.song), drm_chnl->audio_data.song.wav_size);
    }
    memcpy((void *)&drm_chnl->audio_data.song.md, new_md, new_md_len);

    // update file size
    drm_chnl->audio_data.song.file_size += shift;
    drm_chnl->audio_data.song.wav_size  += shift;
    //Attest the share song output data
	att_md.output_att_size = adjust_block_size(new_md_len + 2 * sizeof(int));
	memcpy(att_md.att_input_data, (void *)&drm_chnl->audio_data.song.file_size, sizeof(int));
	memcpy(att_md.att_input_data + sizeof(int), (void *)&drm_chnl->audio_data.song.wav_size, sizeof(int));
	memcpy(att_md.att_input_data + (2 * sizeof(int)), new_md, new_md_len);

    mb_printf("Shared song with '%s'\r\n", drm_chnl->audio_data.username);
}
void login()
{
    if (s.logged_in && (!strncmp(s.username, USERNAMES[PROVISIONED_UIDS[s.uid]], USERNAME_SZ)))
    {
    	usr_name_pin_attst(0);
		mb_printf("User %s Already logged in. Please log out first.\r\n", s.username);
		memcpy((void *)drm_chnl->audio_data.username, s.username, USERNAME_SZ);
		memcpy((void *)drm_chnl->audio_data.pin, s.pin, MAX_PIN_SZ);
		//Attest the output
		usr_name_pin_attst(1);
    }
    else
    {
        for (int i = 0; i < NUM_PROVISIONED_USERS; i++)
        {
            // search for matching username
            if (!strncmp((void*)drm_chnl->audio_data.username, USERNAMES[PROVISIONED_UIDS[i]], USERNAME_SZ))
            {
                // check if pin matches
                if (!strncmp((void*)drm_chnl->audio_data.pin, PROVISIONED_PINS[i], MAX_PIN_SZ))
                {
                    //update states
                	usr_name_pin_attst(0);
                    s.logged_in = 1;
                    memcpy(s.username, (void*)drm_chnl->audio_data.username, USERNAME_SZ);
                    memcpy(s.pin, (void*)drm_chnl->audio_data.pin, MAX_PIN_SZ);
                    s.uid = PROVISIONED_UIDS[i];
                    mb_printf("Logged in for user '%s'\r\n", drm_chnl->audio_data.username);
                    //Attest the input
                    return;
                }
                else
                {
                	//Attest the input
                	usr_name_pin_attst(0);
                    // reject login attempt
                    mb_printf("Incorrect pin for user '%s'\r\n", drm_chnl->audio_data.username);
                    memset((void*)drm_chnl->audio_data.username, 0, USERNAME_SZ);
                    memset((void*)drm_chnl->audio_data.pin, 0, MAX_PIN_SZ);
                    return;
                }
            }
        }

        usr_name_pin_attst(0);
        // reject login attempt
        mb_printf("User not found\r\n");
        memset((void*)drm_chnl->audio_data.username, 0, USERNAME_SZ);
        memset((void*)drm_chnl->audio_data.pin, 0, MAX_PIN_SZ);
    }
}

// attempt to log out
void logout()
{
    if (s.logged_in && (!strncmp(s.username, USERNAMES[PROVISIONED_UIDS[s.uid]], USERNAME_SZ)))
    {
        mb_printf("Logging out...\r\n");
        s.logged_in = 0;
        memset(s.username, 0, USERNAME_SZ);
        memset(s.pin, 0, MAX_PIN_SZ);
        s.uid = 0;
    }
    else
    {
        mb_printf("Not logged in\r\n");
    }
}

void query_song() {

    char *name;
    //Attest query song input
    att_md.input_att_size = adjust_block_size(drm_chnl->audio_data.song.md.md_size);
    memcpy(att_md.att_input_data, (void *)&drm_chnl->audio_data.song.md, drm_chnl->audio_data.song.md.md_size);

    load_song_md();
    memset((void *)&drm_chnl->audio_data.query, 0, sizeof(query));

    drm_chnl->audio_data.query.num_regions = s.song_md.num_regions;
    drm_chnl->audio_data.query.num_users = s.song_md.num_users;

    uid_to_username(s.song_md.owner_id, &name, FALSE);

    strncpy((char *)drm_chnl->audio_data.query.owner, name, USERNAME_SZ);

    for (int i = 0; i < s.song_md.num_regions; i++) {
		rid_to_region_name(s.song_md.rids[i], &name, FALSE);
		strncpy((char *)q_region_lookup(drm_chnl->audio_data.query, i), name, REGION_NAME_SZ);
	}

    for (int i = 0; i < s.song_md.num_users; i++) {
        uid_to_username(s.song_md.uids[i], &name, FALSE);
        strncpy((char *)q_user_lookup(drm_chnl->audio_data.query, i), name, USERNAME_SZ);
    }
    //Attest query song outputs
    att_md.output_att_size = adjust_block_size(drm_chnl->audio_data.query.num_regions * REGION_NAME_SZ +  drm_chnl->audio_data.query.num_regions * USERNAME_SZ + 72);
	memcpy(att_md.att_output_data, (void *)&drm_chnl->audio_data.query, att_md.output_att_size);

    mb_printf("Queried song (%d regions, %d users)\r\n", drm_chnl->audio_data.query.num_regions,  drm_chnl->audio_data.query.num_users);
}


int is_locked() {
    int locked = TRUE;

    // check for authorized user
    if (!s.logged_in) {
        mb_printf("No user logged in");
    } else {
        load_song_md();

        // check if user is authorized to play song
        if (s.uid == s.song_md.owner_id) {
            locked = FALSE;
        } else {
            for (int i = 0; i < NUM_PROVISIONED_USERS && locked; i++) {
                if (s.uid == s.song_md.uids[i]) {
                    locked = FALSE;
                }
            }
        }

        if (locked) {
            mb_printf("User '%s' does not have access to this song", s.username);
            return locked;
        }
        mb_printf("User '%s' has access to this song", s.username);
        locked = TRUE; // reset lock for region check

        // search for region match
        for (int i = 0; i < s.song_md.num_regions; i++) {
            for (int j = 0; j < (u8)NUM_PROVISIONED_REGIONS; j++) {
                if (PROVISIONED_RIDS[j] == s.song_md.rids[i]) {
                    locked = FALSE;
                }
            }
        }

        if (!locked) {
            mb_printf("Region Match. Full Song can be played. Unlocking...");
        } else {
            mb_printf("Invalid region");
        }
    }
    return locked;
}

void play_song() {
    u32 counter = 0, rem, cp_num, cp_xfil_cnt, offset, dma_cnt, length, *fifo_fill;

    mb_printf("Reading Audio File...");
    load_song_md();

    // get WAV length
    length = drm_chnl->audio_data.song.wav_size;
    mb_printf("Song length = %dB", length);

    // truncate song if locked
    if (length > PREVIEW_SZ && is_locked()) {
        length = PREVIEW_SZ;
        mb_printf("Song is locked.  Playing only %ds = %dB\r\n",
                   PREVIEW_TIME_SEC, PREVIEW_SZ);
    } else {
        mb_printf("Song is unlocked. Playing full song\r\n");
    }

    rem = length;
    fifo_fill = (u32 *)XPAR_FIFO_COUNT_AXI_GPIO_0_BASEADDR;

    // write entire file to two-block codec fifo
    // writes to one block while the other is being played
    while(rem > 0) {
        // check for interrupt to stop playback
        while (*(int *)point_to_runtime_interrrupt) {
        	*(int *)point_to_runtime_interrrupt = FALSE;

            switch (drm_chnl->audio_data.ssc_cmd) {
            case PAUSE:
                mb_printf("Pausing... \r\n");
                while (!(*(int *)point_to_runtime_interrrupt)) continue; // wait for interrupt
                break;
            case PLAY:
                mb_printf("Resuming... \r\n");
                break;
            case STOP:
                mb_printf("Stopping playback...");
                return;
            case RESTART:
                mb_printf("Restarting song... \r\n");
                rem = length; // reset song counter
            default:
                break;
            }
        }

        // calculate write size and offset
        cp_num = (rem > CHUNK_SZ) ? CHUNK_SZ : rem;
        offset = (counter++ % 2 == 0) ? 0 : CHUNK_SZ;

        // do first mem cpy here into DMA BRAM
        Xil_MemCpy((void *)(XPAR_MB_DMA_AXI_BRAM_CTRL_0_S_AXI_BASEADDR + offset),
                   (void *)(get_drm_song(drm_chnl->audio_data.song) + length - rem),
                   (u32)(cp_num));
        //Attest song data for each chunk
        Xil_MemCpy((void *)(XPAR_MB_DMA_AXI_BRAM_CTRL_0_S_AXI_BASEADDR + offset + (u32)(cp_num)),
        		measurement, MEASUREMENT_SIZE);
        int data_size = adjust_block_size(offset + cp_num);
        //blake2s(measurement, (void *)(get_drm_song(drm_chnl->audio_data.song) + length - rem), data_size);
        blake2s(measurement, (void *)(XPAR_MB_DMA_AXI_BRAM_CTRL_0_S_AXI_BASEADDR + offset), data_size);
        for (int i = 0; i < MEASUREMENT_SIZE; i++)
        {
        	xil_printf("%.2x", measurement[i]);
        }
        xil_printf("\r\n");
        cp_xfil_cnt = cp_num;

        while (cp_xfil_cnt > 0) {

            // polling while loop to wait for DMA to be ready
            // DMA must run first for this to yield the proper state
            // rem != length checks for first run
            while (XAxiDma_Busy(sAxiDma_pointer, XAXIDMA_DMA_TO_DEVICE)
                   && rem != length && *fifo_fill < (FIFO_CAP - 32));

            // do DMA
            dma_cnt = (FIFO_CAP - *fifo_fill > cp_xfil_cnt)
                      ? FIFO_CAP - *fifo_fill
                      : cp_xfil_cnt;
            fnAudioPlay(*(XAxiDma *)sAxiDma_pointer, offset, dma_cnt);
            cp_xfil_cnt -= dma_cnt;
        }
        xil_printf("on to the next hop\r\n");
        rem -= cp_num;
    }
    att_md.ssc_flag = 1;
    memcpy(att_md.ssc_measurement, measurement, MEASUREMENT_SIZE);
}

// removes DRM data from song for digital out
void digital_out() {
    // remove metadata size from file and chunk sizes
	drm_chnl->audio_data.song.file_size -= drm_chnl->audio_data.song.md.md_size;
	drm_chnl->audio_data.song.wav_size -= drm_chnl->audio_data.song.md.md_size;

    if (is_locked() && PREVIEW_SZ < drm_chnl->audio_data.song.wav_size) {
        mb_printf("Only playing 30 seconds");
        drm_chnl->audio_data.song.file_size -= drm_chnl->audio_data.song.wav_size - PREVIEW_SZ;
        drm_chnl->audio_data.song.wav_size = PREVIEW_SZ;
    }
    //Attestation on digital out data
    for (int i = 0; i < drm_chnl->audio_data.song.wav_size; i += (ATTESTION_CAP - MEASUREMENT_SIZE))
    {
    	memcpy(att_md.att_output_data, (void *)&drm_chnl->audio_data.song.md + i, (ATTESTION_CAP - MEASUREMENT_SIZE));
    	memcpy(att_md.att_output_data + (ATTESTION_CAP - MEASUREMENT_SIZE), measurement, MEASUREMENT_SIZE);
    	blake2s(measurement, att_md.att_output_data, ATTESTION_CAP);
    }

    // move WAV file up in buffer, skipping metadata
    mb_printf(MB_PROMPT "Dumping song (%dB)...", drm_chnl->audio_data.song.wav_size);
    memmove((void *)&drm_chnl->audio_data.song.md, (void *)get_drm_song(drm_chnl->audio_data.song), drm_chnl->audio_data.song.wav_size);
    mb_printf("Song dump finished\r\n");
    att_md.ssc_flag = 1;
    memcpy(att_md.ssc_measurement, measurement, MEASUREMENT_SIZE);
}

//////////////////////// MAIN ////////////////////////

int main()
{
	switch (drm_chnl->audio_data.ssc_cmd) {
		case LOGIN:
			mb_printf("Secure DRM: login\r\n");
			login();
			break;
		case LOGOUT:
			mb_printf("Secure DRM: logout\r\n");
			logout();
			break;
		case QUERY:
			mb_printf("Secure DRM: Query song\r\n");
			query_song();
			break;
		case SHARE:
			mb_printf("Secure DRM: Share song\r\n");
			share_song();
			break;
		case PLAY:
			mb_printf("Secure DRM: Play song\r\n");
			play_song();
			mb_printf("Secure DRM: Done playing Song\r\n");
			break;
		case DIGITAL_OUT:
			digital_out();
			break;
		default:
			break;
	}
	strncpy((char *)drm_chnl->audio_data.username, s.username, USERNAME_SZ);
	drm_chnl->audio_data.login_status = s.logged_in;
	usleep(500);
    return 0;
}
