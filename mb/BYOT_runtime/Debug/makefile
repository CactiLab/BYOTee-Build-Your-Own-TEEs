################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
ELFSIZE += \
BYOT_runtime.elf.size \


# All Target
all: BYOT_runtime.elf secondary-outputs

# Tool invocations
BYOT_runtime.elf: $(OBJS) ../src/lscript.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MicroBlaze gcc linker'
	mb-gcc -L"/home/tomal/Desktop/BUILDTEEcode/organize/code-build-your-own-TEE/mb/BYOT_bsp/microblaze_0/lib" -Wl,-T -Wl,../src/lscript.ld -L"/home/tomal/Desktop/BUILDTEEcode/organize/code-build-your-own-TEE/mb/BYOT_bsp/microblaze_0/include" -mlittle-endian -mcpu=v10.0 -mxl-soft-mul -o "BYOT_runtime.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

BYOT_runtime.elf.size: BYOT_runtime.elf
	@echo 'Invoking: MicroBlaze Print Size'
	mb-size BYOT_runtime.elf  |tee "BYOT_runtime.elf.size"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(EXECUTABLES)$(OBJS)$(S_UPPER_DEPS)$(C_DEPS)$(ELFSIZE) BYOT_runtime.elf
	-@echo ' '

secondary-outputs: $(ELFSIZE)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
