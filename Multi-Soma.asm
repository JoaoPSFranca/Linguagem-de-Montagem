section .data
	msg1 db "Numero 1: "
	tmsg1 equ $ - msg1
	
	msg2 db "Numero 2: "
	tmsg2 equ $ - msg2

	msg3 db "Numero 3: "
	tmsg3 equ $ - msg3
	
	msg4 db "Numero 4: "
	tmsg4 equ $ - msg4

	msg5 db "Resultado: "
	tmsg5 equ $ - msg5

section .bss
	n1 resb 1
	n2 resb 1
	n3 resb 1
	n4 resb 1
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

	mov rax, 4
    	mov rbx, 1
    	mov rcx, msg3
    	mov rdx, tmsg3
    	int 0x80

    	mov rax, 3
    	mov rbx, 0
    	mov rcx, n3
    	mov rdx, 2
    	int 0x80

	mov rax, 4
   	mov rbx, 1
    	mov rcx, msg4
    	mov rdx, tmsg4
    	int 0x80

    	mov rax, 3
    	mov rbx, 0
    	mov rcx, n4
    	mov rdx, 2
    	int 0x80

	mov r8, [n1]
	mov r9, [n2]
	mov r10, [n3]
	mov r11, [n4]

	sub r8, '0'
    	sub r9, '0'
	sub r10, '0'
    	sub r11, '0'

	add r8, r9
	add r8, r10
	sub r8, r11
	
	add r8, '0'

	mov [r], r8

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
	
	mov rax, 4
	mov rbx, 1
	mov [rcx], byte 0xa
	mov rdx, 1
	int 0x80

exit:
	mov rax, 1
	int 0x80
