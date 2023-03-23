
/*
 *  C Compiler
 *  Input:  ANSI C file(s)
 *  Output: GNU Assembly file(s)
 */

#ifndef CC_INCLUDED
#define CC_INCLUDED

#include <stdio.h>

/* Monitor memory usage? */
#define ALLOW_ALLOC_POISON 1

#include "adlib.h"
#include "translation_limits.h"

#define MARK printf("Marked\n");
#define UNUSEDV(x) (void)(x)
#define UNUSEDF __attribute__((unused))

#define IOTYPEF 1
#define IOTYPES 0

typedef enum {false, true} bool;

extern unsigned int heap_space_allocated;
extern unsigned int heap_space_freed;

typedef struct Map {
    struct Map *parent;
    char **key;
    void **val;
    int size;
    int nelem;
    int nused;
} Map;

typedef struct instream {
	bool is_file;
	unsigned int position;
	String *filename;
	union {
		String *string_data;
		FILE *file_data;
	};
} File;

struct debug_info {
    int warnings;
    double lex_time;
    double cpp_time;
    double parse_time;
    double optimize_time;
    double gen_time;
    double compile_time;
};

typedef struct MODULE_RECORD {
  File *infile;
  Vector *file_stream;
  String *input;
  Vector *tokens;
  Map *cpptable;
  Vector *ast;
  Vector *deps;
  String *generated_code;
  struct debug_info *debug;
  struct asm_code *outfile;
} C_Module;

typedef struct token_s {
	unsigned int type;
	bool leading_space;
	union {
        char *value;
		unsigned int id;
	};
} Token;

struct node;

typedef struct type_s {
    int kind;
    int bytes;
    struct type_s *base_type;
    int isunsigned;
    int isconst;
    int storage_type;
    int record_type;
    int is_fptr;
    int is_arr;
    struct node *subscript;
    struct type *pointer;
    Vector *parameters;
} Type;

// AST nodes

typedef struct node {
    int type;
    unsigned int registers; // For a simple register allocator when flattening a tree
    union {
        // Identifier
        struct {
            int ident_offset;
            char *ident_name;
            Type *ident_type;
        };

        // Return
        struct {
            struct node *return_val;
            Type *return_type;
        };

        // Integer terminals
		struct {
			// float/double = number * (number_base ** number_exponent);
			int number_base;
			long long number_exponent;
			long long number;
			Type *number_type;
		};

        // Assignment
        struct {
            struct node *assign_lhs;
            struct node *assign_rhs;
        };

        // Binary op
        struct {
            int binop_symbol;
            struct node *binop_lhs;
            struct node *binop_rhs;
        };

        // Expression
        struct {
            struct node *expr_head;
            Type *expr_type;
        };

        // Unary op
        struct {
			int unop_symbol;
            struct node *unop_val;
        };

        // Compound statements
        struct {
            Vector *compound_block;
        };

        // If
        struct {
            char *if_block_label;
            char *if_end_label;
            struct node *if_cond;
            Vector *if_block;
        };

        // For
        struct {
            struct node *for_cond;
            Vector *for_block;
        };

        // While
        struct {
			bool while_cond_top; // Is the while condition up or down? (while or do/while)
			char *while_block_label;
			char *while_end_label;
            struct node *while_cond;
            Vector *while_block;
        };

        // Function decl
        struct {
            int f_size;
            char *f_block_label;
            char *f_end_label;
            Type *f_return_type;
            String *f_name;
            Vector *f_params;
            Vector *f_block;
        };

        // Function call
        struct {
            struct node *fc_pointer;
            Vector *fc_params;
        };

		// Struct
		struct {
			long struct_size;
			char *struct_name;
			Vector *struct_fields;
		};

		// Union
		struct {
			long union_size;
			char *union_name;
			Vector *union_fields;
		};

		// Enum
		struct {
			// Make an assignment node for each name from initial to enum length
			int enum_initial;
			char *enum_name;
			Vector *enum_list;
		};

		// Array/string
		struct {
			long long array_size;
			Type *array_type;
		};

		// DEBUG
		struct {
            struct node *print_iden;
		};

    };
} Node;

