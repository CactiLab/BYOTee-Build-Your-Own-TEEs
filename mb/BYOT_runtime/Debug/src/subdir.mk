################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/AES_test.c \
../src/aes.c \
../src/main.c \
../src/platform.c \
../src/util.c 

OBJS += \
./src/AES_test.o \
./src/aes.o \
./src/main.o \
./src/platform.o \
./src/util.o 

C_DEPS += \
./src/AES_test.d \
./src/aes.d \
./src/main.d \
./src/platform.d \
./src/util.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze gcc compiler'
	mb-gcc -Wall -O0 -g3 -I"/home/tomal/Desktop/Cacti_lab/BTEE/v2/code-build-your-own-TEE/mb/BYOT_bsp/microblaze_0/include" -c -fmessage-length=0 -MT"$@" -I"/home/tomal/Desktop/Cacti_lab/BTEE/v2/code-build-your-own-TEE/mb/BYOT_bsp/microblaze_0/include" -mlittle-endian -mcpu=v10.0 -mxl-soft-mul -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


