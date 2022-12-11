%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global points_distance
    extern printf

points_distance:
    ;; DO NOT MODIFY
    
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; points
    mov eax, [ebp + 12]     ; distance
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    mov ecx, [ebx + point.x]                    ; iau x1 in ecx
    mov edx, [ebx + point_size + point.x]       ; iau x2 in edx
    cmp cl, dl                                  ; compar x1 si x2 daca sunt egali
    je distanta_y                               ; calculez distanta y-ilor

    mov ecx, [ebx + point.y]                    ; iau y1 in ecx
    mov edx, [ebx + point_size + point.y]       ; iau y2 in edx
    cmp cl, dl                                  ; compar y1 si y2
    je distanta_x                               ; calculez distanta x-ilor
    jmp exit

distanta_y:
    mov ecx, [ebx + point.y]                    ; pun y ul in ecx
    mov edx, [ebx + point_size + point.y]       ; pun urmatorul y in edx
    cmp cl, dl                                  ; compar y1 si y2
    jg scadere_y                                ; daca y1 e mai mare decat y2
    sub dl, cl                                  ; scad din y2 pe y1
    mov [eax], dl                               ; pun rezultatul in eax
    jmp exit

scadere_y:
    sub ecx, edx                                ; scad din y1 pe y2
    mov [eax], ecx                              ; pun rezultatul in eax
    jmp exit

distanta_x:
    mov ecx, [ebx + point.x]                    ; pun x1 ul in ecx
    mov edx, [ebx + point_size + point.x]       ; pun urmatorul x in edx
    cmp cl, dl                                  ; compar x1 cu x2
    jg scadere_x                                ; verific care e mai mare
    sub edx, ecx                                ; scad din x2 pe x1
    mov [eax], edx                              ; pun rezultatul in eax
    jmp exit

scadere_x:
    sub ecx, edx                                ; scad din x1 pe x2
    mov [eax], ecx                              ; pun rezultatul in eax
    jmp exit

exit:                                           ; labelul de oprire
    ;PRINTF32 `%d\n\x0`, [eax]
    popa
    leave
    ret



    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret

    ;; DO NOT MODIFY