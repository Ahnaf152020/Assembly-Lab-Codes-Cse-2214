.MODEL SMALL
.STACK 100H
.DATA

MSG DB 3
MSG1 DB ?

.CODE


MAIN PROC
    
    ;INITIALIZE DATA SEGMENT
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,2
    ADD MSG,48
    MOV DL,MSG 
    INT 21H 
    
    ;INPUT
    MOV AH,1
    INT 21H
    MOV MSG1,AL; AL E SHB MAAN SET THAKE
    
    ; NEW LINE
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    ; SHOW MSSG
    
    MOV AH,2
    MOV DL,MSG1
    INT 21H   
    
    
    ;EXIT
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
    
    
    
    
    
    
    
    
    
    
END MAIN    