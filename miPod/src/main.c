/*
 * eCTF Collegiate 2020 miPod Example Code
 * Linux-side DRM driver
 */


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


//////////////////////// UTILITY FUNCTIONS ////////////////////////


// sends a command to the microblaze using the shared command channel and interrupt
void send_command(int cmd) {
    memcpy((void*)&c->cmd, &cmd, 1);

    //trigger gpio interrupt
    system("devmem 0x41200000 32 0");
    system("devmem 0x41200000 32 1");
}


// parses the input of a command with up to two arguments
// any arguments not present will be set to NULL
void parse_input(char *input, char **cmd, char **arg1, char **arg2) {
    *cmd = strtok(input, " \r\n");
    *arg1 = strtok(NULL, " \r\n");
    *arg2 = strtok(NULL, " \r\n");
}


// prints the help message while not in playback
void print_help() {
	 mp_printf("miPod options:\r\n");
	 mp_printf("  load_code <fileName> : load code to be executed in Microblaze\r\n");
}

// loads a file into the song buffer with the associate
// returns the size of the file or 0 on error
size_t load_file(char *fname, char *file_buf) {
    int fd;
    struct stat sb;

    fd = open(fname, O_RDONLY);
    if (fd == -1){
        mp_printf("Failed to open file! Error = %d\r\n", errno);
        return 0;
    }

    if (fstat(fd, &sb) == -1){
        mp_printf("Failed to stat file! Error = %d\r\n", errno);
        return 0;
    }

    read(fd, file_buf, sb.st_size);
    close(fd);

    mp_printf("Loaded file into shared buffer (%dB)\r\n", sb.st_size);
    return sb.st_size;
}

void query_drm(){
	send_command(QUERY_DRM);
	while (c->drm_state == STOPPED) continue; // wait for DRM to start working
	while (c->drm_state == WORKING) continue; // wait for DRM to dump file
	mp_printf("Dummy query\r\n");
}
//////////////////////// MAIN ////////////////////////
void load_code(char *fileName) {
	 // load file into shared buffer
	    if (!load_file(fileName, (void*)&c->code)) {
	        mp_printf("Failed to load song!\r\n");
	        return;
	    }
		send_command(LOAD_CODE);
		while (c->drm_state == STOPPED) continue; // wait for DRM to start working
		while (c->drm_state == WORKING) continue; // wait for DRM to dump file
		mp_printf("Finished executing file\r\n");
}

int main(int argc, char** argv)
{
    int mem;
    char usr_cmd[USR_CMD_SZ + 1], *cmd = NULL, *arg1 = NULL, *arg2 = NULL;
    memset(usr_cmd, 0, USR_CMD_SZ + 1);

    // open command channel
    mem = open("/dev/uio0", O_RDWR);
    c = mmap(NULL, sizeof(cmd_channel), PROT_READ | PROT_WRITE,
             MAP_SHARED, mem, 0);
    if (c == MAP_FAILED){
        mp_printf("MMAP Failed! Error = %d\r\n", errno);
        return -1;
    }
    mp_printf("Command channel open at %p (%dB)\r\n", c, sizeof(cmd_channel));

    // dump player information before command loop
    query_drm();

    // go into command loop until exit is requested
    while (1) {
        // get command
        print_prompt();
        fgets(usr_cmd, USR_CMD_SZ, stdin);

        // parse and handle command
        parse_input(usr_cmd, &cmd, &arg1, &arg2);
        if (!cmd) {
            continue;
        } else if (!strcmp(cmd, "help")) {
            print_help();
        } else if (!strcmp(cmd, "load_code")) {
        	load_code(arg1);
        }
        else {
            mp_printf("Unrecognized command.\r\n\r\n");
            print_help();
        }
    }

    // unmap the command channel
    munmap((void*)c, sizeof(cmd_channel));

    return 0;
}
