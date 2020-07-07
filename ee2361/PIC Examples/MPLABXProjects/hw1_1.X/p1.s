        .equ __P24FJ64GA002,1        ;required "boiler-plate" (BP)
        .include "p24Fxxxx.inc"      ;BP

#include "xc.inc"                    ;BP             
    .global _main
    
    .section *,address(0x800),data,near ;no padding, store as initialized data in near memory
    .global outputVar
    .global _a
    .global _b	;using _ prefix because a/b operands reserved for acca/accb registers for ADD
    .global _c
    .align 2
outputVar:  .word    0xFFFF ;variable "outputVar" set to -1, address 0x0800
_a:  .word   99 
_b:  .word   2 
_c:  .word   50

    .text
_main:
    mov _a, WREG
    add _b, WREG    ;add b to w0 (a)
    cp _c   ;compare c to a+b
    bra GT, pass    ;if c GT than a, goto pass
    goto fail	;else goto fail
pass:
    mov #100, w0
    cp _a	;compare a to 100
    bra LT, fail    ;if a <100, goto fail
    mov #1, w0	
    mov w0, outputVar	;both conditions true, writes 1 to outputVar
    goto end
    
fail:
    mov #0, w0
    mov w0, outputVar	;both conditions false, writes 0 to outputVar
end:
    .end