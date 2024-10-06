.model small
.stack 100h

.data
 
 array db 1,1,1,2,3
 sum dw ?
.code

main proc
    
   mov ax,@data
   mov ds,ax
   
   mov si,offset array
   
   mov cx,5
   mov bx,0
   loop1:
  
  add bx,[si]
  inc si
  mov sum,bx
  
  loop loop1
  
  mov ah,2
  mov dx,sum
  add dx,48
  int 21h   
    
    
    
   exit:
   mov ah,4ch
   int 21h 
    
    
 end main   