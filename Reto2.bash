nasm -f elf64 -g Reto2.asm -o Reto2.o
ld Reto2.o -o Reto2
gdb -x Reto2.gdb
./Reto2