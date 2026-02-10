#=======================================================================
# Makefile for riscv-tests/isa
#-----------------------------------------------------------------------

src_dir := ./src

build_dir := .

test_name := rv32ui-v-add

default: all

#--------------------------------------------------------------------
# Build rules
#--------------------------------------------------------------------

RISCV_PREFIX ?= riscv64-unknown-elf-
RISCV_GCC ?= $(RISCV_PREFIX)gcc
RISCV_GCC_OPTS ?= -static -mcmodel=medany -fvisibility=hidden -nostdlib -nostartfiles -Oz
RISCV_OBJDUMP ?= $(RISCV_PREFIX)objdump --disassemble-all --disassemble-zeroes --section=.text --section=.text.startup --section=.text.init --section=.data
RISCV_OBJCOPY ?= $(RISCV_PREFIX)objcopy -O binary
RV32_CFLAGS := -march=rv32g -mabi=ilp32  

#--------------------------------------------------------------------
# Dependencies
#--------------------------------------------------------------------

INCLUDES := \
	-I$(src_dir)/../env/v \
	-I$(src_dir)/../env \
	-I$(src_dir)/macros/scalar

LINKER_SCRIPT := \
	-T$(src_dir)/../env/link.ld

KERNEL_SRCS := \
	$(src_dir)/../env/v/entry.S \
	$(src_dir)/../env/v/*.c


#------------------------------------------------------------
# Build assembly tests

%.bin: %
	$(RISCV_OBJCOPY) $< $@

%.dump: %
	$(RISCV_OBJDUMP) $< > $@


$(build_dir)/$(test_name): $(src_dir)/rv32ui/add.S
	$(RISCV_GCC) $(RV32_CFLAGS) $(RISCV_GCC_OPTS) \
		-DENTROPY=0x$(shell echo $@ | md5sum | cut -c 1-7) \
		-std=gnu99 -O2 \
		$(INCLUDES) \
		$(LINKER_SCRIPT) \
		$(KERNEL_SRCS) \
		$< -o $@

#------------------------------------------------------------
# Default

all: $(test_name).bin $(test_name).dump

#------------------------------------------------------------
# Clean up

clean:
	rm -rf $(test_name) $(test_name).bin $(test_name).dump
