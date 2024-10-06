                                               .data 
arr dw  6,1,9,3,4
n db 4
.code 
main proc 
    
    mov ax,@data
    mov ds,ax 
    
    xor cx,cx
    mov cl,n
    inc cx 
    lea si,arr
    
    ;print
    print:
    mov bx,[si]
    mov ah,2
    mov dl,bl
    add dl,48
    int 21h
    mov dl,' '
    int 21h
    add si,2
    loop print
    
    ;newline
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
    ;bubble sort (descending order)
    
    mov ch,0
    
    outer:    
    inc ch
    cmp ch,n
    jg exit 
    
    mov cl,0 
    lea si,arr
    
    inner:
    inc cl
    cmp cl,n
    jg outer
    mov ax,[si]
    mov bx,[si+2]   
    
    cmp ax,bx
    jl swap
    
    add si,2
    jmp inner
    
    swap:
    xchg ax,bx  
    mov [si],ax
    mov [si+2],bx   
    add si,2
    jmp inner
    
    
    exit:  
    
    lea si,arr 
    xor cx,cx
    mov cl,n
    inc cx
    
     ;print
    print2:
    mov bx,[si]
    mov ah,2
    mov dl,bl
    add dl,48
    int 21h
    mov dl,' '
    int 21h    
    add si,2
    loop print2   
    
    
    
    
    ;newline
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
    ;bubble sort (ascending order)
    
    mov ch,0
    
    outer2:    
    inc ch
    cmp ch,n
    jg exit2 
    
    mov cl,0 
    lea si,arr
    
    inner2:
    inc cl
    cmp cl,n
    jg outer2
    mov ax,[si]
    mov bx,[si+2]   
    
    cmp ax,bx
    jg swap2
    
    add si,2
    jmp inner2
    
    swap2:
    xchg ax,bx  
    mov [si],ax
    mov [si+2],bx   
    add si,2
    jmp inner2
    
        
    exit2:  
    
    lea si,arr 
    xor cx,cx
    mov cx,5
    
     ;print
    print3:
    mov bx,[si]
    mov ah,2
    mov dl,bl
    add dl,48
    int 21h
    mov dl,' '
    int 21h    
    add si,2
    loop print3
    
    
    main endp
end main