#include <stdio.h>
#include <stdlib.h>
#include "cc.h"

/* File encapsulation
 *  How it works: this file handles file/string IO operations for a single global module
 *  How it should work: this file should perform file/string IO on multiple different modules
 */

static char file_take(void);
static char string_take(void);

static char file_peek(void);
static char string_peek(void);

static C_Module *current_module;
static File *current_file;
static Vector *file_stream;
static char (*take_func)(void) = NULL;
static char (*peek_func)(void) = NULL;

/*
Consider using a small buffer to store chunks of input
struct {
	short i = 0;
	char buffer[128];
} buf;

void fill_buf() {
	while (buf->i < 128) {
		buf->buffer[buf->i++] = take();
	}
}

take() {
	if (buf->i == 128) {
		fill_buf();
	}
	return buf->buffer[buf->i++];
}
*/

File *open_instream(char *filename) {
	File *stream = malloc(sizeof(File));
	stream->is_file = true;
	stream->position = 0;
	stream->filename = make_string(filename);
	stream->file_data = fopen(filename, "r");
	return stream;
}

File *open_code_string(String *data) {
	File *stream = malloc(sizeof(struct instream));
	stream->is_file = false;
	stream->position = 0;
	stream->filename = make_string("cstringout.c");
	stream->string_data = data;
	return stream;
}

void close_input_stream() {
	if (current_file->is_file && current_file->file_data != NULL) {
		fclose(current_file->file_data);
	}
}

void push_file(char *filename) {
    File *new_file = open_instream(filename);
    vector_append(file_stream, (void *)new_file);
    current_file = new_file;
}

int pop_file() {
    vector_pop(file_stream);
    if (vector_empty(file_stream))
        return 0;
    current_file = (File *)vector_top(file_stream);
    return 1;
}

void set_current_file() {
    file_stream = make_vector();
    current_file = get_current_file();
    vector_append(file_stream, current_file);
}

static char file_take() {
    return getc(current_file->file_data);
}

static char string_take() {
    return current_file->string_data->body[current_file->position];
}

static char file_peek() {
    char c;

    c = getc(current_file->file_data);
    ungetc(c, current_file->file_data);
    return c;
}

static char string_peek() {
    return current_file->string_data->body[current_file->position];
}

/* Set the input type, since this question only needs to be asked once */
void set_input_type(int type) {
	// if no threading: getc_unlocked
    if (type == IOTYPEF) {
        take_func = file_take;
        peek_func = file_peek;
    }
    else {
        take_func = string_take;
        peek_func = string_peek;
    }
}

//inline
char take() {
	char c;

	c = take_func();
	current_file->position++;
	return c;
}

//inline
char peek() {
    return peek_func();
}


//inline
void replace(char c) {
	if (current_file->is_file) {
		ungetc(c, current_file->file_data);
	}
	current_file->position--;
}
