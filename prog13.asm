
;David Uriel Palacios Santillano
;programa que te dice el caracter que tecleaste
; 4 de marzo del 2026
.MODEL SMALL
.STACK 20h
.DATA
    nombre DB 'David Uriel Palacios Santillano', 10,10,13,'$'
    descipcion DB 'Programa que te dice el caracter que tecleaste. ', 10,10,13,'$'
    ingresar DB 10,10,13, 'Ingresa un caracter: $'
    elcaracter DB 10,10,13, 'el caracter que tecleaste fue: $'
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
    mov ah, 09h
; este bloque muestra la cadena de ingresar y la interrupcion 01h para ingresar un caracter a ah y despues se mueve a bl 
    mov dx, offset ingresar
    int 21h
    mov ah, 01h
    int 21h
    mov bl, al

; esta bloque muestra la cadena de elcaracter y se usa la interrupcion 02h para mostrar el caracter que se almaceno en bl y se movio a dl para mostrarlo en pantalla, despues se salta a la etiqueta cfinprograma.
    mov ah, 09h
    mov dx, offset elcaracter
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
