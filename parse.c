#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "cc.h"

/* Parser
 *  How it works: this file turns a vector of tokens into a forest of ASTs
 *  How it should work: it's fine as is
 */

static Vector *toplevel;

void ast_link_toplevel(Node *headnode);
static Node *make_print_ident_node(Node *iden);
static Node *make_iden_node(Type *ident_type, char *name, int offset);
static Node *make_return_node(Node *retval, Type *rettype);
static Node *make_number_node(bool is_string, char *cnum, int num);
static Node *make_function_call_node(Node *pointer, Vector *params);
static Node *make_function_decl_node(int size, Type *rettype, char *name, Vector *params, Vector *fstmts);
static Node *make_assign_node(Node *iden, Node *exprhead);
static Node *make_expr_node(Node *expr_head, Type *expr_type);
static Node *make_binop_node(int symbol, Node *n, Node *m);
static Node *make_unop_node(int symbol, Node *n);
static Node *make_if_node(Node *cond, Vector *then);
static Node *make_for_node(Node *cond, Vector *then);
static Node *make_while_node(Node *cond, Vector *then);
static Node *make_stmt_node(Vector *stmts);
static Node *make_struct_node(void);
static Node *make_union_node(void);
static Node *make_enum_node(void);
static Node *make_stub_node(void);
static Node *make_token_node(Token *tok);
static Node *parse_local_stmt(void);
static Node *get_iden(char *name, Type *ty, int offset);
static Node *parse_function_def(unsigned int size, Type *ty, char *name, Vector *params, Vector *fstmts);
static Node *parse_function_decl(unsigned int size, Type *ty, char *name, Vector *params);
static Vector *parse_block(bool is_function, Type *rettype, unsigned int *size);
static Vector *parse_param_types(unsigned int *size);
static Node *parse_assignment_tail(Node *iden, char *dbgtype);
static Node *parse_function_call(char *name);
static Node *parse_function(Type *ty, char *name);
static Node *parse_local_decl_assignment(Type *ty, char *name, int offset);
static Node *parse_global_decl_assignment(Type *ty, char *name);
static Node *parse_local_decl(unsigned int *offset);
static Node *parse_global_decl(Type *ty, Token *iden);
static Node *parse_pre_inc_or_dec(int type);
static void parse_return_stmt(Type *return_type, Vector **local_block);
static void parse_local_decl_reassignment(Node *idenref, Vector **local_block);
static void parse_while_stmt(Type *return_type, Vector **local_block);
static void parse_for_stmt(Type *return_type, Vector **local_block);
static void parse_if_stmt(Type *return_type, Vector **local_block);
static int is_right_assoc(Token *op);
static int expr_sentinel(Token *tok, int bracket_depth, int paren_depth);
static long long fold_constants(Node *lchild, Node *rchild, Token *op);
static void pop_and_link_tree(Vector *operand_stack, Token *op);
static bool ectx_default_sentinel(Token *current);
static bool ectx_index_sentinel(Token *current);
static bool ectx_farg_sentinel(Token *current);
static bool ectx_enclosed_cond_sentinel(Token *current);
static Node *parse_expr(bool(*sentinel)(Token *));
static int get_fixed_offset(void);

// Used for return, break, and continue nodes while the logic is available
static char *current_return_label;
static char *current_break_label;
static char *current_cont_label;

#include "tokenshortcuts.inc"

/* Parsing */

/* Used for printing memory offsets while printf calls aren't supported (no cpp or va args currently) */
static Node *make_print_ident_node(Node *iden) {
    Node *n = malloc(sizeof(Node));
    n->type = AST_PRINTIDENT;
    n->print_iden = iden;
    return n;
}

Node *make_tmp_iden_node(Type *ident_type, int offset) {
	static int tmp_number = 0;
	String *name = make_fmt_string("tmp%d", tmp_number++);
    Node *n = malloc(sizeof(Node));
    n->type = AST_IDENT;
    n->ident_name = string_body(name);
    n->ident_type = ident_type;
    n->ident_offset = offset;
    string_free(name);
    return n;
}

static Node *make_iden_node(Type *ident_type, char *name, int offset) {
    Node *n = malloc(sizeof(Node));
    n->type = AST_IDENT;
    n->ident_name = name;
    n->ident_type = ident_type;
    n->ident_offset = -offset;
    return n;
}

