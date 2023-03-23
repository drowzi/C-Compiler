// Shortcuts of the form:
#define SYMBOL(tok) tok->type == TYSYMBOL
#define SPACE(tok) tok->type == TYSPACE
#define NEWLINE(tok) tok->type == TYNEWLINE
#define IDENT(tok) tok->type == TYIDENT
#define IS_OP_STAR(tok) tok->type == TYSYMBOL && tok->id == OP_STAR
