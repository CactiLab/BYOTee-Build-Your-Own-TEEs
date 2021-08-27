CC=gcc
CFLAGS=-I.

auth_SSA: hmac.o hmac_test.o sha1.o sha2.o
	$(CC) -o auth_SSA hmac.o hmac_test.o sha1.o sha2.o


clean :
	-rm *.o $(objects)