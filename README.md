Superblink
=========

Tiny PlatformIO project for an embedded systems lab (ECE395 Lab 1).

Summary
-------
This project implements a simple LED blink exercise for a microcontroller (used as part of ECE395 Lab 1). It contains assembly and C source files that initialize the hardware and blink an LED using timer or GPIO code. The original lab PDF provides background on timers, GPIO configuration, and the expected behavior (periodic LED toggling).

Superblink
=========

Tiny PlatformIO project for an embedded-systems lab (ECE395 Lab 1).

Summary
-------
This project implements a simple LED blink exercise for a microcontroller (part of ECE395 Lab 1).
It includes C and assembly sources that initialize the MCU and toggle an LED using GPIO/timer logic.
The attached lab PDF explains the learning goals: configuring GPIOs, using a hardware timer, and observing periodic LED toggling.

Repository layout
-----------------
- `platformio.ini` - PlatformIO project configuration.
- `src/` - Source files (e.g. `main.c`, `asm_main.S`).
- `include/` - Project headers.
- `lib/` - Libraries used by the project (if any).
- `test/` - Test or verification scaffolding.

Build and upload
----------------
Requirements:
- PlatformIO (VS Code extension or the `platformio` CLI)
- The toolchain for the target MCU (configured via `platformio.ini`)

From the project root, build and upload with PlatformIO:

```powershell
# Build
platformio run

# Upload to the board
platformio run --target upload
```

If you use the PlatformIO VS Code extension, open the folder and use the PlatformIO sidebar to "Build" and "Upload".

Notes
-----
- The code is intended for lab demonstration and learning about low-level MCU programming.
- Inspect `src/asm_main.S` and `src/main.c` for the implementation details.

License
-------
Provided as-is for educational purposes. Add or replace with a suitable open-source license if you plan to publish.
