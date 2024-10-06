.model small
.stack 100h



.data

msg1 db 'enter first number:$'
msg2 db 10,13,'enter second number:$'

msg3 db 10,13,'the largest number:$'
msg4 db 10,13,'the smallest number:$'



.code



main proc
    
  mov ax,@data
  mov ds,ax
  
  
  mov ah,9
  lea dx,msg1
  int 21h
  
  mov ah,1
  int 21h
  
  sub al,48
  mov bl,al
  
    
   mov ah,9
  lea dx,msg2
  int 21h
  
  mov ah,1
  int 21h
  
  sub al,48
  mov bh,al
  
  cmp bh,bl
  
  jg bh_larger
  
  jl bl_larger
  
  
  bh_larger:
    
     mov ah,9
  lea dx,msg3
  int 21h
  
 mov ah,2
 mov dl,bh
 add dl,48
 int 21h 
 
 
  mov ah,9
  lea dx,msg4
  int 21h
  
 mov ah,2
 mov dl,bl
 add dl,48
 int 21h
 
   jmp exit
   
  bl_larger:
    
     mov ah,9
  lea dx,msg3
  int 21h
  
 mov ah,2
 mov dl,bl
 add dl,48
 int 21h     

   
   mov ah,9
  lea dx,msg4
  int 21h
  
 mov ah,2
 mov dl,bh
 add dl,48
 int 21h
    
 exit:
 mov ah,4ch
 int 21h   
    
 end main   