# Lab 1 Demo Steps (HiFive1‑RevB / FE310)

## Prep
- Connect HiFive1‑RevB via USB; install Segger J‑Link drivers.
- Open this workspace in VS Code. Ensure environment `lab1-asm` is active in `platformio.ini`.

## Build + Upload
1) Build: PlatformIO → Project Tasks → `lab1-asm` → General → `Build`
2) Upload: PlatformIO → Project Tasks → `lab1-asm` → General → `Upload`
   - Or PowerShell:
     ```powershell
     $env:Path="$PWD\.venv\Scripts;$env:Path"
     python -m platformio run -e lab1-asm
     python -m platformio run -e lab1-asm -t upload
     ```

## Debug (recommended for demonstration)
1) Run & Debug (Ctrl+Shift+D) → "PIO Debug" → Start (F5)
2) Set breakpoints in `src/lab1/asm_main.S` at:
   - Both `jal change_value` calls
   - The `change_value` label
   - The `ret` instruction
3) Step and observe:
   - Registers: `ra` (return address), `a1` (address argument), `a3/a4` (compute path)
   - Memory: watch addresses `0x80000000` and `0x80000004` change each loop
     - GDB console examples:
       ```
       info reg ra a1 a3 a4
       x/4wx 0x80000000
       ```

## What to explain while demoing
- `jal` stores PC+4 in `ra` and jumps to the subroutine; `ret` (aka `jalr x0, 0(ra)`) returns to the next instruction.
- The subroutine sequence: `lw` → `addi` → `xori` → `and` → `sw` operates on the word at the address in `a1`.
- We use SRAM at `0x80000000` / `0x80000004` to keep focus on control flow (no MMIO needed).

## Troubleshooting
- If upload/debug fails: close serial monitors; ensure J‑Link drivers; optionally set `upload_protocol = jlink` in `platformio.ini`.
- If debugger doesn’t halt initially: press the board reset after starting the session.
