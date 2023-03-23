#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <assert.h>
#include "cc.h"

/* GAS code generation
 *  How it works: this file traverses a forest recursively and flattens it into simple instructions
 *  How it should work: this file should have a few intermediate passes before it so it can work in a more elegant way
 */

/*
 * Back end for GNU Assembly output
 */

static int stack_size;
static FILE *default_outfile;

static char *get_int_reg(Type *ty, char r);
static char *get_load_inst(Type *ty);
static int align(int n, int m);
static char *get_opcode(int symbol);
static void emit(char *s, ...);
static void emitln(char *s, ...);
static void emit_static_decl(Node *tree);
static void emit_fheader(char *filename);
static inline void maybe_emit_readonly(Node *tree);
static inline void emit_main();
static inline void emit_function_header(Node *tree);
static inline void emit_function_decl_init(Node *tree);
static inline void emit_function_return(void);
static void emit_def(char *name);
static void emit_function_decl(Node *tree);
static void UNUSEDF emit_charlabel(char *text, int charlabelid);
static void UNUSEDF emit_dependencies(void);
static void gen_return(Node *ret);
static void gen_function_call(Node *fcall);
static void gen_assignment(Node *assign);
static void gen_statements(Vector *head, unsigned int funcsize);
static void gen_expr_traverse(Node *tree);
static void gen_expr(Node *iden, Node *exprhead);
static void gen_expr_eax(Node *exprhead);
static void gen_cond(Node *cond, char *success, char *failure, bool jump);
static void __imp_printf(void);
static void __imp_printf_readonly(void);
static void __print_reg(char *reg);
static void __print_all_regs(void);
static void __test_print_reg(char *reg);
static void push_patch(char *label);
static void patch(void);

static Vector *patch_labels = NULL;

/* Idea (from scc), have a map of all mnemonics and a macro for each index, like the following two lines */

static const char *mnemonics[] =
{
    // opcodes
    "movl",
    "addl",
    "subl",
    "imull",
    "divi",
    "pushl",
    "popl",
    "sarl",
    "sall",
    "cmpl",
    "xorl",
    "testl",

    "al", "ah", "ax", "eax",
    "bl", "bh", "bx", "ebx",
    "cl", "ch", "cx", "ecx",
    "dl", "dh", "dx", "edx",

    "esi", "edi", "ebp", "esp"
};

/* */

// Accumulator: I/O port access, arithmetic, interrupt calls
static const char *eax = "eax";

// Base: base pointer for memory access
static const char *ebx = "ebx";

// Counter: loop counter and for shifts
static const char *ecx = "ecx";

// Data: string, memory array copying and setting and for far pointer addressing with ES
static const char *edx = "edx";

static const char *movl = "movl";
static const char *addl = "addl";
static const char *subl = "subl";
static const char *imull = "imull";
static const char *divi = "divi";

#define emit_cfi_endproc() emit("\t.cfi_endproc\n")
#define emit_cfi_def_cfa(n, m) emit("\t.cfi_def_cfa %d, %d\n", n, m)
#define emit_cfi_restore(n) emit("\t.cfi_restore %d\n", n)
#define emit_cfi_def_cfa_register(n) emit("\t.cfi_def_cfa_register %d\n", n)
#define emit_cfi_offset(n, m) emit("\t.cfi_offset %d, %d\n", n, m)
#define emit_cfi_def_cfa_offset(n) emit("\t.cfi_def_cfa_offset %d\n", n)
#define emit_cfi_startproc() emit("\t.cfi_startproc\n")
#define emit_push(r) emit("\tpushl\t@%s\n", r)
#define emit_ret() emit("\tret\n")
#define emit_leave() emit("\tleave\n")
#define emit_def(name) emit("\t.def\t_%s;\t.scl\t2;\t.type\t32; .endef\n", name)
#define emit_file(name) emit("\t.file\t\"%s.c\"\n", name)
#define emit_call(name) emit("\tcall\t_%s\n", name)
#define emit_align(d) emit("\t.align %d\n", d)
#define emit_data() emit("\t.data\n")
#define emit_text() emit("\t.text\n")
#define emit_function(name) emit("_%s.%d:", name, 1000)
#define emit_label(label) emit("%s:\n", label)
#define emit_op_reg_reg(op, r1, r2) emit("\t%s\t@%s, @%s\n", op, r1, r2)
#define emit_op_mem_reg(op, o, m, r) emit("\t%s\t%d(@%s), @%s\n", op, o, m, r)
#define emit_op_reg_mem(op, r, o, m) emit("\t%s\t@%s, %d(@%s)\n", op, r, o, m)
#define emit_op_literal_reg(op, c, r) emit("\t%s\t$%d, @%s\n", op, c, r)
#define emit_op_static_reg(op, c, r) emit("\t%s\t$%s, @%s\n", op, c, r)
#define emit_op_literal_mem(op, c, o, m) emit("\t%s\t$%d, %d(@%s)\n", op, c, o, m)
#define emit_op_static_mem(op, c, o, m) emit("\t%s\t$%s, %d(@%s)\n", op, c, o, m)

