#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include "cc.h"

/* C preprocessor
 *  How it works: this file handles directives and creates a macro list (of tokens) for each definition for the macro symbol table
 *  How it should work: this file needs support for function macros and builtin macros
 */

struct cpp_token {
    char context;
    Map *params;
    List *macros;
};

List *make_token_list(Vector *tokens) {
    List *l = make_list();

    for (unsigned int i = 0; i < vector_length(tokens); i++) {
        Token *tok = (Token *)vector_get(tokens, i);
        list_append(l, (void*)tok);
    }
    return l;
}

void process_define() {
    Vector *token_set;
    List *token_list;
    Token *macro, *current;

    MARK;
    macro = scan();
    assert(tident(macro));
    print_token(macro);

    token_set = make_list();
    current = scan();
    // if peek is a space, this isn't a function macro
    if (tsymbol(current) && current->id == OP_OPAREN) {
        // Function macro
    }
    else {
        MARK;
        token_set = scan_cpp_line();
        MARK;
    }
    // make a struct for a macro, cppXXX
    token_list = make_token_list(token_set);
    free(token_set);
    define_macro(macro->value, token_list);
}
void process_undef() {
    Token *tok = scan();
    assert(tok->type == TYIDENT);
    remove_macro(tok->value);
}
void process_ifdef() {
    Token *tok = scan();
    assert(tok->type == TYIDENT);
    if (macro_exists(tok->value)) {

    }
}
void process_ifndef() {
    Token *tok = scan();
    assert(tok->type == TYIDENT);
    if (!macro_exists(tok->value)) {

    }
}

void process_endif() {
    Token *tok = scan();
}

char *process_native_include() {
    char current;
    char *dir;
    String *sdir;

    sdir = make_string("");
    while ((current = take()) != '>') {
        string_append_char(sdir, current);
    }
    dir = string_body(sdir);
    string_free(sdir);
    return dir;
}

char *process_local_include() {
    char current;
    char *dir;
    String *sdir;

    sdir = make_string("");
    while ((current = take()) != '\"') {
        string_append_char(sdir, current);
    }
    dir = string_body(sdir);
    string_free(sdir);
    return dir;
    // return unstring(sdir);
}

void process_include() {
    Token *tok;
    char current;
    char *path;

    while ((current = take()) == ' ') {}

    switch(current) {
        case '<':  path = process_native_include(); break;
        case '\"': path = process_local_include(); break;
        default: fatal("Invalid #include directive: expected '<' or '\"', got %c", current);
    }
    printf("<Included %s file: %s>\n", current == '<' ? "native" : "local", path);
    // add_dependancy(path);
    skip_to_newline();
    push_file(path);
}

Token *token_union(Token *t, Token *t2) {
    size_t slen;
    char *snew;

    slen = strlen(t->value) + strlen(t2->value);
    snew = malloc(slen+1);

    strncat(t->value, t2->value, slen);
    return make_token(false, TYSTRING, snew, 0);
}

int parse_cpp_directive() {
    char *directive;
    struct MODULE_RECORD *module = get_current_module();
    Token *tok;

    tok = scan();
    assert(tok->type == TYIDENT);
    directive = tok->value;
    if (strcmp(directive, "define") == 0) {
        process_define();
    }
    else if (strcmp(directive, "include") == 0) {
        process_include();
    }
    else if (strcmp(directive, "undef") == 0) {
        process_undef();
    }
    else if (strcmp(directive, "ifdef") == 0) {
        process_ifdef();
    }
    else if (strcmp(directive, "ifndef") == 0) {
        process_ifndef();
    }
    else if (strcmp(directive, "endif") == 0) {
        process_endif();
    }
    else if (strcmp(directive, "if") == 0) {
        process_endif();
    }
    else {
        error("Invalid preprocessor directive %s", directive);
    }
    return 1;
}

// replace identifier with identifier
/*
void swap_macro(TVector *tv, char *macro) {
    for (unsigned int i=0; i < tv->vec->length; i++) {
        Token *curr = (Token*)vector_get(tv->vec, i);
        if (curr->type == TYIDENT && strcmp(curr->value, macro) == 0) {
            curr->value = malloc(strlen(macro));
            strcpy(curr->value, macro);
        }
    }
}
*/
