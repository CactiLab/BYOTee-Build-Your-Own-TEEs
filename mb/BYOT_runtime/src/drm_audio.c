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
#include "constants.h"
#include "sleep.h"
#include "drm_header.h" /*remove this when decouple from runtime*/
//#include "BYOT_header.h"
//////////////////////// GLOBALS ////////////////////////

// audio DMA access
static XAxiDma sAxiDma;


// shared command channel -- read/write for both PS and PL
player_input received_input;
volatile drm_channel *drm_chnl = (drm_channel*)SHARED_DDR_BASE;
volatile char *input = (char *)0x189f8;
// internal state store
drm_internal_state s;

int init = 0;
//////////////////////// INTERRUPT HANDLING ////////////////////////
int dummy()
{
    usleep(500);
    init_platform();
    cleanup_platform();
}
//////////////////////// UTILITY FUNCTIONS ////////////////////////

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
        if (!strcmp(region_name, REGION_NAMES[i]) &&
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
        if (!strcmp(username, USERNAMES[USER_IDS[i]]) &&
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

    mb_printf("Shared song with '%s'\r\n", drm_chnl->audio_data.username);
}


void login()
{
    if (s.logged_in)
    {
        mb_printf("User %s Already logged in. Please log out first.\r\n", s.username);
       // memcpy((void *)c->username, s.username, USERNAME_SZ);
        //memcpy((void *)c->pin, s.pin, MAX_PIN_SZ);
    }
    else
    {
        for (int i = 0; i < NUM_PROVISIONED_USERS; i++)
        {
            // search for matching username
            if (!strcmp(received_input.username, USERNAMES[PROVISIONED_UIDS[i]]))
            {
                // check if pin matches
                if (!strcmp(received_input.pin, PROVISIONED_PINS[i]))
                {
                    //update states
                    s.logged_in = 1;
                    //c->login_status = 1;
                    memcpy(s.username, received_input.username, USERNAME_SZ);
                    memcpy(s.pin, received_input.pin, MAX_PIN_SZ);
                    s.uid = PROVISIONED_UIDS[i];
                    mb_printf("Logged in for user '%s'\r\n", received_input.username);
                    return;
                }
                else
                {
                    // reject login attempt
                    mb_printf("Incorrect pin for user '%s'\r\n", received_input.username);
                    memset(received_input.username, 0, USERNAME_SZ);
                    memset(received_input.pin, 0, MAX_PIN_SZ);
                    return;
                }
            }
        }

        // reject login attempt
        mb_printf("User not found\r\n");
        memset(received_input.username, 0, USERNAME_SZ);
        memset(received_input.pin, 0, MAX_PIN_SZ);
    }
}

// attempt to log out
void logout()
{
    if (s.logged_in)
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

    load_song_md();
    memset((void *)&drm_chnl->audio_data.query, 0, sizeof(query));

    drm_chnl->audio_data.query.num_regions = s.song_md.num_regions;
    drm_chnl->audio_data.query.num_users = s.song_md.num_users;

    uid_to_username(s.song_md.owner_id, &name, FALSE);

    strcpy((char *)drm_chnl->audio_data.query.owner, name);

    for (int i = 0; i < s.song_md.num_regions; i++) {
		rid_to_region_name(s.song_md.rids[i], &name, FALSE);
		strcpy((char *)q_region_lookup(drm_chnl->audio_data.query, i), name);
	}

    for (int i = 0; i < s.song_md.num_users; i++) {
        uid_to_username(s.song_md.uids[i], &name, FALSE);
        strcpy((char *)q_user_lookup(drm_chnl->audio_data.query, i), name);
    }

    mb_printf("Queried song (%d regions, %d users)\r\n", drm_chnl->audio_data.query.num_regions,  drm_chnl->audio_data.query.num_users);
}

//////////////////////// MAIN ////////////////////////

int ssc()
{
	memcpy(&received_input, (void *)input, sizeof(player_input));
	if (!strcmp(received_input.cmd, "login")) {
		xil_printf("LOGIN COMMAND received\r\n");
		login();
	}
	else if (!strcmp(received_input.cmd, "logout")) {
		xil_printf("LOGOUT COMMAND received\r\n");
		logout();
	}
	else if (!strcmp(received_input.cmd, "query"))  {
		xil_printf("Query song COMMAND received\r\n");
		query_song();
	}
	else if (!strcmp(received_input.cmd, "share"))  {
		xil_printf("Share song COMMAND received\r\n");
		share_song();
	}
    return 0;
}
