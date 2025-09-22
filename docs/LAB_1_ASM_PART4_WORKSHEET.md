Lab 1 – Part 4: Conditional Branching (Observation Sheet)

Instructions
- Build env `lab1-asm-part4` and upload.
- Start a debug session; break at `asm_main` in `src/lab1/asm_main_part4.S`.
- Step and observe which label is reached depending on `a1` vs `a2` and zero detection.
- Try changing `li a1, 0xDEADBEEF` to `0x0` or `0x1` and rebuild, then observe path changes.

Branch conditions
* beq a1, a2, spot1 → taken if a1 == a2
* beqz a1, spot2    → taken if a1 == 0
* bne a1, a2, spot3 → taken if a1 != a2

Record
* PC at spot1: __________ (if taken)
* PC at spot2: __________ (if taken)
* PC at spot3: __________ (if taken)