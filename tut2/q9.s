# // Simple factorial calculator - without error checking

# #include <stdio.h>

# int main(void) {
# 	int n;
# 	printf("n  = ");
# 	scanf("%d", &n);
	
# 	// 1. convert to while loop
# 	// 2. convert to goto
# 	// 3. finally we can convert the whole program to mips

# 	int fac = 1;
# 	int i = 1;
	
# loop_i_le_n_cond:
# 	if (i > n) goto epilogue;

# loop_i_le_n_body:
# 	fac *= i;
	
# loop_i_le_n_epi:
# 	i++;
	
# 	goto loop_i_le_n_cond;
	
# epilogue:
# 	printf("n! = %d\n", fac);
# 	return 0;
# }

# n in $t0, fac in $t1, i in $t2

main:
	la $a0, prompt_str
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $t1, 1
	li $t2, 1
	
loop_i_le_n_cond:
	bgt $t2, $t0, epilogue
	
loop_i_le_n_body:
	mul $t1, $t1, $t2
	
loop_i_le_n_epi:
	addi $t2, $t2, 1
	
	j loop_i_le_n_cond
	
epilogue:
	la $a0, result_str
	li $v0, 4
	syscall
	
	move $a0, $t1
	li $v0, 1
	syscall
	
	li $a0, '\n'
	li $v0, 11
	syscall

	li $v0, 0
	jr $ra
	
	.data
prompt_str:
	.asciiz "n  = "

result_str:
	.asciiz "n! = "