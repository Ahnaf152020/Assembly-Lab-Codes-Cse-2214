.model small
.stack 100h

.data


msg1 db 10,13,'input first capital letter:$'
msg2 db 10,13,'input 2nd capital letter:$'
msg3 db 10,13,'letters in alphabetical order:$'
let2 db ?

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

    
 mov ax,@data
mov ds,ax

mov ah,9
lea dx,msg2
int 21h

mov ah,1
int 21h   
    
mov let2,al

 mov ah,9
lea dx,msg3
int 21h


cmp let2,bl
jg bigger
jl lesser



bigger:
mov ah,2
mov dl,bl
int 21h
mov dl,32
int 21h
mov dl,let2
int 21h

jmp exit

lesser:
mov ah,2
mov dl,let2
int 21h
mov dl,32
int 21h
mov dl,bl
int 21h

jmp exit  
    
exit:

mov ah,4ch
int 21h    
    
    
end main