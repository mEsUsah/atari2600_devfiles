;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;  Atari 2600 boilerplate
;  Written by Stanley Skarshaug 09.01.2022
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    processor 6502
    include "vcs.h"
    include "macro.h"

    seg code
    org $F000       ; Define the code origin at $F000

Start:
    sei             ; Disable iterrupts
    cld             ; Disable BCD decimal math math mode
    ldx #$FF        ; Load the X register with #$FF. NB. literally load $FF into the register!
    txs             ; Transfer the X register to the Stack pointer register

    CLEAN_START     ; Macro to safely clear the memory 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Code goes here!
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Fill the ROM size to exactly 4KB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    org $FFFC
    .word Start     ; Reset vector at $FFFC (where the program starts)
    .word Start     ; Iterrup vector at $FFFE (unused int the VCS, but required by 6502 assembly)