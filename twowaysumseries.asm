include 'emu8086.inc'
.model small
.stack 100h



.data
 
msg db 'the sum of the series:$'
 sum dw ?
.code


main proc
   mov ax,@data
   mov ds,ax
   
  mov cx,10
  mov sum,0
 ; mov ax,1;1+2+3....+10 
 
 ; 100+90....10
 
 mov ax,100
  loopx:
  add sum,ax
  sub ax,10
 
  loop loopx
             
             
   mov ah,9
   lea dx,msg
   int 21h          
   mov ax,sum
   
   call OUTDEC 
   
   
   
   
    
    
    
    
    
 exit:
 mov ah,4ch
 int 21h 
 
 OUTDEC PROC
    ;prints AX as a signed decimal integer
    ;input: AX 
    ;output: none 
    
    ;saving values of AX-DX as they will be changed during operations
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    ;if AX<0 [i.e. negative number]
    OR AX,AX    
    JGE END_IF1
    ;then
    PUSH AX  ;to conserve the value of AX
    MOV DL,'-'
    MOV AH,2
    INT 21H
    POP AX   ;to restore the value of AX
    NEG AX   ;to get absolute value  -(-AX) = AX
    
    
    END_IF1:
    ;get decimal digits
    XOR CX,CX
    MOV BX,10D
    REPEAT1:
    XOR DX,DX
    DIV BX   ;AX/10
    PUSH DX  ;remainder (i.e. digit in LSB position)
    INC CX   ;to keep count of number of digits
    
    ;until value becomes 0
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
    
    ;restoring values of AX-DX
    POP DX 
    POP CX
    POP BX
    POP AX
    
    RET
    OUTDEC ENDP   
    
end main    