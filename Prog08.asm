;David Uriel Palacios Santillano
;Caracter ingresado es una a minuscula

; je = jump if equal (salta si son iguales)
; jne = jump if not equal (salta si no son iguales)
; jmp = jump (salta incondicionalmente a la etiqueta especificada)

.MODEL SMALL
.STACK 20h
.DATA

    descipcion DB 'Programa que lee un caracter y comprueba si es ditigo. ', 10,10,13,'$'
    ingresar DB 'Ingresa un digito: $'
    SIESDig DB 10,10,13, 'El caracter ingresado si es un digito. $'
    NOESDig DB 10,10,13, 'el caracter ingresado no es un digito. $'
    finprograma db 10,10,13, 'el programa a finalizado, preciona cualquier tecla para salir....$'  
.CODE
    eInicio:
        mov ax, @DATA
        mov ds, ax

        mov ah, 09h
        mov dx, offset descipcion
        int 21h

        mov ah, 09h
        mov dx, offset ingresar
        int 21h

    
        mov ah, 01h ; lee un caracter desde teclado y guarda el valor en "al"
        int 21h


        cmp al, '0' ; compara el valor del caracter ingresado (en el registro al) con el valor hexadecimal de la letra "a" minuscula (61h)
        jb cNOESDig



        cmp al, 39h ; compara el valor del caracter ingresado (en el registro al) con el valor hexadecimal de la letra "9" (39h)  
       jbe cSIESDig
       jmp cNOESDig  




    cSIESDig: 
        mov ah, 09h
        mov dx, offset SIESDig
        int 21h  
          jmp cfinprograma 


    cNOESDig:
        mov ah, 09h
        mov dx, offset NOESDig
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