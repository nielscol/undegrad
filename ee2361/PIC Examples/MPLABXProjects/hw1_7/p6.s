        .equ __P24FJ64GA002,1        ;required "boiler-plate" (BP)
        .include "p24Fxxxx.inc"      ;BP

#include "xc.inc"                    ;BP             
    .global _main
    
    .section *,address(0x0800),data,near ;no padding, store as initialized data in near memory
    .global array
    .align 2
numlist:    .word   0x3,0x2,0x3,0x4,0x5,0x6,0x7,0x8,0x9,0xA	;list of 10 words

    .text
_main:    
    mov #0x0800 w1 ;start address of data
    mov #0x0812 w2 ;end address of data 
    clr w3
    
    
main_loop:
    mov [w1], w0
    sub w0,[++w1],w0 ;subtract # from adress w1+1 from # at adress in w1
    btsc 0x0042, #3 ;bit test negative bit of SR
    neg w0,w0	    ;if negative, convert to positive value
    add w0,w3,w3    ;accumalte the differences
    cp w1,w2	    ;test if reached end of list
    bra GE end	    ;if so end
    goto main_loop  ;otherwise continue
    
end:
    .end
