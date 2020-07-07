        .equ __P24FJ64GA002,1        ;required "boiler-plate" (BP)
        .include "p24Fxxxx.inc"      ;BP

#include "xc.inc"                    ;BP             
    .global _main
    
    .section *,address(0x800),data,near ;no padding, store as initialized data in near memory
    .global outputVar
    .align 2
outputVar:  .word    0xFFFF ;variable "outputVar" set to -1, address 0x0800
a:  .word   0x0065
b:  .word   0x0004
c:  .word   0x0096
  
    .equ d, 0x0802
    .equ e, 0x0804
    .equ f, 0x0806

    .text
_main:
    clr w0  
    add d, WREG ;add a
    add e, WREG ;add b (w0 = a+b)
    cp f ;compare c to a+b
    bra GT, pass ;if c GT than a+, goto pass
    goto fail	;else goto fail
    
pass:
    mov #100, w0
    cp 0x802	;compare a to 100
    bra LT, fail    ;if a <100, goto fail
    mov #1, w0	
    mov w0, outputVar	;both conditions true, writes 1 to outputVar
    goto end
    
fail:
    mov #0, w0
    mov w0, outputVar	;both conditions false, writes 0 to outputVar
end:
    .end