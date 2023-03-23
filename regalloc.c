#include <stdio.h>
#include <stdlib.h>
#include "cc.h"

#define MAX(a,b) (((a)>(b))?(a):(b))

/*
 * regalloc: CFG register allocator for an optimized backend (-O1)
 * Construct a graph where each vertex represents a unique variable in the program. Interference edges connect pairs of vertices
 * which are live at the same time, and preference edges connect pairs of vertices which are involved in move instructions.
 */



/*
 * ast_regalloc: AST register allocator for a non-optimized backend (-O0)
 * Sethi-Ullman algorithm - https://en.wikipedia.org/wiki/Sethi%E2%80%93Ullman_algorithm
 */

// This is currently designed for a load/store architecture - it needs to be changed to a register memory architecture
static unsigned int ast_regalloc_block(Vector *block);
static unsigned int ast_regalloc_branch(Node *branch);

static unsigned int ast_regalloc_block(Vector *block) {
    int type;
    unsigned int registers, top, l, r, t;
    Node *current;

    for (unsigned int i=0; i<block->length; i++) {
        current = (Node*)vector_get(block, i);
        type = current->type;
        switch(type) {
            case AST_ASSIGN: {
                registers = ast_regalloc_branch(current->assign_rhs);
                current->registers = registers;
                break;
            }
            case AST_IF: {
                l = ast_regalloc_branch(current->if_cond);
                r = ast_regalloc_block(current->if_block);
                registers = MAX(l, r);
                if (l == r) ++registers;
                current->registers = registers;
                break;
            }
            case AST_FUNCDEF: {
                l = ast_regalloc_branch(current->f_block);
                r = ast_regalloc_block(current->f_params);
                registers = MAX(l, r);
                if (l == r) ++registers;
                current->registers = registers;
                break;
            }
        }
        top = MAX(top, registers);
    }
    return top;
}

static unsigned int ast_regalloc_branch(Node *branch) {
    int type;
    unsigned int registers, lhs, rhs;

    type = branch->type;
    switch(type) {
        case AST_NUMBER: {
            registers = 0;
            break;
        }
        case AST_IDENT: {
            registers = 1;
            break;
        }
        case AST_UNOP: {
            registers = ast_regalloc_branch(branch->unop_val);
            break;
        }
        case AST_BINOP: {
            lhs = ast_regalloc_branch(branch->binop_lhs);
            rhs = ast_regalloc_branch(branch->binop_rhs);
            registers = MAX(lhs, rhs);
            if (lhs == rhs) ++registers;
            break;
        }
        case AST_FUNCCALL: {
            // registers = ast_regalloc_branch(branch->fc_params);
            break;
        }
    }
    branch->registers = registers;
    return registers;
}


void ast_regalloc(Vector *ast) {
    int type;
    unsigned int registers, l, r, t;
    Node *current;

    for (unsigned int i=0; i<ast->length; i++) {
        current = (Node*)vector_get(ast, i);
        type = current->type;
        switch(type) {
            case AST_ASSIGN: {
                current->registers = ast_regalloc_branch(current->assign_rhs);
                break;
            }
            case AST_IF: {
                l = ast_regalloc_branch(current->if_cond);
                r = ast_regalloc_block(current->if_block);
                registers = MAX(l, r);
                if (l == r) ++registers;
                current->registers = registers;
                break;
            }
            case AST_FUNCDEF: {
                l = ast_regalloc_block(current->f_block);
                r = ast_regalloc_block(current->f_params);
                registers = MAX(l, r);
                if (l == r) ++registers;
                current->registers = registers;
                break;
            }
        }
    }
}






