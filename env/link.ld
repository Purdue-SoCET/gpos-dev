MEMORY
{
  RAM : ORIGIN = 0x80000000, LENGTH = 1024M
}

ENTRY(_start)

SECTIONS
{
  .text.init :
  {
    *(.text.init)
  } > RAM

  . = ALIGN(0x1000);
  .tohost : { *(.tohost) }

  . = ALIGN(0x1000);

  .preinit_array :
  {
      PROVIDE(__preinit_array_start = .);
      KEEP(*(SORT_BY_INIT_PRIORITY(.preinit_array)));
      PROVIDE(__preinit_array_end = .);
  }

  .init_array :
  {
      PROVIDE(__init_array_start = .);
      KEEP(*(SORT_BY_INIT_PRIORITY(.init_array.*) SORT_BY_INIT_PRIORITY(.ctors.*)))
      KEEP(*(.init_array .ctors));
      PROVIDE(__init_array_end = .);
  }

  .fini_array :
  {
      PROVIDE(__fini_array_start = .);
      KEEP(*(SORT_BY_INIT_PRIORITY(.fini_array.*) SORT_BY_INIT_PRIORITY(.dtors.*)));
      KEEP(*(.fini_array .dtors));
      PROVIDE(__fini_array_end = .);
  }

  .text :
  {
    *(.text .text.*)
  }

  . = ALIGN(0x1000);
  .data : { 
    *(.data .data.*)
    *(.rodata .rodata.*)
    *(.sdata .sdata.*)
    *(.eh_frame .eh_frame.*)
  }

  PROVIDE(_edata = .);

  PROVIDE(__bss_start = .);
  .bss : 
  {
    *(.sbss .sbss.*)
    *(.bss .bss.*) 
  }

  PROVIDE(__bss_end = .);
  PROVIDE(_end = .);
  PROVIDE(__global_pointer$ = .);

  . = ALIGN(0x1000);
  PROVIDE(__heap_start = .);
  PROVIDE(__stack_top = ORIGIN(RAM) + LENGTH(RAM));
}

