
;David Uriel Palacios Santillano
; hacer un programa en ensamblador en el que l usuario el usuario intente adivinar un numero definido previamente
; 3 de marzo del 2026
.MODEL SMALL
.STACK 20h
.DATA
    nombre DB 'David Uriel Palacios Santillano', 10,10,13,'$'
    descipcion DB 'Programa que te dice si adivinaste el numero o no. ', 10,10,13,'$'
    ingresar DB 10,10,13, 'Ingresa un numero: $'
    adivin DB 10,10,13, 'adivninaste. $'
   intento1 DB 10,10,13, 'no adivinaste intento 1: $'
    intento2 DB 10,10,13, 'no adivinaste intento 2: $'
     finprograma db 10,10,13, 'el programa a finalizado, preciona cualquier tecla para salir....$'
.CODE
    eInicio:
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    mov dx, offset nombre
    int 21h

    mov ah, 09h
    mov dx, offset descipcion
    int 21h
    mov ah, 09h
    mov dx, offset ingresar
    int 21h

    mov ah, 01h
    int 21h

cmp al, 49
je cadivin
jb cintento2
ja cintento1
jmp cfinprograma

cadivin:
mov ah, 09h
mov dx, offset adivin
int 21h
jmp cfinprograma


cintento1:
mov ah, 09h
mov dx, offset intento1
int 21h
mov ah, 09h
mov dx, offset ingresar
int 21h
 mov ah, 01h
 int 21h
cmp al, 49
je cadivin
ja cintento2
jmp cfinprograma



cintento2: 
mov ah, 09h
mov dx, offset intento2
int 21h
mov ah, 09h
mov dx, offset ingresar
int 21h
 mov ah, 01h
 int 21h
 cmp al, 49
je cadivin
jmp cfinprograma

cfinprograma: 
mov ah, 09h
mov dx, offset finprograma
int 21h

mov ah, 08h
int 21h

mov ax, 4c00h
int 21h

END eInicio

