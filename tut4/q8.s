# // A topographic map!
# // This helpful tool will tell explorers how much they need to climb to
# // reach various points of interest.
# // Given an array of points, `my_points`, it can look up individual cells
# // in the 2D map and print their height.

# #include <stdio.h>

# #define MAP_SIZE 5
# #define N_POINTS 4

# // 2D representation of a point, stored as a single struct
# struct point2D {
#     int row;
#     int col;
# } typedef point2D_t;

# // 2D grid representing the height data for an area.
# int topography_grid[MAP_SIZE][MAP_SIZE] = {
#     {0, 1, 1, 2, 3},
#     {1, 1, 2, 3, 4},
#     {1, 2, 3, 5, 7},
#     {3, 3, 4, 5, 6},
#     {3, 4, 5, 6, 7},
# };

# // Points of interest to print heights for, as a 1D array.
# point2D_t my_points[N_POINTS] = {
#     {1, 2},
#     {2, 3},
#     {0, 0},
#     {4, 4},
# };

# int main() {
#     // Loop over all elements, and print their data
#     for (int i = 0; i < N_POINTS; i++) {
#         int row = my_points[i].row;
#         int col = my_points[i].col;
#         int height = topography_grid[row][col];
#         printf("Height at %d,%d=%d\n", row, col, height);
#     }
#     return 0;
# }

MAP_SIZE = 5
N_POINTS = 4

# i in $t0, row in $t4, col in $t5, height in $t9
main:
	li $t0, 0
main_i_lt_n_points:
	bge $t0, N_POINTS, main_epilogue
	
	# offset of row is 0
	# total size of struct is 8
	# &my_points[i].row = my_points + (i * 8) + (0)
	la $t1, my_points
	mul $t2, $t0, 8
	add $t3, $t1, $t2
	lw $t4, ($t3)
	
	# &my_points[i].col = my_points + (i * 8) + (4)
	lw $t5, 4($t3)
	
	# &topography_grid[row][col] = topography + (row * MAP_SIZE + col) * 4
	la $t6, topography_grid
	mul $t7, $t4, MAP_SIZE
	add $t7, $t7, $t5
	mul $t7, $t7, 4
	add $t8, $t6, $t7
	lw $t9, ($t8)
	
	la $a0, result_str
	li $v0, 4
	syscall
	
	move $a0, $t4
	li $v0, 1
	syscall
	
	li $a0, ','
	li $v0, 11
	syscall
	
	move $a0, $t5
	li $v0, 1
	syscall
	
	li $a0, '='
	li $v0, 11
	syscall
	
	move $a0, $t9
	li $v0, 1
	syscall
	
	li $a0, '\n'
	li $v0, 11
	syscall
	
	addi $t0, $t0, 1
	j main_i_lt_n_points

main_epilogue:
	li $v0, 0
	jr $ra

	.data
topography_grid:
    	.word 0, 1, 1, 2, 3,
    	.word 1, 1, 2, 3, 4,
    	.word 1, 2, 3, 5, 7,
    	.word 3, 3, 4, 5, 6,
    	.word 3, 4, 5, 6, 7,

my_points:
	.word 1, 2
	.word 2, 3
	.word 0, 0
	.word 4, 4
	
result_str:
	.asciiz "Height at "
    
# // Points of interest to print heights for, as a 1D array.
# point2D_t my_points[N_POINTS] = {
#     {1, 2},
#     {2, 3},
#     {0, 0},
#     {4, 4},
# };