section .data
    cadena1 db "dbabd"
    len equ $-cadena1

section .bss
    cadena2 resb 30
    car resb 8

section .text
    global _start

_start:
    mov rax, cadena1
    mov rcx, 0
; AVANZA HASTA EL ULTIMO CARACTER DE CADENA1
bucle1:
    mov r9b, [rax] ; NO SE UTILIZA TODO EL REGISTRO R9
    inc rax
    inc rcx
    cmp rcx, len ; TERMINA CUANDO LLEGA A LA LONGITUD DE LA PALABRA
    jl bucle1
; INGRESA DESDE EL ULTIMO CARACTER HASTA EL PRIMERO A LA CADENA2
; RCX = LEN
salida:
    mov rbx, 0
bucle2:
    mov r8, cadena2
    add r8, rbx

    dec rax
    mov r10b, [rax]
    mov [r8], r10b

    dec rcx
    inc rbx
    
    cmp rcx, 0 ; RCX LLEGA A 0
    jne bucle2

; SE INICIALIZA ANTES DE LA COMPARACION DE CADA CARACTER
salida2:
    mov r12, cadena1
    mov r11, cadena2
    ; LIMPIEZA
    xor r10, r10
    xor r13, r13
    mov rbx, 0

bucle3:
    ; LIMPIEZA
    xor r10, r10
    xor r13, r13
    
    ; SE GUARDA CADA CARACTER
    mov r10b, [r12]  ;NO SE UTILIZA TODO EL REGISTRO
    mov r13b, [r11]  
    
    inc rbx 
    inc r12
    inc r11

    cmp rbx, len ; SI AMBOS LLEGAN A LA LONGITUD DE LA PALABRA
    je palindromo

    xor r10b, r13b ; SE COMPARA
    jz bucle3

no_palindromo:
    ;LE METEMOS UN CAMBIO DE LINEA
    mov r13, car  
    mov r15, "F"
    mov [r13], r15
    inc r13
    mov r14, 10
    mov [r13], r14

    ; ----- Codigo para impresión en pantalla ----- ;
	mov rax, 1		    ; función a utilizar (printf)
	mov rdi, 1		    ; imprimir en pantalla: 1
	mov rsi, car	; rsi debe contener el puntero hacia el arreglo a imprimir
	mov rdx, 8		; numero de elementos a imprimir
	syscall			    ; system call --> llamadas a funciones del sistema (SO)
	; --------------------------------------------- ;
    jmp exit            ; si no es capicua debemos terminar el programa


palindromo:
;LE METEMOS UN CAMBIO DE LINEA
    mov r13, car  
    mov r15, "T"
    mov [r13], r15
    inc r13
    mov r14, 10
    mov [r13], r14

    ; ----- Codigo para impresión en pantalla ----- ;
	mov rax, 1		    ; función a utilizar (printf)
	mov rdi, 1		    ; imprimir en pantalla: 1
	mov rsi, car	; rsi debe contener el puntero hacia el arreglo a imprimir
	mov rdx, 8		; numero de elementos a imprimir
	syscall			    ; system call --> llamadas a funciones del sistema (SO)
	; --------------------------------------------- ;

exit:
    ; ---- return 0 ---- ;
	mov rax, 60		; función para terminar la ejecución del programa. Similar a int 21h
	mov rdi, 0
	syscall
    ; ------------------ ;