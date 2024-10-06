.model small
.stack 100h

.data


  msg1 db 'Enter Two Digit Number:$'
  num1 db ?
  
  



.code



main proc
   
   mov ax,@data
   mov ds,ax
   
   mov ah,9
   lea dx,msg1
   int 21h
   
   mov ah,1
   int 21h
   
   cmp al,09
   jbe number
   
   number:
   mov cl,04
   rol al,cl
   mov ah,1
   int 21h 
 
    
    
 end main   