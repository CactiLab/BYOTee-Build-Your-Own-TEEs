/*
 * miPod.h
 *
 *  Created on: Jan 9, 2020
 *      Author: ectf
 */

#ifndef SRC_MIPOD_H_
#define SRC_MIPOD_H_


// miPod constants
#define USR_CMD_SZ 64

#define CODE_SIZE 50000
#define INPUT_SIZE 2000
#define OUTPUT_SIZE 2000
#define USERNAME_SZ 64
#define MAX_PIN_SZ 64
#define COMMAND_SIZE 10
// printing utility
#define MP_PROMPT "mP> "
#define mp_printf(...) printf(MP_PROMPT __VA_ARGS__)

#define USER_PROMPT "miPod %s# "
#define print_prompt() printf(USER_PROMPT, "")
#define print_prompt_msg(...) printf(USER_PROMPT, __VA_ARGS__)

// shared buffer values
//enum commands { QUERY_PLAYER, QUERY_SONG, LOGIN, LOGOUT, SHARE, PLAY, STOP, DIGITAL_OUT, PAUSE, RESTART, FF, RW };
enum commands { LOAD_CODE, QUERY_DRM, QUERY_PLAYER, QUERY_SONG, LOGIN, LOGOUT, SHARE, PLAY, STOP, DIGITAL_OUT, PAUSE, RESTART, FF, RW };
enum states   { STOPPED, WORKING, PLAYING, PAUSED };


// struct to interpret shared command channel
typedef volatile struct __attribute__((__packed__)) {
   char cmd;
   char drm_state;
   char code [CODE_SIZE];
   char input[INPUT_SIZE];
   //char output[OUTPUT_SIZE];
} cmd_channel;

#endif /* SRC_MIPOD_H_ */
