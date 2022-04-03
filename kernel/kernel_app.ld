OUTPUT_ARCH(riscv)
ENTRY(_entry)
BASE_ADDRESS = 0x80200000;

SECTIONS
{
    /* Load the kernel at this address: "." means the current address */
    . = BASE_ADDRESS;

    kernel_start = .;

    . = ALIGN(4K);

    text_start = .;
    .text : {
        *(.text .text.*)
        . = ALIGN(0x1000);
        _trampoline = .;
        *(trampsec)
        . = ALIGN(0x1000);
        ASSERT(. - _trampoline == 0x1000, "error: trampoline larger than one page");
        PROVIDE(etext = .);
    }

    . = ALIGN(4K);
    rodata_start = .;
    .rodata : {
        srodata = .;
        *(.rodata .rodata.*)
        erodata = .;
    }

    . = ALIGN(4K);
    data_start = .;
    .data : {
        sdata = .;
        . = ALIGN(0x1000);
        *(.data.app0)
        . = ALIGN(0x1000);
        *(.data.app1)
        . = ALIGN(0x1000);
        *(.data.app2)
        . = ALIGN(0x1000);
        *(.data.app3)
        . = ALIGN(0x1000);
        *(.data.app4)
        . = ALIGN(0x1000);
        *(.data.app5)
        . = ALIGN(0x1000);
        *(.data.app6)
        . = ALIGN(0x1000);
        *(.data.app7)
        . = ALIGN(0x1000);
        *(.data.app8)
        . = ALIGN(0x1000);
        *(.data.app9)
        . = ALIGN(0x1000);
        *(.data.app10)
        . = ALIGN(0x1000);
        *(.data.app11)
        . = ALIGN(0x1000);
        *(.data.app12)
        . = ALIGN(0x1000);
        *(.data.app13)
        . = ALIGN(0x1000);
        *(.data.app14)
        . = ALIGN(0x1000);
        *(.data.app15)
        . = ALIGN(0x1000);
        *(.data.app16)

        *(.data .data.*)
        edata = .;
    }

    . = ALIGN(4K);
    bss_start = .;
    .bss : {
	    *(.bss.stack)
        sbss_clear = .;
        *(.sbss .bss .bss.*)
        ebss_clear = .;
    }

    . = ALIGN(4K);
    PROVIDE(kernel_end = .);
}
