 include 'emu8086.inc'
 
 .model small
 .stack 100h
 
.data
                       
 msg1 db 'Enter a number:$'


                       
   
     
.code


main proc
    
    
  mov ax,@data
  mov ds,ax
  
   mov ah,9
   lea dx,msg1
   int 21h
   
   mov ah,1
   int 21h
  
   mov bl,al 
   
   mov cl,30h
   cmp bl,cl
   
   jg positive
   
   jl negative
   je zero
   
   positive:
   printn ' It is a positive number'
   jmp exit
   
   negative:
   printn 'The number is a negative number'
   jmp exit
   
    zero:
   printn 'The number is equal to zeror'
   jmp exit
   
  exit:
  mov ah,4ch
  int 21h  
    
    
 end main    