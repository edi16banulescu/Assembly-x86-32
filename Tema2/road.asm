%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global road
    extern printf

road:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]      ; points
    mov ecx, [ebp + 12]     ; len
    mov ebx, [ebp + 16]     ; distances
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    mov edi, 0                                                     ; pasul lui x1
    mov esi, 1                                                     ; pasul lui x2
L1:
    push ecx
    mov ecx, [eax + point_size * edi + point.x]                    ; iau x1 in ecx
    mov edx, [eax + point_size * esi + point.x]                    ; iau x2 in edx
    cmp cl, dl                                                     ; compar x1 si x2 daca sunt egali
    je distanta_y                                                  ; calculez distanta y-ilor
    xor ecx, ecx
    xor edx, edx
    mov ecx, [eax + point_size * edi + point.y]                    ; iau y1 in ecx
    mov edx, [eax + point_size * esi + point.y]                    ; iau y2 in edx
    cmp cl, dl                                                     ; compar y1 si y2
    je distanta_x                                                  ; calculez distanta x-ilor
    jmp exit

distanta_y:
    mov ecx, [eax + point_size * edi + point.y]                    ; pun y ul in ecx
    mov edx, [eax + point_size * esi + point.y]                    ; pun urmatorul y in edx
    cmp cl, dl                                                     ; compar y1 si y2
    jg scadere_y                                                   ; daca y1 e mai mare decat y2
    sub dl, cl                                                     ; scad din y2 pe y1
    mov [ebx + 4 * edi], dl                                        ; pun rezultatul in ebx
    inc edi                                                        ; incrementez
    inc esi
    pop ecx
    cmp esi, ecx                                                   ; conditia de oprire
    jl L1
    jmp exit

scadere_y:
    sub cl, dl                                                     ; scad din y1 pe y2
    mov [ebx + 4 * edi], cl                                        ; pun rezultatul in ebx
    inc edi                                                        ; incrementez
    inc esi                             
    pop ecx
    cmp esi, ecx                                                   ; conditia de oprire
    jl L1
    jmp exit

distanta_x:
    mov ecx, [eax + point_size * edi + point.x]                    ; pun x1 ul in ecx
    mov edx, [eax + point_size * esi + point.x]                    ; pun urmatorul x in edx
    cmp cl, dl                                                     ; compar x1 cu x2
    jg scadere_x                                                   ; verific care e mai mare
    sub edx, ecx                                                   ; scad din x2 pe x1
    mov [ebx + 4 * edi], edx                                       ; pun rezultatul in ebx
    inc edi                                                        ; incrementez
    inc esi             
    pop ecx
    cmp esi, ecx                                                   ; conditia de oprire
    jl L1
    jmp exit

scadere_x:
    sub ecx, edx                                                   ; scad din x1 pe x2
    mov [ebx + 4 * edi], ecx                                       ; pun rezultatul in ebx
    inc edi                                                        ; incrementez
    inc esi
    pop ecx
    cmp esi, ecx                                                   ; conditia de oprire
    jl L1
    jmp exit

exit:                                                              ; labelul de oprire
    popa
    leave
    ret


    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY