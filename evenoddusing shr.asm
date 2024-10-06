.MODEL SMALL
.STACK 100H
.DATA
    NUM DB 24     ; Example number (you can change it to any number)
    MSG_EVEN DB 'The number is even$'
    MSG_ODD DB 'The number is odd$'

.CODE
MAIN PROC
    MOV AX, @DATA      ; Initialize data segment
    MOV DS, AX

    MOV AL, NUM        ; Load the number into AL register
    MOV AH, 00H        ; Clear AH for any possible garbage

    SHR AL, 1          ; Shift right AL by 1 bit (divides by 2 and keeps remainder in CF)
    JNC EVEN           ; If Carry Flag (CF) is not set, jump to EVEN

    ; If CF is set, number is odd
    MOV DX, OFFSET MSG_ODD
    JMP DISPLAY_MSG

EVEN:
    ; If CF is not set, number is even
    MOV DX, OFFSET MSG_EVEN

DISPLAY_MSG:
    MOV AH, 09H        ; DOS service to print a string
    INT 21H            ; Call interrupt

    MOV AH, 4CH        ; DOS interrupt to exit
    INT 21H

MAIN ENDP
END MAIN
