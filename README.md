# SuperBlink + Lab1 UART

This PlatformIO project contains two build environments for the HiFive1‑RevB (SiFive FE310):

- env:hifive1-revb: RGB LED blink using GPIO.
- env:lab1-uart: UART echo at 115200 baud.

## Build

```powershell
# Build the blink app
pio run -e hifive1-revb

# Build the Lab 1 UART echo app
pio run -e lab1-uart
```

## Upload

```powershell
pio run -e hifive1-revb -t upload
pio run -e lab1-uart -t upload
```

## Serial monitor

```powershell
pio device monitor --baud 115200
```

Type in the monitor; characters should echo back.
