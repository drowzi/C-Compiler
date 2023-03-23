#include <stdio.h>
#include <stdlib.h>
#include "cc.h"

#define MAX_WARNINGS 100
#define MAX_ERRORS 1

static int error_count = 0;
static int warning_count = 0;

int get_error_count() {
    return error_count;
}

int get_warning_count() {
    return warning_count;
}

void warn(char *message, ...) {
    va_list args;
    va_start(args, message);
    printf("Warning: ");
    vprintf(message, args);
    printf("\n");
    va_end(args);
    error_count++;
    if (warning_count == MAX_WARNINGS) {
        fatal("Too many warnings");
    }
}

void error(char *message, ...) {
    va_list args;
    va_start(args, message);
    printf("Error: ");
    vprintf(message, args);
    printf("\n");
    va_end(args);
    error_count++;
    if (error_count == MAX_ERRORS) {
        fatal("Too many errors");
    }
}

void fatal(char *message, ...) {
    va_list args;
    va_start(args, message);
    printf("Fatal: ");
    vprintf(message, args);
    printf("\n");
    va_end(args);
    error_count++;
    exit(1);
}

void syntaxerror(char *message) {
    printf("Syntax Error: %s\n", message);
    exit(1);
}

void internalerror(char *message) {
    printf("Internal Error: %s\n", message);
    exit(1);
}
