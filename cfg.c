#include <stdio.h>
#include <stdlib.h>
#include "cc.h"

/* IR
 * Input: Abstract syntax tree
 * Output: Control flow graph (TAC graph) / symbol table
 */

Map     *quad_symbols;
Vector  *quad_code;

/* Quadcode value: a container for symbol names OR numerical constants */
typedef struct quad_val {
    int type;
    union {
        char *sym;
        long val;
    };
} quad_val;

enum
{
    QJMP, QJG, QJL, QJGE, QJLE, QJZ, QJNZ,
    QADD, QSUB, QMUL, QDIV, QMOV, QLEA, QLOAD,
    QGOTO, QCMP, QLABEL,
};

/* Line of quadcode, where symbol(name) = arg0 op arg1; when op != conditional */
typedef struct quad {
    int op;
    char *name;
    quad_val *arg0;
    quad_val *arg1;
} quad;

/* Vectors of: basic block predecessors, quadcodes, basic block successors */
typedef struct bb {
    Vector *precs;
    Vector *code;
    Vector *succs;
} bb;

typedef struct cfg {
    bb *entry;
} Cfg;

quad *make_quadcode() {

}

bb *make_entry_bb(bb *link) {
    bb *wbb = malloc(sizeof(bb));
    wbb->precs = NULL;
    wbb->code = NULL;
    wbb->succs = link;
    return wbb;
}

Cfg *make_cfg(Vector *forest) {
    unsigned int i;
    Node *nod;
    Cfg *cfg;
    bb *wbb;

    cfg = malloc(sizeof(cfg));
    cfg->entry = make_entry_bb(wbb);

    for (i = 0; i < vector_length(forest); i++) {
        nod = (Node *)vector_get(forest, i);
    }
}
