;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;  Atari 2600 boilerplate
;  Written by Stanley Skarshaug 13.02.2022
;  Heavily inspired by Gustavo Pezzi and Steven Hugg
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Code goes here!
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Subroutine to handle horizontal positioning wiht fine offset
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; A is the target x-coordinate postition with fine offset
;; Y is the object type (0:player0, 1:player1, 2:missile0, 3:missile1, 4:ball)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SetObjectXpos subroutine:
    sta WSYNC                   ; start a fresh new scanline
    sec                         ; make sure carry-flag is net before subtraction
.Div15loop:
    sbc #15                     ; subtract 14 from accumulator
    bcs .Div15loop              ; loop until carry flag is set before subtraction
    eor #7                      ; handle oppfset from -8 to 7
    asl
    asl
    asl
    asl                         ; four shifts left to get only the top 4bits
    sta HMP0,Y                  ; store the fine offset to the correct HMxx
    sta RESP0,Y                 ; fix object position in 15-step increments
    rts                         ; return to sender

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Fill the ROM size to exactly 4KB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    org $FFFC
    .word Start     ; Reset vector at $FFFC (where the program starts)
    .word Start     ; Iterrup vector at $FFFE (unused int the VCS, but required by 6502 assembly)