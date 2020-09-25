/*
 * eCTF Collegiate 2020 miPod Example Code -- RIT design
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
#include <stddef.h>


volatile mipod_buffer *mipod_in;


//////////////////////// UTILITY FUNCTIONS ////////////////////////


// sends a command to the microblaze using the shared command channel and interrupt
void send_command(int operation) {
    memcpy((void*)&mipod_in->operation, &operation, 1);

    //trigger gpio interrupt
    system("devmem 0x41200000 32 0");
    system("devmem 0x41200000 32 1");
}


// parses the input of a command with up to two arguments
// any arguments not present will be set to NULL
void parse_input(char *input, char **ops, char **arg1, char **arg2) {
    *ops = strtok(input, " \r\n");
    *arg1 = strtok(NULL, " \r\n");
    *arg2 = strtok(NULL, " \r\n");
}


// prints the help message while not in playback
void print_help() {
    mp_printf("miPod options:\r\n");
    mp_printf("  login <username> <pin>: log on to a miPod account (must be logged out)\r\n");
    mp_printf("  logout: log off of a miPod account (must be logged in)\r\n");
    mp_printf("  query <song.drm>: display information about the song\r\n");
    mp_printf("  share <song.drm> <username>: share the song with the specified user\r\n");
    mp_printf("  play <song.drm>: play the song\r\n");
    mp_printf("  digital_out <song.drm>: play the song to digital out\r\n");
    mp_printf("  exit: exit miPod\r\n");
    mp_printf("  help: display this message\r\n");
}


// prints the help message while in playback
void print_playback_help() {
    mp_printf("miPod playback options:\r\n");
    mp_printf("  stop: stop playing the song\r\n");
    mp_printf("  pause: pause the song\r\n");
    mp_printf("  resume: resume the paused song\r\n");
    mp_printf("  restart: restart the song\r\n");
    mp_printf("  ff: fast forwards 5 seconds(unsupported)\r\n");
    mp_printf("  rw: rewind 5 seconds (unsupported)\r\n");
    mp_printf("  help: display this message\r\n");
}


// loads a file into the song buffer with the associate
// returns the size of the file or 0 on error
size_t load_file(char *fname, mipod_digital_data *digital_data) {
    mipod_play_data * song_buf;
    // char *song_buf;
    int fd;
    struct stat sb;

    fd = open(fname, O_RDONLY);
    if (fd == -1){
        mp_printf("Song file does not exist!\r\n");
        return 0;
    }

    if (fstat(fd, &sb) == -1){
        mp_printf("Failed to stat file!\r\n");
        return 0;
    }

    ssize_t readValue = read(fd, &(digital_data->play_data), sb.st_size);
    if (readValue == -1) {
        close(fd);
        return 0;
    }
    digital_data->wav_size = digital_data->play_data.drm.wavdata.chunk_size - 44 + 8;
    
    close(fd);

    mp_printf("Loaded file into shared buffer (%ldB)\r\n", sb.st_size);
    return sb.st_size;
}


//////////////////////// COMMAND FUNCTIONS ////////////////////////


// attempts to log in for a user
void login(char *username, char *pin) {
    if (!username || !pin) {
        mp_printf("Invalid user name/PIN\r\n");
        print_help();
        return;
    }

    // drive DRM
    memset((void*)mipod_in->login_data.name, 0, UNAME_SIZE);
    memset((void*)mipod_in->login_data.pin, 0, PIN_SIZE);
    strncpy((void*)mipod_in->login_data.name, username, UNAME_SIZE);
    strncpy((void*)mipod_in->login_data.pin, pin, PIN_SIZE);
    send_command(MIPOD_LOGIN);
    while (mipod_in->operation == MIPOD_STOP) continue; // wait for DRM to start working
    while (mipod_in->status == STATE_WORKING) continue; // wait for DRM to dump file
    if (mipod_in->status == STATE_FAILED) {
        mp_printf("Login Failed\r\n");
        return;
    }
}


// logs out for a user
void logout() {
    // drive DRM
    send_command(MIPOD_LOGOUT);
    while (mipod_in->operation == MIPOD_STOP) continue; // wait for DRM to start working
    while (mipod_in->status == STATE_WORKING) continue; // wait for DRM to dump file
    return;
}


// queries the DRM about the player
// DRM will fill shared buffer with query content
void query_player() {
    // drive DRM
    send_command(MIPOD_QUERY);
    while (mipod_in->operation == MIPOD_STOP) continue; // wait for DRM to start working
    while (mipod_in->status == STATE_WORKING) continue; // wait for DRM to dump file

    mp_printf("Regions: %s", q_region_lookup(mipod_in->query_data, 0));
    if (mipod_in->query_data.users_list) {
        for (int i = 1; i < MAX_SHARED_REGIONS; i++) {
            // printf(", %X", q_user_lookup(mipod_in->query_data, i));
            if(strlen(q_region_lookup(mipod_in->query_data, i)) == 0){
                // mp_printf("empty users list!\r\n");
                i = MAX_SHARED_REGIONS;
                break;
            }
            else printf(", %s", q_region_lookup(mipod_in->query_data, i));
        }
    }
    printf("\r\n"); 

    mp_printf("Authorized users: ");
    if (mipod_in->query_data.users_list) {
        printf("%s", q_user_lookup(mipod_in->query_data, 0));
        for (int i = 1; i < MAX_SHARED_USERS; i++) {
            if(strlen(q_user_lookup(mipod_in->query_data, i)) == 0){
                i = MAX_SHARED_USERS;
                break;
            }
            else printf(", %s", q_user_lookup(mipod_in->query_data, i));
        }
    }
    printf("\r\n"); 
}


// queries the DRM about a song
void query_song(char *song_name) {
    // load the song into the shared buffer
    if (!load_file(song_name, &mipod_in->digital_data)) {
        mp_printf("Failed to load song!\r\n");
        return;
    }

    send_command(MIPOD_QUERY_SONG);
    while (mipod_in->operation == MIPOD_STOP) continue; // wait for DRM to start working
    while (mipod_in->status == STATE_WORKING) continue; // wait for DRM to finish
}


// attempts to share a song with a user
void share_song(char *song_name, char *username) {
    int fd;
    unsigned int length = sizeof(drm_header);
    ssize_t wrote, written = 0;

    if (!username) {
        mp_printf("Need song name and username\r\n");
        print_help();
        return;
    }

    // load the song into the shared buffer
    if (!load_file(song_name,(void*)&mipod_in->digital_data)) {
        mp_printf("Failed to load song!\r\n");
        return;
    }

    strncpy((char *)mipod_in->shared_user, username,UNAME_SIZE);

    // drive DRM
    send_command(MIPOD_SHARE);
    while (mipod_in->operation == MIPOD_STOP) continue; // wait for DRM to start sorking
    while (mipod_in->status == STATE_WORKING) continue; // wait for DRM to share song
  
    if (mipod_in->status == STATE_FAILED) {
        mp_printf("Share rejected\r\n");
        return;
    }

    // open output file
    fd = open(song_name, O_WRONLY);
    if (fd == -1){
        mp_printf("Failed to open the file. Share rejected.\r\n");
        return;
    }

    // write song dump to file
    mp_printf("Writing song to file '%s' (%dB)\r\n", song_name, length);
    while (written < length) {
        wrote = write(fd, (char *)&mipod_in->digital_data.play_data.drm + written, length - written);
        if (wrote == -1) {
            mp_printf("Failed to share song: %s \r\n",song_name);
            return;
        }
        written += wrote;
    }
    close(fd);
    mp_printf("Done Sharing.\r\n");
}


// plays a song and enters the playback command loop
int play_song(char *song_name) {
    char usr_ops[USR_CMD_SZ + 1], *ops = NULL, *arg1 = NULL, *arg2 = NULL;

    // load song into shared buffer
    if (!load_file(song_name, (void*)&mipod_in->digital_data)) {
        mp_printf("Failed to load song!\r\n");
        return 0;
    }

    // drive the DRM
    send_command(MIPOD_PLAY);
    while (mipod_in->operation == MIPOD_STOP) continue; // wait for DRM to start playing
    while (mipod_in->status == STATE_WORKING) continue; // wait for DRM to start playing

    // play loop
    while(1) {
        // get a valid command
        do {
            print_prompt_msg(song_name);
            fgets(usr_ops, USR_CMD_SZ, stdin);

            // exit playback loop if DRM has finished song
            if (mipod_in->operation == MIPOD_STOP) {
                mp_printf("Song finished\r\n");
                return 0;
            }

            if (mipod_in->status == STATE_FAILED)
            {
                mp_printf("Play song failed.\r\n");
                return -1;
            }
        } while (strlen(usr_ops) < 2);

        // parse and handle command
        parse_input(usr_ops, &ops, &arg1, &arg2);
        if (!ops) {
            continue;
        } else if (!strcmp(ops, "help")) {
            print_playback_help();
        } else if (!strcmp(ops, "resume")) {
            send_command(MIPOD_PLAY);
            usleep(200000); // wait for DRM to print
        } else if (!strcmp(ops, "pause")) {
            send_command(MIPOD_PAUSE);
            usleep(200000); // wait for DRM to print
        } else if (!strcmp(ops, "stop")) {
            send_command(MIPOD_STOP);
            while (mipod_in->status == STATE_WORKING) continue; // wait for DRM to start playing
            break;
        } else if (!strcmp(ops, "restart")) {
            send_command(MIPOD_RESTART);
        } else if (!strcmp(ops, "rw")) {
            send_command(MIPOD_REWIND);
            usleep(200000); // wait for DRM to print
            // mp_printf("Unsupported feature.\r\n\r\n");
            // print_playback_help();
        } else if (!strcmp(ops, "ff")) {
            send_command(MIPOD_FORWARD);
            usleep(200000); // wait for DRM to print
            // mp_printf("Unsupported feature.\r\n\r\n");
            // print_playback_help();
        } else if (!strcmp(ops, "lyrics")) {
            mp_printf("Unsupported feature.\r\n\r\n");
            print_playback_help();
        } else {
            mp_printf("Unrecognized command.\r\n\r\n");
            print_playback_help();
        }
    }

    return 0;
}


// turns DRM song into original WAV for digital output
void digital_out(char *song_name) {
    char fname[64];

    // load file into shared buffer
    if (!load_file(song_name, (void*)&mipod_in->digital_data)) {
        mp_printf("Failed to load song!\r\n");
        return;
    }

    // drive DRM
    send_command(MIPOD_DIGITAL);
    while (mipod_in->operation == MIPOD_STOP) continue; // wait for DRM to start working
    while (mipod_in->status == STATE_WORKING) continue; // wait for DRM to dump file

    if (mipod_in->status == STATE_FAILED)
    {
        mp_printf("Digital out song failed.\r\n");
        return;
    }

    // open digital output file
    int written = 0, wrote, length = mipod_in->digital_data.wav_size + 8;   // 44 for wav header, this 8???
    sprintf(fname, "%s.dout", song_name);
    int fd = open(fname, O_WRONLY | O_CREAT | O_TRUNC);
    if (fd == -1){
        mp_printf("Failed to open file! Error = %d\r\n", errno);
        return;
    }

    // write song dump to file
    mp_printf("Writing song to file '%s' (%dB)\r\n", fname, length + 44);
    // write song header to file
    write(fd, (char *)&mipod_in->digital_data.play_data.drm.wavdata, 44);
    while (written < length) {
        wrote = write(fd, (char *)&mipod_in->digital_data.play_data.filedata[0] + written, length - written);
        if (wrote == -1) {
            mp_printf("Error in writing file! Error = %d \r\n", errno);
            return;
        }
        written += wrote;
    }
    close(fd);
    mp_printf("Finished writing file\r\n");
}

//////////////////////// MAIN ////////////////////////


int main(int argc, char** argv)
{
    int mem;
    char usr_ops[USR_CMD_SZ + 1], *ops = NULL, *arg1 = NULL, *arg2 = NULL;
    memset(usr_ops, 0, USR_CMD_SZ + 1);

    // open command channel
    mem = open("/dev/uio0", O_RDWR);
    mipod_in = mmap(NULL, sizeof(mipod_buffer), PROT_READ | PROT_WRITE, MAP_SHARED, mem, 0);
    if (mipod_in == MAP_FAILED){
        mp_printf("MMAP Failed! Error = %d\r\n", errno);
        return -1;
    }
    memset(mipod_in, 0, sizeof(mipod_buffer));
    mp_printf("Command channel open at %p (%dB)\r\n", mipod_in, sizeof(mipod_buffer));

    // dump player information before command loop
    query_player();

    // go into command loop until exit is requested
    while (1) {
        // get command
        print_prompt();
        fgets(usr_ops, USR_CMD_SZ, stdin);

        // parse and handle command
        parse_input(usr_ops, &ops, &arg1, &arg2);
        if (!ops) {
            continue;
        } else if (!strcmp(ops, "help")) {
            print_help();
        } else if (!strcmp(ops, "login")) {
            login(arg1, arg2);
        } else if (!strcmp(ops, "logout")) {
            logout();
        } else if (!strcmp(ops, "query")) {
        	query_song(arg1);
        } else if (!strcmp(ops, "play")) {
            // break if exit was commanded in play loop
            if (play_song(arg1) < 0) {
                break;
            }
        } else if (!strcmp(ops, "digital_out")) {
        	digital_out(arg1);
        } else if (!strcmp(ops, "share")) {
            share_song(arg1, arg2);
        } else if (!strcmp(ops, "exit")) {
            mp_printf("Exiting...\r\n");
            break;
        } else {
            mp_printf("Unrecognized command.\r\n\r\n");
            print_help();
        }
    }

    // unmap the command channel
    munmap((void*)mipod_in, sizeof(mipod_buffer));

    return 0;
}
