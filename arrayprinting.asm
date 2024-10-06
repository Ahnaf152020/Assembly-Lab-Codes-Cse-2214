include 'emu8086.inc'

.model small
.stack 100h


.data
  array db 3,5,8,7,9,1
.code



main proc
    
   mov ax,@data
   mov ds,ax
   
   
   mov si,offset array
   
   mov cx,6
   
   print 'your values:'
   
   loopx:
   
   mov dl,[si]
   add dl,48
   mov ah,2
   int 21h
   
   mov dl,32
   mov ah,2
   int 21h
   inc si
   
   loop loopx 
    
    
   exit:
   mov ah,4ch
   int 21h 
    
    
end main    