// AST node types
enum {
    AST_ASSIGN,
    AST_EXPR,
    AST_IDENT,
    AST_NUMBER,
    AST_BINOP,
    AST_UNOP,
    AST_FUNCDEF,
    AST_FUNCCALL,
    AST_STMTS,
    AST_IF,
    AST_FOR,
    AST_WHILE,
    AST_RETURN,
    AST_STRUCT,
    AST_UNION,
    AST_ENUM,
    AST_STUB,
    // DEBUG
    AST_PRINTIDENT,
};

// Token types
enum {
    TYSPACE,
    TYNEWLINE,
    TYEOF,
    TYCOMMENT,
    TYIDENT,
    TYKEYWORD,
    TYNUMBER,
    TYSYMBOL,
    TYCHAR,
    TYSTRING,
    TYLSTRING,
};

// Token IDs for keywords
enum {
    KWAUTO,
    KWBREAK,
    KWCASE,
    KWCHAR,
    KWCONST,
    KWCONTINUE,
    KWDEFAULT,
    KWDO,
    KWDOUBLE,
    KWELSE,
    KWENUM,
    KWEXTERN,
    KWFLOAT,
    KWFOR,
    KWGOTO,
    KWIF,
    KWINT,
    KWLONG,
    KWREGISTER,
    KWRETURN,
    KWSHORT,
    KWSIGNED,
    KWSIZEOF,
    KWSTATIC,
    KWSTRUCT,
    KWSWITCH,
    KWTYPEDEF,
    KWUNION,
    KWUNSIGNED,
    KWVOID,
    KWVOLATILE,
    KWWHILE,
    // Debug symbols
    KWPRINTIDENT,
};

// Record classes
enum {
    RECTYPE_NONE,
    RECTYPE_STRUCT,
    RECTYPE_UNION,
};

// Storage classes
enum {
    STORAGE_AUTO,
    STORAGE_EXTERN,
    STORAGE_STATIC,
    STORAGE_REGISTER,
};

// C types
enum {
    CTYPECHAR,
    CTYPESHORT,
    CTYPESHORTINT,
    CTYPEINT,
    CTYPELONG,
    CTYPELONGINT,
    CTYPELONGLONGINT,
    CTYPEDOUBLE,
    CTYPEFLOAT,
    CTYPELONGDOUBLE,
    CTYPELONGLONG,
    CTYPEVOID,
    CTYPESTRUCT,
    CTYPEPOINTER,
    CTYPESTUB,
};

// Token IDs for operators
enum {
    // Unresolved lexical analysis phase types
    OP_DEC = 512,
    OP_INC,
    OP_OPAREN,
    OP_CPAREN,
    OP_STAR,
    OP_AMP,
    OP_PREPROCESS,
    OP_TAB,
    OP_EOF,
    OP_NEWLINE,
    OP_SPACE,
    OP_SEMICOLON,
    OP_OBRACKET,
    OP_CBRACKET,
    OP_OBRACE,
    OP_CBRACE,
    OP_QUESTION,
    OP_BACKSLASH,
    OP_COLON,
    OP_CPP_STRINGIZE,
    OP_CPP_PASTE,

    /*
    * All C operators from lowest to highest precedence.
    */

    // Resolved syntax analysis phase types
	OP_COMMA,
	OP_A_OR,
	OP_A_XOR,
	OP_A_AND,
	OP_A_SAR,
	OP_A_SAL,
	OP_A_MOD,
	OP_A_DIV,
	OP_A_MUL,
	OP_A_SUB,
	OP_A_ADD,
	OP_ASSIGN,
	OP_TERNARY,
	OP_LOGOR,
	OP_LOGAND,
	OP_BITOR,
	OP_BITXOR,
	OP_BITAND,
	OP_NE,
	OP_EQ,
	OP_GE,
	OP_GT,
	OP_LE,
	OP_LT,
	OP_SAR,
	OP_SAL,
	OP_SUB,
	OP_ADD,
	OP_MOD,
	OP_DIV,
	OP_MUL,
	OP_ALIGNOF,
	OP_SIZEOF,
	OP_ADDRESS,
	OP_INDIRECTION,
	OP_TYPECAST,
	OP_BITNOT,
	OP_LOGNOT,
	OP_UNARY_MINUS,
	OP_UNARY_PLUS,
	OP_PRE_DEC,
	OP_PRE_INC,
	OP_COMP_LIT,
	OP_ARROW,
	OP_PERIOD,
	OP_ARRAY_SUB,
	OP_FUNC_CALL,
	OP_POST_DEC,
	OP_POST_INC,
};