static int tmpheaders = 100;
static Vector *code;

// JNB AND JB ARE COMPARISONS FOR UNSIGNED VALUES, DONT USE JL OR JG

#define _PRINTF_LABEL_ID 999
#define _PRINTF_LABEL "LF999"

static char *generate_label(char *prefix, unsigned int id) {
    String *s = make_fmt_string("%s%d", prefix, id);
    char *label = string_body(s);
    free(s);
    return label;
}

char *get_function_entry_label(void) {
    static unsigned int id = 0;
    return generate_label("LFE", id++);
}
char *get_function_block_label(void) {
    static unsigned int id = 0;
    return generate_label("LFB", id++);
}
char *get_generic_label(void) {
    static unsigned int id = 0;
    return generate_label("L", id++);
}
char *get_static_label(void) {
    static unsigned int id = 0;
    return generate_label("LC", id++);
}

/* Imply printf, needed functionality for displaying assembly output for early builds */
static void __imp_printf_def() {
    emit("LFE%d:\n", tmpheaders++);
    emit_def("printf");
}

static void __imp_printf_readonly() {
    emit("LF%d:\n", _PRINTF_LABEL_ID);
    emit("\t.ascii %s\n", "\"value: %d\\n\\0\"");
}

static void __print_reg(char *reg) {
    emit("\tmovl\t@%s, 4(@esp)\n", reg);
    emit("\tmovl\t$%s, (@esp)\n", _PRINTF_LABEL);
    emit("\tcall\t_printf\n");
}

static void __print_all_regs() {
    __print_reg("eax");
    __print_reg("ecx");
    __print_reg("edx");
}

static void __print_ident(Node *iden) {
    emit("\tmovl\t%d(@ebp), @eax\n", iden->ident_offset);
    emit("\tmovl\t@eax, 4(@esp)\n");
    emit("\tmovl\t$%s, (@esp)\n", _PRINTF_LABEL);
    emit("\tcall\t_printf\n");
}

static void __test_print_reg(char *reg) {
    emit("\tmovl\t$128, @eax\n");
    __print_reg("eax");
}

/* Check if storing output as a string is faster than 1 w/p/line */
static void emit_as_string(char *s, ...) {
    if (default_outfile == NULL) error("no output file set?");
    char buffer[128];
    String *str;
    va_list args;
    va_start(args, s);
    /*int ret = */vsnprintf(buffer, 128, s, args);
    va_end(args);
    for(unsigned int c = 0; c <= strlen(buffer); c++) {
        if (buffer[c] == '@') buffer[c] = '%';
    }
    str = make_string(buffer);
    vector_append(code, (void*)str);
    // at the end, take each index 0-n and write, this might keep the io hot and efficient
}

static void emit(char *s, ...) {
    if (default_outfile == NULL) error("no output file set?");
    char buffer[128];
    va_list args;
    va_start(args, s);
    /*int ret = */vsnprintf(buffer, 128, s, args);
    va_end(args);
    for(unsigned int c = 0; c <= strlen(buffer); c++) {
        if (buffer[c] == '@') buffer[c] = '%';
    }
    printf("%s", buffer);
    fputs(buffer, default_outfile);
}

static void emit_nop() {
    // Seems like gcc pads functions to the nearest divisor of 8 by default
    emit("\tnop\n");
}

