#include <stdio.h>
#include <stdlib.h>
#include "cc.h"

// this structure is int-sized (23+1)
static struct op {
    int arity: 23;
    char associativity;
};

static struct op op_table[] =
{
    {2, 'l'}, // OP_COMMA
    {2, 'r'}, // OP_A_OR
    {2, 'r'}, // OP_A_XOR
    {2, 'r'}, // OP_A_AND
    {2, 'r'}, // OP_A_SAR
    {2, 'r'}, // OP_A_SAL
    {2, 'r'}, // OP_A_MOD
    {2, 'r'}, // OP_A_DIV
    {2, 'r'}, // OP_A_MUL
    {2, 'r'}, // OP_A_SUB
    {2, 'r'}, // OP_A_ADD
    {2, 'r'}, // OP_ASSIGN
    {2, 'r'}, // OP_TERNARY
    {2, 'l'}, // OP_LOGOR
    {2, 'l'}, // OP_LOGAND
    {2, 'l'}, // OP_BITOR
    {2, 'l'}, // OP_BITXOR
    {2, 'l'}, // OP_BITAND
    {2, 'l'}, // OP_NE
    {2, 'l'}, // OP_EQ
    {2, 'l'}, // OP_GE
    {2, 'l'}, // OP_GT
    {2, 'l'}, // OP_LE
    {2, 'l'}, // OP_LT
    {2, 'l'}, // OP_SAR
    {2, 'l'}, // OP_SAL
    {2, 'l'}, // OP_SUB
    {2, 'l'}, // OP_ADD
    {2, 'l'}, // OP_MOD
    {2, 'l'}, // OP_DIV
    {2, 'l'}, // OP_MUL
    {1, 'r'}, // OP_ALIGNOF
    {1, 'r'}, // OP_SIZEOF
    {1, 'r'}, // OP_ADDRESS
    {1, 'r'}, // OP_INDIRECTION
    {1, 'r'}, // OP_TYPECAST
    {2, 'r'}, // OP_BITNOT
    {2, 'r'}, // OP_LOGNOT
    {1, 'r'}, // OP_UNARY_MINUS
    {1, 'r'}, // OP_UNARY_PLUS
    {1, 'r'}, // OP_PRE_DEC
    {1, 'r'}, // OP_PRE_INC
    {1, 'l'}, // OP_COMP_LIT
    {2, 'l'}, // OP_ARROW
    {2, 'l'}, // OP_PERIOD
    {1, 'l'}, // OP_ARRAY_SUB
    {1, 'l'}, // OP_FUNC_CALL
    {1, 'l'}, // OP_POST_DEC
    {1, 'l'}  // OP_POST_INC
};

bool unset_op(unsigned int op) {
    return op < OP_COMMA; // Lexical analysis phase op catch
}

bool binary_op(unsigned int op) {
    return op_table[op].arity == 2;
}

bool unary_op(unsigned int op) {
    return op_table[op].arity == 1;
}

bool cond_op(unsigned int op) {
    return op == OP_LOGAND || op == OP_LOGOR || op >= OP_NE && op <= OP_LT;
}

bool left_associative(unsigned int op) {
    return op_table[op].associativity == 'l';
}

bool right_associative(unsigned int op) {
    return op_table[op].associativity == 'r';
}
