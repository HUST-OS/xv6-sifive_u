    .align 4
    .section .data
    .global _app_num
_app_num:
    .quad 17
    .quad app_0_start
    .quad app_1_start
    .quad app_2_start
    .quad app_3_start
    .quad app_4_start
    .quad app_5_start
    .quad app_6_start
    .quad app_7_start
    .quad app_8_start
    .quad app_9_start
    .quad app_10_start
    .quad app_11_start
    .quad app_12_start
    .quad app_13_start
    .quad app_14_start
    .quad app_15_start
    .quad app_16_start
    .quad app_16_end

    .global _app_names
_app_names:
   .string "ca"
   .string "ech"
   .string "fin"
   .string "gre"
   .string "ini"
   .string "kil"
   .string "l"
   .string "mkdi"
   .string "m"
   .string "r"
   .string "s"
   .string "slee"
   .string "strac"
   .string "tes"
   .string "usertest"
   .string "w"
   .string "xarg"

    .section .data.app0
    .global app_0_start
app_0_start:
    .incbin "./target/_cat"

    .section .data.app1
    .global app_1_start
app_1_start:
    .incbin "./target/_echo"

    .section .data.app2
    .global app_2_start
app_2_start:
    .incbin "./target/_find"

    .section .data.app3
    .global app_3_start
app_3_start:
    .incbin "./target/_grep"

    .section .data.app4
    .global app_4_start
app_4_start:
    .incbin "./target/_init"

    .section .data.app5
    .global app_5_start
app_5_start:
    .incbin "./target/_kill"

    .section .data.app6
    .global app_6_start
app_6_start:
    .incbin "./target/_ls"

    .section .data.app7
    .global app_7_start
app_7_start:
    .incbin "./target/_mkdir"

    .section .data.app8
    .global app_8_start
app_8_start:
    .incbin "./target/_mv"

    .section .data.app9
    .global app_9_start
app_9_start:
    .incbin "./target/_rm"

    .section .data.app10
    .global app_10_start
app_10_start:
    .incbin "./target/_sh"

    .section .data.app11
    .global app_11_start
app_11_start:
    .incbin "./target/_sleep"

    .section .data.app12
    .global app_12_start
app_12_start:
    .incbin "./target/_strace"

    .section .data.app13
    .global app_13_start
app_13_start:
    .incbin "./target/_test"

    .section .data.app14
    .global app_14_start
app_14_start:
    .incbin "./target/_usertests"

    .section .data.app15
    .global app_15_start
app_15_start:
    .incbin "./target/_wc"

    .section .data.app16
    .global app_16_start
app_16_start:
    .incbin "./target/_xargs"
app_16_end:

