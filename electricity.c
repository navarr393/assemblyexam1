//David Navarro
//CPSC240-1 Test 1

#include <stdio.h>
#include <stdint.h>

extern double resistance(); //name in asm label (ex. global start)

int main()
{
   double result_code = 1.0;
    
 printf("Welcome to the Electric Resistance Calculator programmed by David Navarro.\n");
    result_code = resistance();
 printf("The Electricity module received this number %lf and will keep it.\n", result_code);
 printf("Have a very nice evening. Electricity will now return 0 to the operating system. Bye\n");
 return 0;
}