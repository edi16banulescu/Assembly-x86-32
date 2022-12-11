%include "../include/io.mac"

section .text
    global is_square
    extern printf

is_square:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; dist
    mov eax, [ebp + 12]     ; nr
    mov ecx, [ebp + 16]     ; sq
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    mov edi, 0
L1:
    push ecx
    push eax
    mov ecx, [ebx + 4 * edi]                        ; iau fiecare element pe rand
    mov ax, 0                                       ; initializari
    mov al, 0
    push ebx
    mov bx, 0                                       ; un contor care ma ajuta sa tin ax sub control
    jmp method

method:
    mul al                                          ; folosesc mul pentru a inmulti din patrat in patrat
    cmp ax, cx
    je perfect_square
    jg not_perfect_square
    inc al
    inc bx
    mov ax, bx                                      ; ax ul creste odata cu al si sunt egali
    jmp method

perfect_square:
    pop ebx
    pop eax
    pop ecx
    mov [ecx + 4 * edi], dword 1                    ; pun 1 daca numarul este patrat perfect
    inc edi
    cmp edi, eax                                    ; conditia de oprire
    jl L1
    jmp exit

not_perfect_square:
    pop ebx
    pop eax
    pop ecx
    mov [ecx + 4 * edi], dword 0                    ; pun 0 daca numarul nu este patrat perfect
    inc edi
    cmp edi, eax                                    ; conditia de oprire
    jl L1
    jmp exit

exit:                                               ; labelul de oprire
    popa
    leave
    ret


    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY