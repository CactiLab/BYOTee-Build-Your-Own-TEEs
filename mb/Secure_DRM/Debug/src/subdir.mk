################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/platform.c \
../src/secure_drm.c \
../src/util.c 

OBJS += \
./src/platform.o \
./src/secure_drm.o \
./src/util.o 

C_DEPS += \
./src/platform.d \
./src/secure_drm.d \
./src/util.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze gcc compiler'
	mb-gcc -Wall -O0 -g3 -I"/home/tomal/Desktop/Cacti_lab/BTEE/v2/code-build-your-own-TEE/mb/BYOT_bsp/microblaze_0/include" -c -fmessage-length=0 -MT"$@" -I../../BYOT_bsp/microblaze_0/include -mlittle-endian -mcpu=v10.0 -mxl-soft-mul -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


