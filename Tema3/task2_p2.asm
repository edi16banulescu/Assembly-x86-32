section .text
	global par

;; int par(int str_length, char* str)
;
; check for balanced brackets in an expression
par:
	push dword [esp + 4]
	pop ecx							; str_length
 	push dword [esp + 8]
 	pop eax							; str ul nostru
 	push dword 0
 	pop esi   						; pasul pentru sir
	push dword 0
	pop edi   						; nr_paranteze_deschise
	push dword 0
	pop edx   						; nr_paranteze_inchise

L1:
	push ecx						; pun str_length pe stiva pentru a ma folosi de ecx
	push dword [eax + esi]
	pop ecx   						; paranteza curenta
	cmp cl, 40						; verific ce fel de paranteza este
	je nr_paranteze_deschise
	jmp nr_paranteze_inchise

nr_paranteze_deschise:
	inc edi							; incrementez numarul parantezelor deschise
	inc esi							; incrementez pasul
	pop ecx
	cmp esi, ecx					; conditia de oprire
	jl L1
	jmp final

nr_paranteze_inchise:
	inc edx							; incrementez numarul parantezelor inchise
	inc esi							; incrementez pasul
	pop ecx
	cmp esi, ecx					; conditia de oprire
	jl L1
	jmp final

final:
	cmp edi, edx					; verific daca numar paranteze deschise = numar paranteze inchise
	je balanced
	jmp not_balanced

balanced:
	push dword 1					; sirul este balansat
	pop eax
	ret

not_balanced:
	push dword 0					; sirul nu este balansat
	pop eax
	ret
