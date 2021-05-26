#include "miPod.h"

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
volatile drm_audio_channel *drm_chnl;
//////////////////////// UTILITY FUNCTIONS ////////////////////////

// sends a command to the microblaze using the shared command channel and interrupt
void send_command(int cmd)
{
    memcpy((void *)&c->cmd, &cmd, 1);

    //trigger gpio interrupt
    system("devmem 0x41200000 32 0");
    system("devmem 0x41200000 32 1");
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
    mp_printf("miPod options:\r\n");
    mp_printf("  load_code <fileName> : load code to be executed in Microblaze\r\n");
}

void query_drm()
{
    send_command(QUERY_DRM);
    while (c->drm_state == STOPPED)
        continue; // wait for DRM to start working
    while (c->drm_state == WORKING)
        continue; // wait for DRM to dump file
    mp_printf("Dummy query\r\n");
}

// loads a file into the song buffer with the associate
// returns the size of the file or 0 on error
size_t load_file(char *fname, char *file_buf) {
    int fd, total_read_bytes = 0;
    struct stat sb;
    mp_printf("Inside load file function \r\n");
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
  /*  if ( sb.st_size > CODE_SIZE)
    {
    	mp_printf("Code size if bigger than buffer space can not execute SSC code\r\n");
    	return 0;
    }*/

    while (total_read_bytes < sb.st_size)
    {
    	total_read_bytes += read(fd, file_buf, sb.st_size);
    }
    close(fd);

    mp_printf("Loaded file into shared buffer (%dB)\r\n", sb.st_size);
    return sb.st_size;
}

/*
bool copy_to_shared(char *fileName) {
    if (!load_file(fileName, (void *)&c->code))
    {
        mp_printf("Failed to load code!\r\n");
        return false;
    }
    return true;
}*/
void login(char *username, char *pin) {
    if (!username || !pin) {
        mp_printf("Invalid user name/PIN\r\n");
        print_help();
        return;
    }
    strcpy((void*)c->input, "login");
    strcpy((void*)c->input + COMMAND_SIZE, username);
    strcpy((void*)c->input + COMMAND_SIZE + USERNAME_SZ , pin);
    send_command(SSC_COMMAND);
    while (c->drm_state == STOPPED)
        continue; // wait for DRM to start working
    while (c->drm_state == WORKING)
        continue; // wait for DRM to dump file
    mp_printf("Finished Query file\r\n");
}
void logout() {
	strcpy((void*)c->input, "logout");
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
    mp_printf("Finished executing file\r\n");
}
// attempts to share a song with a user
void share_song(char *song_name, char *username) {
    int fd;
    unsigned int length;
    ssize_t wrote, written = 0;

    if (!username) {
        mp_printf("Need song name and username\r\n");
        print_help();
    }

    // load the song into the shared buffer
    strcpy((char *)c->input, username);
    if (!load_file(song_name, (void*)&c->input + 10)) {
        mp_printf("Failed to load song!\r\n");
        return;
    }

   // strcpy((char *)c->input, username);

    // drive DRM
    send_command(SSC_COMMAND);
    while (c->drm_state == STOPPED) continue; // wait for DRM to start working
    while (c->drm_state == WORKING) continue; // wait for DRM to share song

    // request was rejected if WAV length is 0
   /* length = c->song.wav_size;
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
        wrote = write(fd, (char *)&c->song + written, length - written);
        if (wrote == -1) {
            mp_printf("Error in writing file! Error = %d\r\n", errno);
            return;
        }
        written += wrote;
    }
    close(fd);
    mp_printf("Finished writing file\r\n");*/
}


void query_song(char *song_file_name) {
    // load file into shared buffer
	if (!song_file_name)
	{
		mp_printf("Invalid file name\r\n");
		print_help();
		return;
	}
	strcpy((void*)c->input, "query");
    if (!load_file(song_file_name, (void *)&drm_chnl->song + COMMAND_SIZE))
    {
        mp_printf("Failed to load song file!\r\n");
        return -1;
    }
    send_command(SSC_COMMAND);
    while (c->drm_state == STOPPED)
        continue; // wait for DRM to start working
    while (c->drm_state == WORKING)
        continue; // wait for DRM to dump file
    mp_printf("Finished Query file\r\n");
    
}
int main(int argc, char **argv)
{
    int mem;
    char usr_cmd[USR_CMD_SZ + 1], *cmd = NULL, *arg1 = NULL, *arg2 = NULL, *arg3 = NULL, *arg4 = NULL;
    memset(usr_cmd, 0, USR_CMD_SZ + 1);

    // open command channel
    mem = open("/dev/uio0", O_RDWR);
    c = mmap(NULL, sizeof(cmd_channel), PROT_READ | PROT_WRITE,
             MAP_SHARED, mem, 0);
    if (c == MAP_FAILED)
    {
        mp_printf("MMAP Failed! Error = %d\r\n", errno);
        return -1;
    }
    mp_printf("Command channel open at %p (%dB)\r\n", c, sizeof(cmd_channel));

    // dump player information before command loop
    query_drm();

    // go into command loop until exit is requested
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
        else if (!strcmp(cmd, "help"))
        {
            print_help();
        }
        else if (!strcmp(cmd, "load_code"))
        {
            load_code(arg1);
        }
        else if (!strcmp(cmd, "login"))
        {
        	login(arg1, arg2);
        }
        else if (!strcmp(cmd, "logout"))
        {
        	logout();
        }
        else if (!strcmp(cmd, "query"))
        {
        	 query_song(arg1);
        }
        else if (!strcmp(cmd, "share"))
	    {
        	share_song(arg1, arg2);
	    }
        else
        {
            mp_printf("Unrecognized command.\r\n\r\n");
            print_help();
        }
    }

    // unmap the command channel
    munmap((void *)c, sizeof(cmd_channel));

    return 0;
}

