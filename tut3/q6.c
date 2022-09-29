# // A simple program that will print 10 numbers from an array

# #define N_SIZE 10

# #include <stdio.h>

# int main(void) {
#     int i;
#     int numbers[N_SIZE] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};

#     i = 0;
#     while (i < N_SIZE) {
#         printf("%d\n", numbers[i]);
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
	lw $t4, ($t3)
	
	# t4 = numbers[i]
	
	move $a0, $t4
	li $v0, 1
	syscall
	
	li $a0, '\n'
	li $v0, 11
	syscall
	
	addi $t0, $t0, 1
	
	j i_lt_n_size

epilogue:
	jr $ra
	
	.data
numbers:
	.word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
	