static void emitln(char *s, ...) {
    if (default_outfile == NULL) error("no output file set?");
    char buffer[128];
    va_list args;
    va_start(args, s);
    /*int ret = */vsnprintf(buffer, 128, s, args);
    va_end(args);
    for(unsigned int c = 0; c <= strlen(buffer); c++) {
        if (buffer[c] == '@') buffer[c] = '%';
    }
    snprintf(buffer, 128, "\t%s\n", buffer);
    printf("%s", buffer);
    fputs(buffer, default_outfile);
}

static void emit_static_decl(Node *tree) {
    // Figure out alignment and temp.%d digit significance
    emit_data();
    emit_align(4);
    emit("_%s.%d:", tree->ident_name, 1000);
    // emit .ascii, .long, etc
}

static void emit_fheader(char *filename) {
    emit_file(filename);
    emit_text();
}

static void emit_bss() {
    // emit(".bss")
    // for static declaration in codefile:
    // emit(".align size", "_name:", ".space size")
}

static inline void emit_main() {
    emit_def("__main");
}

static inline void emit_function_header(Node *tree) {
    emit("\t.globl\t_%s\n", tree->f_name->body);
    emit_def(tree->f_name->body);
    //emit("\t.def\t_%s;\t.scl\t2;\t.type\t32; .endef\n", tree->fname->body);
    emit("_%s:\n", tree->f_name->body);
    emit("%s:\n", tree->f_block_label);
}

static inline void emit_function_decl_init(Node *tree) {
    emit_cfi_startproc();
    emit_push("ebp");
    emit_cfi_def_cfa_offset(8);
    emit_cfi_offset(5, -8);
    emit_op_reg_reg("movl", "esp", "ebp");
    emit_cfi_def_cfa_register(5);
    emit_op_literal_reg("andl", -16, "esp");
    emit_op_literal_reg("subl", align(tree->f_size, 16), "esp");
}

static inline void emit_function_return() {
    emit("\tmovl\t@ebp, @esp\n");
    emit("\tpopl\t@ebp\n");
    emit_cfi_restore(5);
    emit_cfi_def_cfa(4, 4);
    emit_ret();
    emit_cfi_endproc();
}

static void emit_charlabel(char *text, int charlabelid) {
    // emit constant strings here before a function
    emit("LC%d:\n", charlabelid);
    emit("\t.ascii %s\n", text);
}

static void maybe_emit_readonly(Node *tree) {
    Node *t = tree;
}

static char *get_int_reg(Type *ty, char r) {
    assert(r == 'a' || r == 'c');
    switch (ty->bytes) {
    case 1: return (r == 'a') ? "al" : "cl";
    case 2: return (r == 'a') ? "ax" : "cx";
    case 4: return (r == 'a') ? "eax" : "ecx";
    case 8: return (r == 'a') ? "rax" : "rcx";
    default:
        log_error("Unknown data size: %s: %d", ctype2s(ty), ty->bytes); // ctype2s wont work for custom types
    }
}

static char *get_load_inst(Type *ty) {
    switch (ty->bytes) {
    case 1: return "movsbq";
    case 2: return "movswq";
    case 4: return "movslq";
    case 8: return "movl";
    default:
        log_error("Unknown data size: %s: %d", ctype2s(ty), ty->bytes);
    }
}

static int align(int n, int m) {
    int rem = n % m;
    return (rem == 0) ? n : n - rem + m;
}

static char *get_opcode(int symbol) {
    switch (symbol) {
        case OP_SUB: return "subl";
        case OP_ADD: return "addl";
        case OP_DIV: return "divl";
        case OP_MUL: return "imul";
        default: log_error("unsupported op %s", op2s(symbol)); return "suppression";
    }
}

static void emit_function_decl(Node *tree) {
    unsigned int funcsize;

    emit("%s:\n", tree->f_block_label);
    if (string_equal_const(tree->f_name, "main")) {
        emit_main();
    }
    emit_function_header(tree);
    maybe_emit_readonly(tree);
    funcsize = align(tree->f_size, 16);
    emit_function_decl_init(tree);
    if (tree->f_block->length > 0) {
        gen_statements(tree->f_block, funcsize);
    }
    //__test_print_reg("eax");
    //__test_print_reg("ecx");
    //__test_print_reg("edx");
    emit("%s:\n", tree->f_end_label);
    emit_function_return();
}

