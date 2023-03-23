#include <stdio.h>
#include <stdlib.h>
#include "cc.h"

static List *debug_memory;

char *ty2s(int kind) {
    switch (kind) {
        case TYSPACE: return "TYSPACE";
        case TYNEWLINE: return "TYNEWLINE";
        case TYEOF: return "TYEOF";
        case TYCOMMENT: return "TYCOMMENT";
        case TYIDENT: return "TYIDENT";
        case TYKEYWORD: return "TYKEYWORD";
        case TYNUMBER: return "TYNUMBER";
        case TYSYMBOL: return "TYSYMBOL";
        case TYCHAR: return "TYCHAR";
        case TYSTRING: return "TYSTRING";
        default: return "TYNOTFOUND";
    }
}

char *tok2s(Token *t) {
    String *token_string;
    int type;

    type = t->type;
    switch (type) {
        case TYKEYWORD: {
            token_string = make_fmt_string("<type=%s, id='%s'>\n", ty2s(t->type), kw2s(t->id));
            break;
        }
        case TYSYMBOL: {
            token_string = make_fmt_string("<type=%s, id='%s'>\n", ty2s(t->type), op2s(t->id));
            break;
        }
        case TYIDENT:
        case TYNUMBER: {
            token_string = make_fmt_string("<type=%s, value='%s'>\n", ty2s(t->type), t->value);
            break;
        }
        default: token_string = make_fmt_string("<type=%s>\n", ty2s(t->type));
    }
    return string_body(token_string);
}

char *kw2s(int kw) {
    switch (kw) {
        case KWAUTO: return "auto";
        case KWBREAK: return "break";
        case KWCASE: return "case";
        case KWCHAR: return "char";
        case KWCONST: return "const";
        case KWCONTINUE: return "continue";
        case KWDEFAULT: return "default";
        case KWDO: return "do";
        case KWDOUBLE: return "double";
        case KWELSE: return "else";
        case KWENUM: return "enum";
        case KWEXTERN: return "extern";
        case KWFLOAT: return "float";
        case KWFOR: return "for";
        case KWGOTO: return "goto";
        case KWIF: return "if";
        case KWINT: return "int";
        case KWLONG: return "long";
        case KWREGISTER: return "register";
        case KWRETURN: return "return";
        case KWSHORT: return "short";
        case KWSIGNED: return "signed";
        case KWSIZEOF: return "sizeof";
        case KWSTATIC: return "static";
        case KWSTRUCT: return "struct";
        case KWSWITCH: return "switch";
        case KWTYPEDEF: return "typedef";
        case KWUNION: return "union";
        case KWUNSIGNED: return "unsigned";
        case KWVOID: return "void";
        case KWVOLATILE: return "volatile";
        case KWWHILE: return "while";
        case KWPRINTIDENT: return "__printident";
        default: return "KWNOTFOUND";
    }
}

char *op2s(int op) {
    switch (op) {
        case OP_ASSIGN: return "=";
        case OP_PRE_DEC:
        case OP_POST_DEC:
        case OP_DEC: return "--";
        case OP_PRE_INC:
        case OP_POST_INC:
        case OP_INC: return "++";
        case OP_OPAREN: return "(";
        case OP_CPAREN: return ")";
        case OP_STAR: return "*";
        case OP_AMP:
        case OP_BITAND:
        case OP_ADDRESS: return "&";
        case OP_ARROW: return "->";
        case OP_A_ADD: return "+=";
        case OP_A_AND: return "&=";
        case OP_A_DIV: return "/=";
        case OP_A_MOD: return "%=";
        case OP_A_MUL: return "*=";
        case OP_A_OR: return "|=";
        case OP_A_SAL: return "<<=";
        case OP_A_SAR: return ">>=";
        case OP_A_SUB: return "-=";
        case OP_A_XOR: return "^=";
        case OP_EQ: return "==";
        case OP_GT: return ">";
        case OP_LT: return "<";
        case OP_GE: return ">=";
        case OP_LE: return "<=";
        case OP_LOGAND: return "&&";
        case OP_LOGOR: return "||";
        case OP_NE: return "!=";
        case OP_UNARY_MINUS:
        case OP_SUB: return "-";
        case OP_UNARY_PLUS:
        case OP_ADD: return "+";
        case OP_MOD: return "%";
        case OP_DIV: return "/";
        case OP_INDIRECTION:
        case OP_MUL: return "*";
        case OP_SAL: return "<<";
        case OP_SAR: return ">>";
        case OP_COMMA: return ",";
        case OP_ALIGNOF: return "alignof";
        case OP_SIZEOF: return "sizeof";
        case OP_TYPECAST: return "typecast";
        case OP_BITXOR: return "^";
        case OP_BITNOT: return "~";
        case OP_LOGNOT: return "!";
        case OP_PERIOD: return ".";
        case OP_ARRAY_SUB: return "[]";
        case OP_FUNC_CALL: return "()";
        case OP_PREPROCESS: return "#";
        case OP_TAB: return "\\t";
        case OP_EOF: return "eof";
        case OP_NEWLINE: return "\\n";
        case OP_SPACE: return "\\s";
        case OP_SEMICOLON: return ";";
        case OP_OBRACKET: return "[";
        case OP_CBRACKET: return "]";
        case OP_OBRACE: return "{";
        case OP_CBRACE: return "}";
        case OP_QUESTION: return "?";
        case OP_BACKSLASH: return "\\";
        case OP_COLON: return ":";
        default: return "OP_NOTFOUND";
    }
}

