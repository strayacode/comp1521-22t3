#include <stdio.h>

void print_array(int nums[], int pos, int len) {
    // if (pos == len) {
    //     return;
    // }

    // printf("%d\n", nums[pos]);

    // print_array(nums, pos + 1, len);

    if (pos < len) {
        printf("%d\n", nums[pos]);

        print_array(nums, pos + 1, len);
    }
}

// print_array(nums, 0, 10) prints 3
//     print_array(nums, 1, 10) prints 1
//         print_array(nums, 2, 10) prints 4
//             ..
//             print_array(nums, 10, 10)


// 1. code we want to call recursively (in this case printing a specific integer in the array)
// 2. terminate condition (some sort of code to detect when we've printed all the integers)

int main(void)
{
    int nums[] = {3, 1, 4, 1, 5, 9, 2, 6, 5, 3};
    print_array(nums, 0, 10);

    return 0;
}