section .data
	msg db "Primos: "
	tmsg equ $ - msg
	
	espace db " "
	tespace equ $ - espace
	
section .bss
	r resq 1

section .text

global _start

_start:
	xor r8, r8
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msg
	mov rdx, tmsg
	int 0x80
		
loop:
	add r8, 1
	
	cmp r8, 10
	je final

	cmp r8, 2
	je imprime
	
	xor r9, r9
	mov r9, 2
	
loop_increment:	
	cmp r9, r8
	je imprime

	xor rdx, rdx	
	mov rax, r8
	div r9
	
	cmp rdx, 0
	je loop

	add r9, 1
	jmp loop_increment
	
imprime:
	add r8, 48
	mov [r], r8
	sub r8, 48
	
	mov rax, 4
	mov rbx, 1
	mov rcx, r
	mov rdx, 1
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, espace
	mov rdx, tespace
	int 0x80

	jmp loop

exit:
	final:
	mov rax, 1
	int 0x80