static void emit_dependencies() {
    Vector *deps;
    unsigned int i, dependencies;
    char *handle;

    deps = get_module_deps();
    dependencies = vector_length(deps);
    for (i = 0; i < dependencies; i++) {
        handle = (char*)vector_get(deps, i);
        emit_def(handle);
    }
}

static void gen_expr_eax(Node *exprhead) {
    unsigned int i;

    if (exprhead->type == AST_NUMBER) {
        emit("\tmovl\t$%d, @eax\n", exprhead->number);
    }
    else if (exprhead->type == AST_IDENT) {
        emit("\tmovl\t%d(@ebp), @eax\n", exprhead->ident_offset);
    }
    else if (exprhead->type == AST_FUNCCALL) {
        printf("OFF-LIMITS! (function call return)\n");
        return;
        // This does not work as expected!
        unsigned int offset = 0;
        unsigned int parameters = exprhead->fc_params->length;
        for (i=0; i<parameters; i++) {
            Node *param = (Node*)vector_get(exprhead->fc_params, i);
            Node *parentparam = (Node*)vector_get(exprhead->fc_pointer->f_params, i);
            Node *iden = make_tmp_iden_node(parentparam->ident_type, offset);
            offset += parentparam->ident_type->bytes; // function parameters start at 0(esp)
            gen_expr(iden, param);
        }
        emit("\tcall\t_%s\n", exprhead->fc_pointer->f_name->body);
    }
    else {
        gen_expr_traverse(exprhead->binop_lhs); // put lchild into edx
        emit("\tmovl\t@eax, @edx\n");
        gen_expr_traverse(exprhead->binop_rhs); // put rchild into eax
        emit("\t%s\t@eax, @edx\n", get_opcode(exprhead->binop_symbol));
        emit("\tmovl\t@edx, @eax\n");
    }
}

// Place return in %eax
static void gen_return(Node *ret) {
    // After placing return in %eax, jump to a predefined return label which should be passed here (f_end_block_label)
    Node *iden, *expr;

    if (ret->type == AST_BINOP) {
        gen_expr_eax(ret);
        return;
    }
    expr = ret->return_val;
    if (expr->type == AST_IDENT) {
        emit_op_mem_reg("movl", expr->ident_offset, "ebp", "eax");
    }
    else if (expr->type == AST_NUMBER) {
        emit("\tmovl\t$%lld, @eax\n", expr->number);
        //emit_op_literal_reg("movl", expr->number, "eax");
    }
    else {
        iden = make_tmp_iden_node(ret->return_type, ret->return_type->bytes);
        gen_expr(iden, expr);
        emit_op_mem_reg("movl", iden->ident_offset, "ebp", "eax");
    }
}

static void gen_function_call(Node *fcall) {
    Node *param, *parentparam, *iden;
    unsigned int offset, parameters;

    offset = 0;
    parameters = fcall->fc_params->length;
    for (unsigned int i=0; i<parameters; i++) {
        param = (Node*)vector_get(fcall->fc_params, i);
        parentparam = (Node*)vector_get(fcall->fc_pointer->f_params, i);
        offset += parentparam->ident_type->bytes;
        iden = make_tmp_iden_node(parentparam->ident_type, offset);
        gen_expr(iden, param);
    }
    emit("\tcall\t_%s\n", fcall->fc_pointer->f_name);
}

static void gen_assignment(Node *assign) {
    Node *iden, *val;

    iden = assign->assign_lhs;
    val = assign->assign_rhs;
    if (val->type == AST_IDENT) {
        emit_op_mem_reg("movl", val->ident_offset, "ebp", "eax");
        emit_op_reg_mem("movl", "eax", iden->ident_offset, "ebp");
    } else {
        gen_expr(iden, val);
    }
}

static void gen_dec_or_inc(Node *unop) {
    switch (unop->unop_symbol) {
        case OP_PRE_DEC:
        case OP_POST_DEC: {
            emit("\tsubl\t$1, %d(@ebp)\n", unop->unop_val->ident_offset);
            break;
        }
        case OP_PRE_INC:
        case OP_POST_INC: {
            emit("\taddl\t$1, %d(@ebp)\n", unop->unop_val->ident_offset);
            break;
        }
    }
}

