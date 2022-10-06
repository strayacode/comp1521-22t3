// This program prints out a danish flag, by
// looping through the rows and columns of the flag.
// Each element inside the flag is a single character.
// (i.e., 1 byte).
//
// (Dette program udskriver et dansk flag, ved at
// sløjfe gennem rækker og kolonner i flaget.)
//

#include <stdio.h>

#define FLAG_ROWS 6
#define FLAG_COLS 12

char flag[FLAG_ROWS][FLAG_COLS] = {
    {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'},
    {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'},
    {'.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'},
    {'.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'},
    {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'},
    {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'}
};

int main(void) {
    for (int row = 0; row < FLAG_ROWS; row++) {
        for (int col = 0; col < FLAG_COLS; col++) {
            printf("%c", flag[row][col]);
        }
        printf("\n");
    }
}

FLAG_ROWS = 6
FLAG_COLS = 12
        
# row in $t0, col in $t1
main:
        li $t0, 0
        
main_row_lt_flag_rows:
        bge $t0, FLAG_ROWS, main_epilogue
        
        li $t1, 0
        
main_col_lt_flag_cols:
        bge $t1, FLAG_COLS, main_row_lt_flag_rows_cont
        
        # &flag[row][col] = flag + (row * FLAG_COLS * sizeof element) + (col * sizeof element)
        la $t2, flag
        mul $t3, $t0, FLAG_COLS
        add $t4, $t2, $t3
        add $t4, $t4, $t1
        
        lb $a0, ($t4)
        li $v0, 11
        syscall
        addi $t1, $t1, 1
        
        j main_col_lt_flag_cols

main_row_lt_flag_rows_cont:
        li $a0, '\n'
        li $v0, 11
        syscall
        
        addi $t0, $t0, 1
        
        j main_row_lt_flag_rows

main_epilogue:
        jr $ra

        .data
flag:
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#',
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#',
        .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.',
        .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.',
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#',
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'