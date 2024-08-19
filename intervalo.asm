section .data
	msg1 db "Numero 1: "
	tmsg1 equ $ - msg1
	
	msg2 db "Numero 2: "
	tmsg2 equ $ - msg2
	
	msg3 db "Intervalo Negativo", 0xa
	tmsg3 equ $ - msg3

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

	mov r8, [n1]
	mov r9, [n2]
	
	cmp r8, r9
	jg maior
	jle loop
	
	;je = igual
	;jg = maior
	;jl = menor
	
	loop:
	mov [r], r8
	
	mov rax, 4
	mov rbx, 1
	mov rcx, r
	mov rdx, 2
	int 0x80
	
	add r8, 0x0000000000000001
		
	cmp r8, r9
	jle loop
	jg exit
	
	maior:
	mov rax, 4
	mov rbx, 1
	mov rcx, msg3
	mov rdx, tmsg3
	int 0x80
exit:
	mov rax, 1
	int 0x80

