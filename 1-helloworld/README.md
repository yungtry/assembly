nasm -f win32 helloworld-win.asm -o helloworld-win.obj
GoLink /console /entry main helloworld-win.obj kernel32.dll
