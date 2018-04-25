#----------------------------------------------------------------
# Funkcja do programu lab_6b - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------

	.type sum3, @function
	.globl sum3

sum3:	mov %rdi, %rax
	add %rsi, %rax
	add %rdx, %rax
	ret