static Node *make_return_node(Node *retval, Type *rettype) {
    Node *n = malloc(sizeof(Node));
    n->type = AST_RETURN;
    n->return_val = retval;
    n->return_type = rettype;
    return n;
}

/* Used for discovering a numbers base and type; for consistencies sake, you should call this before node creation */
static void parse_number(Node *n, char *num) {
    unsigned int i, length;
    bool decimal;
    int base;
    char c;

    i = 0;
    length = strlen(num);

    // parse_base
    c = num[i++];
    if (c == '0' && length > 1) {
        c = num[i++];
        if (c == 'x') {
            base = 16;
        } else {
            base = 8;
            --i;
        }
    } else {
        base = 10;
    }

    // parse_explicit_type
    for (; i < length; i++) {
        c = num[i];
        if (c == '.' && !decimal) {
            decimal = true;
        }
        if (c == 'f' || c == 'u' || c == "l") {
            // unimplemented
            break;
        }
    }

    n->number_base = base;
    n->number_type = get_number_type(0);
}

static Node *make_number_node(bool is_string, char *cnum, int num) {
    Node *n = malloc(sizeof(Node));
    n->type = AST_NUMBER;
    parse_number(n, cnum);
    n->number = is_string ? strtol(cnum, NULL, 10) : num;
    return n;
}

static Node *make_expr_node(Node *expr_head, Type *expr_type) {
    Node *n = malloc(sizeof(Node));
    n->type = AST_EXPR;
    n->expr_head = expr_head;
    n->expr_type = expr_type;
    return n;
}

static Node *make_function_call_node(Node *pointer, Vector *params) {
    Node *n = malloc(sizeof(Node));
    n->type = AST_FUNCCALL;
    n->fc_pointer = pointer;
    n->fc_params = params;
    return n;
}

static Node *make_function_decl_node(int size, Type *rettype, char *name, Vector *params, Vector *fstmts) {
    Node *n = malloc(sizeof(Node));
    n->type = AST_FUNCDEF;
    n->f_size = size;
    n->f_return_type = rettype;
    n->f_name = make_string(name);
    n->f_params = params;
    n->f_block = fstmts;
    n->f_block_label = get_function_block_label();
    n->f_end_label = get_function_entry_label();
    return n;
}

static Node *make_assign_node(Node *iden, Node *exprhead) {
    Node *n = malloc(sizeof(Node));
    n->type = AST_ASSIGN;
    n->assign_lhs = iden;
    n->assign_rhs = exprhead;
    return n;
}

static Node *make_binop_node(int symbol, Node *n, Node *m) {
    Node *op = malloc(sizeof(Node));
    op->type = AST_BINOP;
    op->binop_symbol = symbol;
    op->binop_lhs = n;
    op->binop_rhs = m;
    return op;
}

static Node *make_unop_node(int symbol, Node *n) {
    Node *op = malloc(sizeof(Node));
	op->type = AST_UNOP;
	op->unop_symbol = symbol;
	op->unop_val = n;
	return op;
}

static Node *make_if_node(Node *cond, Vector *then) {
    Node *n = malloc(sizeof(Node));
    n->type = AST_IF;
    n->if_block_label = get_generic_label();
    n->if_end_label = get_generic_label();
    n->if_cond = cond;
    n->if_block = then;
    return n;
}

static Node *make_for_node(Node *cond, Vector *then) {
    Node *n = malloc(sizeof(Node));
    n->type = AST_FOR;
    n->for_cond = cond;
    n->for_block = then;
    return n;
}

static Node *make_while_node(Node *cond, Vector *then) {
    Node *n = malloc(sizeof(Node));
    n->type = AST_WHILE;
    n->while_cond = cond;
    n->while_block = then;
    return n;
}

static Node *make_struct_node() {
    Node *n = malloc(sizeof(Node));
    n->type = AST_STRUCT;
    return n;
}

static Node *make_union_node() {
    Node *n = malloc(sizeof(Node));
    n->type = AST_UNION;
    return n;
}

static Node *make_enum_node() {
    Node *n = malloc(sizeof(Node));
    n->type = AST_ENUM;
    return n;
}

static Node *make_stub_node() {
    Node *n = malloc(sizeof(Node));
    n->type = AST_STUB;
    return n;
}

static Node *make_token_node(Token *tok) {
    assert(tok->type == TYIDENT || tok->type == TYNUMBER);
    Node *n;
    char *name;
    switch(tok->type) {
        case TYIDENT: {
            name = tok->value;
            assert_lvar_exists(name);
            n = get_lvar(name);
            break;
        }
        case TYNUMBER: {
            name = tok->value;
            n = make_number_node(true, name, 0);
            break;
        }
    }
    return n;
}

