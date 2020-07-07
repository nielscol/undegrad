        .equ __P24FJ64GA002,1        ;required "boiler-plate" (BP)
        .include "p24Fxxxx.inc"      ;BP

#include "xc.inc"                    ;BP             
    .global _main
    
    .section *,address(0x0810),data,near ;no padding, store as initialized data in near memory
    .global array
    .align 2
array:	.word	0x0123,0x0473,0x0638,0x0101,0x0011,0x0992,0x0377,0x0093,0x0993,0x0999

    .text
_main:    
    mov #0x0810, w1 ;adress checking
    mov 0x0810, w2 ;current lowest
    mov #0x0822, w3 ;last address
    
loop1:
    cp w1, w3
    bra GE, end
    cp w2, [++w1]
    bra GT, loop2
    goto loop1
    
loop2:
    mov [w1], w2
    goto loop1
end:
    mov w2, 0x0800
    .end