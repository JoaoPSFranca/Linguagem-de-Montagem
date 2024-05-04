section .data

section .bss
    r resb 64

section .text

global _start

_start:
    sub rax, rax

    mov ax, 0011110101100110b
    mov ah, 00000000b
    mov al, 00110000b
	
    mov [r], rax 

    mov rax, 4
    mov rbx, 1
    mov rcx, r
    mov rdx, 1
    int 0x80

exit:
    mov rax, 1
    int 0x80