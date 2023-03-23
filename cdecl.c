#include <stdio.h>
#include <stdlib.h>
#include "cc.h"

/* C Decl parser
 * Input: A pointer to the start of the declaration tokens.
 * Output: A type structure for the declaration.
 */

Type *parse_c_declaration() {
    struct MODULE_RECORD *record = get_current_module();
    bool is_fptr = true;
    bool has_ud_basety = false;
    Token *tok = get_token();
    Token *last = tok;
    while (true) {
        if (last->type == TYIDENT && tok->type == TYSYMBOL && tok->id == OP_OPAREN) {
            is_fptr = false;
            break;
        }
        if (tok->type == TYIDENT) {

        }
        if (tok->type == TYSYMBOL && tok->id == OP_SEMICOLON) {
            break;
        }
        tok = get_token();
    }
}

/*
Type *parse_c_declaration() {
    i = get position
    k = get end position
    fptr = return true if (*iden, return false if iden(
    get base type
    assert(valid base type)
    i = position after base type
    do funcdecl or fptrdecl
}
*/
