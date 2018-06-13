# Jakub Adamczyk
/*
	Komentarz na temat programu
	
*/
.data
	len:		.quad 0
	character_pos:	.quad 0
	.type	binary_op, @function
	.global	binary_op
.text
	
binary_op:
	cmp	$0, %rcx
	je	add
	cmp	$1, %rcx
	je 	and
	cmp	$2, %rcx
	je 	or
	cmp	$3, %rcx
	je	xor
	
add:
	jmp	check_len

check_len:
	cmp	$0, (%rsi)
	jne	not_end
	jmp	add_2

not_end:
	incq	(len)
	inc	%rsi
	jmp	check_len

add_2:
	mov	len, %r9
	mov	%rsi, %rdi

and:

or:

xor:


