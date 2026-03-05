
;David Uriel Palacios Santillano
;compara 2 numeros y determina cual es el mayor
; concatenacion del valor
; 5 de marzo del 2026
.MODEL SMALL
.STACK 20h
.DATA
    nombre DB 'David Uriel Palacios Santillano', 10,10,13,'$'
    descipcion DB 'Programa que compara 2 numeros y determina cual es el mayor. ', 10,10,13,'$'
    ingresar1 DB 10,10,13, 'Ingresa el primer numero: $'
    ingresar2 DB 10,10,13, 'Ingresa el segundo numero: $'
    elmayor DB 10,10,13, 'el numero mayor es: $'
     finprograma db 10,10,13, 'el programa a finalizado, preciona cualquier tecla para salir....$'
.CODE
    eInicio:
    mov ax, @data
    mov ds, ax

; este bloque muestra la cadena con mi nombre
    mov ah, 09h
    mov dx, offset nombre
    int 21h

; este bloque muestra la cadena de la descripcion
    mov ah, 09h
    mov dx, offset descipcion
    int 21h

; este bloque muestra la cadena de ingresar y la interrupcion 01h para ingresar un caracter a ah (al) y despues se mueve a bl 
    mov ah, 09h
    mov dx, offset ingresar1
    int 21h
    mov ah, 01h
    int 21h
    mov bl, al
    

    ; este bloque muestra la cadena ingresar2 y la interrupcion 01h para ingresar a ah (al)
    mov ah, 09h
    mov dx, offset ingresar2
    int 21h
    mov ah, 01h
    int 21h
    mov cl, al


; bl es el primer valor
; cl es el segundo valor
   cmp bl, cl
    ; si bl > cl salta a cMayorA
   ja cMayorA
   ; si cl > bl se salta a cMayorB
   jmp cMayorB


cMayorB:
mov ah, 09h
mov dx, offset elmayor
int 21h
mov ah, 02h
mov dl, cl
int 21h
jmp cfinprograma

cMayorA: 
mov ah, 09h
mov dx, offset elmayor
int 21h
mov ah, 02h
mov dl, bl
int 21h
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
