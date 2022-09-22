# // Print every third number from 24 to 42.
# #include <stdio.h>

# int main(void) {
#     // while loop
#     int x = 24;
    
# loop_x_le_42_cond:
# 	if (x >= 42) goto epilogue;
	
# loop_x_le_42_body:
# 	printf("%d\n", x);
# 	x += 3;
	
# 	goto loop_x_le_42_cond;
	
# epilogue:
# 	return 0;
# }

# x in $t0

main:
	li $t0, 24
	
loop_x_le_42_cond:
	bge $t0, 42, epilogue

loop_x_le_42_body:
	move $a0, $t0
	li $v0, 1
	syscall
	
	li $a0, '\n'
	li $v0, 11
	syscall
	
	addi $t0, $t0, 3
	
	j loop_x_le_42_cond

epilogue:
	li $v0, 0
	jr $ra