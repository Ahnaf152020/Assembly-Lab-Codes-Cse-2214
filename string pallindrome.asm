include 'emu8086.inc'
.model small
.stack 100h

.data
 string db 'abba','$'
 string1 db 'string is pallindrome','$'
 string2 db 'string is not pallindrome ','$'
 
.code

main proc
    
     mov ax,@data
     mov ds,ax
     
     mov si,offset string
     
     loop1:
     mov al,[si]
     cmp al,'$'
     je label1
     inc si
     
     jmp loop1
     
     label1:
     mov di,offset string
     dec si
     
     loop2:
     cmp si,di
     jl output1
     mov al,[si]
     mov bl,[di]
     cmp al,bl
     jne output2
     dec si
     inc di
     jmp loop2
     
     output1:
     lea dx,string1
     mov ah,9
     int 21h
     jmp exit
     
     output2:
      lea dx,string2
     mov ah,9
     int 21h
     jmp exit
    
    exit:
    mov ah,4ch
    int 21h
    
end main    