static void gen_if(Node *ifstmt) {
    Node *cond;
    Vector *then;

    cond = ifstmt->if_cond;
    then = ifstmt->if_block;
    gen_cond(cond, ifstmt->if_block_label, ifstmt->if_end_label, 0);
    char *end = get_generic_label();
    emit("\ttest @eax, @eax\n");
    emit("\tje %s\n", end);
    gen_statements(then, 0);
    emit_label(end);
}

/*  op -> mnemonic
    ge -> jl  !dest
    gt -> jg  dest
    le -> jg  !dest
    lt -> jl  dest
    eq -> je  dest
*/

/* boolcast:
    // !var
    cmpl 0, var
    sete al // set 1 or 0
    movzbl al, eax // clear eax except for the low bytes
    movl eax, var

    // !!var
    cmpl 0, var
    setne al // set 1 or 0
    movzbl al, eax // clear eax except for the low bytes
    movl eax, var
*/

/* Cast the value in register %eax to a boolean */
void cast_bool_eax(void) {
    emit("\tcmpl\t$0, @eax\n");
    emit("\tsete\t@al\n");
    emit("\tmovzbl\t@al, @eax\n");
}

/* Move value into %eax, cast to boolean */
void cast_bool(Node *n) {
    if (n->type == AST_NUMBER) {
        emit("\tmovl\t$%lld, @eax\n", n->number);
        cast_bool_eax();
    }
    else if (n->type == AST_IDENT) {
        emit("\tmovl\t%d(@ebp), @eax\n", n->ident_offset);
        cast_bool_eax();
    }
}

static void push_patch(char *label) {
    vector_append(patch_labels, (void*)label);
}

static void patch() {
    if (!vector_empty(patch_labels)) {
        char *label = (char*)vector_pop(patch_labels);
        emit_label(label);
    }
}

// note: gen_logor and gen_logand both work now
static void gen_logor(Node *cond, char *success, char *failure) {
    char *end;

    end = get_generic_label();
    gen_expr_eax(cond->binop_lhs);
    emit("\ttest @eax, @eax\n");
    emit("\tmov $1, @eax\n");
    emit("\tjne %s\n", end);
    gen_expr_eax(cond->binop_rhs);
    emit("\ttest @eax, @eax\n");
    emit("\tmov $1, @eax\n");
    emit("\tjne %s\n", end);
    emit("\tmov $0, @eax\n");
    emit("%s:\n", end);
}

static void gen_logand(Node *cond, char *success, char *failure) {
    char *end;

    end = get_generic_label();
    gen_expr_eax(cond->binop_lhs);
    emit("\ttest @eax, @eax\n");
    emit("\tmov $0, @eax\n");
    emit("\tje %s\n", end);
    gen_expr_eax(cond->binop_rhs);
    emit("\ttest @eax, @eax\n");
    emit("\tmov $0, @eax\n");
    emit("\tje %s\n", end);
    emit("\tmov $1, @eax\n");
    emit("%s:\n", end);
}

static void gen_cond(Node *cond, char *success, char *failure, bool jump) {
    switch (cond->type) {
        case AST_NUMBER: {
            emit("\tcmpl\t$0, $%lld\n", cond->number);
            emit("\tjle %s\n", failure);
            break;
        }
        case AST_IDENT: {
            emit("\tcmpl\t$0, %d(@ebp)\n", cond->ident_offset);
            break;
        }
        case AST_BINOP: {
            if (cond_op(cond->binop_symbol)) {
                switch (cond->binop_symbol) {
                    case OP_LOGAND: gen_logand(cond, success, failure); break;
                    case OP_LOGOR: gen_logor(cond, success, failure); break;
                    case OP_NE:
                        break;
                    case OP_EQ:
                        break;
                    case OP_GT:
                        break;
                    case OP_LT:
                        break;
                    case OP_GE:
                        break;
                    case OP_LE:
                        break;
                    default: log_warning("Unexpected conditional binary op %s", op2s(cond->binop_symbol));
                }
            }
            else {
                gen_expr_eax(cond);
                cast_bool_eax();
            }
            break;
        }
        case AST_UNOP: {
            //do_unop(cond);
            cast_bool(cond);
            break;
        }
        default: log_error("Unexpected ast node within conditional: %s", node2s(cond));
    }
}

