# // A simple program that adds 42 to each element of an array

# #define N_SIZE 10

# int main(void) {
#     int i;
#     int numbers[N_SIZE] = {0, 1, 2, -3, 4, -5, 6, -7, 8, 9};

#     i = 0;
#     while (i < N_SIZE) {
#         if (numbers[i] < 0) {
#             numbers[i] += 42;
#         }
#         i++;
#     }
# }

# i in $t0

# numbers[i] += 42;
# load numbers[i] memory into register
# add 42 to that register
# store that register data to memory (&numbers[i])

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
	
	bge $t4, 0, i_lt_n_size_cont
	
	addi $t4, $t4, 42
	
	# t3 = address of &numbers[i]
	sw $t4, ($t3)
	
i_lt_n_size_cont:
	addi $t0, $t0, 1
	j i_lt_n_size

epilogue:
	li $v0, 0
	jr $ra
	
	.data
numbers:
	.word 0, 1, 2, -3, 4, -5, 6, -7, 8, 9