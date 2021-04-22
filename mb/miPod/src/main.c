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
void send_command(int cmd)
{
    memcpy((void *)&c->cmd, &cmd, 1);

    //trigger gpio interrupt
    system("devmem 0x41200000 32 0");
    system("devmem 0x41200000 32 1");
}

void parse_input(char *input, char **cmd, char **arg1, char **arg2, char **arg3, char **arg4)
{
    *cmd = strtok(input, " \r\n");
    *arg1 = strtok(NULL, " \r\n");
    *arg2 = strtok(NULL, " \r\n");
    //*arg3 = strtok(NULL, " \r\n");
    //*arg4 = strtok(NULL, " \r\n");
}

// prints the help message while not in playback
void print_help()
{
    mp_printf("miPod options:\r\n");
    mp_printf("  load_code <fileName> : load code to be executed in Microblaze\r\n");
}

// loads a file into the song buffer with the associate
// returns the size of the file or 0 on error
size_t load_file(char *fname, char *file_buf) {
    int fd, total_read_bytes = 0;;
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
    if ( sb.st_size > CODE_SIZE)
    {
    	mp_printf("Code size if bigger than buffer space can not execute SSC code\r\n");
    	return 0;
    }

    while (total_read_bytes < sb.st_size)
    {
    	total_read_bytes += read(fd, file_buf, sb.st_size);
    }
    close(fd);

    mp_printf("Loaded file into shared buffer (%dB)\r\n", sb.st_size);
    return sb.st_size;
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
/*
bool copy_to_shared(char *fileName) {
    if (!load_file(fileName, (void *)&c->code))
    {
        mp_printf("Failed to load code!\r\n");
        return false;
    }
    return true;
}*/
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
/*
void load_song_file(char *code_file,char *song_file)
{
    if (!load_file(song_file, (void *)&c->input))
    {
        mp_printf("Failed to load song file!\r\n");
        return -1;
    }
    if (!load_file(code_file, (void *)&c->code))
    {
        mp_printf("Failed to load code!\r\n");
        return -1;
    }
    send_command(PLAY);
    while (c->drm_state == STOPPED)
        continue; // wait for DRM to start working
    while (c->drm_state == WORKING)
        continue; // wait for DRM to dump file
    mp_printf("Song file loaded\r\n");
} */
/*
void query_song(char *code_file, char *song_file_name) {
    // load file into shared buffer
    if (!load_file(fileName, (void *)&c->code))
    {
        mp_printf("Failed to load code!\r\n");
        return -1;
    }
    if (!load_file(song_file, (void *)&c->input))
    {
        mp_printf("Failed to load song file!\r\n");
        return -1;
    }
    send_command(QUERY_SONG);
    while (c->drm_state == STOPPED)
        continue; // wait for DRM to start working
    while (c->drm_state == WORKING)
        continue; // wait for DRM to dump file
    mp_printf("Finished Query file\r\n");
    
}*/
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
        parse_input(usr_cmd, &cmd, &arg1, &arg2, &arg3, &arg4);
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
           /* if (!strcmp(arg2, "play") && arg3 != NULL)
            {
                load_song_file(arg1, arg3);
            }
            else if (!strcmp(arg2, "query") && arg3 != NULL) 
            {
                query_song(arg1, arg3);
            }*/
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

