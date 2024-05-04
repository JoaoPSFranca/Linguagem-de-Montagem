section .data
	msg1 db "Apresente o valor de A: "
	tmsg1 equ $ - msg1
	
	msg2 db "Apresente o valor de B: "
	tmsg2 equ $ - msg2

	msg3 db "Apresente o valor de C: "
	tmsg3 equ $ - msg3

	msg4 db "Apresente o valor de X: "
	tmsg4 equ $ - msg4

	msg5 db "Resultado: "
	tmsg5 equ $ - msg5

section .bss
	a resb 1
	b resb 1
	c resb 1
	x resb 1	
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
    	mov rcx, a
    	mov rdx, 2
    	int 0x80

	mov rax, 4
    	mov rbx, 1
    	mov rcx, msg2
    	mov rdx, tmsg2
    	int 0x80

    	mov rax, 3
    	mov rbx, 0
    	mov rcx, b
    	mov rdx, 2
    	int 0x80

	mov rax, 4
	mov rbx, 1
	mov rcx, msg3
	mov rdx, tmsg3
	int 0x80

	mov rax, 3
    	mov rbx, 0
    	mov rcx, c
    	mov rdx, 2
    	int 0x80

	mov rax, 4
    	mov rbx, 1
    	mov rcx, msg4
    	mov rdx, tmsg4
    	int 0x80

    	mov rax, 3
    	mov rbx, 0
    	mov rcx, x
    	mov rdx, 2
    	int 0x80

	mov rax, [x]
	mov r8, [x]

	sub rax ,'0'
	sub r8, '0'
	mul r8

	mov r9, rax
	mov rax, [a]

	sub rax, '0'
	mul r9
	
	mov r10, rax  ; salvou o valor de A.X2
	
	mov r8, [b]
	mov rax, [x]

	sub rax ,'0'
	sub r8, '0'

	mul r8

	mov r11, r8 ; salvou o valor de bx
	
	mov r8, [c]
	sub r8, '0'

	add r10, r11
	sub r10, r8

	add r10, '0'
	mov [r], r10

	mov rax, 4
	mov rbx, 1
	mov rcx, msg5
	mov rdx, tmsg5
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, r
	mov rdx, 1
	int 0x80

exit:
	mov rax, 1
	int 0x80
