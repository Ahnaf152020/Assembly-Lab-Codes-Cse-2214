include 'emu8086.inc'

.model small
.stack 100h

.data
  
msg1 db 'Enter Number:$'
msg2 db 'Number is even:$' 
msg3 db 'Number is odd:$'
 

  
.code


main proc 
    
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,1
    int 21h
    
    mov bl,2
    div bl
    cmp ah,0
    je even
    jne noteven
    
    noteven:
    mov ah,9
    lea dx,msg3
    int 21h 
    jmp exit 
    
    
    
    even:
    mov ah,9
    lea dx,msg2
    int 21h
     jmp exit
    
    
    
    
    
  exit:
  mov ah,4ch
  int 21h  
    
    
end main    