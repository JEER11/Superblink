#include <stdint.h>

// HiFive1-RevB UART0 base and registers (SiFive FE310)
#define UART0_BASE      0x10013000UL
#define UART_TXDATA     0x00
#define UART_RXDATA     0x04
#define UART_TXCTRL     0x08
#define UART_RXCTRL     0x0C
#define UART_IE         0x10
#define UART_IP         0x14
#define UART_DIV        0x18

#define GPIO_BASE       0x10012000UL
#define GPIO_IOF_EN     0x038
#define GPIO_IOF_SEL    0x03C

static inline volatile uint32_t* REG(uint32_t base, uint32_t off) { return (volatile uint32_t*)(base + off); }

static void uart_init(uint32_t baud)
{
    // Route UART0 pins to IOF (GPIO16=RX, GPIO17=TX on HiFive1-RevB default)
    const uint32_t IOF0_UART0_MASK = (1u << 16) | (1u << 17);
    volatile uint32_t* iof_en  = REG(GPIO_BASE, GPIO_IOF_EN);
    volatile uint32_t* iof_sel = REG(GPIO_BASE, GPIO_IOF_SEL);
    *iof_sel &= ~IOF0_UART0_MASK;   // Select IOF0
    *iof_en  |= IOF0_UART0_MASK;    // Enable IOF on these pins

    // Set divisor: div = f_cpu / baud - per FE310, divisor for txclk
    // Assuming ~16 MHz default; adjust if you’ve set PLL/clock elsewhere
    uint32_t fcpu = 16000000u;
    uint32_t div = (fcpu / baud);
    if (div == 0) div = 1;
    *REG(UART0_BASE, UART_DIV) = div;

    // Enable TX and RX, 1 stop bit, no parity
    *REG(UART0_BASE, UART_TXCTRL) = 0x1; // txen
    *REG(UART0_BASE, UART_RXCTRL) = 0x1; // rxen

    // Disable UART interrupts (polling mode)
    *REG(UART0_BASE, UART_IE) = 0;
}

static void uart_write_byte(uint8_t b)
{
    // TXDATA bit31 is full flag; wait until not full
    while ((*REG(UART0_BASE, UART_TXDATA) & (1u << 31)) != 0) { }
    *REG(UART0_BASE, UART_TXDATA) = b;
}

static int uart_read_byte_nonblock(uint8_t* out)
{
    uint32_t v = *REG(UART0_BASE, UART_RXDATA);
    if (v & (1u << 31)) {
        return 0; // empty
    }
    *out = (uint8_t)(v & 0xFF);
    return 1;
}

int main(void)
{
    uart_init(115200);

    // Simple echo: read when available and echo back
    for (;;) {
        uint8_t ch;
        if (uart_read_byte_nonblock(&ch)) {
            // Add simple CRLF handling: convert '\r' to '\r\n'
            if (ch == '\r') {
                uart_write_byte('\r');
                uart_write_byte('\n');
            } else {
                uart_write_byte(ch);
            }
        }
    }
}
