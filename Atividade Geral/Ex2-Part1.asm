section .data
	msg1 db "Bom dia!", 0xa
	tmsg1 equ $ - msg1
	
section .text

global _start

_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, tmsg1
	int 0x80

exit:
	mov eax, 1	
	int 0x80