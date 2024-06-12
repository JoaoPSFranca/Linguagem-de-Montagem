section .data
	msg db "Primos: "
	tmsg equ $ - msg
	
	espace db " ", 0x0
	
section .bss
	r resq 1

section .text

global _start

_start:	
	mov rax, 4
	mov rbx, 1
	mov rcx, msg
	mov rdx, tmsg
	int 0x80
		
	xor r8, r8
	mov r8, 0x2

loop:
	xor r9, r9
	mov r9, 2
	
loop_increment:	
	cmp r9, r8
	je imprime

	xor rax, rax
	mov rax, r8
	
	xor rdx, rdx	
	div r9
	
	cmp rdx, 0x0
	je continuarLoop

	add r9, 0x1
	jmp loop_increment
	
imprime:
	mov rax, r8
	add rax, 0x30
	mov [r], al
	
	mov rax, 4
	mov rbx, 1
	mov rcx, r
	mov rdx, 1
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, espace
	mov rdx, 1
	int 0x80

continuarLoop:
	add r8, 0x1
	cmp r8, 0xa
	jle loop

exit:
	final:
	mov rax, 1
	int 0x80