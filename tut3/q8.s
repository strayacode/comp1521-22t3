# // A short program that reverses an array by swapping elements.

# #define N_SIZE 10
# #define N_SIZE_M_1 N_SIZE - 1
# #define N_SIZE_D_2 N_SIZE / 2

# #include <stdio.h>

# int main(void) {
#     int i;
#     int numbers[N_SIZE] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};

#     i = 0;
#     while (i < N_SIZE_D_2) {
#         int x = numbers[i];
#         int y = numbers[N_SIZE_M_1 - i];

#         numbers[i] = y;
#         numbers[N_SIZE_M_1 - i] = x;

#         i++;
#     }
# }

# i in $t0, x in $t4, y in $t6

N_SIZE = 10
N_SIZE_M_1 = N_SIZE - 1
N_SIZE_D_2 = N_SIZE / 2

	.text
main:
	li $t0, 0
	
i_lt_n_size:
	bge $t0, N_SIZE_D_2, epilogue
	
	# int x = numbers[i]
	# &numbers[i] = numbers + (i * 4) in $t3
	la $t1, numbers
	mul $t2, $t0, 4
	add $t3, $t1, $t2
	lw $t4, ($t3)
	
	# int y = numbers[N_SIZE_M_1 - i];
	# &numbers[N_SIZE_M_1 - i] = numbers + ((N_SIZE_M_1 - i) * 4) in $t5
	sub $t5, N_SIZE_M_1, $t0
	mul $t5, $t5, 4
	add $t5, $t5, numbers
	lw $t6, ($t5)
	
	# numbers[i] = y
	sw $t6, ($t3)
	
	# numbers[N_SIZE_M_1 - i] = x;
	sw $t4, ($t5)
	
	addi $t0, $t0, 1
	
	j i_lt_n_size

epilogue:
	jr $ra

	.data
numbers:
	.word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9