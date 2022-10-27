#include <stdint.h>

uint32_t six_middle_bits(uint32_t value);

int main() {
    printf("%08x\n", six_middle_bits(0xF0123410));
}

// 0b0000000100010 000000 0100010000000
uint8_t six_middle_bits(uint32_t value) {
    uint32_t shifted_value = value >> 13;

    return shifted_value & 0x3F;
}