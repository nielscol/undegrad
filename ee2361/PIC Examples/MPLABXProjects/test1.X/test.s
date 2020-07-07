        .equ __P24FJ64GA002,1        ;required "boiler-plate" (BP)
        .include "p24Fxxxx.inc"      ;BP

#include "xc.inc"                    ;BP             
    .global _main
    .text
_main:
    mov #-10, w0
    
loop1:
    .end