char *storagetype2s(int storage_type) {
    switch (storage_type) {
        case STORAGE_AUTO: return "auto";
        case STORAGE_EXTERN: return "extern";
        case STORAGE_STATIC: return "static";
        case STORAGE_REGISTER: return "register";
        default: return "STORAGE_NOTSET";
    }
}

char *recordtype2s(int record_type) {
    switch (record_type) {
        case RECTYPE_NONE: return "default";
        case RECTYPE_STRUCT: return "struct";
        case RECTYPE_UNION: return "union";
        default: return "RECTYPE_NOTSET";
    }
}

char *ctypekind2s(Type *ty) {
    switch (ty->kind) {
        case CTYPECHAR: return "char";
        case CTYPESHORT: return "short";
        case CTYPEINT: return "int";
        case CTYPELONG: return "long";
        case CTYPEDOUBLE: return "double";
        case CTYPEFLOAT: return "float";
        case CTYPELONGLONG: return "long long";
        case CTYPEVOID: return "void";
        case CTYPESTRUCT: return "struct";
        case CTYPESTUB: return "stub";
        default: return "CTYPENOTSET";
    }
}

char *ctype2s(Type *ty) {
    String *s;
    s = make_fmt_string("(Type: kind:%s, bytes:%d, unsigned:%d, const:%d, storage:%s, record:%s, ptr:%d, params:%d)",
                        ctypekind2s(ty), ty->bytes, ty->isunsigned, ty->isconst, storagetype2s(ty->storage_type),
                        recordtype2s(ty->record_type), ty->pointer != NULL, ty->parameters != NULL ? ty->parameters->length : 0);
    return string_body(s);
}

char *ast_number_2s(Node *n) {
    return string_body(make_fmt_string("(Node: kind:%s, ival:%d)\n", "AST_NUMBER", n->number));
}

char *ast_ident_2s(Node *n) {
    return string_body(make_fmt_string("(Node: kind:%s, ident_type:%s, ident_offset:%d)\n",
                       "AST_IDENT",
                       ctype2s(n->ident_type),
                       n->ident_offset));
}

char *ast_assign_2s(Node *n) {
    return string_body(make_fmt_string("(Node: kind:%s, offset:%d, valtype:wip)\n", "AST_ASSIGN", n->assign_lhs->ident_offset));
}

char *ast_binop_2s(Node *n) {
    return string_body(make_fmt_string("(Node: kind:%s, symbol:%s, lchild:%s, rchild:%s)\n",
                       "AST_BINOP",
                       op2s(n->binop_symbol),
                       ctype2s(n->binop_lhs->ident_type),
                       n->binop_rhs->type == AST_BINOP ? op2s(n->binop_rhs->binop_symbol) : node2s(n->binop_rhs)));
}

char *ast_funcdef_2s(Node *n) {
    return string_body(make_fmt_string("(Node: kind:%s, fblabel:%s, felabel:%s, fsize:%d, fparams:%d, fstmts:%d, frettype:%s)\n",
                       "AST_FUNCDEF",
                       n->f_block_label,
                       n->f_end_label,
                       n->f_size,
                       n->f_params == NULL ? 0 : n->f_params->length,
                       n->f_block == NULL ? 0 : n->f_block->length,
                       ctype2s(n->f_return_type)));
}

char *ast_funccall_2s(Node *n) {
    return string_body(make_fmt_string("(Node: kind:%s, fcptrname:%s, fcparamsize:%d)\n", "AST_FUNCCALL", n->fc_pointer->f_name->body, n->fc_params->length));
}


char *node2s(Node *n) {
    switch (n->type) {
        case AST_IDENT:
            return ast_ident_2s(n);
        case AST_NUMBER:
            return ast_number_2s(n);
        case AST_ASSIGN:
            return ast_assign_2s(n);
        case AST_BINOP:
            return "BINOP\n";//ast_binop_2s(n);
        case AST_FUNCDEF:
            //log_debug("%d", n->fstmts->length);
            return ast_funcdef_2s(n);
        case AST_FUNCCALL:
            return ast_funccall_2s(n);
        default:
            return "Node type not yet supported\n";
    }
}
