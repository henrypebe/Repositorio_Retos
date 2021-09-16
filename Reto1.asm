    extern printf       ; scanf, malloc, calloc

section .datad
cotaA db 5
cotaN db "1"
cero db "0"
superior db "255"
mensaje db "El resultado es"

section .bss
resultado resb 8

section .text
    global main

main:
    ;VALIDACION:
    mov rbx, cotaA
    mov rax, resultado
    mov r8b, [rbx]
    mov [rax], r8b
    
    cmp r8b, [rel cero]
    jl exit
    cmp r8b, [rel 255]
    jg exit

imprimir:
	mov rdi, resultado
    mov rax, 0
    call printf wrt ..plt

; SYS_EXIT
exit:
    mov rax, 0
    ret