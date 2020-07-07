        .equ __P24FJ64GA002,1        ;required "boiler-plate" (BP)
        .include "p24Fxxxx.inc"      ;BP

#include "xc.inc"                    ;BP
        ;the next two lines set up the actual chip for operation - required
        config __CONFIG2, POSCMOD_EC & I2C1SEL_SEC & IOL1WAY_OFF & OSCIOFNC_ON & FCKSM_CSECME & FNOSC_FRC & SOSCSEL_LPSOSC & WUTSEL_FST & IESO_OFF
        config __CONFIG1, WDTPS_PS1 & FWPSA_PR32 & WINDIS_OFF & FWDTEN_OFF & COE_ON & BKBUG_ON & GWRP_ON & GCP_ON & JTAGEN_OFF

    .align   2                  ;need this so that we have the next word at even address

;;stack:
;;    .space  32                  ;this will be our stack area, from var_16_bit to here
    .text                       ;BP (put the following data in ROM(program memory))
    .global _main               ;BP
	.bss
    outputval:	space	4 ;declare variables with 16 bit word lengths
    a:	space	4
    b:	space	4
    c:	space	4
;because we are using the C compiler to assemble our code, we need a "_main" label
;somewhere. (There's a link step that looks for it.)
_main:
    mov #-1,outputval
    mov #101,a
    mov #2,b
    mov #62,c
    add a,b,w4
    cp c,w4
    bra GT atest
    bra fail
atest:
    cp a,#100
    bra GEU, good
    bra fail
fail:
    mov outputval,#0
good:
    mov outputval,#1
    .end    


