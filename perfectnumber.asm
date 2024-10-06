.model small
.stack 100h

.data
    number dw 6               ; Number to test, change to other numbers
    sum dw 0                  ; Sum of proper divisors
    i dw 1                    ; Loop counter
    half dw ?                 ; Half of the number
    msg_perfect db 'The number is a Perfect number.$'
    msg_not_perfect db 'The number is not a Perfect number.$'

.code
main proc
    ; Initialize Data Segment
    mov ax, @data
    mov ds, ax
    mov es, ax                ; Not necessary here, but included for consistency

    ; Calculate half = number / 2
    mov ax, number
    mov bx, 2
    xor dx, dx                ; Clear DX before division
    div bx                    ; AX = number / 2, DX = number mod 2
    mov half, ax              ; Store half in 'half'

    ; Initialize sum to 0 and i to 1
    mov sum, 0
    mov i, 1

check_loop:
    ; Check if i > half
    mov ax, i
    cmp ax, half
    jg finish_loop            ; If i > half, exit loop

    ; Check if number is divisible by i
    mov ax, number
    xor dx, dx                ; Clear DX before division
    mov bx, i
    div bx                    ; AX = number / i, DX = number mod i

    cmp dx, 0                 ; If remainder is 0, i is a divisor
    jne skip_add              ; If not, skip adding to sum

    ; Add i to sum
    mov ax, sum
    add ax, i                 ; sum += i
    mov sum, ax

skip_add:
    ; Increment i
    inc word ptr i
    jmp check_loop            ; Repeat the loop

finish_loop:
    ; Compare sum with the original number
    mov ax, sum
    cmp ax, number
    je perfect_label          ; If equal, it's a Perfect number

    jmp not_perfect_label     ; Otherwise, it's not

perfect_label:
    ; Display "The number is a Perfect number."
    lea dx, msg_perfect
    mov ah, 09h
    int 21h
    jmp exit_program

not_perfect_label:
    ; Display "The number is not a Perfect number."
    lea dx, msg_not_perfect
    mov ah, 09h
    int 21h

exit_program:
    ; Terminate the program
    mov ah, 4Ch
    int 21h

main endp
end main
