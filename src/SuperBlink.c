// Minimal GPIO blink for HiFive1 Rev B (SiFive FE310)
#include <stdint.h>
#include "SuperBlink.h"

#define GPIO_BASE           0x10012000UL
#define GPIO_OUTPUT_EN      0x008
#define GPIO_OUTPUT_VAL     0x00C
#define GPIO_IOF_EN         0x038
#define GPIO_IOF_SEL        0x03C

static inline volatile uint32_t* reg32(uint32_t base, uint32_t off) {
    return (volatile uint32_t*)(base + off);
}

void delay(int milliseconds)
{
    // Crude busy-wait: FE310 default core ~16 MHz on HiFive1; tune as needed
    // cycles per ms rough guess; avoid long 32-bit overflow
    volatile uint32_t cycles = (uint32_t)milliseconds * 8000u;
    while (cycles--) {
        __asm__ __volatile__("nop");
    }
}

void setupGPIO()
{
    volatile uint32_t* iof_en  = reg32(GPIO_BASE, GPIO_IOF_EN);
    volatile uint32_t* iof_sel = reg32(GPIO_BASE, GPIO_IOF_SEL);
    volatile uint32_t* out_en  = reg32(GPIO_BASE, GPIO_OUTPUT_EN);

    // Ensure RGB LED pins are under GPIO control (disable IOF)
    uint32_t rgb_mask = (RED_LED | BLUE_LED | GREEN_LED);
    *iof_en &= ~rgb_mask;
    *iof_sel &= ~rgb_mask;

    // Enable output on the LED pins
    *out_en |= rgb_mask;
}

int setLED(int color, int state)
{
    volatile uint32_t* out_val = reg32(GPIO_BASE, GPIO_OUTPUT_VAL);
    if (state == ON) {
        *out_val |= (uint32_t)color;
    } else {
        *out_val &= ~((uint32_t)color);
    }
    return 0;
}

int main()
{
    int error = 0;
    int ledNum = 0;
    int colors[NUM_LEDS] = {GREEN_LED, RED_LED, BLUE_LED};

    setupGPIO();
    
    while(!error) {
        setLED(colors[ledNum], ON);
        delay(DELAY);
        error = setLED(colors[ledNum], OFF);
        delay(DELAY);
        ledNum = (ledNum + 1) % NUM_LEDS;
    }

    return 0;
}