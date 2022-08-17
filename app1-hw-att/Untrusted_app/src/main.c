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
int ases_ssa_load = 0;
// sends a command to the Enclave using the shared command channel and interrupt
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

void specify_aes_ssc_command(int cmd)
{
    memcpy((void *)&c->aes_cmd, &cmd, 1);
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
    mp_printf("  load <fileName>: load SSC module to be executed in Enclave\r\n");
    mp_printf("  exe: Execute the loaded SSC module\r\n");
    mp_printf("  exit: Clean the loaded SSC module from Enclave\r\n");
    mp_printf("  quit: To quit the untrusted application\r\n");
}

void aes_ssa_help()
{
    mp_printf("AES SSA options:\r\n");
    mp_printf("  encrypt: Encrypt the data specified in the application, Key is embedded in hardware module\r\n");
    mp_printf("  decrypt: Decrypt the data specified in the application, Key is embedded in hardware module\r\n");
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

void login(char *username, char *pin)
{

    if (!username || !pin)
    {
        mp_printf("Invalid user name/PIN\r\n");
        print_help();
        return;
    }

    specify_ssc_command(LOGIN);
    strncpy((void *)c->drm_chnl.username, username, USERNAME_SZ);
    strncpy((void *)c->drm_chnl.pin, pin, MAX_PIN_SZ);
    send_command(SSC_COMMAND);

    while (c->drm_state == STOPPED)
        continue; // wait for DRM to start working

    while (c->drm_state == WORKING)
        continue; // wait for DRM to dump file
}

void logout()
{
    specify_ssc_command(LOGOUT);
    send_command(SSC_COMMAND);
}
//////////////////////// MAIN ////////////////////////
void load_code(char *fileName)
{
    c->file_size = (int)load_file(fileName, (void *)&c->code);
    // load file into shared buffer
    if (!c->file_size)
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

    if (!strncmp(fileName, "AES_SSC", sizeof("AES_SSC")))
    {
        ases_ssa_load = 1;
        aes_ssa_help();
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

static void phex(unsigned char *str)
{

    unsigned char len = 16;
    unsigned char i;

    for (i = 0; i < len; ++i)
        printf("%.2x", str[i]);

    printf("\n");
}
void encrypt_SSC()
{
    unsigned char test_plain_text[64] = {(unsigned char)0x6b, (unsigned char)0xc1, (unsigned char)0xbe, (unsigned char)0xe2, (unsigned char)0x2e, (unsigned char)0x40, (unsigned char)0x9f, (unsigned char)0x96, (unsigned char)0xe9, (unsigned char)0x3d, (unsigned char)0x7e, (unsigned char)0x11, (unsigned char)0x73, (unsigned char)0x93, (unsigned char)0x17, (unsigned char)0x2a,
                                         (unsigned char)0xae, (unsigned char)0x2d, (unsigned char)0x8a, (unsigned char)0x57, (unsigned char)0x1e, (unsigned char)0x03, (unsigned char)0xac, (unsigned char)0x9c, (unsigned char)0x9e, (unsigned char)0xb7, (unsigned char)0x6f, (unsigned char)0xac, (unsigned char)0x45, (unsigned char)0xaf, (unsigned char)0x8e, (unsigned char)0x51,
                                         (unsigned char)0x30, (unsigned char)0xc8, (unsigned char)0x1c, (unsigned char)0x46, (unsigned char)0xa3, (unsigned char)0x5c, (unsigned char)0xe4, (unsigned char)0x11, (unsigned char)0xe5, (unsigned char)0xfb, (unsigned char)0xc1, (unsigned char)0x19, (unsigned char)0x1a, (unsigned char)0x0a, (unsigned char)0x52, (unsigned char)0xef,
                                         (unsigned char)0xf6, (unsigned char)0x9f, (unsigned char)0x24, (unsigned char)0x45, (unsigned char)0xdf, (unsigned char)0x4f, (unsigned char)0x9b, (unsigned char)0x17, (unsigned char)0xad, (unsigned char)0x2b, (unsigned char)0x41, (unsigned char)0x7b, (unsigned char)0xe6, (unsigned char)0x6c, (unsigned char)0x37, (unsigned char)0x10};

    memcpy((void *)&c->enc_dec_data, &test_plain_text, ENC_DEC_DATA_SIZE);
    mp_printf("plain text:\r\n");

    for (unsigned char i = (unsigned char)0; i < (unsigned char)4; ++i)
    {
        phex((void *)&c->enc_dec_data + i * (unsigned char)ENC_DEC_BLOCK_SIZE);
    }

    printf("\n");

    specify_aes_ssc_command(ENC);
    send_command(SSC_COMMAND);

    while (c->drm_state == STOPPED)
        continue; // wait for DRM to start working

    while (c->drm_state == WORKING)
        continue; // wait for DRM to dump file

    mp_printf("Cipher text received:\r\n");

    for (unsigned char i = (unsigned char)0; i < (unsigned char)4; ++i)
    {
        phex((void *)&c->enc_dec_data + i * (unsigned char)ENC_DEC_BLOCK_SIZE);
    }
    printf("\n");
}
void decrypt_SSC()
{
    unsigned char test_cipher_text[64] = {(unsigned char)0x3a, (unsigned char)0xd7, (unsigned char)0x7b, (unsigned char)0xb4, (unsigned char)0x0d, (unsigned char)0x7a, (unsigned char)0x36, (unsigned char)0x60, (unsigned char)0xa8, (unsigned char)0x9e, (unsigned char)0xca, (unsigned char)0xf3, (unsigned char)0x24, (unsigned char)0x66, (unsigned char)0xef, (unsigned char)0x97,
                                          (unsigned char)0xf5, (unsigned char)0xd3, (unsigned char)0xd5, (unsigned char)0x85, (unsigned char)0x03, (unsigned char)0xb9, (unsigned char)0x69, (unsigned char)0x9d, (unsigned char)0xe7, (unsigned char)0x85, (unsigned char)0x89, (unsigned char)0x5a, (unsigned char)0x96, (unsigned char)0xfd, (unsigned char)0xba, (unsigned char)0xaf,
                                          (unsigned char)0x43, (unsigned char)0xb1, (unsigned char)0xcd, (unsigned char)0x7f, (unsigned char)0x59, (unsigned char)0x8e, (unsigned char)0xce, (unsigned char)0x23, (unsigned char)0x88, (unsigned char)0x1b, (unsigned char)0x00, (unsigned char)0xe3, (unsigned char)0xed, (unsigned char)0x03, (unsigned char)0x06, (unsigned char)0x88,
                                          (unsigned char)0x7b, (unsigned char)0x0c, (unsigned char)0x78, (unsigned char)0x5e, (unsigned char)0x27, (unsigned char)0xe8, (unsigned char)0xad, (unsigned char)0x3f, (unsigned char)0x82, (unsigned char)0x23, (unsigned char)0x20, (unsigned char)0x71, (unsigned char)0x04, (unsigned char)0x72, (unsigned char)0x5d, (unsigned char)0xd4};

    memcpy((void *)&c->enc_dec_data, &test_cipher_text, ENC_DEC_DATA_SIZE);
    mp_printf("Cipher text:\r\n");

    for (unsigned char i = (unsigned char)0; i < (unsigned char)4; ++i)
    {
        phex((void *)&c->enc_dec_data + i * (unsigned char)ENC_DEC_BLOCK_SIZE);
    }
    printf("\n");

    specify_aes_ssc_command(DEC);
    send_command(SSC_COMMAND);

    while (c->drm_state == STOPPED)
        continue; // wait for DRM to start working

    while (c->drm_state == WORKING)
        continue; // wait for DRM to dump file

    mp_printf("Plain text received:\r\n");

    for (unsigned char i = (unsigned char)0; i < (unsigned char)4; ++i)
    {
        phex((void *)&c->enc_dec_data + i * (unsigned char)ENC_DEC_BLOCK_SIZE);
    }
    printf("\n");
}
void exit_SSC()
{
    send_command(EXIT);

    while (c->drm_state == STOPPED)
        continue; // wait for DRM to start working

    while (c->drm_state == WORKING)
        continue; // wait for DRM to dump file

    ases_ssa_load = 0;
    mp_printf("Cleaned UP SSC\r\n");
}
// attempts to share a song with a user
void share_song(char *song_name, char *username)
{
    int fd;
    unsigned int length;
    ssize_t wrote, written = 0;

    specify_ssc_command(SHARE);

    if (!username)
    {
        mp_printf("Need song name and username\r\n");
        print_help();
        return;
    }
    // load the song into the shared buffer
    if (!load_file(song_name, (void *)&c->drm_chnl.song))
    {
        mp_printf("Failed to load song!\r\n");
        return;
    }

    strncpy((char *)c->drm_chnl.username, username, USERNAME_SZ);

    // drive DRM
    send_command(SSC_COMMAND);

    while (c->drm_state == STOPPED)
        continue; // wait for DRM to start working

    while (c->drm_state == WORKING)
        continue; // wait for DRM to share song

    // request was rejected if WAV length is 0
    length = c->drm_chnl.song.wav_size;

    if (length == 0)
    {
        mp_printf("Share rejected\r\n");
        return;
    }

    // open output file
    fd = open(song_name, O_WRONLY);

    if (fd == -1)
    {
        mp_printf("Failed to open file! Error = %d\r\n", errno);
        return;
    }
    // write song dump to file
    mp_printf("Writing song to file '%s' (%dB)\r\n", song_name, length);

    while (written < length)
    {
        wrote = write(fd, (char *)&c->drm_chnl.song + written, length - written);

        if (wrote == -1)
        {
            mp_printf("Error in writing file! Error = %d\r\n", errno);
            return;
        }

        written += wrote;
    }
    close(fd);
    mp_printf("Finished writing file\r\n");
}

void query_song(char *song_file_name)
{
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

    for (int i = 1; i < c->drm_chnl.query.num_regions; i++)
    {
        printf(", %s", q_region_lookup(c->drm_chnl.query, i));
    }

    printf("\r\n");

    mp_printf("Owner: %s", c->drm_chnl.query.owner);
    printf("\r\n");

    mp_printf("Authorized users: ");
    if (c->drm_chnl.query.num_users)
    {
        printf("%s", q_user_lookup(c->drm_chnl.query, 0));

        for (int i = 1; i < c->drm_chnl.query.num_users; i++)
        {
            printf(", %s", q_user_lookup(c->drm_chnl.query, i));
        }
    }
    printf("\r\n");
}

int play_song(char *song_name)
{
    char usr_cmd[USR_CMD_SZ + 1], *cmd = NULL, *arg1 = NULL, *arg2 = NULL;

    // load song into shared buffer
    if (!load_file(song_name, (void *)&c->drm_chnl.song))
    {
        mp_printf("Failed to load song!\r\n");
        return 0;
    }

    // drive the DRM
    specify_ssc_command(PLAY);
    send_command(SSC_COMMAND);

    while (c->drm_state == STOPPED)
        continue; // wait for DRM to start playing

    // play loop
    while (1)
    {
        // get a valid command
        do
        {
            print_prompt_msg(song_name);
            fgets(usr_cmd, USR_CMD_SZ, stdin);

            // exit playback loop if DRM has finished song
            if (c->drm_state == STOPPED)
            {
                mp_printf("Song finished\r\n");
                return 0;
            }
        } while (strlen(usr_cmd) < 2);

        // parse and handle command
        parse_input(usr_cmd, &cmd, &arg1, &arg2);
        if (!cmd)
        {
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

void digital_out(char *song_name)
{
    char fname[64];

    // load file into shared buffer
    if (!load_file(song_name, (void *)&c->drm_chnl.song))
    {
        mp_printf("Failed to load song!\r\n");
        return;
    }

    // drive DRM
    specify_ssc_command(DIGITAL_OUT);
    send_command(SSC_COMMAND);
    while (c->drm_state == STOPPED)
        continue; // wait for DRM to start working

    while (c->drm_state == WORKING)
        continue; // wait for DRM to dump file

    // open digital output file
    int written = 0, wrote, length = c->drm_chnl.song.file_size + 8;
    sprintf(fname, "%s.dout", song_name);
    int fd = open(fname, O_WRONLY | O_CREAT | O_TRUNC);

    if (fd == -1)
    {
        mp_printf("Failed to open file! Error = %d\r\n", errno);
        return;
    }

    // write song dump to file
    mp_printf("Writing song to file '%s' (%dB)\r\n", fname, length);

    while (written < length)
    {
        wrote = write(fd, (char *)&c->drm_chnl.song + written, length - written);

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
void generate_challenge_number()
{
    time_t t;
    srand((unsigned)time(&t));
    c->challenge_number = rand();
    mp_printf("Challenge number is %d\n", c->challenge_number);
}
void print_measurement()
{
    mp_printf("Computed preExeAtt measurement: ");

    for (int i = 0; i < MEASUREMENT_SIZE; i++)
    {
        printf("%02x", c->preExehash[i]);
    }
    printf("\r\n");
    mp_printf("Computed postExeAtt measurement: ");

    for (int i = 0; i < MEASUREMENT_SIZE; i++)
    {
        printf("%02x", c->postExehash[i]);
    }
    printf("\r\n");
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

            if (ases_ssa_load)
                aes_ssa_help();
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
            if (play_song(arg1) < 0)
            {
                break;
            }
        }
        else if (!strncmp(cmd, "digital_out", sizeof("digital_out")))
        {
            digital_out(arg1);
        }
        else if (!strncmp(cmd, "encrypt", sizeof("encrypt")))
        {
            generate_challenge_number();
            encrypt_SSC();
            print_measurement();
        }
        else if (!strncmp(cmd, "decrypt", sizeof("decrypt")))
        {
            generate_challenge_number();
            decrypt_SSC();
            print_measurement();
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

            if (ases_ssa_load)
                aes_ssa_help();
        }
    }

    // unmap the command channel
    munmap((void *)c, sizeof(cmd_channel));

    return 0;
}
