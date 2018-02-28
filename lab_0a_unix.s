#----------------------------------------------------------------
# Program lab_0a.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile: as -o lab_0a.o lab_0a.s
#  To link:    ld -o lab_0a lab_0a.o
#  To run:     ./lab_0a
#
#----------------------------------------------------------------

	.data			# wyrażenia od . to dyrektywy assemblera
	
dummy:				# some data
	.byte	0x00		# rezerwujemy miejsce o rozmiarze jednego bajta i nadajemy wartość 0

	.text			# oznacza, że od tego momentu zaczyna się kod programu
				# dane w innym miejscu a kod w innym

	.global _start		# entry point dyrektywa global i jakiś symbol
				# symbol ma być globalny tak mówi dyrektywa .global
				# dla symboli lokalnych odwołania moga być tylko i wyłącznie lokalne
_start:
	JMP	_start


# etykieta, w przypadku assemblera etykieta jest tożsama z adresem
# w trakcie kompilacji adresy zostaną zastąpione konkretnym adresem

