;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------

			; Store values
            mov.w #02223, R4
            mov.w #00010, R5
            mov.w #00001, R6

            ; Ands
            and R6, R4
            and R6, R5

			; Compare

			cmp R4, R6
			jeq R4isEqualR6 ;jump to label 1
			jne R4isNotEqualR6 ;

			jmp $

R4isEqualR6: ; First jump
			cmp R5, R6
			jeq R5isEqualR6 ;jump to label 2
			jne complement
			jmp $

R4isNotEqualR6:
			cmp R5, R6
			jeq complement
			jmp $

R5isEqualR6:
			mov.w #0ff0h, R9
			jmp $

complement:
			 mov.w R9, R10
			 mov.w #FFFFFFFF, R8
			 xor R10, R8
			 jmp $
;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
            
