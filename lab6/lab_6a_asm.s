#----------------------------------------------------------------
# Funkcja do programu lab_6a - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------

	.text
	.type facta, @function
	.globl facta	

facta:	mov $1, %rax

	cmp %rax, %rdi
	jbe f_e

	push %rdi

	dec %rdi	# zmniejszamy argument o 1
	call facta	# wywołujemy rekurencyjnie factorial ASM

	pop %rdi	

	mul %rdi	# jednoargumentowe mnożenie rejestr rdi jest mnożnikiem, mnożna jest w %rax

f_e:	ret

