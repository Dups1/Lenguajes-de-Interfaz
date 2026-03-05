;David Uriel Palacios Santillano
;Programa en ensamblador que lee caracteres desde teclado
;24 de febrero del 2026
.MODEL SMALL
.STACK 20h
.DATA
; micro base de datos de cadenas de caracteres
    cadena1 DB 'Programa que lee un caracter', 0dh, 0dh, 0ah, '$'
    cadena2 DB 'Ingresa un caracter: $'
    cadena3 DB 0dh, 0dh, 0ah,'El programa a finalizado, presiona cualquier tecla $'

.CODE
    eInicio:
     mov ax, @Data
     mov ds, ax

; interrupcion para cadenas de caracteres = "Programa que lee un caracter"
     mov ah, 09h
      mov dx, offset cadena1
     int 21h

  ; interrupcion para cadenas de caracteres = "Ingresa un caracter"
     mov ah, 09h
      mov dx, offset cadena2
     int 21h
   ;interrupcion para confirmar el caracter seleccionado 
     mov ah, 01h
     int 21h

    ; interrupcion para cadenas de caracteres = "El programa a finalizado, presiona cualquier tecla"
     mov ah, 09h
      mov dx, offset cadena3
     int 21h      ; int 21 sin h hace que ignore todo el bloque de la interrupcion que imprime la cadena 3
     ; interrupcion para confirmar cierre con cualquier tecla
     mov ah, 08h
     int 21h

    ; interrupcion para finalizar el programa
     mov ax, 4C00h
     int 21h

    End eInicio