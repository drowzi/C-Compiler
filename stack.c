#include <stdio.h>
#include <stdlib.h>
#include "cc.h"

#define MAX_STACK_SIZE 1028

static void stack_grow(Stack *s);

Stack *make_stack() {
    Stack *s = malloc(sizeof(Stack));
    s->size = 0;
    s->max_size = 128;
    s->body = malloc(sizeof(void*) * 128);
    return s;
}

void stack_push(Stack *s, void *data) {
    if (s->size+1 == s->max_size) {
        stack_grow(s);
    }
    s->body[s->size++] = data;
}

void *stack_pop(Stack *s) {
    if (s->size <= 0) error("Attempted to pop from an empty stack");
    s->size = s->size - 1;
    return s->body[s->size];
}

void stack_free(Stack *s) {
    free(s->body);
    free(s);
}

void *stack_top(Stack *s) {
    return s->body[s->size-1];
}

int stack_empty(Stack *s) {
    return s->size <= 0;
}

static void stack_grow(Stack *s) {
    s->max_size *= 2;
    printf("Stack reallocated to size %d.\n", s->max_size);
    if (s->max_size > MAX_STACK_SIZE) error("Memory is probably leaking; this stack shouldnt have 1028 entries.");
    realloc(s, s->max_size);
}


