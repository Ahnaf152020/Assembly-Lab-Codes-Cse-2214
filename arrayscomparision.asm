include 'emu8086.inc'
  ; comparision between two arrays 
.model small
.stack 100h


.data

array1 db 3,5,8,7,9
array2 db 3,4,87,7,9

.code



main proc
   
   mov ax,@data
   mov ds,ax
   
   mov si,offset array1 
   mov di,offset array2; si  array index maintain koree 1st address of bit k si te rakhe so offset 
   
   mov cx,5 
   
   
   loopx:
   
   mov al,[si]
   mov bl,[di]
   cmp al,bl
   
    
  jne notSame
  
  inc si
  inc di
  
  
   
   loop loopx 
   
   print 'Both are same:'
      jmp  end_if
         
    notSame:
    
    print 'Both are not same:'
      jmp  end_if
              
         
   
   end_if:
   mov ah,4ch
   int 21h 
    
    
end main    