static void gen_cond_assignment(Node *cond, char *success, char *failure) {
    switch (cond->type) {
        case AST_NUMBER: {
            cast_bool(cond);
            break;
        }
        case AST_IDENT: {
            cast_bool(cond);
            emit_op_mem_reg("movl", cond->ident_offset, "ebp", "eax");
            break;
        }
        case AST_BINOP: {
            if (cond_op(cond->binop_symbol)) {
                switch (cond->binop_symbol) {
                    case OP_LOGAND:
                        // this would mean gen_cond will have to generate its own success and failure labels. acceptable?
                        //gen_cond(cond->binop_lhs, get_generic_label(), get_generic_label());
                        break;
                    case OP_LOGOR:
                        break;
                    case OP_NE:
                        break;
                    case OP_EQ:
                        break;
                    case OP_GT:
                        break;
                    case OP_LT:
                        break;
                    case OP_GE:
                        break;
                    case OP_LE:
                        break;
                    default: log_warning("Unexpected conditional binary op %s", op2s(cond->binop_symbol));
                }
            }
            else {
                gen_expr_eax(cond);
                cast_bool_eax();
            }
            break;
        }
        case AST_UNOP: {
            //do_unop(cond);
            cast_bool(cond);
            break;
        }
        default: log_error("Unexpected ast node within conditional: %s", node2s(cond));
    }


    // rough sketch

    // traverse to bottom
    // if and:              go through each condition and jump away (false) if any of them are false, else fall through to truth
    // if or:               go through each condition and jump away (truth) if any of them are true, else fall through to false
    // if simple condition: use the above table
    // if expr:             idk
}

static void gen_statements(Vector *head, unsigned int funcsize) {
    // Note: you need to completely change how the stack is arranged, right now it makes no sense.
    // The same offsets used for local variables are also used for function call parameters for example
    unsigned int stack_space = funcsize;
    int type;
    Node *current;

    for (unsigned int i=0; i<head->length; i++) {
        current = (Node*)vector_get(head, i);
        type = current->type;
        switch(type) {
            case AST_FUNCDEF: {
                emit_function_decl(current);
                break;
            }
            case AST_UNOP: {
                gen_dec_or_inc(current);
                break;
            }
            case AST_IF: {
                gen_if(current);
                break;
            }
            case AST_RETURN: {
                gen_return(current);
                break;
            }
            case AST_FUNCCALL: {
                // Function pointers are generated by loading the name into eax and doing 'call *%eax'
                gen_function_call(current);
                break;
            }
            case AST_ASSIGN: {
                gen_assignment(current);
                break;
            }
            case AST_PRINTIDENT: {
                __print_ident(current->print_iden);
                break;
            }
            default: {
                log_warning("Node type %d is currently unimplemented", type);
            }
        }
    }
}

/*
-simple binary operation, v1 op v2-
    movl    v1, eax
    op      v2, eax
    movl    eax, idenoffset
-complex binary operation, x * 5 +(y + 5)-
    movl    y, eax
    addl    5, eax
    movl    eax, ebx
    movl    x, eax
    muli    5, eax
    addi    ebx, eax
-simple and expression, x > 20 && y < 10-
    movl    x, eax
    cmp     20, x
    jle      not_true
    movl    y, eax
    cmp     10, y
    jg      not_true
*/

static void gen_expr_traverse(Node *tree) {
    if (tree == NULL) return;
    if (tree->type == AST_IDENT) {
        emit_op_mem_reg("movl", tree->ident_offset, "ebp", "eax");
        return;
    }
    if (tree->type == AST_NUMBER) {
        emit("\tmovl\t$%lld, @eax", tree->number);
        //emit_op_literal_reg("movl", tree->number, "eax");
        return;
    }
    // 1/25 bugfix: I had the rhs and lhs mixed up, the assembly output went rhs op lhs instead of lhs op rhs
    if (tree->binop_rhs->type != AST_NUMBER) {
        gen_expr_traverse(tree->binop_rhs);
        emit_op_reg_reg("movl", "eax", "ecx");
    } else {
        emit("\tmovl\t$%lld, @ecx\n",  tree->binop_rhs->number);
        //emit_op_literal_reg("movl", tree->binop_lhs->number, "ecx");
    }
    if (tree->binop_lhs->type != AST_NUMBER) {
        gen_expr_traverse(tree->binop_lhs);
    } else {
        emit("\tmovl\t$%lld, @eax\n",  tree->binop_lhs->number);
        //emit_op_literal_reg("movl", tree->binop_rhs->number, "eax");
    }
    emit_op_reg_reg(get_opcode(tree->binop_symbol), "ecx", "eax");
}

