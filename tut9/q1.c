#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    // get the full path of $HOME/.diary
    // $HOME = getenv("HOME")
    // concatenate the home path and .diary
    // open that path and read the file character by character
    char *home_path = getenv("HOME");
    char *diary_path = ".diary";
    int full_path_length = strlen(home_path) + strlen(diary_path) + 2;
    char *full_path = malloc(full_path_length);

    snprintf(full_path, full_path_length, "%s/%s", home_path, diary_path);

    FILE *fp = fopen(full_path, "r");

    int c;

    while ((c = fgetc(fp)) != EOF) {
        fputc(c, stdout);
    }
}