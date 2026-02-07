prefix          := /usr/local
abs_top_src_dir := /home/asicfab/a/$(USER)/gpos-dev
XLEN            := 32
target_alias    := 
RISCV_PREFIX_VAR :=
# hack below, because configure outputs XLEN as 'yes' for some stupid reason...
ifneq ($(target_alias),)
XLEN            := 
endif
isa_src_dir     := $(abs_top_src_dir)/src
compile_dir	:= $(abs_top_src_dir)/compile

all: isa

isa:
	$(MAKE) -C compile -f $(compile_dir)/Makefile src_dir=$(isa_src_dir) XLEN=$(XLEN) $(RISCV_PREFIX_VAR)

clean:
	$(MAKE) -C compile -f $(compile_dir)/Makefile src_dir=$(isa_src_dir) XLEN=$(XLEN) $(RISCV_PREFIX_VAR) clean

.PHONY: isa clean

