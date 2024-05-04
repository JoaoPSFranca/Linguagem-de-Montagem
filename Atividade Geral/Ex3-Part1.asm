section .data
	msg1 db "Entre com o nome do aluno: "
	tmsg1 equ $ - msg1

section .bss
	nome resb 128
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
	mov rdx, 128
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