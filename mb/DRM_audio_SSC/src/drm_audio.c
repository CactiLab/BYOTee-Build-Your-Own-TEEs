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
//#include "BYOT_header.h"
//////////////////////// GLOBALS ////////////////////////

// audio DMA access
static XAxiDma sAxiDma;


// shared command channel -- read/write for both PS and PL
player_input received_input;

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

    song song_data;
    memcpy(&song_data, (void *)input, sizeof(song));


    // copy owner name
    uid_to_username(song_data.md.owner_id, &name, FALSE);

    mb_printf("Owner: %s \r\n", name);
    // copy region names
   /*for (int i = 0; i < song_data.md.num_regions; i++) {
        rid_to_region_name(s.song_md.rids[i], &name, FALSE);
        strcpy((char *)q_region_lookup(c->query, i), name);
    }

    // copy authorized uid names
    for (int i = 0; i < s.song_md.num_users; i++) {
        uid_to_username(s.song_md.uids[i], &name, FALSE);
        strcpy((char *)q_user_lookup(c->query, i), name);
    }*/

    mb_printf("Queried song (%d regions, %d users)\r\n", song_data.md.num_regions, song_data.md.num_users);
}

//////////////////////// MAIN ////////////////////////

int main()
{
	if (init == 0) {
		init++;
		xil_printf("DRM AUDIO SSC LOADED\r\n");
		return 0;
	}
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
    return 0;
}
