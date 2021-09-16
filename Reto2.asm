;INGRESO DE DATOS
section .data
    mensaje db "El numero es (T:fuerte | F:debil)",10
    len1 equ $-mensaje
    numero db 145 ;EL NUMERO QUE SE DESEA INVESTIGAR
;RESERVA DE MEMORIA PARA EL CARACTER:
section .bss
    car resb 16

section .text
    global _start ;MAIN

_start:
;SE INICIALIZA LAS VARIABLES
    mov r10, 0 ;CONTENDRA LA SUMA DE FACTORIALES
    mov r8, qword[numero] ;TENDRA EL NUMERO ENTERO
    mov rax, r8 ;SE INGRESA A RAX PARA QUE EL NUMERO PUEDA SER OPERADO EN EL LOOP
antes_loop:
    mov rbx, 10 ;PARA DESCONTAR UN DECIMAL A LA DERECHA (145 -> 14)
loop1:
    mov r11, r8 ;SE GUARDA EL VALOR QUE SE TIENE EN EL REGISTRO R8
    cmp rax, 10 ;SE COMPARA SI EL NUMERO QUE FALTA ES DE UN SOLO DECIMAL
    jl salida_loop
    div rbx ;SE DIVIDE EL RAX
    mov r8, rax ;SE GUARDA EL NUEVO NUMERO
    ;CALCULO DEL RESIDUO:
    mul rbx 
    sub r11,rax ;RESIDUO
    ;INICIALIZACION DE LAS VARIABLES ANTES DE ENTRAR AL LOOP DEL FACTORIAL
    mov rax, 1 ;contendra el valor del factorial
    mov rcx, 1 ;conteo
loop2:
    mov r12, rcx
    mul rcx ;SE MULTIPLICA EL CONTEO
    xor r12, r11   ;verifica si son iguales
    jz salida ;si lo son, sale
    inc rcx
    jmp loop2
salida:
    add r10, rax ;SE GUARDA EL VALOR DEL FACTORIAL DENTRO DEL REGISTRO 10
    mov rax, r8 ;SE ACTUALIZA EL NUEVO NUMERO
    jmp loop1
    
salida_loop:
;FALTA SACAR EL FACTORIAL DEL NUMERO DECIMAL RESTANTE:
    mov r11, rax
    mov rax, 1
    mov rcx, 1 ;conteo
mini_loop:
    mov r12, rcx
    mul rcx
    xor r12, r11   ;verifica si son iguales
    jz salida_2 ;si lo son, sale
    inc rcx
    jmp mini_loop
salida_2:
    add r10, rax ;AHORA TIENE EL FACTORIAL COMPLETO
    mov r8, qword[numero] ;SE INICIALIZA NUEVAMENTE EL NUMERO ENTERO:
    xor r8, r10 ;SE COMPARA SI SON IGUALES
    jnz impresion_no_fuerte

impresion_fuerte:
    mov rax, 1
	mov rdi, 1
	mov rsi, mensaje
	mov rdx, len1
	syscall

    ;LE METEMOS UN CAMBIO DE LINEA
    mov r8, car  
    mov r15, "T"
    mov [r8], r15
    inc r8
    mov r14, 10
    mov [r8], r14

    mov rax, 1
	mov rdi, 1
	mov rsi, car
	mov rdx, 16
	syscall
    jmp exit

impresion_no_fuerte:
    mov rax, 1
	mov rdi, 1
	mov rsi, mensaje
	mov rdx, len1
	syscall

    ;LE METEMOS UN CAMBIO DE LINEA
    mov r8, car
    mov r15, "F"
    mov [r8], r15
    inc r8
    mov r14, 10
    mov [r8], r14

    mov rax, 1
	mov rdi, 1
	mov rsi, car
	mov rdx, 16
	syscall

exit:
    ; ---- return 0 ---- ;
	mov rax, 60		; función para terminar la ejecución del programa. Similar a int 21h
	mov rdi, 0
	syscall
    ; ------------------ ;