void ast_link_toplevel(Node *headnode) {
    if (headnode != NULL) {
        vector_append(toplevel, (void*)headnode);
    }
}

/* Parses a return statement, asserts return_type, stores node in &local_block */
static void parse_return_stmt(Type *return_type, Vector **local_block) {
    Node *ret;
    Token *peek;

    peek = peek_next_token();
    switch (peek->type) {
        case TYSTRING:
        case TYCHAR:
        case TYLSTRING:
            assert(ret->type == CTYPECHAR);
            break;
        default: {
            Node *expr = parse_expr(ectx_default_sentinel);
            //if (expr->)
            warn("Return statement type does not match function's return type.");
            ret = make_return_node(expr, return_type);
        }

    }
    vector_append(*local_block, (void*)ret);
}

static void parse_local_decl_reassignment(Node *idenref, Vector **local_block) {
    Token *tok;
    Node *assign;

    tok = get_token();
    assert(tok->type == TYSYMBOL);
    switch (tok->id) {
        case OP_OPAREN: {
            // func call
            break;
        }
        case OP_ASSIGN: {
            assign = parse_assignment_tail(idenref, "local reassignment");
            vector_append(*local_block, (void*)assign);
            break;
        }
        default:
            log_error("Unexpected behavior, node_type: %s", ty2s(idenref->type));
    }
}

/* Currently doesn't support function pointers */
static Vector *parse_param_types(unsigned int *size) {
    Token *curr, *peek;
    Node *tmp;
    Vector *paramtypes;
    char *name;
    Type *ty;
    int paramoffset;

    paramtypes = make_vector();
    paramoffset = 0;
    while (true) {
        curr = get_token();
        if (curr->type == TYSYMBOL && curr->id == OP_CPAREN) {
            break;
        }
        if (curr->type == TYIDENT || curr->type == TYKEYWORD) {
            ty = parse_fparam_type();
            curr = get_token();
            if (curr->type == TYIDENT) {
                name = curr->value;
                paramoffset += ty->bytes;
                tmp = make_iden_node(ty, name, paramoffset);

                assert_lvar_doesnt_exist(name);
                define_lvar(name, tmp);
                vector_append(paramtypes, (void*)tmp);
                peek = peek_next_token();
                if (peek->type == TYSYMBOL && peek->id == OP_COMMA) {
                    skip_token();
                    continue;
                } else {
                    assert(peek->type == TYSYMBOL && peek->id == OP_CPAREN);
                    skip_token();
                    break;
                }
            } else {
                log_error("expected identifier here");
            }
        }
    }
    size += paramoffset;
    return paramtypes;
}

static Node *parse_function_call(char *name) {
    Node *fcall, *funcdef, *param;
    Vector *params;
    int parameters, i;
    Token *peek;

    peek = peek_token(0);
    if (peek->type == TYSYMBOL && peek->id == OP_OPAREN) {
        assert_gvar_exists(name);
        funcdef = get_gvar(name);
        params = make_vector();
        get_token(); // eat (
        parameters = funcdef->f_params->length;
        if (parameters) {
            for (i=0; i<parameters; i++) {
                param = parse_expr(ectx_farg_sentinel);
                vector_append(params, (void*)param);
            }
            peek = peek_token(-1);
            assert(peek->id == OP_CPAREN);
        }
        else {
            fcall = make_function_call_node(funcdef, params);
            assert(get_token()->id == OP_CPAREN);
        }
    }
    return fcall;
}

static Node *parse_pre_inc_or_dec(int type) {
    Node *parent, *unop;
    Token *tok;
    int new_type;

    tok = get_token();
    assert(tident(tok));
    assert_lvar_exists(tok->value);
    parent = get_lvar(tok->value);
    new_type = (type == OP_DEC) ? OP_PRE_DEC: OP_PRE_INC;
    unop = make_unop_node(new_type, parent);
    return unop;
}

/* if name exists, return symtable[name], else create node for name, add it to symtable, and return it */
static Node *get_iden(char *name, Type *ty, int offset) {
    Node *iden;

    if (lvar_exists(name)) {
        iden = get_lvar(name);
    } else {
        iden = make_iden_node(ty, name, offset);
        define_lvar(name, iden);
    }
    return iden;
}

