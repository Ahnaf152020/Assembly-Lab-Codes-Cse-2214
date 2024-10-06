include 'emu8086.inc'
.model small
.stack 100h


.data
 n dw 4
.code


main proc
    
   mov ax,@data
   mov ds,ax
   
   
   mov ax,n
   mov cx,n
   dec cx
   
   fact:
   dec n
   mul n
   dec cx
   jnz fact
   
  ; add ax,48
   mov dx,ax
   mov ah,2
   int 21h
   
   
   
   exit:
   mov ah,4ch
   int 21h
end main