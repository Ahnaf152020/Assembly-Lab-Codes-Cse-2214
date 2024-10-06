include 'emu8086.inc'

.model small
.stack 100h

.data
  
  
  msg1 db 'Enter Chracter:$'
  vowel db 'You enter Vowel Character:$'
  const db 'You enter Consonant Character:$'
  
  
  
.code



main proc
    
   mov ax,@data
   mov ds,ax
   
   mov ah,9
   lea dx,msg1
   int 21h
   
   mov ah,1
   int 21h
   
   cmp al,'A'
   je vwl
    
   cmp al,'E'
   je vwl
     
   cmp al,'I'
   je vwl
     
   cmp al,'O'
   je vwl
    
   cmp al,'U'
   je vwl
     
   cmp al,'a'
   je vwl
    
   cmp al,'e'
   je vwl
     
   cmp al,'i'
   je vwl
     
   cmp al,'o'
   je vwl
    
   cmp al,'u'
   je vwl
   
   
   mov ah,9
   lea dx,const
   int 21h
   jmp exit
   
       
   
   vwl:
   mov ah,9
   lea dx,vowel
   int 21h
   
   jmp exit 
    
    
  exit:
  mov ah,4ch
  int 21h  
    
    
end main    