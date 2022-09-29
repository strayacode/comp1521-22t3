# char *string = "....";
# char *s = &string[0];
# int   length = 0;
# while (*s != '\0') {
#    length++;  // increment length
#    s++;       // move to next char
# }

	.data
string:
   	.asciiz  "...."
	   
	.text
# s in $t0, length in $t1
la $t0, string
li $t1, 0

while:
	# *s = loading 1 byte from memory at address s
	lb $t2, ($t0)
	
	beq $t2, 0, epilogue
	
	addi $t1, $t1, 1
	addi $t0, $t0, 1
	
	j while
	
epilogue: