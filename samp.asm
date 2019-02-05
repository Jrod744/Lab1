;---------------------------------------------
; Real-Time Embedded System Programming
; Lab 1: 3-bit number addition and subtraction
; Jared Bloomfield & Alex Tilot
;---------------------------------------------

            include "P16F877A.inc"
            LIST P=16F877A, R=DEC
            
            ; XT (slow) Oscillator, Watchdog disabled, other config bits off
            __config _XT_OSC & _WDT_OFF & _CP_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF

;-------------------------------
; Constants
;-------------------------------
MAX_SIZE    EQU     10               

;-------------------------------
; Variables
;-------------------------------
X           EQU     32                    ; first available RAM location, in decimal
y           EQU     33
OPCODE      EQU     34
RESULT      EQU     35              

                
            ; Set the I/O directions for port pins
            ; will get "messages" to "ensure bank bits okay"
            clrf    PORTB                 ; 
            clrf    PORTC                 ; 
            clrf    PORTD                 ; Clear output data latches
            bsf     STATUS, RP0           ; Switch bank to bank 1
            bcf     OPTION_REG, NOT_RBPU  ; weak pull-ups on Port B
            movlw   B'0011111'           ; 1=input, 0=output
            movwf   TRISB                 ; Set PORTB directions
            ; Do something similar for Ports C and D
            movlw B'00010000'
            movwf TRISC                   ; Set PORTC directions
            movlw B'01110000'
            movwf TRISD                   ; Set PORTD directions
            bcf     STATUS, RP0           ; switch back to bank 0

;------------------------
;
;------------------------
main_method:
            movlw PORTB   
            movwf X
            movlw B'00000111'             
            andwf X, 1                     

            movlw PORTB
            movwf Y
            movlw B'00111000'
            andwf Y, 1
            bcf STATUS, C       ; Clear the carry flag
            rlf Y, 1
            swapf Y, 1
            ;TODO Set Y as B'00000XXX'
            

            END                           ; don't forget the end!
;-----------------------------------------------------
; add_func will add two 3-bit from variables X and Y
; and store the result in PORTD 6-5-4
;-----------------------------------------------------
add_func:
            RETURN

;---------------------------------------------------
; sub_func will subtract the 3-bit variable X from 
; the 3-bit variable Y and store the result in PORTD 6-5-4
;---------------------------------------------------
sub_func:
            RETURN
			

