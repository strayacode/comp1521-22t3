#include <stdio.h>
#include <string.h>

#define MAX_LINE_LENGTH 1000

// continually read lines from the stream, searching for a string search_for
// in each line. if the line contains search_for, then print the line with a 
// line number
void search_stream(FILE *stream, char stream_name[], char search_for[]);

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Incorrect number of arguments used\n");
        return 1;
    }

    if (argc == 2) {
        // read lines from stdin
        search_stream(stdin, "<stdin>", argv[1]);
    } else {
        // for each argument after the string to search, we should use each argument
        // as a filename and search for the string in that file
        for (int argument = 2; argument < argc; argument++) {
            FILE *fp = fopen(argv[argument], "r");

            if (fp == NULL) {
                // error occured
                perror("Error opening file: ");
                return 1;
            }

            search_stream(fp, argv[argument], argv[1]);
        }
    }

    return 0;
}

void search_stream(FILE *stream, char stream_name[], char search_for[]) {
    char line[MAX_LINE_LENGTH];
    int line_number = 1;

    while (fgets(line, MAX_LINE_LENGTH, stream) != NULL) {
        // if strstr() == NULL, then the string wasn't found in the line
        if (strstr(line, search_for) != NULL) {
            printf("%s: %d: %s\n", stream_name, line_number, search_for);
        }

        line_number++;
    }
}