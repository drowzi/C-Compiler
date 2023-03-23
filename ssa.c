#include <stdio.h>
#include <stdlib.h>
#include "cc.h"

static Vector *vars; // If all variables share the same base name, choose this
static Map *mvars; // Else, choose this

static int ssa_size;
static int ssa_nalloc;

// The symbol table may need to be reworked for static single assignment optimization.
// The heart of this file will be the ast_flatten function

/* https://www.cs.cmu.edu/~fp/courses/15411-f08/lectures/09-ssa.pdf
 * Wonderful brief resource for SSA optimization
 */

 // <dest_id> = <src_id> <symbol> <operand>
struct ssa_block_entry {
    unsigned int dest_id;
    unsigned int src_id;
    unsigned int symbol;
    unsigned int operand;
};

struct ssa_block {
    Vector *assignments;
    struct ssa_block *lchild;
    struct ssa_block *rchild;
};

struct ssa_block *make_ssa_block(Vector *v /* small vec */) {
    struct ssa_block *ssa = malloc(sizeof(struct ssa_block));
    ssa->assignments = v;
    ssa->lchild = NULL;
    ssa->rchild = NULL;
    return ssa;
}

struct ssa_block_entry *make_ssa_block_entry() {
    struct ssa_block_entry *ssa = malloc(sizeof(struct ssa_block_entry));
    ssa->dest_id = 0;
    ssa->src_id = 0;
    ssa->symbol = 0;
    ssa->operand = 0;
    return ssa;
}
