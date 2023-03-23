#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "cc.h"

/* Symbol tables
 *  How it works: this file controls all access to symbols.
 *  How it should work: it's fine as is
 */

static Vector *envchain;
static Map *macros;
static Map *localenv;
static Map *globalenv;
static Map *staticenv;
static Map *usertypes;
static Map *labels;
static Map *userstructs;

/*
 * All symbol table references are handled through here
 */

void init_symbols() {
    macros = make_map();
    localenv = make_map();
    globalenv = localenv;
    staticenv = make_map();
    usertypes = make_map();
    labels = make_map();
    userstructs = make_map();
    envchain = make_vector();
    vector_append(envchain, (void*)localenv);
}

void define_lvar(char *name, Node *iden) {
    map_put(localenv, name, (void*)iden);
}

Node *get_lvar(char *s) {
    Map *current_env;
    Node *n;

    n = NULL;
    for (int i=envchain->length-1; i>=0 && n == NULL; i--) {
        current_env = vector_get(envchain, i);
        n = (Node*)map_get(current_env, s);
    }
    return n;
}

int lvar_exists(char *s) {
    return !((Node*)get_lvar(s) == NULL);
}

void assert_lvar_exists(char *s) {
    if (!lvar_exists(s)) log_error("Syntax: undefined local variable reference to %s.", s);
}

void assert_lvar_doesnt_exist(char *s) {
    // Used for assuring that no two parameters have the same identifier
    if (lvar_exists(s)) log_error("expected local variable %s to not exist.", s);
}

void push_localenv() {
    localenv = make_map();
    vector_append(envchain, (void*)localenv);
}

void pop_localenv() {
    vector_pop(envchain);
    localenv = (Map*)vector_top(envchain);
}

// Global symbol table

Node *get_gvar(char *s) {
    return (Node*)map_get(globalenv, s);
}

int gvar_exists(char *s) {
    return get_gvar(s) != NULL;
}

void define_gvar(char *s, Node *gvar) {
    if (!gvar_exists(s)) {
        map_put(globalenv, s, (void*)gvar);
        if (gvar->ident_type->storage_type == STORAGE_STATIC) {
            map_put(staticenv, s, (void*)gvar);
        }
    }
}

void fill_function_decl(char *s, Vector *fstmts) {
    Node *f = get_gvar(s);
    assert(f->type == AST_FUNCDEF && f->f_block == NULL);
    f->f_block = fstmts;
}

void assert_gvar_exists(char *s) {
    if (!gvar_exists(s)) log_error("expected global variable %s to exist", s);
}

void assert_gvar_doesnt_exist(char *s) {
    if (gvar_exists(s)) {
        log_error("expected global variable %s to not exist, cc currently doesnt support function overloading", s);
    }
}

void assert_var_exists(char *s) {
    if (get_lvar(s) == NULL && get_gvar(s) == NULL) {
        log_error("expected variable %s to exist", s);
    }
}

// Utilities

bool is_builtin_type(Token *t) {
    if (t->type == TYKEYWORD) {
        switch (t->id) {
            case KWSHORT:
            case KWCHAR:
            case KWINT:
            case KWLONG:
            case KWDOUBLE:
            case KWFLOAT:
                return true;
        }
    }
    return false;
}

bool is_userdefined_type(Token *t) {
    return (t->type == TYIDENT) && (map_get(usertypes, t->value) != NULL);
}

bool is_valid_type(Token *t) {
    return is_builtin_type(t) || is_userdefined_type(t);
}

void assert_type_exists(Token *t) {
    if (!is_userdefined_type(t)) {
        log_error("Syntax: undefined type reference to %s.", t->value);
    }
}

Type *get_utype(Token *t) {
    assert_type_exists(t);
    Type *otype = (Type*)map_get(usertypes, t->value);
    return otype;
}

// Macros

void define_macro(char *name, List *tokens) {
    map_put(macros, name, (void*)tokens);
}

void remove_macro(char *name) {
    map_put(macros, name, NULL);
}

int macro_exists(char *name) {
    return map_get(macros, name) != NULL;
}

List *get_macro(char *name) {
    if (macro_exists(name)) {
        return (List*)map_get(macros, name);
    }
    return NULL;
}
