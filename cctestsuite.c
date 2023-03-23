#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "cc.h"

/*
void test_precedence_parser(char *expression) {
    log_debug("given expression: %s", expression);
    TVector *tv = do_lex_string(expression);
    log_debug("tokens: ");
    print_tokens();
    Node *n = make_expr_node();
    assert(n->kind == AST_BINOP &&
           n->lchild->kind == AST_NUMBER && n->rchild->kind == AST_BINOP &&
           n->rchild->lchild->kind == AST_NUMBER && n->rchild->rchild->kind == AST_NUMBER);
    log_debug("precedence parser successfully parsed expression %s", expression);
    log_debug("%d", n->kind);
    log_debug("%d, %d", n->lchild->kind, n->rchild->kind);
    log_debug("%d, %d", n->rchild->lchild->kind, n->rchild->rchild->kind);
}
*/
