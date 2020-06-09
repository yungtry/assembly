global main
extern GetStdHandle, WriteConsoleA, ExitProcess, ReadConsoleA

section .data
	msg 	db "Type something: ", 0
	msg.len equ $ - msg
	

section .bss     ;buffers declaration
	buffer_out          resd 2
	buffer_in           resd 128
	events_read         resd 1
	buffer_onechar	    resb 4

section .text
main:
    mov ebp, esp; for correct debugging
	push -11
	call GetStdHandle

	push 0
	push buffer_out
	push msg.len
	push msg
	push eax
	call WriteConsoleA

readline:
	push -10
	call GetStdHandle

	push 0
	push events_read
	push 128
	push buffer_in
	push eax
	call ReadConsoleA
move:
	mov eax, [buffer_in]
	mov [buffer_onechar], al

write:
	push -11
	call GetStdHandle

	push 0
	push buffer_out
	push 128
	push buffer_onechar
	push eax
	call WriteConsoleA

exit:
	push    0
	call    ExitProcess
