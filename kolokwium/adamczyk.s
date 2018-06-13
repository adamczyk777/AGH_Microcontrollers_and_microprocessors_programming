# Jakub Adamczyk
/*
	Komentarz na temat programu
	udało się zrobić podział na to gidze skaczemy w zależności od operacji
	zaczęto implementowanie add dla stringów o takiej samej długości
	przechodze na koniec, przechodze sobie po nich i staram się je dodawać
	Sam program nie zwraca stringa, kompiluje się i linkuje, ale wychodzą jakieś śmieci
	Czego brakuje:
	* jest tylko proba zrobienia add reszty brak
	* nie zapamietuje czy powinno nastapic przesuniecie przez to bedzie znak 2, trzeba byloby to 		obsluzyc
	
*/
.data
	len:		.quad 0
	character_pos:	.quad 0
	.type	binary_op, @function
	.global	binary_op
.text
	
binary_op:
	mov	%rdi, %rax	# wrzucam od razu wskaznik tak zeby go zwracac
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

# iteruje do konca stringa zwiekszajac licznik jak bede pozniej zmiejszal
# oraz zmieniam pozycje wskaznika na koneic
not_end:
	incq	len
	inc	%rsi
	inc	%rdi
	inc	%rdx
	jmp	check_len

add_2:
	jmp 	loop		# skacze do petli

loop:
	xor	%r8, %r8
	xor 	%r9, %r9
	mov	(%rsi), %r8	# biore aktualny znak do rejestru
	mov	(%rdx), %r9
	sub	$48, %r8	# obnizam o wartosc ascii 1 i 0 aby byly to liczby 1 0 
	sub	$48, %r9
	add	%r8, %r9	# dodaje ze soba te liczby
	add	$48, %r9
	mov	%r9, (%rdi)	# wrzucam do tablicy znakow res
	jmp	prepare_next_iter

# zmniejszanie indeksu zeby czytac nizsze znaki
prepare_next_iter:
	cmp	$0, len
	je	add_end
	dec	%rdi
	dec	%rsi
	dec	%rdx
	decq	len
	
# zwracam bo adres poczatku wrzucilem do rax na samym początku
add_end:
	ret

# start dla add
and:
	ret

# start dla or
or:
	ret

#start dla xor
xor:
	ret


