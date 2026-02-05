prefix          := /usr/local
abs_top_src_dir := /home/asicfab/a/akhauv/gpos-dev
XLEN            := 64
target_alias    := 
RISCV_PREFIX_VAR :=
# hack below, because configure outputs XLEN as 'yes' for some stupid reason...
ifneq ($(target_alias),)
XLEN            := 
endif
isa_src_dir     := $(abs_top_src_dir)/isa

all: isa

isa:
	mkdir -p isa
	$(MAKE) -C isa -f $(isa_src_dir)/Makefile src_dir=$(isa_src_dir) XLEN=$(XLEN) $(RISCV_PREFIX_VAR)

clean:
	[ ! -d isa ]        || $(MAKE) -C isa -f $(isa_src_dir)/Makefile src_dir=$(isa_src_dir) XLEN=$(XLEN) $(RISCV_PREFIX_VAR) clean

.PHONY: isa clean

