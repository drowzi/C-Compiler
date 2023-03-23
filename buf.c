#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "cc.h"

/*
 * String buffer
 */

#define CA_SENTINEL '\0'
#define MAX_SIZE 256

static void buffer_memory_dump(Buf *b);

Buf *buffer_open() {
    Buf *b = malloc(sizeof(Buf));
    b->len = 0;
    b->str = calloc(MAX_SIZE, 1);
    return b;
}

void buffer_clear(Buf *b) {
    //char *c = buffer_get(b);
    b->len = 0;
    b->str[0] = CA_SENTINEL;
}

void buffer_append(Buf *b, char c) {
    if (b->len >= MAX_SIZE) error("buffer_overflow");
    b->str[b->len++] = c;
    b->str[b->len] = CA_SENTINEL;
}

char *buffer_get(Buf *b) {
    char *buffer_string = malloc(sizeof(char) * b->len);
    strcpy(buffer_string, b->str);
    return buffer_string;
}

int buffer_len(Buf *b) {
    return b->len;
}

void buffer_close(Buf *b) {
    free(b->str);
    free(b);
}

static void UNUSED_FUNC buffer_memory_dump(Buf *b) {
    if (b->len == 0) return;
    for (int i = 0; i < MAX_SIZE; i++) {
        printf("%c,", b->str[i]);
    }
    printf("\n");
}

void buffer_print(Buf *b) {
    for (int i=0; i<b->len; i++) {
        printf("%c", b->str[i]);
    }
    printf("\n");
}
