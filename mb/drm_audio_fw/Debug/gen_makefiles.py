#!/usr/bin/env python3

def main():
	write_sources_mk()
	write_objects_mk()
	write_subdir_mk()

def write_sources_mk():
	SOURCES="sources.mk"
	fcontents='''
LD_SRCS :=
OBJ_SRCS :=
S_SRCS :=
C_SRCS :=
S_UPPER_SRCS :=
O_SRCS :=
EXECUTABLES :=
OBJS :=
S_UPPER_DEPS :=
C_DEPS :=
ELFSIZE :=

# Every subdirectory with source files must be described here
SUBDIRS := src
'''
	sf=open(SOURCES,'w')
	sf.write(fcontents)
	sf.close()

def write_objects_mk():
	OBJECTS="objects.mk"
	fcontents='''
USER_OBJS :=

LIBS := -Wl,--start-group,-lxil,-lgcc,-lc,--end-group
'''

	of=open(OBJECTS,'w')
	of.write(fcontents)
	of.close()

def write_subdir_mk():
	SUBDIR="src/subdir.mk"

	sdmkdirective='''
src/%.o: ../src/%.c
\t@echo 'Building file: $<'
\t@echo 'Invoking: MicroBlaze gcc compiler'
\tmb-gcc -Wall -fno-strict-aliasing -Os -g3 -I"/ectf/mb/drm_audio_fw_bsp/microblaze_0/include" -c -fmessage-length=0 -MT"$@" -I"/ectf/mb/drm_audio_fw_bsp/microblaze_0/include" -mlittle-endian -mcpu=v10.0 -mxl-soft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
\t@echo 'Finished building: $<'
\t@echo ' '
'''
	#note: originial -O was -O0 not -Os

	ldsrc="LD_SRCS += ../src/lscript.ld\n"
	csrc="C_SRCS +="
	objs="OBJS +="
	cdeps="C_DEPS +="
	cfiles=[
	'platform','util',
	'cacti_sig','hash_sha512',
	'hash_sha512_cp','memops',
	'pbkdf2','xdecrypt',
	'xdecrypt_linux','xdecrypt_sinit'
	]
	for f in cfiles:
		csrc+=' ../src/'+f+'.c'
		objs+=' ./src/'+f+'.o'
		cdeps+=' ./src/'+f+'.d'

	csrc+="\n"
	objs+="\n"
	cdeps+="\n"

	sf=open(SUBDIR,'w')
	sf.write(ldsrc)
	sf.write(csrc)
	sf.write(objs)
	sf.write(cdeps)
	sf.write(sdmkdirective)
	sf.close()

main()
