#include <stdio.h>

typedef unsigned int Word;

#define N_BITS 32

Word reverse_bits(Word w);

int main() {
    printf("%x\n", reverse_bits(0x01234567));
}

Word reverse_bits(Word w) {
    Word reversed = 0;

    for (int i = 0; i < N_BITS; i++) {
        int bit = (w >> i) & 0x1;

        // bit position is 5, reverse bit position is 26
        // bit position is 0, reverse bit position is 31

        // i = 5
        // bit = 0001
        // bit << 26 = 0000 0100 0000 0000 0000 0000 0000 0000

        // reversed = reversed | (bit << (N_BITS - i - 1))
        reversed = reversed | (bit << (N_BITS - i - 1));
    }

    return reversed;
}