# -------------------------------
#
# Jakub Adamczyk
# 
# unsigned int check_tab(int* tab, int n, int* max)
# 
# a wejsciu tablica n elementow z zewnatrz; sprawdzic elementy tablicy pod katem
# występowania wrtosci od 0 do 63, nastepnie policzyc ile razy ktorys tam element
# sie pojawil, np 0 pojawilo sie iles razy, dwojka iles razy (zliczamy wystapienia),
# poprzez wskaznik przekazany w trzecim argumencie zwrocic maksimum wystapień;
# Funckja ma zwrocic wartosc w postaci 64 bitow - kazdy bit okresla wystapienie
# liczby odpowiadajacej temu bitowi, np jesli byla dwojka w tablicy to ma sie pojawic
# jedynka na pozycji 3, ostatni bit odpowiada za liczbe 63
# (wynik funkcji - ktore liczby sie pojawily, maks mowi o tym ile razy pojawila sie
# najczesciej wystepujaca liczba)
# 
# -------------------------------

.data

    tab_position:   .quad 0

    .type           check_tab @function
    .global         check_tab


.text

check_tab:
    mov     $63, %r8
    jmp     loop_numbers

loop_numbers:
    cmp     $0, %r8
    jl      exit_loop_numbers
    jmp     end_loop_numbers

loop_tab_elements:


end_loop_tab_elements:


end_loop_numbers:
    dec     %r8
    jmp     loop_numbers

exit_loop_numbers:
    mov     $1, %rax
    ret
