.model small
.stack 100h

.data

.code

main proc
     
     mov ax,@data
     mov ds,ax
     
     mov bl,9
     check:
     mov ax,9
     div bl
     
     cmp ah,0
     je again
     
     dec bl
     jmp check
     
     again:
     
     mov ax,5
     div bl
     
     cmp ah,0
     je endd
     
     dec bl
     jmp check
     endd:
     mov ah,2
     mov dl,bl
     add dl,48
     int 21h
    
     exit:
     mov ah,4ch
     int 21h
    
    end main