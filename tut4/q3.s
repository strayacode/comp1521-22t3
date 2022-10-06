# // C function to find the largest element in an array, recursively.
# // Returns the value of the largest element in the array.
# // 
# // array:  Array to search
# // length: Number of elements in the array
# int max(int array[], int length) {
#     // 
#     int first_element = array[0];
#     if (length == 1) {
#         // Handle the base-case of the recursion, at the end of the array.
#         return first_element;
#     } else {
#         // Recurse on the rest of the array.
#         // Finds the largest element after first_element in the array.
#         int max_so_far = max(&array[1], length - 1);
#         // Compare this element with the largest element after it in the array.
#         if (first_element > max_so_far) {
#             max_so_far = first_element;
#         }
#         return max_so_far;
#     }
# }

# rule 1: if a function calls another function, you need to save $ra to the stack
# rule 2: if you use an s register, you must push and pop it in the function

# first_element in $s0
max:
max_prologue:
	push $ra
	push $s0
	
	lw $s0, ($a0)
	
	bne $a1, 1, max_length_ne_1
	
	move $v0, $s0
	j max_epilogue
	
max_length_ne_1:
	addi $a0, $a0, 4
	addi $a1, $a1, -1
	
	jal max
	
	move $t0, $v0
	
	ble $s0, $t0, max_first_element_le_max_so_far
	
	move $v0, $s0
	j max_epilogue
	
max_first_element_le_max_so_far:
	move $v0, $t0
	
max_epilogue:
	pop $s0
	pop $ra
	jr $ra