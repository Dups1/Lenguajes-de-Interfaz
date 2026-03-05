;David Uriel Palacios Santillano
;Caracter ingresado es una a minuscula
;Incluye saltos y cmp, je, jne

; je = jump if equal (salta si son iguales)
; jne = jump if not equal (salta si no son iguales)
; jmp = jump (salta incondicionalmente a la etiqueta especificada)

.MODEL SMALL
.STACK 20h
.DATA

    descipcion DB 'Programa que lee un caracter y lo compara con la letra "a" minuscula', 10,10,13,'$'
    ingresar DB 'Ingresa un caracter: $'
    SIESa DB 10,10,13, 'El caracter ingresado si es la "a" minuscula. $'
    NOESa DB 10,10,13, 'el caracter ingresado no es una "a" minuscula. $'
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
 ; se cambio 61h por 'a' que es lo mismo
        cmp al, 'a' ; compara el valor del caracter ingresado (en el registro al) con el valor hexadecimal de la letra "a" minuscula (61h)
        je cSIESa         ;aqui practicamente se dice que si el valor del caracter ingresado es igual al valor hexadecimal de la letra "a" minuscula, entonces salta a eSiEsA
        jne cNOESa        ; aqui se dice que si el valor del caracter ingresado no es igual al valor hexadecimal de la letra "a" minuscula, entonces salta a eNoEsA    
       jmp cfinprograma    ; jmp se usa para mandar a llamar a la cadena cuando las comparaciones hayan terminado
    CSIESa: 
        mov ah, 09h
        mov dx, offset SIESa
        int 21h  
          jmp cfinprograma  
    cNOESa:
        mov ah, 09h
        mov dx, offset NOESa
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