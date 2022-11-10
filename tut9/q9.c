#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

void *next_byte(void *byte) {
    return (void *)((char *)byte + 1);
}

int main(void)
{
    uint8_t  chars[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    uint32_t ints[10]  = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

    printf("%16p - %16p\n", (void *)&chars[0], (void *)next_byte(&chars[0]));
    printf("%16p - %16p\n", (void *)&ints[0],  (void *)next_byte(&ints[0]));
}