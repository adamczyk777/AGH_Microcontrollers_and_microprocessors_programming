# Jakub Adamczyk
/*
 	Poprawilem kod tak aby dzialal (chyba) zgodnie z zalozeniami zadania calego a nie wersji minimalnej
	Na zajeciach, na ktorych pozwolil Pan poprawiac, napisalem tylko add i to dosyc nieudolnie
	W tej wersji powinny dzialac wszystkie operacje wymienione w zadaniu.
	Zgodnie z Pana sugestia obcinam takze bezsensowne zera na poczatku, co daje nam liczbe binarna, ktora ma dlugosc
	tylko taka jaka jest potrzebna.
	Dla numeru operacji innego niz wspierany wyprintuje sie string ERROR

	Zgodnie z tym co zauwazyl Pan na konsultacjach, ten kod nie zadziala poprawnie dla dluzszego niz 64 znaki lancucha
	Wydaje mi sie ze lancuch zostanie obciety najstarsze bity zostana utracone, poniewaz wypadna z zakresu 64 bitowego rejestru

	Nic pan nie wspominal o tym ze mozna poprawic w domu, postanowilem jednak sprobowac. 
	Nie zalezy mi na wyzszej ocenie, interesuje mnie jedynie 3.0 i zaliczenie przedmiotu.
*/
.data
	.type	binary_op, @function
	.global	binary_op
.text
	
binary_op:
	mov		%rdi, %rax			# wrzucam od razu wskaznik tak zeby go zwracac
	cmp		$4, %rcx
	jge 	error
	jmp 	read_number			# przeczytamy sobie liczby otrzymane na wejsciu
	
read_number:					# tu czytamy liczby do rejestrow r8 i r9
	xor		%r8, %r8			# czyszcze rejestry zeby nic nam nie bruzdzilo i nie bylo smieci
	xor		%r9, %r9
	jmp 	arg1_to_num
	
arg1_to_num:					# pierwszy argument
	cmpb	$0, (%rsi)			# sprawdzamy czy nie czytamy znaku konca stringa
	je 		arg2_to_num
	shl		$1, %r8				# przesuwamy bit dalej zeby wpisywac liczby zgodnie z pozycja
	cmpb	$'0', (%rsi)		# jak jest zero to nie wpisujemy nic i przechodzimy dalej
	je		arg1_to_num_2		# zostawiamy bit 0, czytamy kolejny znak
	inc		%r8					# znak to '1', czyli najmlodszy przeczytany bit to 1

arg1_to_num_2:
	inc		%rsi				# inkrementujemy czyli czytamy dalej argument
	jmp		arg1_to_num

arg2_to_num:					# tutaj robimy to samo dla drugiego argumentu
	cmpb	$0, (%rdx)
	je		select_correct_path # przechodzimy do selekcji operacji
	shl		$1, %r9	
	cmpb	$'0', (%rdx)
	je		arg2_to_num_2
	inc		%r9

arg2_to_num_2:
	inc		%rdx
	jmp 	arg2_to_num

select_correct_path:			# tutaj wybieramy operacje lub dostajemy error ze operacja jest nie taka jak trzeba
	cmp		$0, %rcx
	je		add_op				# skok dla operacji dodawania
	cmp		$1, %rcx
	je 		and_op				# skok dla operacji and
	cmp		$2, %rcx
	je 		or_op				# skok dla operacji or
	cmp		$3, %rcx
	je		xor_op				# skok dla operacji xor 
	
# operacja add
add_op:
	add		%r9, %r8 			# operacja dodawania
	jmp		from_num_to_str

# start dla and
and_op:
	and		%r9, %r8			# zwykla operacja and na liczbach
	jmp 	from_num_to_str

# start dla or
or_op:
	or		%r9, %r8			# zwykla operacja or na dwoch liczbach
	jmp 	from_num_to_str

# start dla xor
xor_op:
	xor		%r9, %r8			# xor na dwoch liczbach
	jmp 	from_num_to_str

error:							# w przypadku ustawimy w rdi napis ERROR
	movb	$'E', (%rdi)
	inc		%rdi
	movb	$'R', (%rdi)
	inc		%rdi
	movb	$'R', (%rdi)
	inc		%rdi
	movb	$'O', (%rdi)
	inc		%rdi
	movb	$'R', (%rdi)
	inc		%rdi
	movb	$0, (%rdi)
	ret

from_num_to_str:
	xor		%r10, %r10
	mov		$1, %r10			# maska do sprawdzania kolejno zapisanych bitow w naszej liczbie
	shl		$63, %r10			# zczynamy tak ze jest najstarszym bitem, potem przesuwamy w prawo az cala wartosc bedzie 0 co zakonczy program
	xor		%rcx, %rcx
	mov		$0, %rcx			# ustawiamy sobie rcx, ktorego juz nie potrzebujemy bo znamy operacje jako flage czy pojawila sie pierwsza jedynka
	jmp 	write_characters

write_characters:
	test	%r10, %r8			# and porownujacy z maska nie zapisuje wartosci do rejestru dziala jak cmp
	jz		consider_putting_zero
	jmp		put_one

consider_putting_zero:
	cmp		$1, %rcx
	je		put_zero
	shr		$1, %r10
	jnz 	write_characters
	jmp 	end_program_and_return

put_zero:
	movb	$'0', (%rdi)		# doklejamy do lancucha znakow 0
	jmp		prepare_for_next_character

put_one:						# doklejamy do lancucha znakow 1
	movb	$'1', (%rdi)
	cmp		$1, %rcx
	jne		set_rcx_flag_to_true
	jmp		prepare_for_next_character

set_rcx_flag_to_true:
	xor		%rcx, %rcx
	mov 	$1, %rcx
	jmp 	prepare_for_next_character

prepare_for_next_character:
	inc		%rdi
	shr		$1, %r10
	cmp		$0, %r10
	jne		write_characters
	jmp		end_program_and_return

end_program_and_return:
	movb	$0, (%rdi)			# znak konca linii do lancucha znakow na jego koniec
	ret							# zwrotka z tego co bylo na samym poczatku wskaznikiem do rax

