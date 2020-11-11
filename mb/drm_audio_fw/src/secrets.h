
#ifndef SECRETS_H
#define SECRETS_H

#define NUM_REGIONS 3
const char *REGION_NAMES[] = { "United States", "Japan", "Australia" };
const u8 REGION_IDS[] = { 0, 1, 2 };

#define NUM_PROVISIONED_REGIONS 2
const u8 PROVISIONED_RIDS[] = { 0, 1 };

#define NUM_USERS 3
const char *USERNAMES[] = { "drew", "ben", "misha" };
const u8 USER_IDS[] = { 0, 1, 2 };

#define NUM_PROVISIONED_USERS 3
const u8 PROVISIONED_UIDS[] = { 0, 1, 2 };
const char *PROVISIONED_PINS[] = { "1234567890", "00000000", "0987654321" };

#endif // SECRETS_H
