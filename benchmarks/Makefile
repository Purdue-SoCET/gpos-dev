#=======================================================================
# UCB VLSI FLOW: Makefile for riscv-bmarks
#-----------------------------------------------------------------------
# Yunsup Lee (yunsup@cs.berkeley.edu)
#

XLEN ?= 64

ifeq ($(XLEN),32)
ABI ?= ilp32  # ICEBOX(anyone): update to ilp32f when we support F or ilp32d when we support F + D
endif
ifeq ($(XLEN),64)
ABI ?= lp64d
endif

default: all

src_dir = .

instname = riscv-bmarks
instbasedir = $(UCB_VLSI_HOME)/install

#--------------------------------------------------------------------
# Sources
#--------------------------------------------------------------------

base_bmarks = \
	median \
	qsort \
	rsort \
	towers \
	vvadd \
	memcpy \
	multiply \
	dhrystone \
	spmv \
	pmp \
	# mm \
	# mt-vvadd \
	# mt-matmul \
	# mt-memcpy \

vec_bmarks = \
	vec-memcpy \
	vec-daxpy \
	vec-sgemm \
	vec-strcmp \

# ICEBOX(anyone): add back when we support vector extension
# bmarks = $(base_bmarks) $(vec_bmarks)
bmarks = $(base_bmarks)

#--------------------------------------------------------------------
# Build rules
#--------------------------------------------------------------------

RISCV_PREFIX ?= riscv64-unknown-elf-
RISCV_GCC ?= $(RISCV_PREFIX)gcc
RISCV_GCC_OPTS ?= -DPREALLOCATE=1 -mcmodel=medany -static -std=gnu99 -O2 -ffast-math -fno-common -fno-builtin-printf -fno-tree-loop-distribute-patterns -Wno-implicit-int -Wno-implicit-function-declaration -mabi=$(ABI)
RISCV_LINK ?= $(RISCV_GCC) -T $(src_dir)/common/test.ld $(incs)
RISCV_LINK_OPTS ?= -static -nostdlib -nostartfiles -lm -lgcc -T $(src_dir)/common/test.ld
RISCV_OBJDUMP ?= $(RISCV_PREFIX)objdump --disassemble-all --disassemble-zeroes --section=.text --section=.text.startup --section=.text.init --section=.data
RISCV_OBJCOPY ?= $(RISCV_PREFIX)objcopy -O binary
RISCV_MARCH ?= rv$(XLEN)imc_zicsr_zifencei_zba_zbb_zbs  # ICEBOX(anyone): update imc_zicsr_zifencei to gc when floats, doubles, and atomics are added to the core.
RISCV_VMARCH ?= rv$(XLEN)imcv_zicsr_zifencei_zba_zbb_zbs  # ICEBOX(anyone): update imc_zicsr_zifencei to gcv when floats, doubles, atomics, and vectors are added to the core.
RISCV_SIM ?= spike --isa=$(RISCV_MARCH)

incs  += -I$(src_dir)/../env -I$(src_dir)/common $(addprefix -I$(src_dir)/, $(bmarks))
objs  :=

define compile_template
$(1).riscv: $(wildcard $(src_dir)/$(1)/*) $(wildcard $(src_dir)/common/*)
	$$(RISCV_GCC) $$(incs) $$(RISCV_GCC_OPTS) -march=$(2) -o $$@ $(wildcard $(src_dir)/$(1)/*.c) $(wildcard $(src_dir)/$(1)/*.S) $(wildcard $(src_dir)/common/*.c) $(wildcard $(src_dir)/common/*.S) $$(RISCV_LINK_OPTS)
endef

$(foreach bmark,$(base_bmarks),$(eval $(call compile_template,$(bmark),$(RISCV_MARCH))))
$(foreach bmark,$(vec_bmarks),$(eval $(call compile_template,$(bmark),$(RISCV_VMARCH))))

#------------------------------------------------------------
# Build and run benchmarks on riscv simulator

bmarks_riscv_bin  = $(addsuffix .riscv,  $(bmarks))
bmarks_riscv_rvb  = $(addsuffix .bin, $(bmarks))
bmarks_riscv_dump = $(addsuffix .riscv.dump, $(bmarks))
bmarks_riscv_out  = $(addsuffix .riscv.out,  $(bmarks))

$(bmarks_riscv_rvb): %.bin: %.riscv
	$(RISCV_OBJCOPY) $< $@

$(bmarks_riscv_dump): %.riscv.dump: %.riscv
	$(RISCV_OBJDUMP) $< > $@

$(bmarks_riscv_out): %.riscv.out: %.riscv
	$(RISCV_SIM) $< > $@

riscv: $(bmarks_riscv_dump) $(bmarks_riscv_rvb)
run: $(bmarks_riscv_out)

junk += $(bmarks_riscv_bin) $(bmarks_riscv_dump) $(bmarks_riscv_hex) $(bmarks_riscv_out) $(bmarks_riscv_rvb)

#------------------------------------------------------------
# Default

all: riscv

#------------------------------------------------------------
# Install

date_suffix = $(shell date +%Y-%m-%d_%H-%M)
install_dir = $(instbasedir)/$(instname)-$(date_suffix)
latest_install = $(shell ls -1 -d $(instbasedir)/$(instname)* | tail -n 1)

install:
	mkdir $(install_dir)
	cp -r $(bmarks_riscv_bin) $(bmarks_riscv_dump) $(install_dir)

install-link:
	rm -rf $(instbasedir)/$(instname)
	ln -s $(latest_install) $(instbasedir)/$(instname)

#------------------------------------------------------------
# Clean up

clean:
	rm -rf $(objs) $(junk)
