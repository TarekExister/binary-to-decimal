.386
.model flat
.data
binary_number	DD		00111111d ; input as decimal
decimal_number	DD		0
.code

main	proc
		
		push ebp
		push ebx
		mov ebp , esp
		sub esp, 12
		mov DWORD PTR [ebp-4],1
		mov ebx , binary_number
		mov [ebp-8], ebx
		lp:
		mov eax, [ebp-8]
		mov ecx, 10
		cdq
		idiv ecx
		mov [ebp-8], eax
		mov  [ebp-12], edx
		mov eax , [EBP-12]
		mov ecx , [EBP-4]
		imul ecx
		add decimal_number , eax
		mov eax , [ebp-4]
		mov ecx , 2
		imul ecx
		mov [ebp-4], eax
		cmp DWORD PTR [ebp-4],0
		jne lp
		mov esp , ebp
		pop ebx
		pop ebp
		ret

main	endp
end