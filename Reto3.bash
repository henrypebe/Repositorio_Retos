nasm -f elf64 -g Reto3.asm -o Reto3.o
ld Reto3.o -o Reto3
gdb -x Reto3.gdb
./Reto3