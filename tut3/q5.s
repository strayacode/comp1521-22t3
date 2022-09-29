# // A simple program that will read 10 numbers into an array

# #define N_SIZE 10

# #include <stdio.h>

# int main(void) {
#     int i;
#     int numbers[N_SIZE] = {0};

#     i = 0;
#     while (i < N_SIZE) {
#         scanf("%d", &numbers[i]);
#         i++;
#     }
# }

# i in $t0

N_SIZE = 10

	.text
main:
	li $t0, 0
	
i_lt_n_size:
	bge $t0, N_SIZE, epilogue
	
	# &numbers[i] = numbers + (i * 4)
	la $t1, numbers
	mul $t2, $t0, 4
	add $t3, $t1, $t2
	
	li $v0, 5
	syscall
	
	# v0 = scanned in value
	sw $v0, ($t3)
	
	addi $t0, $t0, 1
	
	j i_lt_n_size
	
epilogue:
	jr $ra
	
	.data
numbers:
	.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0