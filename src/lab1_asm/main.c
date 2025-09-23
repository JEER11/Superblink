// Minimal C entry that repeatedly calls the assembly demo
extern void asm_main(void);

int main(void)
{
    for(;;) {
        asm_main();
    }
    return 0;
}
