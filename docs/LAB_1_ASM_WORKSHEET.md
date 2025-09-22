Lab 1 Part 1 – Assembly Observation Notes

Goal: Step through `asm_main` and observe register and memory values after each instruction.

Instructions
- Build env `lab1-asm` and upload.
- Start a debug session; set a breakpoint at `asm_main`.
- Single-step and record values after each instruction as the lab asks.

Key symbols
- `offset = 0x80000000`
- `data   = 0xDEADBEEF`
- Memory location used: `[offset]`

What to observe
- After `li a1, data`: a1 = 0xDEADBEEF
- After `li a2, offset`: a2 = 0x80000000
- After `sw a1, (a2)`: mem[0x80000000] = 0xDEADBEEF
- After `lw a3, (a2)`: a3 = 0xDEADBEEF
- After `lh a4, (a2)`: a4 = low half of 0xDEADBEEF (endianness! expect 0xBEEF)
- After `lb a5, (a2)`: a5 = lowest byte of 0xDEADBEEF (expect 0xEF)
- After `mv a2, a1`: a2 = 0xDEADBEEF
- After `mv a1, x0`: a1 = 0x00000000

Note: Values update only after the instruction retires.