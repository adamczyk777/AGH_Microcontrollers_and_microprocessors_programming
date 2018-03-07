#----------------------------------------------------------------
# Program lab_1.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile: as -o lab_1.o lab_1.s
#  To link:    ld -o lab_1 lab_1.o
#  To run:     ./lab_1
#
#----------------------------------------------------------------

	.equ	write_64, 1	    # write data to file function (64bit)
	.equ	exit_64, 60	    # exit program function (64bit)
	.equ	stdout, 0x01	# handle to stdout

	.data

starttxt:			# first message
	.ascii	    "Start/n"
endtxt:				# second message
	.ascii	    "Finish/n"
arg1:				# first argument
	.byte		1
arg2:				# second argument
	.word		2
arg3:				# third argument
	.long		3
result:				# result
	.long		0

	.equ	startlen, endtxt - starttxt
	.equ	endlen, arg1 - endtxt

	.text
	.global _start

_start:
    # POSTFIXY dla MOV
    # B - 1 byte
    # W - 2 bytes
    # L - 4 bytes
    # Q - 8 bytes
	MOV	    $write_64,%rax        # Instrukcja przeniesienia danych z jednego miejsca w drugie
	MOVQ	$stdout,%rdi            # MOVB 1 bajt MOVW 2 bajty MOVL 4 bajty MOVQ 8 bajtów
	MOV	    $starttxt,%rsi
	MOVQ	$startlen,%rdx
	SYSCALL

	NOP

	MOVB	arg1,%al								# Nie mozemy wrzucić małej ilości danych do duzego rejestru rejestr musi być taki sam jak rozmiar danych przenoszonych
	MOVW	arg2,%ax
	MOVL	arg3,%ecx
	# BASIC arithmetic operations, addition subtractions
	# Wynik jest zapisywany w drugim podanym w argumentach rejestrze
	ADD	    %ebx,%eax
	SUB	    %ecx,%eax
	MOVL	%eax,result

	NOP

	MOV	    $write_64,%rax          # używamy rejerstów 64 bitowych, dlatego rozpoczynaja się od litery r, 32 bitowe zaczynają się od litery
	MOVQ	$stdout,%rdi
	MOV	    $endtxt,%rsi
	MOVQ	endlen,%rdx
	SYSCALL                         # SYSCALL

	NOP

theend:
	MOV	$exit_64,%rax
	SYSCALL

# ---------------------------NOTES------------------------------------------------------------------------------
# to z % to są rejestry
# %rax to rejestr 64 bitowy
# %eax to czesc 32 bitowa rejestru ax
# % możemy też wziac 16 bitow czyli %ax
# lub nawet po 8 bitów %ah lub %al
#
# ---------------------------------------------------------------------------------------------------------------
