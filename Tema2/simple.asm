%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here
    mov ebx, 0
first:
    xor eax, eax
    mov eax, [esi + ebx]    ; pun litera in eax
    add eax, edx            ; incrementez cu pasul edx
    cmp al, 90              ; compar al care este primul byte din eax cu 'Z'
    jg adaugare_2
    mov [edi + ebx], eax    ; pun noua litera in edi + ebx
    inc ebx                 ; incrementez ebx
    cmp ecx, ebx            ; fac loop la first pana iau toate literele
    jg first
    jmp exit

adaugare_2:
    sub eax, 26             ; daca face overflow peste Z, scad 26
    mov [edi + ebx], eax    ; pun noua litera in edi + ebx
    inc ebx                 ; incrementez ebx
    cmp ecx, ebx            ; fac loop la first pana iau toate literele
    jg first
    jmp exit

exit:                       ; creez conditia de iesire
    popa
    leave
    ret


    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
