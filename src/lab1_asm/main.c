// Lab 1 Part 1: C main that calls asm_main
// Demonstrates moving data between registers and memory as per lab steps.
#include <stdint.h>

extern void asm_main(void);

int main(void)
{
    // Call the assembly routine to perform the loads/stores and register moves
    asm_main();

    // Spin forever so you can attach a debugger and inspect registers/memory
    for (;;) { }
}
