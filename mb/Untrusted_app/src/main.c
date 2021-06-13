#include "untrusted_app.h"

#include <stdio.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <linux/gpio.h>
#include <string.h>

volatile cmd_channel *c;
//////////////////////// UTILITY FUNCTIONS ////////////////////////
int secure_drm_load = 0;
// sends a command to the CTEE using the shared command channel and interrupt
void send_command(int cmd)
{
    memcpy((void *)&c->cmd, &cmd, 1);

    //trigger gpio interrupt
    system("devmem 0x41200000 32 0");
    system("devmem 0x41200000 32 1");
}

void specify_ssc_command(int cmd)
{
	memcpy((void *)&c->drm_chnl.ssc_cmd, &cmd, 1);
}

void parse_input(char *input, char **cmd, char **arg1, char **arg2)
{
    *cmd = strtok(input, " \r\n");
    *arg1 = strtok(NULL, " \r\n");
    *arg2 = strtok(NULL, " \r\n");
}

// prints the help message while not in playback
void print_help()
{
    mp_printf("Untrusted Application options:\r\n");
    mp_printf("  load <fileName>: load SSC module to be executed in CTEE\r\n");
    mp_printf("  exe: Execute the loaded SSC module\r\n");
    mp_printf("  exit: Clean the loaded SSC module from CTEE\r\n");
    mp_printf("  quit: To quit the untrusted application\r\n");
}
void secure_drm_print_help()
{
	mp_printf("Secure_DRM SSC options:\r\n");
    mp_printf("  login <userName> <pin>: Secure_DRM-> Loging with <userName> and <pin>\r\n");
    mp_printf("  logout: Secure_DRM-> Logout current logged in user\r\n");
    mp_printf("  Query <fileName>: Secure_DRM-> Query Song information\r\n");
    mp_printf("  Share <fileName> <userName>: Secure_DRM-> Share <fileName> with <userName>\r\n");
    mp_printf("  Play <fileName>: Secure_DRM-> Play the <fileName> media file\r\n");
    mp_printf("  digital_out <song.drm>: play the song to digital out\r\n");
}
void print_playback_help() {
    mp_printf("Secure DRM Player play back options:\r\n");
    mp_printf("  stop: stop playing the song\r\n");
    mp_printf("  pause: pause the song\r\n");
    mp_printf("  resume: resume the paused song\r\n");
    mp_printf("  restart: restart the song\r\n");
    mp_printf("  help: display this message\r\n");
}
void query_BYOT_runtime()
{
    send_command(QUERY_DRM);

    while (c->drm_state == STOPPED)
        continue; // wait for DRM to start working
    while (c->drm_state == WORKING)
        continue; // wait for DRM to dump file

    mp_printf("Initialization Done!!\r\n");
}

// loads a file into the song buffer with the associate
// returns the size of the file or 0 on error
size_t load_file(char *fname, char *file_buf) {
    int fd;
    struct stat sb;

    fd = open(fname, O_RDONLY);

    if (fd == -1)
    {
        mp_printf("Failed to open file! Error = %d\r\n", errno);
        return 0;
    }

    if (fstat(fd, &sb) == -1)
    {
        mp_printf("Failed to stat file! Error = %d\r\n", errno);
        return 0;
    }

    read(fd, file_buf, sb.st_size);
    close(fd);

    mp_printf("Loaded file into shared buffer (%dB)\r\n", sb.st_size);
    return sb.st_size;
}

