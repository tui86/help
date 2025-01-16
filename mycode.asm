
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
jmp start
msg1: db "input a: ",24h
msg2: db "input b: ",24h
msg3: db "input c: ",24h
msg4: db "S= ",24h
msg: db "", 0Ah, 0Dh, 24h
S: db ?
start: mov dx, msg1; input a
       mov ah, 09h
       int 21h
       mov ah, 01h
       int 21h
       sub al, 30h
       mov bl, al
       mov dx, msg
       mov ah, 09h
       int 21h
       ; input b
       mov dx, msg2
       mov ah, 09h
       int 21h
       mov ah, 01h
       int 21h
       sub al, 30h
       mov cl, al
       mov dx, msg
       mov ah, 09h
       int 21h
       ;input c
       mov dx,msg3
       mov ah, 09h
       int 21h
       mov ah, 01h
       int 21h
       sub al, 30h
       mov dl, al
       ; Caculate S
       mov al, cl; al<-b
       add al, dl; al=b+c
       mul bl    ; ax=a*(b+c)
       mov bp, ax
       mov al, cl; al<-b
       mul dl; ax=b*c
       sub bp, ax
       mov [S], bp
       ; result S
       mov dx, msg
       mov ah, 09h
       int 21h
       mov dx, msg4
       mov ah, 09h
       int 21h
       mov ax, [S]
       add al, 30h
       mov dl, al
       mov ah, 02h
       int 21h
      
ret