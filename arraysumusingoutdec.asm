.model small
.stack 100h

.data
arr db 1,2,3,4,6  ; Array of bytes
sum dw ?          ; Word to store the sum

.code
main proc
    mov ax, @data
    mov ds, ax

    mov si, offset arr  ; Point SI to the array
    mov cx, 5           ; Loop counter for 5 elements
    mov sum, 0          ; Initialize sum to 0

loopx:
    mov bl, [si]        ; Load byte from array into BL
    add sum, bx         ; Add value of BL (extends to BX)
    inc si              ; Increment SI to point to the next byte
    loop loopx          ; Repeat until CX is zero

    mov ax, sum         ; Move the sum into AX to print
    call OUTDEC         ; Call procedure to print the decimal value

    exit:
    mov ah, 4ch
    int 21h
main endp

; Procedure to print a signed decimal integer in AX
OUTDEC PROC
    push ax
    push bx
    push cx
    push dx

    ; If AX < 0, print the '-' sign
    or ax, ax
    jge END_IF1
    push ax
    mov dl, '-'
    mov ah, 2
    int 21h
    pop ax
    neg ax
END_IF1:

    ; Get decimal digits
    xor cx, cx
    mov bx, 10
REPEAT1:
    xor dx, dx
    div bx
    push dx
    inc cx
    or ax, ax
    jne REPEAT1

    ; Convert digits to characters and print
    mov ah, 2
PRINT_LOOP:
    pop dx
    or dl, 30h
    int 21h
    loop PRINT_LOOP

    ; Restore registers
    pop dx
    pop cx
    pop bx
    pop ax
    ret
OUTDEC ENDP

end main
