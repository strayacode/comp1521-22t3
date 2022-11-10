#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

void chmod_if_publically_writeable(char *path) {
    stat_t s;
    if (stat(path, &s) != 0) {
        perror("stat failed");
        exit(1);
    }

    mode_t permissions = s.st_mode;

    if (permissions & S_IWOTH) {
        // publically writeable
        printf("removing public write from %s\n", path);
        mode_t new_permissions = permissions & ~S_IWOTH;
        
        if (chmod(path, new_permissions) != 0) {
            perror("chmod failed");
            exit(1);
        }
    } else {
        printf("%s is not publically writable\n", path);
    }
}

int main(int argc, char *argv[]) {
    // loop through each argument
    // for each argument:
    // check if publically writeable or not
    // if publically writeable, then reset the publically writeable bit

    for (int argument = 1; argument < argc; argument++) {
        chmod_if_publically_writeable(argv[argument]);
    }
}