void login(char *username, char *pin) {

    if (!username || !pin) {
        mp_printf("Invalid user name/PIN\r\n");
        print_help();
        return;
    }

    specify_ssc_command(LOGIN);
    strncpy((void*)c->drm_chnl.username, username, USERNAME_SZ);
    strncpy((void*)c->drm_chnl.pin , pin, MAX_PIN_SZ);
    send_command(SSC_COMMAND);

    while (c->drm_state == STOPPED)
        continue; // wait for DRM to start working
    while (c->drm_state == WORKING)
        continue; // wait for DRM to dump file
}
void logout() {
	specify_ssc_command(LOGOUT);
	send_command(SSC_COMMAND);
}
//////////////////////// MAIN ////////////////////////
void load_code(char *fileName)
{
    // load file into shared buffer
    if (!load_file(fileName, (void *)&c->code))
    {
        mp_printf("Failed to load code!\r\n");
        return -1;
    }

    send_command(LOAD_CODE);

    while (c->drm_state == STOPPED)
        continue; // wait for DRM to start working
    while (c->drm_state == WORKING)
        continue; // wait for DRM to dump file

    mp_printf("Finished loading file\r\n");

    if (!strncmp(fileName, "Secure_DRM", sizeof("Secure_DRM")))
    {
    	secure_drm_load = 1;
    	secure_drm_print_help();
    }
}
void execute_SSC()
{
	send_command(EXECUTE);

	while (c->drm_state == STOPPED)
		continue; // wait for DRM to start working
	while (c->drm_state == WORKING)
		continue; // wait for DRM to dump file

	mp_printf("Finished Executing SSC file\r\n");

}
void exit_SSC()
{
	send_command(EXIT);

	while (c->drm_state == STOPPED)
		continue; // wait for DRM to start working
	while (c->drm_state == WORKING)
		continue; // wait for DRM to dump file

	secure_drm_load = 0;
	mp_printf("Cleaned UP SSC\r\n");
}
// attempts to share a song with a user
void share_song(char *song_name, char *username) {
    int fd;
    unsigned int length;
    ssize_t wrote, written = 0;

    specify_ssc_command(SHARE);
    if (!username) {
        mp_printf("Need song name and username\r\n");
        print_help();
        return;
    }
    // load the song into the shared buffer
    if (!load_file(song_name, (void*)&c->drm_chnl.song)) {
        mp_printf("Failed to load song!\r\n");
        return;
    }

    strncpy((char *)c->drm_chnl.username, username, USERNAME_SZ);

    // drive DRM
    send_command(SSC_COMMAND);

    while (c->drm_state == STOPPED) continue; // wait for DRM to start working
    while (c->drm_state == WORKING) continue; // wait for DRM to share song

    // request was rejected if WAV length is 0
    length = c->drm_chnl.song.wav_size;
    if (length == 0) {
        mp_printf("Share rejected\r\n");
        return;
    }

    // open output file
    fd = open(song_name, O_WRONLY);

    if (fd == -1){
        mp_printf("Failed to open file! Error = %d\r\n", errno);
        return;
    }
    // write song dump to file
    mp_printf("Writing song to file '%s' (%dB)\r\n", song_name, length);

    while (written < length) {
        wrote = write(fd, (char *)&c->drm_chnl.song + written, length - written);
        if (wrote == -1) {
            mp_printf("Error in writing file! Error = %d\r\n", errno);
            return;
        }
        written += wrote;
    }
    close(fd);
    mp_printf("Finished writing file\r\n");
}


void query_song(char *song_file_name) {
    // load file into shared buffer
	if (!song_file_name)
	{
		mp_printf("Invalid file name\r\n");
		print_help();
		return;
	}

	specify_ssc_command(QUERY);

    if (!load_file(song_file_name, (void *)&c->drm_chnl.song))
    {
        mp_printf("Failed to load song file!\r\n");
        return -1;
    }
    send_command(SSC_COMMAND);

    while (c->drm_state == STOPPED)
        continue; // wait for DRM to start working
    while (c->drm_state == WORKING)
        continue; // wait for DRM to dump file

    mp_printf("Regions: %s", q_region_lookup(c->drm_chnl.query, 0));

	for (int i = 1; i < c->drm_chnl.query.num_regions; i++) {
		printf(", %s", q_region_lookup(c->drm_chnl.query, i));
	}

	printf("\r\n");

	mp_printf("Owner: %s", c->drm_chnl.query.owner);
	printf("\r\n");

	mp_printf("Authorized users: ");
	if (c->drm_chnl.query.num_users) {
		printf("%s", q_user_lookup(c->drm_chnl.query, 0));
		for (int i = 1; i < c->drm_chnl.query.num_users; i++) {
			printf(", %s", q_user_lookup(c->drm_chnl.query, i));
		}
	}
	printf("\r\n");
}

int play_song(char *song_name) {
    char usr_cmd[USR_CMD_SZ + 1], *cmd = NULL, *arg1 = NULL, *arg2 = NULL;

    // load song into shared buffer
    if (!load_file(song_name, (void*)&c->drm_chnl.song)) {
        mp_printf("Failed to load song!\r\n");
        return 0;
    }

    // drive the DRM
    specify_ssc_command(PLAY);
    send_command(SSC_COMMAND);
    
    while (c->drm_state == STOPPED) continue; // wait for DRM to start playing

    // play loop
    while(1) {
        // get a valid command
        do {
            print_prompt_msg(song_name);
            fgets(usr_cmd, USR_CMD_SZ, stdin);

            // exit playback loop if DRM has finished song
            if (c->drm_state == STOPPED) {
                mp_printf("Song finished\r\n");
                return 0;
            }
        } while (strlen(usr_cmd) < 2);

        // parse and handle command
        parse_input(usr_cmd, &cmd, &arg1, &arg2);
        if (!cmd) {
            continue;
        }
        else if (!strncmp(cmd, "help", sizeof("help")))
        {
        	print_playback_help();
        }
        else if (!strncmp(cmd, "resume", sizeof("resume")))
        {
        	specify_ssc_command(PLAY);
            send_command(SSC_COMMAND);
            usleep(200000); // wait for DRM to print
        }
        else if (!strncmp(cmd, "pause", sizeof("pause")))
        {
        	specify_ssc_command(PAUSE);
            send_command(SSC_COMMAND);
            usleep(200000); // wait for DRM to print
        }
        else if (!strncmp(cmd, "stop", sizeof("stop")))
        {
        	specify_ssc_command(STOP);
            send_command(SSC_COMMAND);
            usleep(200000); // wait for DRM to print
            break;
        }
        else if (!strncmp(cmd, "restart", sizeof("restart")))
        {
        	specify_ssc_command(RESTART);
            send_command(SSC_COMMAND);
        }
        else if (!strncmp(cmd, "quit", sizeof("quit")))
        {
            mp_printf("Quitting...\r\n");
            specify_ssc_command(STOP);
            send_command(SSC_COMMAND);
            return -1;
        }
        else
        {
            mp_printf("Unrecognized command.\r\n\r\n");
            print_playback_help();
        }
    }

    return 0;
}

