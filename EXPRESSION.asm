.MODEL SMALL
.STACK 100h

.DATA
    a dw 5
    b dw 4
    c dw 6
    d dw 8
    result dw ?

.CODE

main proc
    
    mov ax,@data
    mov ds,ax
    
    ; Compute (a+b)
    mov ax,a
    add ax,b
    mov bx,ax    ; BX = a + b
    
    ; Compute (b+c)
    mov ax,b
    add ax,c
    mul bx       ; AX = (a+b)(b+c)
    mov bx,ax    ; BX = (a+b)(b+c)
    
    ; Compute (c+d)
    mov ax,c
    add ax,d
    mul bx       ; AX = (a+b)(b+c)(c+d)
    
    ; Compute (a+b+c+d)
    mov cx,a
    add cx,b
    add cx,c
    add cx,d     ; CX = (a+b+c+d)
    
    ; Perform the division
    div cx       ; AX = (a+b)(b+c)(c+d) / (a+b+c+d)
    
    ; Store the result
    mov result, ax
    mov dx, result
    
    ; Call OUTDEC to print the result
    ;push dx
    call OUTDEC
    ;pop dx

    ; Exit program
    exit:
    mov ah,4ch
    int 21h

OUTDEC PROC
    ; Prints AX as a signed decimal integer
    ; Input: AX
    ; Output: none
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX

    ; Check if AX < 0 (signed number)
    OR AX, AX
    JGE END_IF1
    ; If AX is negative, print '-'
    PUSH AX
    MOV DL, '-'
    MOV AH, 2
    INT 21H
    POP AX
    NEG AX       ; Make AX positive for further processing
END_IF1:
    
    ; Get decimal digits
    XOR CX, CX
    MOV BX, 10D
REPEAT1:
    XOR DX, DX   ; Clear DX before division
    DIV BX       ; Divide AX by 10
    PUSH DX      ; Store remainder (digit)
    INC CX       ; Increment count of digits
    OR AX, AX
    JNE REPEAT1  ; Repeat until AX becomes zero

    ; Print the digits
    MOV AH, 2
PRINT_LOOP: 
    POP DX       ; Get the digits in reverse order
    OR DL, 30H   ; Convert to ASCII
    INT 21H      ; Print the digit
    LOOP PRINT_LOOP

    ; Restore registers
    POP DX 
    POP CX
    POP BX
    POP AX
    RET
OUTDEC ENDP  

END main
