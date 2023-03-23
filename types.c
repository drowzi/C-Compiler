#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "cc.h"

/* Type system
 *  How it works: this file handles everything type related, it asks the symbol table for user defined types and references its own
 *      built in types
 *  How it should work: it's fine as is
 */

/*
 * (note): Integer only has to be 2 bytes wide and long only has to be 4 bytes wide
 * (note): C type qualifiers are const, volatile, restrict, and _Atomic
 * (note): Volatile type values must be reread from memory every time they are accessed
 */

static Type *type_char;
static Type *type_short;
static Type *type_int;
static Type *type_longlong;
static Type *type_long;
static Type *type_double;
static Type *type_longdouble;
static Type *type_float;
static Type *type_enum;
static Type *type_void;
static Type *type_uchar;
static Type *type_ushort;
static Type *type_uint;
static Type *type_ulong;
static Type *type_ulonglong;

static Type *define_builtin_type(unsigned int size, unsigned int kind, bool isunsigned);
static Type *parse_cast_type(void);
static Type *parse_function_def(void);
static Type *parse_function_param_def(void);
static Type *parse_lvar_def(void);
static Type *parse_type(void);
static void maybe_parse_record_type(Type *ty);
static void maybe_parse_const(Type *ty);
static void parse_base_type(Type *ty);
static void parse_storage_type(Type *ty);
static void parse_global_storage_type(Type *ty);

static Type *define_builtin_type(unsigned int size, unsigned int kind, bool isunsigned) {
    Type *ty = malloc(sizeof(Type));
    ty->bytes = size;
    ty->kind = kind;
    ty->isunsigned = isunsigned;
    return ty;
}

void init_builtin_types(void) {
    type_char = define_builtin_type(1, CTYPECHAR, false);
    type_short = define_builtin_type(2, CTYPESHORT, false);
    type_int = define_builtin_type(4, CTYPEINT, false);
    type_long = define_builtin_type(8, CTYPELONG, false);
    type_longlong = define_builtin_type(8, CTYPELONGLONG, false);
    type_longdouble = define_builtin_type(8, CTYPELONGDOUBLE, false);
    type_double = define_builtin_type(8, CTYPEDOUBLE, false);
    type_float = define_builtin_type(4, CTYPEFLOAT, false);
    type_void = define_builtin_type(0, CTYPEVOID, false);

    type_uchar = define_builtin_type(1, CTYPECHAR, true);
    type_ushort = define_builtin_type(2, CTYPESHORT, true);
    type_uint = define_builtin_type(4, CTYPEINT, true);
    type_ulong = define_builtin_type(8, CTYPELONG, true);
    type_ulonglong = define_builtin_type(8, CTYPELONGLONG, true);
}

/*
 * Handles creation of types (through parsing tokens) and type symbol table interaction
 */

Type *make_base_type() {
    Type *t = malloc(sizeof(Type));
    t->pointer = NULL;
    t->base_type = NULL;
    t->kind = CTYPESTUB;
    t->bytes = 0;
    t->isunsigned = 0;
    t->isconst = 0;
    t->storage_type = STORAGE_AUTO;
    t->record_type = RECTYPE_NONE;
    t->is_fptr = 0;
    t->pointer = NULL;
    t->parameters = NULL;
    return t;
}

Type *make_func_type(Type *pointer, Vector *parameters) {
    // judge parameters to find size
    Type *t = make_base_type();
    t->pointer = pointer;
    t->parameters = parameters;
    return t;
}

void print_type(Type *ty) {
    printf("[TYPE INFO] ");
    while (ty->kind == CTYPEPOINTER) {
        printf("%s pointer to ", ty->isconst ? "const" : "");
        ty = ty->pointer;
    }
    printf("%s%s", ty->isunsigned ? "unsigned " : "signed ", ty->isconst ? "const " : "");
    printf("%s ", ctypekind2s(ty));
    printf("with storage type %s\n", storagetype2s(ty->storage_type));
}

// function for parsing struct/union
static void maybe_parse_record_type(Type *ty) {
    Token *tok = get_token();
    ty->record_type = RECTYPE_NONE;
    if (tok->type == TYKEYWORD) {
        switch (tok->id) {
        case KWSTRUCT:
            ty->record_type = RECTYPE_STRUCT;
            return;
        case KWUNION:
            ty->record_type = RECTYPE_UNION;
            return;
        }
    }
    unwind_token_pos();
}

