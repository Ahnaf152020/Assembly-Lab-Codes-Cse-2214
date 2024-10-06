
.model small

.stack 100h


.data
 
 str db 'ahnaf amer'
 
 msg1 db 10,13,'the capital letter string:$'
 


.code


main proc
    
    
 mov ax,@data
 mov ds,ax
 
 mov si,offset str
 mov cx,10 
 
 
 mov ah,9
 lea dx,msg1
 int 21h
 
 
 loop1:
 mov bl,[si]
 
 mov ah,2
 sub bl,32
 mov dl,bl
 int 21h
  
  
  inc si
  loop loop1
    
    
    
    
    
    
end main    