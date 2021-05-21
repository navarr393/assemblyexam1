
#David Navarro
#CPSC240-1 Test 1
# ********************************************


echo "Bash script has started"

rm *.out    # Remove other helper files.
rm *.o
rm *.lis

echo "Assembling resitance.asm"

    # Assemble x86 module.
nasm -f elf64 -l resistance.lis -o resistance.o resistance.asm

echo "Compiling electricity.c"

    # Compile C module.
gcc -c -Wall -m64 -no-pie -o electricity.o electricity.c -std=c11

echo "Linking the object files"

    # Link object files.
gcc -m64 -no-pie -o executable.out -std=c11 resistance.o electricity.o

echo "Running the program"
./executable.out

echo "The bash script file will terminate"