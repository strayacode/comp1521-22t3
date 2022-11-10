#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

static uint16_t a;

int main(void)
{
    uint16_t b;

    uint16_t *pa = &a;
    uint16_t *pb = &b;
    uint16_t *pc = malloc(sizeof(uint16_t));

    *pa = 0xAAAA;
    *pb = 0xBBBB;
    *pc = 0xCCCC;

    printf("a:\n\tvalue: 0x%X\n\taddress: %16p\n", *pa, (void *)pa);
    printf("b:\n\tvalue: 0x%X\n\taddress: %16p\n", *pb, (void *)pb);
    printf("c:\n\tvalue: 0x%X\n\taddress: %16p\n", *pc, (void *)pc);
}