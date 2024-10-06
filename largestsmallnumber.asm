include 'emu8086.inc'
.model small
.stack 100h

.data
    array db 2, 3, 8, 7, 9  ; Array of elements
    size  dw 5              ; Size of the array

.code
main proc
    mov ax, @data
    mov ds, ax

    mov si, offset array     ; SI points to the first element of the array
    mov cx, size             ; CX holds the size of the array

    ; Initialize smallest (bl) and largest (bh) with the first element
    mov bl, [si]             ; bl holds the smallest value (initially the first element)
    mov bh, [si]             ; bh holds the largest value (initially the first element)
    
    ; Move to the next element for comparison
    inc si                   ; SI now points to the second element
    dec cx                   ; Decrease CX by 1 as we already have the first element loaded

loopx:
    cmp [si], bl             ; Compare current element with bl (smallest)
    jge check_larger         ; If [si] >= bl, skip to check for larger
    
    ; Update bl with new smallest value
    mov bl, [si]

check_larger:
    cmp [si], bh             ; Compare current element with bh (largest)
    jle skip_larger          ; If [si] <= bh, skip updating bh
    
    ; Update bh with new largest value
    mov bh, [si]

skip_larger:
    inc si                   ; Move to the next element
    loop loopx               ; Repeat until all elements are processed

    ; Print the smallest value
    printn 'Smallest value in the array: '
    add bl, 48               ; Convert smallest value (bl) to ASCII
    mov dl, bl               ; Load it in DL for printing
    mov ah, 2
    int 21h

    ; Print the largest value
    printn 'Largest value in the array: '
    add bh, 48               ; Convert largest value (bh) to ASCII
    mov dl, bh               ; Load it in DL for printing
    mov ah, 2
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h

main endp
end main