static Node *parse_assignment_tail(Node *iden, char *dbgtype) {
    Node *assign, *expr;

    expr = parse_expr(ectx_default_sentinel);
    assign = make_assign_node(iden, expr);
    log_debug("Assignment node (%s) created: \nLHS = %sRHS = %s", dbgtype, node2s(iden), node2s(expr));
    return assign;
}

// parse decl assignment
static Node *parse_local_decl_assignment(Type *ty, char *name, int offset) {
    return parse_assignment_tail(get_iden(name, ty, offset), "local");
}

static Node *parse_global_decl_assignment(Type *ty, char *name) {
    Node *iden;

    assert_gvar_doesnt_exist(name);
    iden = make_iden_node(ty, name, 0);
    define_gvar(name, iden);
    return parse_assignment_tail(iden, "global");
}

static void declare_identifier(char *name, Type *ty, unsigned int *offset) {
    Node *iden = make_iden_node(ty, name, *offset);
    define_lvar(name, iden);
}

/* Return full definition or null if no definition */
static Node *parse_local_decl(unsigned int *offset) {
	// This function begins assuming <userdefined-type>
	Token *iden, *tok;
	Type *ty;
	char *name;
	Node *assign;
	unwind_token_pos(); // rewind type
	ty = parse_local_decl_type();
	iden = get_token();
    assert(iden->type == TYIDENT);
	*offset += ty->bytes;
	tok = get_token();
	if (tsymbol(tok)) {
        switch (tok->id) {
            case OP_ASSIGN: {
                name = iden->value;
                assign = parse_local_decl_assignment(ty, name, *offset);
                //tok = get_token();
                //print_token(tok);
                return assign;
            }
            case OP_SEMICOLON: {
                declare_identifier(iden->value, ty, offset);
                //tok = get_token();
                return NULL;
            }
            case OP_COMMA: {
                declare_identifier(iden->value, ty, offset);
                while (true) {
                    iden = get_token();
                    assert(iden->type == TYIDENT);
                    *offset += ty->bytes;
                    tok = get_token();
                    declare_identifier(iden->value, ty, offset);
                    if (tok->type == TYSYMBOL) {
                        if (tok->id == OP_COMMA) continue;
                        if (tok->id == OP_SEMICOLON) break;
                    }
                    log_error("Incomplete identifier declaration list");
                }
                return NULL;
            }
        }
	}
}

static void parse_while_stmt(Type *return_type, Vector **local_block) {
    // store break, continue
    unsigned int size = 0;
    expect(OP_OPAREN);
    Node *cond = parse_expr(ectx_enclosed_cond_sentinel);
    expect(OP_CPAREN);
    expect(OP_OBRACE);
    Vector *then = parse_block(true ,return_type, &size);
    expect(OP_CBRACE);
    Node *whilestmt = make_stub_node();
    vector_append(*local_block, (void*)whilestmt);
}

static void parse_for_stmt(Type *return_type, Vector **local_block) {
    // store break, continue
    unsigned int size = 0;
    // maybe_initialize
    expect(OP_OPAREN);
    expect(OP_SEMICOLON);
    // maybe_cond
    expect(OP_SEMICOLON);
    // maybe_expr
    expect(OP_CPAREN);
    expect(OP_OBRACE);
    Vector *then = parse_block(true, return_type, &size);
    expect(OP_CBRACE);
    Node *forstmt = make_stub_node();
    vector_append(*local_block, (void*)forstmt);
}

static void parse_if_stmt(Type *return_type, Vector **local_block) {
    // No global label setting is needed
    unsigned int size;
    Token *peek;
    Vector *then;
    Node *ifstmt;

    size = 0;
    expect(OP_OPAREN);
    Node *cond = parse_expr(ectx_enclosed_cond_sentinel);
    peek = peek_next_token();
    //if (tsymbol(peek) && peek->id == OP_OBRACE)
        then = parse_block(true, return_type, &size);
    //else
        //then = parse_statement
    ifstmt = make_if_node(cond, then);
    vector_append(*local_block, (void*)ifstmt);
}

