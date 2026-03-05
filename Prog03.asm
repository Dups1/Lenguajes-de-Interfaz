; David Uriel Palacios Santillano
; Programa en ensamblador
; 24 de febrero del 2026

.MODEL SMALL
.STACK 20h
.DATA
.DATA
    cadena1 DB 'Lenguajes de Interfaz', 0Dh, 0Dh, 0Ah, '$'
    cadena2 DB 'U1: Introduccion a la Programacion', 0Dh, 0Dh, 0Ah, '$'
    cadena3 DB 'David Uriel Palacios Santillano', 0Dh, 0Dh, 0Ah, '$'
    cadena4 DB 'Febrero 2026', 0Dh, 0Dh, 0Ah, '$'
.CODE
  eInicio:
        mov ax, @Data
        mov ds, ax

        mov ah, 09h
        mov dx, offset cadena1
        int 21h

        mov ah, 09h
        mov dx, offset cadena2
        int 21h

        mov ah, 09h
        mov dx, offset cadena3
        int 21h

        mov dx, offset cadena4
        mov ah, 09h
        int 21h

         mov ah, 08h
        int 21h


        mov ax, 4C00h
        int 21h       
END eInicio
