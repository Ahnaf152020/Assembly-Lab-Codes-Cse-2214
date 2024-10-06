.model small
.stack 100h


.data
 arr db 1,2,3,4,5
 msg1 db 'the key is found$'
 msg2 db 'the key is not found$'
 
 key db 3

.code



main proc
    
    
 mov ax,@data
 mov ds,ax
 
 mov si,offset arr
 mov cx,5
 mov al,key
 
 
 loop1:
 mov bl,[si]
 cmp al,bl
 jz found
 inc si
 loop loop1 
 
  mov ah,9
 lea dx,msg2
 int 21h
 
 found:
 mov ah,9
 lea dx,msg1
 int 21h
 
     
    
    
    
end main    