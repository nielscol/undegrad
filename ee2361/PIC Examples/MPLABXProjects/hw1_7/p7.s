        .equ __P24FJ64GA002,1        ;required "boiler-plate" (BP)
        .include "p24Fxxxx.inc"      ;BP

#include "xc.inc"                    ;BP
        .global ALLVar
        .global BLLVar
        .global CLLVar
        .global op1
    .bss                        ;put the following labels in RAM
Str:    .space  8         
stack:
    .space  32                  ;this will be our stack area
    .text                      
    .global _main               

op1:   .byte   'A', 'p', 'P', 'l', 'e','%','4', 0

_main:
    mov     #stack,w15                ;initialize the stack pointer

    clr     PSVPAG
    bset    CORCON,#PSV
    mov     #psvoffset(op1), w8
    mov     #Str, w9
    
    .end