static void maybe_parse_const(Type *ty) {
    Token *tok = get_token();
    if (tok->type == TYKEYWORD && tok->id == KWCONST) {
        ty->isconst = 1;
    } else {
        unwind_token_pos();
    }
}
// function for parsing base types
static void parse_base_type(Type *ty) {
    Token *tok = get_token();
    ty->kind = CTYPESTUB;
    if (tok->type == TYKEYWORD && tok->id == KWUNSIGNED) {
        ty->isunsigned = 1;
        tok = get_token();
    }
    //print_token(tok);
    Token *peek = peek_token(0);
    if (tok->type == TYKEYWORD) {
        switch(tok->id) {
        case KWCHAR: {
            ty->base_type = type_char;
            ty->bytes = 1;
            ty->kind = CTYPECHAR;
            break;
        }
        case KWSHORT: {
            if (peek->type == TYKEYWORD && peek->id == KWINT) {
                ty->base_type = type_int;
                ty->bytes = 4; // research
                ty->kind = CTYPESHORTINT;
                DISCARD();
            } else {
                ty->base_type = type_short;
                ty->bytes = 2;
                ty->kind = CTYPESHORT;
            }
            break;
        }
        case KWINT: {
            ty->base_type = type_int;
            ty->bytes = 4;
            ty->kind = CTYPEINT;
            break;
        }
        case KWLONG: {
            if (peek->type == TYKEYWORD && peek->id == KWINT) {
                ty->base_type = type_longlong;
                ty->bytes = 8; // research
                ty->kind = CTYPELONGINT;
                DISCARD();
            }
            else if (peek->type == TYKEYWORD && peek->id == KWDOUBLE) {
                ty->base_type = type_longdouble;
                ty->bytes = 8; // research
                ty->kind = CTYPELONGDOUBLE;
                DISCARD();
            }
            else if (peek->type == TYKEYWORD && peek->id == KWLONG) {
                Token *p2 = peek_token(1);
                if (p2->type == TYKEYWORD && p2->id == KWINT) {
                    ty->base_type = type_longlong;
                    ty->bytes = 8; // research
                    ty->kind = CTYPELONGLONGINT;
                    DISCARD();
                    DISCARD();
                } else {
                    ty->base_type = type_longlong;
                    ty->bytes = 8; // research
                    ty->kind = CTYPELONGLONG;
                    DISCARD();
                }
            } else {
                ty->base_type = type_long;
                ty->bytes = 8;
                ty->kind = CTYPELONG;
            }
            break;
        }
        case KWDOUBLE: {
            ty->base_type = type_double;
            ty->bytes = 8;
            ty->kind = CTYPEDOUBLE;
            break;
        }
        case KWFLOAT: {
            ty->base_type = type_float;
            ty->bytes = 4;
            ty->kind = CTYPEFLOAT;
            break;
        }
        case KWVOID: {
            ty->base_type = type_void;
            ty->bytes = 0;
            ty->kind = CTYPEVOID;
            break;
        }
        default:
            log_error("keyword %s is not supported as a valid c type", kw2s(tok->id));
        }
    } else {
        ty = get_utype(tok);
    }
}
// function for parsing storage type
static void parse_storage_type(Type *ty) {
    ty->storage_type = STORAGE_AUTO;
    Token *peek = peek_token(0);
    if (peek->type == TYKEYWORD) {
        Token *tok = get_token();
        switch (tok->id) {
        case KWSTATIC:
            ty->storage_type = STORAGE_STATIC;
            break;
        case KWEXTERN:
            ty->storage_type = STORAGE_EXTERN;
            break;
        case KWREGISTER:
            ty->storage_type = STORAGE_REGISTER;
            break;
        default:
            ty->storage_type = STORAGE_AUTO;
            unwind_token_pos();
            break;
        }
    }
}

static Type *parse_cast_type() {
    Type *ty = make_base_type();
    maybe_parse_record_type(ty);
    parse_base_type(ty);
    return ty;
}

static Type *parse_function_def() {
    Type *ty = make_base_type();
    parse_storage_type(ty);
    maybe_parse_record_type(ty);
    return ty;
}

