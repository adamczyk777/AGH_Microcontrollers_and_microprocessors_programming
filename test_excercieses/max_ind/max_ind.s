/*
Funkcja do napisania:
int max_ind(int a, int b, int c, int d)

Ma ona zwr´oci´c indeks dla najwiekszego z po´sr´od podanych argument´ow. Dodatkowo, je˙zeli maksymalan
warto´s´c sie powtarza, funkcja ma zwr´oci´c 0.
Przyk lad dzia lania
1 max ind ( 8 , 1 5 , 1 6 , 2 3 ) == 4
2 max ind ( 4 2 , 2 3 , 1 6 , 1 5 ) == 1
3 max ind ( 4 , 8 , 1 6 , 1 5 ) == 3
4 max int ( 4 2 , 2 3 , 4 2 , 1 5 )
*/

.data
    .type   max_ind, @function
    .global max_ind

.text

max_ind:
    mov     %edi, %r8d
    mov     $1, %r10d
    jmp     comp_b

comp_b:
    cmp     %r8d, %esi
    je      b_same_as_max
    jl      comp_c
    mov     %esi, %r8d
    mov     $2, %r10d
    jmp     comp_c

comp_c:
    cmp     %r8d, %edx
    je      c_same_as_max
    jl      comp_d
    mov     %edx, %r8d
    mov     $3, %r10d
    jmp     comp_d

comp_d:
    cmp     %r8d, %ecx
    je      d_same_as_max
    jl      return_result
    mov     %ecx, %r8d
    mov     $4, %r10d
    jmp     return_result

b_same_as_max:
    mov     %r8d, %r9d
    jmp     comp_c

c_same_as_max:
    mov     %r8d, %r9d
    jmp     comp_d

d_same_as_max:
    mov     %r8d, %r9d
    jmp     return_0

return_result:
    cmp     %r8d, %r9d
    je      return_0
    mov     %r10d, %eax
    ret

return_0:
    mov     $0, %eax
    ret 


