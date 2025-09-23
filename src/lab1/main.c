// Lab 1 Part 1: C main that repeatedly calls asm_main (matches lab snippet)
#include <stdio.h>
void asm_main();

int main()
{
    while (1)
        asm_main();
    return 1;
}
