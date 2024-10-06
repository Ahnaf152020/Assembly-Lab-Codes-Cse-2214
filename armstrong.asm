.model small
.stack 100h
.data
    number dw 15 ; Change this number to test other numbers
    result dw 0
    temp dw 0
    digit dw 0
    sum dw 0
    power dw 0
    count dw 0
    ten dw 10
    msg db 'The number is an Armstrong number.$'
    msg2 db 'The number is not an Armstrong number.$'

.code
main proc
    mov ax, @data
    mov ds, ax
    mov es, ax

    ; Initialize variables
    mov ax, number
    mov temp, ax
    mov count, 0

    ; Count the number of digits
count_digits:
    cmp temp, 0
    je calculate_armstrong
    inc count
    mov ax, temp
    xor dx, dx
    div ten
    mov temp, ax
    jmp count_digits

calculate_armstrong:
    mov ax, number
    mov temp, ax
    mov sum, 0

calculate_loop:
    cmp temp, 0
    je check_result
    mov ax, temp
    xor dx, dx
    div ten
    mov digit, dx
    mov cx, count
    mov ax, 1
    mov bx, digit

power_loop:
    cmp cx, 0
    je add_to_sum
    mul bx
    dec cx
    jmp power_loop

add_to_sum:
    add sum, ax
    mov ax, temp
    xor dx, dx
    div ten
    mov temp, ax
    jmp calculate_loop

check_result:
    mov ax, sum
    cmp ax, number
    je armstrong
    jmp not_armstrong

armstrong:
    lea dx, msg
    mov ah, 09h
    int 21h
    jmp end_program

not_armstrong:
    lea dx, msg2
    mov ah, 09h
    int 21h

end_program:
    mov ah, 4Ch
    int 21h

main endp
end main
