section .data
	msg1 db "Entre com o nome do aluno: "
	tmsg1 equ $ - msg1

	msg2 db "Entre com a nota: "
	tmsg2 equ $ - msg2

section .bss
	nome resb 10
	nota resb 2
	tn resb 1

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
	mov rcx, nome
	mov rdx, 10
	int 0x80	

	mov rax, 4
	mov rbx, 1
	mov rcx, msg2
	mov rdx, tmsg2
	int 0x80

	mov rax, 3
	mov rbx, 0
	mov rcx, nota
	mov rdx, 2
	int 0x80

	mov rax, 4
	mov rbx, 1 
	mov rcx, nota
	mov rdx, [tn]
	sub rdx, 1
	int 0x80

	mov rax, 4
	mov rbx, 1 
	mov rcx, nome
	mov rdx, [tn]
	sub rdx, 1
	int 0x80

exit:
	mov rax, 1	
	int 0x80