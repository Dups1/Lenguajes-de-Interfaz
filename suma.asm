.model small
.stack 100h

.data

.code
main proc
Debug 
A100
Mov ah, 02
Mov dl, 55
Int 21
Mov dl, 44
Int 21
Mov ax, 4c00
Int 21
G
    
main endp
end main

