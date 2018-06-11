# -------------------------------
#
# Jakub Adamczyk
#
# unsigned long check_div(long a, long b,long c);
# Jeśli c równe zero to
# a)zwraca 1 jeśli a podzielne przez b
# b)zwraca 0 jeśli a niepodzielne przez b.
# Jeśli c różne od 0 to dzieli a przez liczby z zakresu 1..64 i ustawia odpowiednio bity
# np. jeśli a podzielne przez 1 to najmłodszy bit równy 1, jeśli a niepodzielne przez 2
# to kolejny bit równy 0 itd.
# 
# -------------------------------

.data

    .type   check_div @function
    .global check_div 

.text

check_div:
    cmp     $0, %rdx                # prownanie 3-ciego argumentu do c
    je      check_div_a_b           # skacze do check divisible

    mov     $64, %rcx
    xor     %r10, %r10
    jmp     batch_check             # jesli nie skaczemy do pierwszego przypadku to skoczymy do innego tego trudniejszego

check_div_a_b:                      # funkcja gdy mamy przypadek z 0
    mov     %rdi, %rax              # przeniesienie na potrzeby dzielenia
    xor     %rdx, %rdx
    idiv    %rsi                    # dzielimy rax przez rsi
    cmp     $0, %rdx
    je      return_one
    mov     $0, %rax
    ret

return_one:
    mov     $1, %rax
    ret

batch_check:                        # druga funkcja dla przypadku gdy c nie jest zerem
    cmp     $1, %rcx                # petelka sprawdzamy czy rcx jest wieksze od 64
    jb      return_batch
    xor     %rdx, %rdx              # czyszcze rejestr zeby tam zapisac sobie reste dzielenia
    mov     %rdi, %rax               # wrzucam do dzielnej
    div     %rcx                    # dziele przez to co w rcx czyli nasza zmienna z petli
    shl     $1, %r10
    cmp     $0, %rdx                # sprawdzam czy reszta 0
    je      increment
    dec     %rcx
    jmp     batch_check

increment:
    inc     %r10
    dec     %rcx
    jmp     batch_check

return_batch:
    mov     %r10, %rax
    ret