/* Parses a block of code, shifting symtable if needed, expecting rettype return, and adding to the size */
/* If there is no open brace after the conditional, bind whatever statement/statement block follows */
static Vector *parse_block(bool needs_pop, Type *rettype, unsigned int *size) {
    Vector *block = make_vector();
    Token *curr = get_token();
    Node *idenref, *assign, *unop;
    unsigned int blocksize;

    blocksize = 0;
    // Functions push localenv early to store parameters
    if (needs_pop) {
        push_localenv();
    }
    assert(curr->id == OP_OBRACE);
    while (true) {
        curr = get_token();
        int type = curr->type;
        if (type == TYNEWLINE) continue;
        if (type == TYSYMBOL) {
            if (curr->id == OP_CBRACE) break;
            switch (curr->id) {
                case OP_DEC:
                case OP_INC: {
                    unop = parse_pre_inc_or_dec(curr->id);
                    expect(OP_SEMICOLON);
                    vector_append(block, (void*)unop);
                    break;
                }
                case OP_STAR: {
                    // Indirection not yet supported
                }
                case OP_OPAREN: {
                    // compound_block = parse_block(1, ty, &size);
                }
                default: {
                    log_error("Unexpected symbol at beginning of statement: %s", op2s(curr->id));
                }
            }
            continue;
        }
		if (type == TYKEYWORD) {
            switch (curr->id) {
                case KWPRINTIDENT: {
                    expect(OP_OPAREN);
                    vector_append(block, (void*)make_print_ident_node(get_lvar(get_token()->value)));
                    expect(OP_CPAREN);
                    expect(OP_SEMICOLON);
                    break;
                }
                case KWRETURN: {
                    parse_return_stmt(rettype, &block);
                    break;
                }
                case KWIF: {
                    parse_if_stmt(rettype, &block);
                    break;
                }
                case KWWHILE: {
                    parse_while_stmt(rettype, &block);
                    break;
                }
                case KWFOR: {
                    parse_for_stmt(rettype, &block);
                    break;
                }
                default: goto OTHER_KW;
            }
            continue;
		}
        if (type == TYIDENT) {
            // Naked identifier
            idenref = get_lvar(curr->value);
            if (idenref != NULL) {
                // Identifier exists in the local namespace
                parse_local_decl_reassignment(idenref, &block);
                continue;
            } else {
                // User defined type or bad syntax
                assert_type_exists(curr);
                unwind_token_pos();
            }
        }
        OTHER_KW:
		if ((assign = parse_local_decl(&blocksize)) != NULL) {
            vector_append(block, (void*)assign);
		}
    }
    *size += blocksize;
    if (needs_pop) {
        pop_localenv();
    }
    return block;
}

/* Parses a new function or fills an old function declaration */
static Node *parse_function_def(unsigned int size, Type *ty, char *name, Vector *params, Vector *fstmts) {
    Node *def;

    def = get_gvar(name);
    if (def == NULL) {
        def = make_function_decl_node(size, ty, name, params, fstmts);
        define_gvar(name, def);
    } else {
        assert(def->f_block == NULL);
        fill_function_decl(name, fstmts);
    }
    return def;
}

/* Parses a function declaration of the form '<type> <ident> (<params>);' */
/* NULL is returned from this function so the forest isn't riddled with useless definition trees */
static Node *parse_function_decl(unsigned int size, Type *ty, char *name, Vector *params) {
    Node *decl;

    assert_gvar_doesnt_exist(name);
    decl = make_function_decl_node(size, ty, name, params, NULL);
    define_gvar(name, decl);
    log_debug("Found declaration for function %s.", name);
    skip_token();
    return NULL;
}

/* This function currently returns null when the parsed node isn't relevant to the back end */
/* CC currently does not support plain type parameters */
static Node *parse_function(Type *ty, char *name) {
    Node *f;
    Vector *params, *fstmts;
    Token *peek;
    unsigned int size;

    push_localenv();
    size = ty->bytes;
    params = parse_param_types(&size);
    peek = peek_next_token();

    assert(peek->type == TYSYMBOL);
    switch (peek->id) {
        case OP_OBRACE: {
            fstmts = parse_block(false, ty, &size);
            f = parse_function_def(size, ty, name, params, fstmts);
            break;
        }
        case OP_SEMICOLON: {
            f = parse_function_decl(size, ty, name, params);
            break;
        }
        default: {
            log_error("Unexpected token %s after function parameters.", op2s(peek->id));
        }
    }
    pop_localenv();
    return f;
}

