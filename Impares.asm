section .data

    msg1 db "Número 1: "
    tmsg1 equ $ - msg1

    msg2 db "Número 2: "
    tmsg2 equ $ - msg2

section .bss

    n1 resq 1
    n2 resq 1
    r resq 1

section .text

global _start

_start:

    mov rax, 4
    mov rbx, 1
    mov rcx, msg1
    mov rdx, tmsg1
    int 0x80

    mov rax, 3
    mov rbx, 0
    mov rcx, n1
    mov rdx, 2
    int 0x80

    mov rax, 4
    mov rbx, 1
    mov rcx, msg2
    mov rdx, tmsg2
    int 0x80

    mov rax, 3
    mov rbx, 0
    mov rcx, n2
    mov rdx, 2
    int 0x80

    sub r8, r8
    sub r9, r9
    sub r10, r10
    sub r11, r11
    sub r12, r12

    mov r8, [n1]
    mov r9, [n2]

    sub r8, 0x0000000000000a30
    sub r9, 0x0000000000000a30
    
    mov r10, 0x0000000000000002
    mov r11, 0x0000000000000001

verificar:
    mov rax, r8

    div r10
    
    mov r12, rdx
    
    cmp r12, r11
    je imprime
    
    add r8, 0x0000000000000001

    call verificar

imprime:
    mov [r], r8

    mov rax, 4
    mov rbx, 1
    mov rcx, r
    mov rdx, 2
    int 0x80

    add r8, 0x0000000000000001
    ;call verificar

exit:

    mov rax, 1
    int 0x80