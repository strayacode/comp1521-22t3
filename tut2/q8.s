# // Prints a right - angled triangle of asterisks, 10 rows high.

# #include <stdio.h>

# int main(void) {
# 	int i = 1;
	
# 	// regular while loop
# 	while (i <= 10) {
# 		int j = 0;
		
# 		while (j < i) {
# 			printf("*");
# 			j++;
# 		}
		
# 		printf("\n"); 

# 		i++;
# 	}

# 	// goto version
# loop_i_le_10:
# 	if (i > 10) goto epilogue;
	
# 	int j = 0;
	
# loop_j_lt_i:
# 	if (j >= i) goto loop_i_le_10_epi;
	
# 	printf("*");
# 	j++;
	
# 	goto loop_j_lt_i;
	
# loop_i_le_10_epi:
# 	printf("\n"); 

# 	i++;
	
# 	goto loop_i_le_10;
	
# epilogue:
# 	return 0;
# }

# i in $t0, j in $t1

main:
	li $t0, 1
	
loop_i_le_10:
	bgt $t0, 10, epilogue
	
	li $t1, 0
	
loop_j_lt_i:
	bge $t1, $t0, loop_i_le_10_epi
	
	li $a0, '*'
	li $v0, 11
	syscall
	
	addi $t1, $t1, 1
	
	j loop_j_lt_i
	
loop_i_le_10_epi:
	li $a0, '\n'
	li $v0, 11
	syscall

	addi $t0, $t0, 1
	
	j loop_i_le_10
	
epilogue:
	li $v0, 0
	jr $ra