static Type *parse_function_param_def() {
    Type *ty = make_base_type();
    maybe_parse_record_type(ty);
    parse_base_type(ty);
    return ty;
}

static Type *parse_lvar_def() {
    Type *ty = make_base_type();
    parse_storage_type(ty);
    maybe_parse_record_type(ty);
    parse_base_type(ty);
    return ty;
}

static Type *parse_type() {
    Type *ty = make_base_type();
    return ty;
}

static void parse_global_storage_type(Type *ty) {
    ty->storage_type = STORAGE_EXTERN;
    Token *peek = peek_token(0);
    if (peek->type == TYKEYWORD) {
        Token *tok = get_token();
        switch (tok->id) {
            case KWSTATIC:
                ty->storage_type = STORAGE_STATIC;
                break;
            case KWEXTERN:
                break;
            case KWREGISTER:
                log_error("register is not a valid storage class for a global variable");
                break;
            case KWAUTO:
                log_error("auto is not a valid storage class for a global variable");
                break;
            default:
                unwind_token_pos();
                break;
        }
    }
}

// This function parses decls with pattern (*ident)(basetype0, ..., basetypen)
static void parse_fptr_type(Type *ty) {
    char *name;
    Token *tok = get_token();
    // handle infinite pointers
    while (tok->type == TYSYMBOL && tok->id == OP_STAR) {
        Type *ptrtype = make_base_type();
        ptrtype->kind = CTYPEPOINTER;
        ptrtype->pointer = ty;
        ty = ptrtype;
        tok = get_token();
    }
    // expect an identifier for the function pointer
    assert(tok->type == TYIDENT);
    name = tok->value;
    tok = get_token();
    assert(tok->type == TYSYMBOL && tok->id == OP_OPAREN);
    // assume no function pointer parameters yet
    Vector *v = make_vector();
    while (true) {
        Type *param = make_base_type();
        if (tok->type == TYSYMBOL && tok->id == OP_CPAREN) {
            break;
        }
        parse_base_type(param);
        tok = get_token();
        if (tok->type == TYSYMBOL && tok->id == OP_COMMA) {
            continue;
        }
        break;
    }
    ty->parameters = v;
}

static void parse_wildcard(Type *ty) {
    bool base_found = false;
    while (true) {
        Token *tok = get_token();
        if (!base_found && tok->type == TYSYMBOL && tok->id == OP_OPAREN) {
            Token *peek = peek_token(0);
            if (peek->type == TYSYMBOL && peek->id == OP_STAR) {
                // parse function pointer for the simple case of (*
                parse_fptr_type(ty);
                break;
            }

        }
        if (base_found && tok->type == TYIDENT) {
            unwind_token_pos();
            break;
        }
        if (tok->type == TYKEYWORD && tok->id == KWCONST) {
            //MARK;
            unwind_token_pos();
            maybe_parse_const(ty);
            continue;
        }
        if ((base_found == false && tok->type == TYIDENT) || tok->type == TYKEYWORD) {
            unwind_token_pos();
            parse_base_type(ty);
            base_found = true;
        } else {
            if (tok->type == TYSYMBOL) {
                if (tok->id == OP_STAR) {
                    Type *ptrtype = make_base_type();
                    ptrtype->kind = CTYPEPOINTER;
                    ptrtype->pointer = ty;
                    ty = ptrtype;
                }
            }
        }
    }
}

/*
 * The C standard describes an "abstract declarator", which is used when a type needs to be described but not
 * associated with a variable name. These occur in two places -- casts, and as arguments to sizeof -- and they
 * can look intimidating:
 *
 * int (*(*)())()
 */

Type *get_number_type(long n) {
    return type_int;
}

Type *parse_fparam_type() {
    Type *ty = make_base_type();
    unwind_token_pos();
    maybe_parse_const(ty);
    parse_base_type(ty);
    return ty;
}

Type *parse_global_decl_type() {
    Type *ty = make_base_type();
    //print_token(peek_token(0));
    parse_global_storage_type(ty);
    maybe_parse_record_type(ty);
    parse_wildcard(ty);
    print_type(ty);
    return ty;
}

Type *parse_local_decl_type() {
    Type *ty = make_base_type();
    parse_storage_type(ty);
    parse_wildcard(ty);
    print_type(ty);
    return ty;
}
