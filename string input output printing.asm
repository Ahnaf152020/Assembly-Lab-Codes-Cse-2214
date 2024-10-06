.MODEL SMALL 
.STACK 
.DATA 
STRING DB 80 DUP (0) 
CRLF DB 0DH,0AH,'$' 

.CODE 
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX
    ;read a string
    LEA DI,STRING
    CALL READ_STR
    ;go to a new line
    LEA DX,CRLF
    MOV AH,9
    INT 21H
    ;print string
    LEA SI,STRING
    MOV BX,10
    CALL DISP_STR
    ;dos exit
    MOV AH,4CH
    INT 21H
    MAIN ENDP
;INCLUDE PGM11_1.ASM
;INCLUDE PGM11_2.ASM 

DISP_STR PROC NEAR
;displays a string
;input:SI=offset of string and BX= numbers of characters to display
;output:none
PUSH AX
PUSH BX
PUSH CX
PUSH DX
PUSH SI
MOV CX,BX
JCXZ P_EXIT
CLD
MOV AH,2
TOP:
LODSB
MOV DL,AL
INT 21H
LOOP TOP
P_EXIT:
POP SI
POP DX
POP CX
POP BX
POP AX
RET
DISP_STR ENDP 

READ_STR PROC NEAR
    ;Reads and stores a string
    ;input:DI offset of string
    ;output:DI offset of string
    ;BX number of characters read
    PUSH AX
    PUSH DI
    CLD
    XOR BX,BX
    MOV AH,1
    INT 21H
    WHILE1:
    CMP AL,0DH
    JE END_WHILE1
    ;if character is backspace
    CMP AL,8H
    JNE ELSE1
    ;then
    DEC DI
    DEC BX
    JMP READ
    ELSE1:
    STOSB
    INC BX
    READ:
    INT 21H
    JMP WHILE1
    END_WHILE1:
    POP DI
    POP AX
    RET
    READ_STR ENDP 
END MAIN