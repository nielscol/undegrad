        .equ __P24FJ64GA002,1        ;required "boiler-plate" (BP)
        .include "p24Fxxxx.inc"      ;BP

#include "xc.inc"                    ;BP             
    .global _main
    
    .section *,address(0x800),data,near ;no padding, store as initialized data in near memory
    .global var1
    .global var2
    .align 2
var1:	.word	0x5566,0x3344,0x1122 ;0x0800-0x805
var2:	.word	0x5566,0x3344,0x1122 ;0x806-0x080B

    .text
_main:
    mov 0x0800, wreg	;lsw of var1
    add 0x0806, wreg	;add lsws of var1/var2
    mov w0, w10	    ;move lsw sum to w10
    
    mov 0x0802, wreg	;does same for middle words
    addc 0x0808, wreg
    mov w0, w11
    
    mov 0x0804,wreg	;does same for msw
    addc 0x080A, wreg
    mov w0, w12

    .end