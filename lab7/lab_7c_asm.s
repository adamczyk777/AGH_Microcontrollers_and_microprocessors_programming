#----------------------------------------------------------------
# Funkcja do programu lab_6b - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------

	.type min_of_three_S, @function
	.global min_of_three_S

min_of_three_S:
	mov %rdi, %rax
	cmp %rsi, %rax
	jg choose_b
	ret

choose_b:
	mov %rsi, %rax
	cmp %rdx, %rax
	jg choose_c
	ret

choose_c:
	mov %rdx, %rax
	ret

