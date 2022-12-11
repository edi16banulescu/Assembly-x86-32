section .text
	global sort

; struct node {
;     	int val;
;    	struct node* next;
; };

;; struct node* sort(int n, struct node* node);
; 	The function will link the nodes in the array
;	in ascending order and will return the address
;	of the new found head of the list
; @params:
;	n -> the number of nodes in the array
;	node -> a pointer to the beginning in the array
; @returns:
;	the address of the head of the sorted list
sort:
	enter 0, 0

	push ebx
	push edi
	push esi

	mov ecx, [ebp + 8]  					; numarul elementelor
	mov edx, [ebp + 12] 					; vectorul de numere
	mov esi, 0    							; indicele de la primul "for"
	mov ebx, 1    							; numarul cu care comparam

L1:											; cautam elementul care se afla in ebx
	push ecx
	mov ecx, [edx + 8 * esi]				; primul "for"
	cmp ecx, ebx
	je increase
	inc esi									; crestem indicele
	pop ecx
	cmp esi, ecx							; conditia de oprire esi > nr noduri
	jl L1
	jmp return_first

increase:									; crestem ebx pentru a gasi urmatorul element
	inc ebx
	mov edi, 0	  							; indicele de la al doilea "for"
	push ecx
	jmp find_next

find_next:
	mov ecx, [edx + 8 * edi]				; cautam urmatorul numar pentru a il linka
	cmp ebx, ecx
	je add
	inc edi
	jmp find_next

add:										; linkam nodul precedent cu nodul actual
	pop ecx
	lea eax, [edx + 8 * edi]				; incarc adresa nodului actual
	mov [edx + 8 * esi + 4], eax			; o pun in campul "*next" al nodului precedent
	pop ecx
	mov esi, 0								; resetez indicele de la primul "for"
	cmp ebx, ecx							; conditia de oprire ebx > nr de noduri
	jl L1
	jmp return_first

return_first:
	mov ecx, [edx + 8 * esi]				; caut primul element pentru a ii returna adresa in eax
	cmp ecx, 1
	je finish
	inc esi
	jmp return_first

finish:
	lea eax, [edx + 8 * esi]				; incarc adresa primului element in eax


	pop esi
	pop edi
	pop ebx
	leave
	ret
