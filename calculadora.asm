section .data
	msg1 db "Numero 1: "
	tmsg1 equ $ - msg1
	
	msg2 db "Numero 2: "
	tmsg2 equ $ - msg2

	msg3 db "Soma: "
	tmsg3 equ $ - msg3
	
	msg4 db "Subtracao: "
	tmsg4 equ $ - msg4

	msg5 db "Multiplicacao: "
	tmsg5 equ $ - msg5
	
	msg6 db "Divisao: "
	tmsg6 equ $ - msg6
	
	msg7 db "Resto: "
	tmsg7 equ $ - msg7
	
	msgMenu db "Menu: ", 0xa
	tmsgMenu equ $ - msgMenu
	
	msgMenu1 db "1. Soma ", 0xa
	tmsgMenu1 equ $ - msgMenu1

	msgMenu2 db "2. Subtracao ", 0xa
	tmsgMenu2 equ $ - msgMenu2

	msgMenu3 db "3. Multiplicacao ", 0xa
	tmsgMenu3 equ $ - msgMenu3
	
	msgMenu4 db "4. Divisao ", 0xa
	tmsgMenu4 equ $ - msgMenu4	

	msgMenu5 db "5. Resto ", 0xa
	tmsgMenu5 equ $ - msgMenu5
	
	msgMenu0 db "0. Sair ", 0xa
	tmsgMenu0 equ $ - msgMenu0
	
	msgMenuOpcao db "Opcao: "
	tmsgMenuOpcao equ $ - msgMenuOpcao
	
section .bss
	n1 resq 1
	n2 resq 1
	opt resq 1
	result resq 1

section .text

global _start

_start:
	menu:
	mov rax, 4
	mov rbx, 1
	mov rcx, msgMenu
	mov rdx, tmsgMenu
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msgMenu1
	mov rdx, tmsgMenu1
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msgMenu2
	mov rdx, tmsgMenu2
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msgMenu3
	mov rdx, tmsgMenu3
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msgMenu4
	mov rdx, tmsgMenu4
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msgMenu5
	mov rdx, tmsgMenu5
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msgMenu0
	mov rdx, tmsgMenu0
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msgMenuOpcao
	mov rdx, tmsgMenuOpcao
	int 0x80
	
	mov rax, 3
    	mov rbx, 0
    	mov rcx, opt
    	mov rdx, 2
    	int 0x80
    	
    	mov r15, [opt]
    	
    	cmp r15b, 00110000b
    	je exit
    	
	mov rax, 4
	mov rbx, 1
	mov [rcx], byte 0xa
	mov rdx, 1
	int 0x80

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
    	
    	cmp r15b, 00110001b
    	je soma
    	
    	cmp r15b, 00110010b
    	je subtracao
    	
    	cmp r15b, 00110011b
    	je multiplicacao
    	
    	cmp r15b, 00110100b
    	je divisao
    	
    	cmp r15b, 00110101b
    	je resto
    	
	soma:
	mov r8, [n1]
	mov r9, [n2]

	sub r8, '0'
    	sub r9, '0'

	add r8, r9
	
	add r8, '0'

	mov [result], r8
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msg3
	mov rdx, tmsg3
	int 0x80
	
	call resultado
	
	subtracao:
	mov r10, [n1]
	mov r11, [n2]

	sub r10, '0'
    	sub r11, '0'
	
	sub r10, r11
	
	add r10, '0'
	
	mov [result], r10
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msg4
	mov rdx, tmsg4
	int 0x80
	
	call resultado
	
	multiplicacao:
	mov r12, [n1]
	mov rax, [n2]
	
	sub r12, '0'
	sub rax, '0'
	mul r12
	
	add rax, '0'
	mov [result], rax
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msg5
	mov rdx, tmsg5
	int 0x80
	
	call resultado
	
	divisao:
	mov rax, 0
	mov rdx, 0
	
	mov rax, [n1]
	mov r13, [n2]
	
	sub rax, 0x0a30
	sub r13, 0x0a30
	
	div r13
	
	add rax, 0x30
	add rdx, 0x0a30
	
	mov [result], rax
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msg6
	mov rdx, tmsg6
	int 0x80
	
	call resultado
	
	resto:
	mov rax, 0
	mov rdx, 0
	
	mov rax, [n1]
	mov r13, [n2]
	
	sub rax, 0x0a30
	sub r13, 0x0a30
	
	div r13
	
	add rax, 0x30
	add rdx, 0x0a30
	
	mov [result], rdx
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msg7
	mov rdx, tmsg7
	int 0x80
	
	call resultado

	mov rax, 4
	mov rbx, 1
	mov [rcx], byte 0xa
	mov rdx, 1
	int 0x80
	
	resultado: 
	mov rax, 4
	mov rbx, 1
	mov rcx, result
	mov rdx, 1
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov [rcx], byte 0xa
	mov rdx, 1
	int 0x80

	mov rax, 4
	mov rbx, 1
	mov [rcx], byte 0xa
	mov rdx, 1
	int 0x80
	
	call _start
	
	final:

exit:
	mov rax, 1
	int 0x80