void digital_out(char *song_name) {
    char fname[64];

    // load file into shared buffer
    if (!load_file(song_name, (void*)&c->drm_chnl.song)) {
        mp_printf("Failed to load song!\r\n");
        return;
    }

    // drive DRM
    specify_ssc_command(DIGITAL_OUT);
    send_command(SSC_COMMAND);
    while (c->drm_state == STOPPED) continue; // wait for DRM to start working
    while (c->drm_state == WORKING) continue; // wait for DRM to dump file

    // open digital output file
    int written = 0, wrote, length = c->drm_chnl.song.file_size + 8;
    sprintf(fname, "%s.dout", song_name);
    int fd = open(fname, O_WRONLY | O_CREAT | O_TRUNC);
    if (fd == -1){
        mp_printf("Failed to open file! Error = %d\r\n", errno);
        return;
    }

    // write song dump to file
    mp_printf("Writing song to file '%s' (%dB)\r\n", fname, length);

    while (written < length) {
        wrote = write(fd, (char *)&c->drm_chnl.song + written, length - written);
        if (wrote == -1) {
            mp_printf("Error in writing file! Error = %d \r\n", errno);
            return;
        }
        written += wrote;
    }
    close(fd);
    mp_printf("Finished writing file\r\n");
}

int main(int argc, char **argv)
{
    int mem;
    char usr_cmd[USR_CMD_SZ + 1], *cmd = NULL, *arg1 = NULL, *arg2 = NULL;

    memset(usr_cmd, 0, USR_CMD_SZ + 1);
    // open command channel
    mem = open("/dev/uio0", O_RDWR);
    c = mmap(NULL, sizeof(cmd_channel), PROT_READ | PROT_WRITE, MAP_SHARED, mem, 0);

    if (c == MAP_FAILED)
    {
        mp_printf("MMAP Failed! Error = %d\r\n", errno);
        return -1;
    }
    mp_printf("Command channel open at %p (%dB)\r\n", c, sizeof(cmd_channel));

    // dump player information before command loop
    query_BYOT_runtime();

    // go into command loop until quit is requested
    while (1)
    {
        // get command
        print_prompt();
        fgets(usr_cmd, USR_CMD_SZ, stdin);

        // parse and handle command
        parse_input(usr_cmd, &cmd, &arg1, &arg2);
        if (!cmd)
        {
            continue;
        }
        else if (!strncmp(cmd, "help", sizeof("help")))
        {
            print_help();

            if (secure_drm_load)
            	secure_drm_print_help();
        }
        else if (!strncmp(cmd, "load", sizeof("load")))
        {
            load_code(arg1);
        }
        else if (!strncmp(cmd, "exe", sizeof("exe")))
        {
        	execute_SSC();
        }
        else if (!strncmp(cmd, "exit", sizeof("exit")))
        {
        	exit_SSC();
        }
        else if (!strncmp(cmd, "login", sizeof("login")))
        {
        	login(arg1, arg2);
        }
        else if (!strncmp(cmd, "logout", sizeof("logout")))
        {
        	logout();
        }
        else if (!strncmp(cmd, "query", sizeof("query")))
        {
        	 query_song(arg1);
        }
        else if (!strncmp(cmd, "share", sizeof("share")))
	    {
        	share_song(arg1, arg2);
	    }
        else if (!strncmp(cmd, "play", sizeof("play")))
        {
			// break if exit was commanded in play loop
			if (play_song(arg1) < 0) {
				break;
			}
		}
        else if (!strncmp(cmd, "digital_out", sizeof("digital_out")))
        {
		     digital_out(arg1);
	    }
        else if (!strncmp(cmd, "quit", sizeof("quit")))
        {
        	mp_printf("Exiting untrusted application.....\r\n");
        	break;
        }
        else
        {
            mp_printf("Unrecognized command.\r\n\r\n");
            print_help();

            if (secure_drm_load)
            	secure_drm_print_help();
        }
    }

    // unmap the command channel
    munmap((void *)c, sizeof(cmd_channel));

    return 0;
}