/* Parse a declaration in the global scope */
static Node *parse_global_decl(Type *ty, Token *iden) {
    Node *decl;
    Token *tok;

    assert(iden->type == TYIDENT);
    tok = get_token();
    if (tsymbol(tok)) {
        switch (tok->id) {
            case OP_OPAREN:
                decl = parse_function(ty, iden->value);
                break;
            case OP_ASSIGN:
                decl = parse_global_decl_assignment(ty, iden->value);
                break;
        }
        return decl;
    }
    log_error("Expected valid symbol after identifier in global namespace, got %s.", ty2s(tok->type));
    return NULL;
}

// Current method for discovering if an expression is over. This needs to be extended for incomplete
// expression detection.

static long long fold_constants(Node *lchild, Node *rchild, Token *op) {
    long long res, r, l;

    r = rchild->number;
    l = lchild->number;
    switch(op->id) {
        case OP_LOGOR: res = l || r; break;
        case OP_LOGAND: res = l && r; break;
        case OP_BITOR: res = l | r; break;
        case OP_BITXOR: res = l ^ r; break;
        case OP_BITAND: res = l & r; break;
        case OP_NE: res = l != r; break;
        case OP_EQ: res = l == r; break;
        case OP_GE: res = l >= r; break;
        case OP_GT: res = l > r; break;
        case OP_LE: res = l <= r; break;
        case OP_LT: res = l < r; break;
        case OP_SAR: res = l >> r; break;
        case OP_SAL: res = l << r; break;
        case OP_SUB: res = l - r; break;
        case OP_ADD: res = l + r; break;
        case OP_MOD: res = l % r; break;
        case OP_DIV: res = l / r; break;
        case OP_MUL: res = l * r; break;
        default: log_error("Failed to fold constants: invalid operator %s", op2s(op->id));
    }
    return res;
}

static void pop_and_link_tree(Vector *operand_stack, Token *op) {
    Node *head, *rchild, *lchild;
    char buf[64];
    long long l;

    if (unary_op(op->id)) {
        assert(vector_length(operand_stack) > 0);
        rchild = (Node*)vector_pop(operand_stack);
        head = make_unop_node(op->id, rchild);
        vector_append(operand_stack, (void*)head);
        return;
    }

    assert(vector_length(operand_stack) > 1);

    rchild = (Node*)vector_pop(operand_stack);
    lchild = (Node*)vector_pop(operand_stack);
    if (0 & rchild->type == AST_NUMBER && lchild->type == AST_NUMBER) {
        l = fold_constants(lchild, rchild, op);
        head = make_number_node(false, NULL, l);
    } else {
        head = make_binop_node(op->id, lchild, rchild);
    }
    vector_append(operand_stack, (void*)head);
}

static bool ectx_default_sentinel(Token *current) {
    return current->id == OP_SEMICOLON;
}

static bool ectx_index_sentinel(Token *current) {
    return current->id == OP_CBRACKET;
}

static bool ectx_farg_sentinel(Token *current) {
    return current->id == OP_COMMA || current->id == OP_CPAREN;
}

static bool ectx_enclosed_cond_sentinel(Token *current) {
    return current->id == OP_CPAREN;
}

/*
6.3.1.3 Signed and unsigned integers

1 When a value with integer type is converted to another integer type other than _Bool, if the value can be represented
    by the new type, it is unchanged.

2 Otherwise, if the new type is unsigned, the value is converted by repeatedly adding or subtracting one more than the
    maximum value that can be represented in the new type until the value is in the range of the new type.

3 Otherwise, the new type is signed and the value cannot be represented in it; either the result is implementation-defined
    or an implementation-defined signal is raised.
*/

