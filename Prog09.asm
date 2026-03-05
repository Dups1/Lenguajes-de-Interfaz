; saltos Ja, jae
;David Uriel Palacios Santillano
;Caracter ingresado es un digito
; ja = jump if above (salta si es mayor)
; jae = jump if above or equal (salta si es mayor o igual)
; 26 de febrero del 2026
.MODEL SMALL
.STACK 20h
.DATA

    descipcion DB 'Programa que lee un caracter y comprueba si es ditigo. ', 10,10,13,'$'
    ingresar DB 'Ingresa un digito: $'

    SIESLetra DB 10,10,13, 'El caracter ingresado si es un digito. $'
    NOESLetra DB 10,10,13, 'el caracter ingresado no es un digito. $'
    finprograma db 10,10,13, 'el programa a finalizado, preciona cualquier tecla para salir....$'  
.CODE
    eInicio:
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    mov dx, offset descipcion
    int 21h

    mov ah, 09h
    mov dx, offset ingresar
    int 21h

    mov ah, 01h
    int 21h

cmp al, 30h
jb cNOESLetra
cmp al, 39h
ja cNOESLetra
jmp cSIESLetra


cSIESLetra:
mov ah, 09h
mov dx, offset SIESLetra
int 21h
jmp cfinprograma

cNOESLetra:
mov ah, 09h
mov dx, offset NOESLetra
int 21h

cfinprograma: 
mov ah, 09h
mov dx, offset finprograma
int 21h

mov ah, 08h
int 21h

mov ax, 4c00h
int 21h

END eInicio