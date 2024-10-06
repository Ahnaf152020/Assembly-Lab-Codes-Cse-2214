/////////////////////////////////////////////////largest value in array
include 'emu8086.inc'
.model small
.data
    arr db 8,5,3,6,2,9
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov si, offset arr
    mov cx,6
    mov bl,[si]
    
loop_A:
    cmp [si],bl
    jge update
resume:
    inc si
    loop loop_A
    jmp printing
update:
    mov bl,[si]
    jmp resume
printing:
    print "the largest value is: "
    mov ah,2
    mov dl,bl
    add dl,48
    int 21h

main endp
ret
/////////////////////////////////////////sum of elements of an array
include 'emu8086.inc'
.model small
.data
    arr db 1,1,1,1,1,1
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov si, offset arr
    mov cx,6
    xor ah,ah
    mov ax,[si]
sum:
    inc si
    add ax,[si]
    loop sum
print "the sum is: "
    mov ah,2
    mov dx,ax
    add dx,48
    int 21h
   
    MOV AH,4CH 
    INT 21H
    MAIN ENDP

END MAIN