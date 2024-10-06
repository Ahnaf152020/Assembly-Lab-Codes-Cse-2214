;printing fibonacci series
.model small
.stack 100h
.data   
n db 0
tmp db 0 
x dw ?
y dw ?
z dw ?
a dw 10    ;to divide by 10  
cnt db 0
.code
main proc 
    
    mov ax,@data
    mov ds,ax
    
    ;multi_digit input
    input:
    mov ah,1
    int 21h   
    cmp al,0dh
    je end_input
    sub al,48
    mov tmp,al
    mov ah,0
    mov al,n
    mul a
    add al,tmp
    mov n,al
    jmp input
    
    end_input:
    
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
    mov cl,0
    mov x,0
    mov y,1 
    
    ;printing first term
    mov dl,'0'
    int 21h
    mov dl,' '
    int 21h
    inc cl
    
    cmp n,1
    je exit
   
    ;printing second term
    mov dl,'1'
    int 21h 
    mov dl,' '
    int 21h
    inc cl
    
    cmp n,2 
    je exit
    
    ;printing if more than one term exists
    series_loop:
    inc cl
    cmp cl,n
    jg exit
    
    mov bx,x
    mov z,bx
    mov bx,y
    add z,bx 
    
    mov dx,0 ;dx=0 
    mov ax,z ;ax=z   
    mov cnt,0
    
    while: 
    cmp ax,0
    je stack_pop
    
    div a ;dx:ax/a; a=10
    push dx ;dx has remainder
    inc cnt  
    mov dx,0
    jmp while
    
    stack_pop:
    cmp cnt,0
    je end_pop
    pop dx
    mov ah,2
    add dl,48
    int 21h
    dec cnt
    jmp stack_pop
    
    end_pop:
    mov dl,' '
    int 21h  
    mov bx,y
    mov x,bx
    mov bx,z
    mov y,bx
    jmp series_loop 
    
    
    exit:
    
    main endp
end main