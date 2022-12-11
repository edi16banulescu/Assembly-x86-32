section .text
	global cpu_manufact_id
	global features
	global l2_cache_info

;; void cpu_manufact_id(char *id_string);
;
;  reads the manufacturer id string from cpuid and stores it in id_string
cpu_manufact_id:
	enter 	0, 0
	pusha

	xor eax, eax         				; setam eax = 0
	cpuid
	mov eax, [ebp + 8]					; *id_string
	mov [eax], ebx						; "Genu"
	mov [eax + 4], edx					; "ineI"
	mov [eax + 8], ecx					; "ntel"

	popa
	leave
	ret

;; void features(int *apic, int *rdrand, int *mpx, int *svm)
;
;  checks whether apic, rdrand and mpx / svm are supported by the CPU
;  MPX should be checked only for Intel CPUs; otherwise, the mpx variable
;  should have the value -1
;  SVM should be checked only for AMD CPUs; otherwise, the svm variable
;  should have the value -1
features:
	enter 	0, 0
	pusha

	mov eax, 1
	cpuid
	mov eax, [ebp + 8]					; apic
	and ebx, 0fH						; setam toti bytii 0 in afara de ultimul unde se afla APIC ID
	cmp ebx, 0							; daca APIC id = 0 => are APIC
	je apic

apic:
	mov [eax], dword 1					; setam apic = 1
	popa
	leave
	ret

;; void l2_cache_info(int *line_size, int *cache_size)
;
;  reads from cpuid the cache line size, and total cache size for the current
;  cpu, and stores them in the corresponding parameters
l2_cache_info:
	enter 	0, 0
	
	leave
	ret
