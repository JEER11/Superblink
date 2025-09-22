Lab 1 integration notes

- The PDF is for guidance; it is not compiled.
- The GPIO_.inc and memoryMap.inc files are typical assembly include files for register offsets. In this project we use C `#define`s for clarity; if you need them for assembly, place them in `src/lab1/` and `.include` from your `.S` file.
- If assembly is required, add `src/lab1/asm_main.S` and call it from `main()`; keep function names C-callable with `global` symbols.
