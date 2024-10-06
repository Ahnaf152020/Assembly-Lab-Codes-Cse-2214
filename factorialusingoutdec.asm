.model small
.stack 100h

.data
  n dw 6
.code


main proc
    
    
  mov ax,@data
  mov ds,ax
  
  mov ax,n
  mov cx,n
  dec cx
  
  fact:
  dec n  ;6 5 4 3 2 1
  mul n  ; 6 5 4 
  dec cx
  
  jnz fact
  
  mov dx,ax
  call OUTDEC 
  
  
    
    
    
    
    
    
  exit:
  mov ah,4ch
  int 21h 
  
  OUTDEC PROC
    ;prints AX as a signed decimal integer
    ;input: AX 
    ;output: none
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    ;if AX<0
    OR AX,AX
    JGE END_IF1
    ;then
    PUSH AX
    MOV DL,'-'
    MOV AH,2
    INT 21H
    POP AX
    NEG AX
    END_IF1:
    ;get decimal digits
    XOR CX,CX
    MOV BX,10D
    REPEAT1:
    XOR DX,DX
    DIV BX 
    PUSH DX
    INC CX
    ;until
    OR AX,AX
    JNE REPEAT1
    ;convert digits to characters and print
    MOV AH,2
    ;for count times do
    PRINT_LOOP: 
    POP DX
    OR DL,30H 
    INT 21H
    LOOP PRINT_LOOP
    ;end_for
    POP DX 
    POP CX
    POP BX
    POP AX
    RET
    OUTDEC ENDP  
    
 end main   