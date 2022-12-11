%include "../include/io.mac"

section .text
    global beaufort
    extern printf

; void beaufort(int len_plain, char *plain, int len_key, char *key, char tabula_recta[26][26], char *enc) ;
beaufort:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; len_plain
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; len_key
    mov edx, [ebp + 20] ; key (address of first element in matrix)
    mov edi, [ebp + 24] ; tabula_recta
    mov esi, [ebp + 28] ; enc
    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE

;     push ecx
;     mov ecx, 0

; inceput:
;     push eax
;     mov eax, [ebx + ecx]
;     sub ax, 'A'
;     pop eax
;     push ebx
;     push esi
;     mov esi, 1

; find_letter_in_tabula:
;     mov ebx, [edi + eax + 26]
;     cmp bl, [edx + ecx]
;     je print
;     add al, 26
;     inc esi
;     jmp find_letter_in_tabula

; print:
;     PRINTF32 `%hhu\n\x0`, eax
;     sub al, 26
;     cmp al, 26
;     jg print
;     add al, 1
;     mov ebx, esi
;     pop esi
;     mov [esi + ecx], bl
;     pop ebx
;     inc ecx
;     cmp ecx, eax
;     jl inceput
;     pop ecx

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
