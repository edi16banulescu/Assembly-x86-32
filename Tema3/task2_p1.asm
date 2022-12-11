section .text
	global cmmmc

;; int cmmmc(int a, int b)
;
;; calculate least common multiple fow 2 numbers, a and b
cmmmc:
	push dword [esp + 4]
	pop eax							; primul numar
	push dword [esp + 8]
	pop edx							; al doilea numar
	 ;PRINTF32 `%d\n\x0`, edx

gcd:
	cmp eax, edx					; conditia de oprire este cand a = b
	jne scadere
	jmp next_step

scadere:							; scaderi repetate in functie de a > b sau a < b
	cmp eax, edx
	jg first
	jmp second

first:								; a > b => a = a - b
	sub eax, edx
	jmp gcd

second:								; a < b => b = b - a
	sub edx, eax
	jmp gcd

next_step:
	push eax
	pop ecx							; salvez cel mai mic divizor comun in ecx

	push dword [esp + 4]
	pop eax							; iau din nou primul numar
	push dword [esp + 8]
	pop edx							; iau din nou al doilea numar

	mul edx							; efectuez a * b
	div ecx							; efectuez (a * b) / cmmdc
 	ret