// Linear SSA
extern void *SSA[];

// module.c
C_Module *get_current_module(void);
File *get_current_file(void);
void stash_record(void);

// poison.c
void print_memory_diagnostics(void);

#define DISCARD() take()

// scan.c
bool tident(Token *t);
bool tkeyword(Token *t);
bool tnumber(Token *t);
bool tsymbol(Token *t);
bool tchar(Token *t);
bool tstring(Token *t);
bool tnewline(Token *t);
bool tokens_left(void);
void unwind_token_position(void);
Token *get_token(void);
Token *next_token(void);
Token *last_token(void);
void skip_token(void);
Token *peek_token(int index);
Token *peek_next_token(void);
Token *peek_last_token(void);
void unwind_token_pos(void);
void expect(unsigned int opc);
Token *make_token(bool leading_space, unsigned int type, String *value, int id);
void skip_to_newline(void);
Vector *scan_cpp_line(void);
void do_lex(void);
void do_lex_string(void);
void print_token(Token *t);
void print_tokens(void);
Token *scan(void);

// preprocessor.c
int parse_cpp_directive(void);

// parse.c
Node *make_tmp_iden_node(Type *ident_type, int offset);
void make_ast(void);
void print_nodes(void);
void print_node(Node *n);
void print_expr(Node *exprhead);

// gen.c
char *get_function_entry_label(void);
char *get_function_block_label(void);
char *get_generic_label(void);
char *get_static_label(void);
void do_code_gen(void);
void ast_traverse(Vector *head);

// file.c
struct instream *open_instream(char *filename);
struct instream *open_code_string(String *data);
void push_file(char *filename);
int pop_file(void);
void close_input_stream(void);
void set_current_file(void);
void set_input_type(int type);
char take(void);
void replace(char c);
char peek(void);

// types.c
Type *make_base_type(void);
Type *get_number_type(long n);
Type *parse_fparam_type(void);
Type *parse_global_decl_type(void);
Type *parse_local_decl_type(void);
void init_builtin_types(void);
void print_type(Type *ty);

// symbol.c
void init_symbols(void);
void define_lvar(char *name, Node *iden);
Node *get_lvar(char *s);
int lvar_exists(char *s);
void assert_lvar_exists(char *s);
void assert_lvar_doesnt_exist(char *s);
void push_localenv(void);
void pop_localenv(void);
Node *get_gvar(char *s);
int gvar_exists(char *s);
void define_gvar(char *s, Node *gvar);
void assert_gvar_exists(char *s);
void assert_gvar_doesnt_exist(char *s);
void assert_var_exists(char *s);
bool is_builtin_type(Token *t);
bool is_userdefined_type(Token *t);
bool is_valid_type(Token *t);
void assert_type_exists(Token *t);
Type *get_utype(Token *t);
void fill_function_decl(char *s, Vector *fstmts);
void define_macro(char *name, List *tokens);
void remove_macro(char *name);
int macro_exists(char *name);
List *get_macro(char *name);

// regalloc.c
 void ast_regalloc(Vector *ast);

// cdecl.c
Type *parse_c_declaration(void);

// operator.c
bool unset_op(unsigned int op);
bool binary_op(unsigned int op);
bool unary_op(unsigned int op);
bool cond_op(unsigned int op);
bool left_associative(unsigned int op);
bool right_associative(unsigned int op);

// map.c
Map *make_map(void);
Map *make_map_parent(Map *parent);
void *map_get(Map *m, char *key);
void map_put(Map *m, char *key, void *val);
void map_remove(Map *m, char *key);
size_t map_len(Map *m);

// error.c
int get_error_count(void);
int get_warning_count(void);
void warn(char *message, ...);
void error(char *message, ...);
void fatal(char *message, ...);

// debug.c
char *tok2s(Token *t);
char *ty2s(int kind);
char *kw2s(int kw);
char *op2s(int op);
char *storagetype2s(int storage_type);
char *recordtype2s(int record_type);
char *ctypekind2s(Type *ty);
char *ctype2s(Type *ty);
char *ast_number_2s(Node *n);
char *ast_ident_2s(Node *n);
char *ast_assign_2s(Node *n);
char *ast_binop_2s(Node *n);
char *ast_funcdef_2s(Node *n);
char *node2s(Node *n);

#endif // CC_INCLUDED
