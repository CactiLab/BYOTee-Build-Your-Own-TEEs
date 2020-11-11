CC=mb-gcc
objcpy=mb-objcopy
CFLAGS=-nostdlib -Wall -Wl,--gc-sections -Wl,--no-relax -O0 -mlittle-endian -mcpu=v10.0 -mxl-soft-mul
linker_script_dir=-Wl,-T -Wl,./test.ld
code_and_data=--only-section=.text --only-section=.data
code=--only-section=.text


testLinker: *.c
	  $(CC) $(CFLAGS) $(linker_script_dir) $^ -o $@
dump_elf:
	$(objcpy) -O binary $(code_and_data) testLinker ltestG

.PHONY: clean

clean:
	rm -f *.o final* *.txt *~

