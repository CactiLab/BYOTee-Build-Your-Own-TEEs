// struct to interpret shared command channel
#define COMMAND_SIZE 10
typedef volatile struct __attribute__((__packed__))
{
    char cmd[COMMAND_SIZE];
    char username[USERNAME_SZ];
    char pin[MAX_PIN_SZ];
} player_input;

typedef struct
{
    char logged_in;             // whether or not a user is logged on
    u8 uid;                     // logged on user id
    char username[USERNAME_SZ]; // logged on username
    char pin[MAX_PIN_SZ];       // logged on pin
   // song_md song_md;            // current song metadata
} drm_internal_state;
