
;David Uriel Palacios Santillano
; valida si la letra ingresada corresponde a una vocal o no
; ja = jump if above (salta si es mayor)
; jae = jump if above or equal (salta si es mayor o igual)
; 2 de marzo del 2026
.MODEL SMALL
.STACK 20h
.DATA

    descipcion DB 'Programa que lee un caracter y comprueba si es mayuscula o minuscula. ', 10,10,13,'$'
    ingresar DB 'Ingresa un caracter: $'
    SIesvocal DB 10,10,13, 'el caracter ingresado si es una vocal. $'
   NOesvocal DB 10,10,13, 'el caracter ingresado no es una vocal. $'
   SIesletra DB 10,10,13, 'el caracter ingresado si es una letra. $'
     NOesletra DB 10,10,13, 'el caracter ingresado no es una letra. $'
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


cmp al, 'a'
jz cSIesvocal
cmp al, 'e'
jz cSIesvocal
cmp al, 'i'
jz cSIesvocal
cmp al, 'o'
jz cSIesvocal
cmp al, 'u'
jz cSIesvocal
jmp cNOesvocal






cSIesletra:
mov ah, 09h
mov dx, offset SIesletra
int 21h
jmp cfinprograma

cNOesletra: 
mov ah, 09h
mov dx, offset NOesletra
int 21h

cSIesvocal:
mov ah, 09h
mov dx, offset SIesvocal
int 21h
jmp cfinprograma

cNOesvocal:
mov ah, 09h
mov dx, offset cNOesvocal
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