#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

#define TABLE_SIZE 3
#define MAX_SIZE 1024
char OPEN_BRACKETS[TABLE_SIZE];
char openBrackets[MAX_SIZE];
int openCursor = 0;
char CLOSE_BRACKETS[TABLE_SIZE];
char closeBrackets[MAX_SIZE];
int closeCursor = MAX_SIZE;

int indexOf(const char val, const char *array) {
    for (int i = 0; i < TABLE_SIZE; i++)
        if (array[i] == val)
            return i;
    return -1;
}

bool in_array(const char val, const char *array) {
    return indexOf(val, array) != -1;
}

bool checkBrackets(const int size, const char *charArray) {
    for (int i = 0; i < size; i++)
        if (in_array(charArray[i], OPEN_BRACKETS))
            openBrackets[openCursor++] = charArray[i];
        else if (in_array(charArray[i], CLOSE_BRACKETS))
            closeBrackets[--closeCursor] = charArray[i];

    if (MAX_SIZE - 1 - openCursor != closeCursor)
        return false;

    for (int i = 0; i < openCursor; i++) {
        int openIndex = indexOf(openBrackets[i], OPEN_BRACKETS);
        if (openIndex != -1)
            if (closeBrackets[closeCursor++] != CLOSE_BRACKETS[openIndex])
                return false;
    }

    return true;
}

int main(const int argc, const char **argv) {
    OPEN_BRACKETS[0] = '(';
    OPEN_BRACKETS[1] = '{';
    OPEN_BRACKETS[2] = '[';
    CLOSE_BRACKETS[0] = ')';
    CLOSE_BRACKETS[1] = '}';
    CLOSE_BRACKETS[2] = ']';
    printf("%s\n", checkBrackets((const int) strlen(argv[1]), argv[1]) ? "YES" : "NO");
    return EXIT_SUCCESS;
}