static void gen_expr(Node *iden, Node *exprhead) {
    unsigned int i;

    if (exprhead->type == AST_NUMBER) {
        //emit_op_literal_mem("movl", exprhead->number, iden->ident_offset, "ebp");
        emit("\tmovl\t$%lld, %d(@ebp)\n", exprhead->number, iden->ident_offset);
    }
    else if (exprhead->type == AST_IDENT) {
        emit("\tmovl\t%d(@esp), @eax\n", exprhead->ident_offset);
        emit("\tmovl\t@eax, %d(@ebp)\n", iden->ident_offset);
    }
    else if (exprhead->type == AST_FUNCCALL) {
        // This does not work as expected!
        //MARK;
        unsigned int offset = 0;
        unsigned int parameters = exprhead->fc_params->length;
        for (i=0; i<parameters; i++) {
            Node *param = (Node*)vector_get(exprhead->fc_params, i);
            Node *parentparam = (Node*)vector_get(exprhead->fc_pointer->f_params, i);
            Node *iden = make_tmp_iden_node(parentparam->ident_type, offset);
            offset += parentparam->ident_type->bytes; // function parameters start at 0(esp)
            gen_expr(iden, param);
        }
        emit("\tcall\t_%s\n", exprhead->fc_pointer->f_name->body);
        emit("\tmovl\t@eax, %d(@ebp)\n", iden->ident_offset);
    }
    else {
            /*
        if (exprhead->type == AST_BINOP && exprhead->binop_lhs->type == AST_BINOP && exprhead->binop_rhs->type == AST_BINOP) {
            printf("equation = %s %s %s\n", get_opcode(exprhead->binop_lhs->binop_symbol), get_opcode(exprhead->binop_symbol), get_opcode(exprhead->binop_rhs->binop_symbol));
        }
            */
        gen_expr_traverse(exprhead->binop_lhs); // put lchild into iden
        emit("\tmovl\t@eax, %d(@ebp)\n", iden->ident_offset);
        gen_expr_traverse(exprhead->binop_rhs); // put rchild into eax
        emit("\tmovl\t%d(@ebp), @ecx\n", iden->ident_offset);
        emit("\t%s\t@eax, @ecx\n", get_opcode(exprhead->binop_symbol));
        emit("\tmovl\t@ecx, %d(@ebp)\n", iden->ident_offset);
    }
}

void do_code_gen(void) {
    C_Module *current = get_current_module();
    patch_labels = make_vector();
    // make current->infile->name into assembly
    default_outfile = fopen("outfile.s", "w");
    emit_fheader("outfile");
    // emit_static();
    __imp_printf_readonly();
    gen_statements(current->ast, 0);
    __imp_printf_def();
    // emit_dependencies();
    fclose(default_outfile);
}

/*
void do_int_cast(source_offset, target_offset, source_type) {
    switch(source_type) {
        case CCHAR:
            emit("movl %d(%esp), %eax", source_offset);
            emit("movb %al, %d(%esp)", target_offset);
            return;
        case CINT:
            emit("movl %d(%esp), %eax", source_offset);
            emit("movl %eax, %d(esp)", target_offset);
            return;
        case CSHORT:
            emit("movl %d(%esp), %eax", source_offset);
            emit("movw %ax, %d(%esp)", target_offset);
            return;
    }
}
*/

/* prototype: store assembly data as a structure of flags and output in a state-machine-like fashion
   pros: less floating const chars (same as if we had them stored statically though), hide messy emit statements
   cons: large amount of storage required, lots of reads and writes to set it up and flatten
    static const char *mnemonics = [movl, addl, ...];
    enum { movl, addl, ...};
    struct instruction { opcode, union }
    instruction_vector;

    flatten_instructions() {
        for (instruction in instruction_vector) {
            emit("%s %s, %s", mnemonics[instruction], ...);
        }
    }
*/
