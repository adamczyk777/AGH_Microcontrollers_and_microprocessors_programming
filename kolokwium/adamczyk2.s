# Jakub Adamczyk
/*
	Zmienilem koncepcje zrzucam na liczby robie and i potem zrzucam do tablicy charow
*/
.data
	.type	binary_op, @function
	.global	binary_op
.text
	
binary_op:
	mov	%rdi, %rax	# wrzucam od razu wskaznik tak zeby go zwracac
	xor	%r8, %r8
	xor	%r9, %r9
	cmp	$0, %rcx
	je	add
	cmp	$1, %rcx
	je 	and
	cmp	$2, %rcx
	je 	or
	cmp	$3, %rcx
	je	xor
	
# operacja add
add:
	jmp	arg1_to_num

# te operacje nei zostaly ziamplementowane
# start dla and
and:
	ret

# start dla or
or:
	ret

#start dla xor
xor:
	ret

arg1_to_num:	
	cmpb	$0, (%rsi)	# znak konca stringa
	je	arg2_to_num
	shl	$1, %r8		# przesuwamy bit dalej zeby wpisywac liczby zgodnie z pozycja
	cmpb	$'0', (%rsi)	# jak jest zero to nie wpisujemy nic i przechodzimy dalej
				# $'0' to od razu sprawdza wartosc ASCII
	je	arg1_to_num_2	# zostawiamy bit 0, czytamy kolejny znak
	inc	%r8		# znak to '1', czyli najmlodszy przeczytany bit to 1

arg1_to_num_2:
	inc	%rsi		# inkrementujemy czyli czytamy dalej argument
	jmp	arg1_to_num

arg2_to_num:			# tutaj robimy to samo dla drugiego argumentu
	cmpb	$0, (%rdx)
	je	adding		# roznica przechodzimy do adding
	shl	$1, %r9	
	cmpb	$'0', (%rdx)
	je	arg2_to_num_2
	inc	%r9

arg2_to_num_2:
	inc	%rdx
	jmp 	arg2_to_num

adding:
	add	%r9, %r8 	# operacja dodawania
	jmp	from_num_to_str

from_num_to_str:
	xor	%r10, %r10
	mov	$1, %r10
	shl	$63, %r10

write_characters:
	test	%r10, %r8	# and porownujacy z maska nie zapisuje wartosci do rejestru jak cmp
	jz	put_zero
	movb	$'1', (%rdi)	# wstawiamy 1 fdo wyniku (ASCII)
	jmp	next_character

put_zero:
	movb	$'0', (%rdi)	# wstawiamy zero do wyniku (ASCII)

next_character:
	inc	%rdi
	shr	$1, %r10
	jnz	write_characters
	jmp	end_program_and_ret

end_program_and_ret:
	movb	$0, (%rdi)	# znak konca linii do tablicy charow	
	ret			# zwrotka z tego co bylo na samym poczatku wskaznikiem do rax

