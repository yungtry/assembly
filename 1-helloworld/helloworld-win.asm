global main
extern ExitProcess, GetStdHandle, WriteConsoleA

section .data
	msg                 db "Hello world!", 0
	msg.len             equ $ - msg

section .bss
	buffer_out          resd 1

section .text
main:
	push    -11 ;https://docs.microsoft.com/en-us/windows/console/getstdhandle
	call    GetStdHandle
	push    0
	push    buffer_out
	push    msg.len
	push    msg
	push    eax
	call    WriteConsoleA

exit:
	push    NULL
	call    ExitProcess