static Node *parse_expr(bool(*sentinel)(Token *)) {
    Vector *operator_stack, *operand_stack;
    Node *array_index, *fcall, *n, *expr_head;
    Token *tok, *peek, *op, *op2, *last;
    //<iden> = (implied <iden_type>) <expr_type>
    Type *expr_type;
    unsigned int b, p, top_prec, curr_prec;

    operator_stack = make_vector();
    operand_stack = make_vector();
    b = 0;
    p = 0;
    while (true) {
        tok = get_token();
        //print_token(tok);
        if (tok->type == TYSYMBOL) {
            if ((b == 0 && p == 0) && (*sentinel)(tok)) {
                break;
            }
            switch (tok->id) {
                case OP_OBRACKET: {
                    array_index = parse_expr(ectx_index_sentinel);
                    //expect(OP_CBRACKET);
                    // catch negative index
                    // attach the array index tree
                    continue;
                }
                case OP_OPAREN: {
                    peek = peek_next_token();
                    if (is_valid_type(peek)) {
                        // parse cast
                    }
                    p++;
                    vector_append(operator_stack, (void*)tok);
                    continue;
                }
                case OP_CPAREN: {
                    p--;
                    while (!vector_empty(operator_stack)) {
                        op = (Token*)vector_pop(operator_stack);
                        if (op->id == OP_OPAREN) {
                            break;
                        } else {
                            pop_and_link_tree(operand_stack, op);
                        }
                    }
                    continue;
                }
                default: {
                    // Figure out lexical analysis real types (unset_op(tok))
                    if (tok->id == OP_STAR) {
                        peek = peek_next_token();
                        last = peek_last_token();
                        // bad bad bad
                        if (peek->type == TYIDENT && (last->type == TYSYMBOL && binary_op(last->id) == false)) {
                            assert_lvar_exists(peek->value);
                            tok->id = OP_INDIRECTION;
                        } else {
                            tok->id = OP_MUL;
                        }
                    }
                    // Pop operators until the new operator can be placed on top
                    while (!vector_empty(operator_stack)) {
                        op2 = (Token*)vector_top(operator_stack);
                        top_prec = op2->id;
                        curr_prec = tok->id;
                        if (top_prec > curr_prec || (top_prec == curr_prec && left_associative(top_prec))) {
                            vector_pop(operator_stack);
                            pop_and_link_tree(operand_stack, op2);
                            continue;
                        }
                        break;
                    }
                    vector_append(operator_stack, (void*)tok);
                }
            }
        } else {
            if (tok->type == TYIDENT) {
                // wrap function calls up into one node
                peek = peek_next_token();
                if (peek->type == TYSYMBOL && peek->id == OP_OPAREN) {
                    fcall = parse_function_call(tok->value);
                    vector_append(operand_stack, (void*)fcall);
                    //print_node(fcall);
                    continue;
                }
            }
            //print_token(tok);
            n = make_token_node(tok);
            vector_append(operand_stack, (void*)n);
        }
    }
    while (!vector_empty(operator_stack)) {
        op = (Token*)vector_pop(operator_stack);
        pop_and_link_tree(operand_stack, op);
    }
    // this will break when an empty [] is called
    if (vector_empty(operand_stack)) {
        log_warning("parse_expr returned null");
        return NULL;
    }
    expr_head = (Node*)vector_pop(operand_stack);
    vector_free(operator_stack);
    vector_free(operand_stack);

    printf("Expression output as: ");
    print_expr(expr_head);
    printf("\n");

    return expr_head;
    //return parse_expr(expr_head, expr_type);
}

static Node *parse_sizeof() {
    // assert each type exists
    // get type
    // parse expression. allow type size arithmetic within a single call
}

static int get_fixed_offset() {
    static int offset = 0;
    offset += 4;
    return offset;
}

void print_nodes() {
    for (unsigned int i=0; i<toplevel->length; i++) {
        Node *n = (Node*)vector_get(toplevel, i);
        print_node(n);
    }
}

void print_expr(Node *exprhead) {
    unsigned int kind;

    kind = exprhead->type;
    switch (kind) {
        case AST_UNOP: {
            printf("%s ", op2s(exprhead->unop_symbol));
            print_expr(exprhead->unop_val);
            break;
        }
        case AST_BINOP: {
            print_expr(exprhead->binop_lhs);
            printf("%s ", op2s(exprhead->binop_symbol));
            print_expr(exprhead->binop_rhs);
            break;
        }
        case AST_NUMBER: {
            printf("%lld ", exprhead->number);
            break;
        }
        case AST_IDENT: {
            printf("%s ", exprhead->ident_name);
            break;
        }
        default: {
            printf("%s ", node2s(exprhead));
            break;
        }
    }
}

void print_node(Node *n) {
    printf("%s", node2s(n));
}

/* Compilation unit */
void make_ast() {
    C_Module *record = get_current_module();
    Type *ty;
    Node *decl;
    Token *curr;

    toplevel = make_vector();
    while (tokens_left()) {
        curr = get_token();
        if (curr->type == TYIDENT || curr->type == TYKEYWORD) {
            unwind_token_pos();
            ty = parse_global_decl_type();
            decl = parse_global_decl(ty, get_token());
            ast_link_toplevel(decl);
        } else {
            log_warning("missplaced token in global scope:");
            print_token(curr);
        }
    }
    record->ast = toplevel;
}


