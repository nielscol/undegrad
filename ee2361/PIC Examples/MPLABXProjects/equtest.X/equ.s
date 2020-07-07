        .equ __P24FJ64GA002,1        ;required "boiler-plate" (BP)
        .include "p24Fxxxx.inc"      ;BP

#include "xc.inc"                    ;BP             
    .global _main
    
    .section *,address(0x800),data,near ;no padding, store as initialized data in near memory
    .global outputVar
    .align 2
outputVar:  .word    0xFFFF ;variable "outputVar" set to -1, address 0x0800
    .equ    a,	#0x0064
    .equ    b,	#0x0003
    .equ    c,	#0x0095

    .text
_main:
    clr w0  
    add a, WREG ;add a
    add b, WREG ;add b (w0 = a+b)
    cp c ;compare c to a+b
    bra GT, pass ;if c GT than a+, goto pass
    goto fail	;else goto fail
    
pass:
    mov #100, w0
    cp a	;compare a to 100
    bra LT, fail    ;if a <100, goto fail
    mov #1, w0	
    mov w0, outputVar	;both conditions true, writes 1 to outputVar
    goto end
    
fail:
    mov #0, w0
    mov w0, outputVar	;both conditions false, writes 0 to outputVar
end:
    .end