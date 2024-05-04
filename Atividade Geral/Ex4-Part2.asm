section .data
	msg1 db "Numero 1: "
	tmsg1 equ $ - msg1
	
	msg2 db "Numero 2: "
	tmsg2 equ $ - msg2

	msg3 db "Resultado: "
	tmsg3 equ $ - msg3

section .bss
	x resb 1
	y resb 1
	r resb 1

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
    	mov rcx, x
    	mov rdx, 2
    	int 0x80

    	mov rax, 4
	mov rbx, 1
	mov rcx, msg2
	mov rdx, tmsg2
	int 0x80

	mov rax, 3
	mov rbx, 0
	mov rcx, y
	mov rdx, 2
	int 0x80

	mov r8, [x]
	mov r9, [y]

	sub r8, '0'
	sub r9, '0'

	sub r9, r8
	sub r9, r8
	
	add r9, '0'

	mov [r], r9

	mov rax, 4
	mov rbx, 1
	mov rcx, msg3
	mov rdx, tmsg3
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, r
	mov rdx, 1
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov [rcx], byte 0xa
	mov rdx, 1
	int 0x80

exit:
	mov rax, 1
	int 0x80
