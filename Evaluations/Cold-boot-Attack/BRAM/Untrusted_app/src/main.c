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
volatile bmp_mem *bmp;
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

void print_playback_help()
{
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
size_t load_file(char *fname, char *file_buf)
{
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

//////////////////////// MAIN ////////////////////////
void load_code(char *fileName)
{

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

void write_decay_file(char *fName)
{
	int fd = open(fName, O_WRONLY | O_CREAT | O_TRUNC);
	int length = 817920;
	int written = 0, wrote;
	    if (fd == -1)
	    {
	        mp_printf("Failed to open file! Error = %d\r\n", errno);
	        return;
	    }

	    // write song dump to file
	    mp_printf("Writing song to file '%s' (%dB)\r\n", fName, length);

	    while (written < length)
	    {
	        wrote = write(fd, (char *)&bmp->bmp + written, length - written);

	        if (wrote == -1)
	        {
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
    else
    {
    	mp_printf("MMAP Success\r\n");
    }
    while (1)
    {
    	print_prompt();
		fgets(usr_cmd, USR_CMD_SZ, stdin);

    	size_t size = load_file("1", (void *)c->drm_chnl.buf);

    	printf("File content:\r\n");
		for (int i = 0; i < 64; i++)
		{
			printf("%x ", *( c->drm_chnl.buf + i));
		}
    	c->file_size = size;
    	mp_printf("r\nCalling firmware to load into BRAM\r\n");

    	send_command(LOAD_CODE);

		while (c->drm_state == STOPPED)
			continue; // wait for CTEE
		while (c->drm_state == WORKING)
			continue; // wait for CTEE to dump file

		mp_printf("\r\nFirmware finished execution\r\n");
		FILE *fp = fopen("decay", "wb+");

		if (fp == -1)
		{
			printf("Failed to open file! Error = %d\r\n", errno);
			return 0;
		}

		fwrite(c->previous_BRAM_data.buf, 1, size, fp);
		fclose(fp);
		mp_printf("Finished writing file\r\n");

    }
    // unmap the command channel
    munmap((void *)c, sizeof(cmd_channel));

    return 0;
}
