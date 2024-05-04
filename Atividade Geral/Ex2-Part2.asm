section .data
	msg1 db "Seja bem vindo!", 0xa
	tmsg1 equ $ - msg1
	
	msg2 db "Hoje é dia de Assembly.", 0xa
	tmsg2 equ $ - msg2
	
section .text

global _start

_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, tmsg1
	int 0x80
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, tmsg2
	int 0x80

exit:
	mov eax, 1	
	int 0x80