#include <assert.h>
#include <string.h>
#include "cc.h"

/* Scanner
 *  How it works: this file goes through an input stream and finds tokens in a character state based fashion
 *  How it should work: this file should have a table of state functions, ideally
 *
 *
 */

/* lex.c currently handles all usage of tokens, maybe in the future we should spread the tasks between two classes */

static Vector *tokens;
static String *buffer;
static unsigned int position;
static struct MODULE_RECORD *current;

static const int skipped_tokens[] = {TYSPACE, TYCOMMENT};

bool tident(Token *t) {
    return t->type == TYIDENT;
}

bool tkeyword(Token *t) {
    return t->type == TYKEYWORD;
}

bool tnumber(Token *t) {
    return t->type == TYNUMBER;
}

bool tsymbol(Token *t) {
    return t->type == TYSYMBOL;
}

bool tchar(Token *t) {
    return t->type == TYCHAR;
}

bool tstring(Token *t) {
    return t->type == TYSTRING;
}

bool tnewline(Token *t) {
    return t->type == TYNEWLINE;
}

bool tokens_left() {
	return tokens->length > position;
}

Token *get_token() {
    //print_token((Token*)vector_get(tokens, position));
	return (Token*)vector_get(tokens, position++);
}

Token *next_token() {
	return (Token*)vector_get(tokens, position);
}

Token *last_token() {
    assert(position > 0);
	return (Token*)vector_get(tokens, position-1);
}

void skip_token() {
    position++;
}

Token *peek_token(int index) {
    int peek_pos = position + index;
    if (peek_pos > (int)vector_length(tokens) || peek_pos < 0)
        log_error("requested to peek %d tokens ahead with vec_len %d", peek_pos, vector_length(tokens));
	return (Token*)vector_get(tokens, peek_pos);
}

Token *peek_next_token() {
    return peek_token(0);
}

Token *peek_last_token() {
    return peek_token(-2);
}

void unwind_token_pos() {
	if (position > 0) position--;
}

void expect(unsigned int opc) {
	Token *tok = get_token();
	if (tok->id != opc)
		log_error("Expected %d, got %d", opc, tok->id);
}

typedef struct {
    unsigned int x, y;
} Sloc;

typedef struct full_token {
    Token *token;
    bool ls;
    Sloc *sloc;
} full_token;

/* Token pointers to be reused, the leading space doesn't matter */
static const Token tok_auto = {TYSYMBOL, false, .id=KWAUTO};
static const Token tok_break = {TYSYMBOL, false, .id=KWBREAK};
static const Token tok_case = {TYSYMBOL, false, .id=KWCASE};
static const Token tok_char = {TYSYMBOL, false, .id=KWCHAR};
static const Token tok_const = {TYSYMBOL, false, .id=KWCONST};
static const Token tok_continue = {TYSYMBOL, false, .id=KWCONTINUE};
static const Token tok_default = {TYSYMBOL, false, .id=KWDEFAULT};
static const Token tok_do = {TYSYMBOL, false, .id=KWDO};
static const Token tok_double = {TYSYMBOL, false, .id=KWDOUBLE};
static const Token tok_else = {TYSYMBOL, false, .id=KWELSE};
static const Token tok_enum = {TYSYMBOL, false, .id=KWENUM};
static const Token tok_extern = {TYSYMBOL, false, .id=KWEXTERN};
static const Token tok_float = {TYSYMBOL, false, .id=KWFLOAT};
static const Token tok_for = {TYSYMBOL, false, .id=KWFOR};
static const Token tok_goto = {TYSYMBOL, false, .id=KWGOTO};
static const Token tok_if = {TYSYMBOL, false, .id=KWIF};
static const Token tok_int = {TYSYMBOL,false, .id=KWINT};
static const Token tok_long = {TYSYMBOL, false, .id=KWLONG};
static const Token tok_register = {TYSYMBOL, false, .id=KWREGISTER};
static const Token tok_return = {TYSYMBOL, false, .id=KWRETURN};
static const Token tok_short = {TYSYMBOL, false, .id=KWSHORT};
static const Token tok_signed = {TYSYMBOL, false, .id=KWSIGNED};
static const Token tok_sizeof = {TYSYMBOL, false, .id=KWSIZEOF};
static const Token tok_static = {TYSYMBOL, false, .id=KWSTATIC};
static const Token tok_struct = {TYSYMBOL, false, .id=KWSTRUCT};
static const Token tok_switch = {TYSYMBOL, false, .id=KWSWITCH};
static const Token tok_typedef = {TYSYMBOL, false, .id=KWTYPEDEF};
static const Token tok_unsigned = {TYSYMBOL, false, .id=KWUNSIGNED};
static const Token tok_union = {TYSYMBOL, false, .id=KWUNION};
static const Token tok_void = {TYSYMBOL, false, .id=KWVOID};
static const Token tok_volatile = {TYSYMBOL, false, .id=KWVOLATILE};
static const Token tok_while = {TYSYMBOL, false, .id=KWWHILE};
static const Token tok_printident = {TYSYMBOL, false, .id=KWPRINTIDENT};

// lex.c token involvement

static int keyword_id(char *name) {
    int kw_id;

    kw_id = -1;
    switch(name[0]) {
		case 'a':
			if (strcmp(name, "auto") == 0)
				kw_id = KWAUTO;
			break;
		case 'b':
			if (strcmp(name, "break") == 0)
				kw_id = KWBREAK;
			break;
		case 'c':
			if (strcmp(name, "case") == 0)
				kw_id = KWCASE;
			else if (strcmp(name, "char") == 0)
				kw_id = KWCHAR;
			else if (strcmp(name, "const") == 0)
				kw_id = KWCONST;
			else if (strcmp(name, "continue") == 0)
				kw_id = KWCONTINUE;
			break;
		case 'd':
			if (strcmp(name, "default") == 0)
				kw_id = KWDEFAULT;
			else if (strcmp(name, "do") == 0)
				kw_id = KWDO;
			else if (strcmp(name, "double") == 0)
				kw_id = KWDOUBLE;
			break;
		case 'e':
			if (strcmp(name, "else") == 0)
				kw_id = KWELSE;
			else if (strcmp(name, "enum") == 0)
				kw_id = KWENUM;
			else if (strcmp(name, "extern") == 0)
				kw_id = KWEXTERN;
			break;
		case 'f':
			if (strcmp(name, "float") == 0)
				kw_id = KWFLOAT;
			else if (strcmp(name, "for") == 0)
				kw_id = KWFOR;
			break;
		case 'g':
			if (strcmp(name, "goto") == 0)
				kw_id = KWGOTO;
			break;
		case 'i':
			if (strcmp(name, "if") == 0)
				kw_id = KWIF;
			else if (strcmp(name, "int") == 0)
				kw_id = KWINT;
			break;
		case 'l':
			if (strcmp(name, "long") == 0)
				kw_id = KWLONG;
			break;
		case 'r':
			if (strcmp(name, "register") == 0)
				kw_id = KWREGISTER;
			else if (strcmp(name, "return") == 0)
				kw_id = KWRETURN;
			break;
		case 's':
			if (strcmp(name, "short") == 0)
				kw_id = KWSHORT;
			else if (strcmp(name, "signed") == 0)
				kw_id = KWSIGNED;
			else if (strcmp(name, "sizeof") == 0)
				kw_id = KWSIZEOF;
			else if (strcmp(name, "static") == 0)
				kw_id = KWSTATIC;
			else if (strcmp(name, "struct") == 0)
				kw_id = KWSTRUCT;
			else if (strcmp(name, "switch") == 0)
				kw_id = KWSWITCH;
			break;
		case 't':
			if (strcmp(name, "typedef") == 0)
				kw_id = KWTYPEDEF;
			break;
		case 'u':
			if (strcmp(name, "unsigned") == 0)
				kw_id = KWUNSIGNED;
			else if (strcmp(name, "union") == 0)
				kw_id = KWUNION;
			break;
		case 'v':
			if (strcmp(name, "void") == 0)
				kw_id = KWVOID;
			else if (strcmp(name, "volatile") == 0)
				kw_id = KWVOLATILE;
			break;
		case 'w':
			if (strcmp(name, "while") == 0)
				kw_id = KWWHILE;
			break;
        // DEBUG
		case '_':
			if (strcmp(name, "__printident") == 0)
				kw_id = KWPRINTIDENT;
			break;
		}
    return kw_id;
}


static inline bool valid_char(char c) {
	return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9') || c == '_';
}

static inline bool valid_number(char c) {
    return c == '.' || c == 'e' || (c >= '0' && c <= '9');
}

static void scan_number_tail(String *buffer) {
    /*
        implied types
        decimal with no suffix - double
        decimal with 'f'/'F' suffix - float
        decimal with 'l'/'L' suffix - long double
        integer with no suffix - int, long or long long (implementation defined)
        integer with 'u'/'U' suffix - unsigned ""
        integer with 'l'/'L' suffix - long int, unsigned long int, long long int
        integer with 'u' and 'l' - unsigned long, unsigned long long
        integer with 'll' - long long
        integer with 'llu' - unsigned long long
    */
}

/* Work in progress */
Token *scan_number(char init, bool space, String *buffer) {
    char base[2];
    char c;
    bool decimal;

    /*
    if (c == '0') {
        base[0] = c;
        base[1] = peek();
        if (strncmp(base, "0x", 2) == 0) return scan_hex_number(space, buffer);
        else if (strncmp(base, "0b", 2) == 0) return scan_binary_number(space, buffer);
        return scan_oct_number(space, buffer);
    }
    */

    decimal = false;
    c = take();
    while (valid_number(c)) {
        if (c == '.') {
            for (unsigned int dc = 0, c = take(); valid_number(c); dc++, c = take()) {
                if (c == '.')
                    log_error("multiple decimals in numeric constant");
                if (c == 'e') {
                    if (!dc)
                        log_error("invalid usage of scientific notation: 'e' char cannot follow decimal");
                    c = take();
                    while (c >= '0' && c <= '9') {
                        string_append_char(buffer, c);
                        c = take();
                    }
                    break;
                }
                string_append_char(buffer, c);
            }
            break;
        }
        if (c == 'e')
            log_error("invalid usage of scientific notation: 'e' char cannot come before the decimal");
        string_append_char(buffer, c);
        c = take();
    }
    replace(c);
    scan_number_tail(buffer);
    return make_token(space, TYNUMBER, buffer, 0);
}

Token *scan() {
    char t, c, p;
    bool leading_space;

    leading_space = false;
    string_clean(buffer);
RESTART:
    c = take();
    string_append_char(buffer, c);
    p = peek();
    //printf("%c, %c\n", c, p);
    switch(c) {
        case '\t':
        case ' ':  {
            leading_space = true;
            string_clean(buffer);
            goto RESTART;
        }
        case '\n': return make_token(leading_space, TYNEWLINE, NULL, OP_NEWLINE);
        case EOF:  return make_token(leading_space, TYEOF, NULL, OP_EOF);
        case '-':
            t = take();
            switch(t) {
                case '>': return make_token(leading_space, TYSYMBOL, NULL, OP_ARROW);
                case '-': return make_token(leading_space, TYSYMBOL, NULL, OP_DEC);
                case '=': return make_token(leading_space, TYSYMBOL, NULL, OP_A_SUB);
            }
            replace(t);
            return make_token(leading_space, TYSYMBOL, NULL, OP_SUB);
        case '>':
            t = take();
            switch(t) {
                case '>': return make_token(leading_space, TYSYMBOL, NULL, OP_SAR);
                case '=': return make_token(leading_space, TYSYMBOL, NULL, OP_A_SAR);
            }
            replace(t);
            return make_token(leading_space, TYSYMBOL, NULL, OP_GT);
        case '<':
            t = take();
            switch(t) {
                case '<': return make_token(leading_space, TYSYMBOL, NULL, OP_SAL);
                case '=': return make_token(leading_space, TYSYMBOL, NULL, OP_A_SAL);
            }
            replace(t);
            return make_token(leading_space, TYSYMBOL, NULL, OP_LT);
        case '(': return make_token(leading_space, TYSYMBOL, NULL, OP_OPAREN);
        case ')': return make_token(leading_space, TYSYMBOL, NULL, OP_CPAREN);
        case ',': return make_token(leading_space, TYSYMBOL, NULL, OP_COMMA);
        case ';': return make_token(leading_space, TYSYMBOL, NULL, OP_SEMICOLON);
        case '[': return make_token(leading_space, TYSYMBOL, NULL, OP_OBRACKET);
        case ']': return make_token(leading_space, TYSYMBOL, NULL, OP_CBRACKET);
        case '{': return make_token(leading_space, TYSYMBOL, NULL, OP_OBRACE);
        case '}': return make_token(leading_space, TYSYMBOL, NULL, OP_CBRACE);
        case ':': return make_token(leading_space, TYSYMBOL, NULL, OP_COLON);
        case '~': return make_token(leading_space, TYSYMBOL, NULL, OP_BITNOT);
        case '#': {
            // define, include, undef, ifdef, ifndef, if, else, elif, endif, error, pragma
            return make_token(leading_space, TYSYMBOL, NULL, OP_PREPROCESS);
        }
        case '?': {
            // If trigraph flag
            if (p == '?') {
                DISCARD();
                c = take();
                switch(c) {
                    case '(': return make_token(leading_space, TYSYMBOL, NULL, OP_OBRACKET);
                    case ')': return make_token(leading_space, TYSYMBOL, NULL, OP_CBRACKET);
                    case '<': return make_token(leading_space, TYSYMBOL, NULL, OP_OBRACE);
                    case '>': return make_token(leading_space, TYSYMBOL, NULL, OP_CBRACE);
                    case '=': return make_token(leading_space, TYSYMBOL, NULL, OP_PREPROCESS);
                    case '/': return make_token(leading_space, TYSYMBOL, NULL, OP_BACKSLASH);
                    case '\'': return make_token(leading_space, TYSYMBOL, NULL, OP_BITXOR);
                    case '!': return make_token(leading_space, TYSYMBOL, NULL, OP_BITOR);
                    case '-': return make_token(leading_space, TYSYMBOL, NULL, OP_BITNOT);
                    default: {
                        replace(c);
                        replace(p);
                        return make_token(leading_space, TYSYMBOL, NULL, OP_QUESTION);
                    }
                }
            }
        }
        case 'L':
            if (p == '\"') {
                c = take();
                p = peek();
                while (c != '"') {
                    if (c == '\\' && p == '"') { // Escaped quote
                            DISCARD();
                            DISCARD();
                            string_append_char(buffer, c);
                            string_append_char(buffer, p);
                            continue;
                    }
                    if (c == EOF || c == '\n') log_error("unclosed string");
                    string_append_char(buffer, c);
                    c = take();
                    p = peek();
                }
                return make_token(leading_space, TYLSTRING, buffer, 0);
            }
            break;
        case '\'':
            // 'c' or '\c' must be found here
            if (p == '\\')  {
                string_append_char(buffer, take());
            }
            string_append_char(buffer, take());
            assert(take() == '\'');
            return make_token(leading_space, TYCHAR, buffer, 0);
        case '"':
                c = take();
                p = peek();
                while (c != '"') {
                    if (c == '\\' && p == '"') { // Escaped quote
                            DISCARD();
                            DISCARD();
                            string_append_char(buffer, c);
                            string_append_char(buffer, p);
                            continue;
                    }
                    if (c == EOF || c == '\n') log_error("unclosed string");
                    string_append_char(buffer, c);
                    c = take();
                    p = peek();
                }
                return make_token(leading_space, TYSTRING, buffer, 0);
		case '/':
			if (p == '/') {
				c = take();
				while (c != '\n' && c != EOF) {
                    //if (c == '\n' || c == EOF) break;
					string_append_char(buffer, c); // Delete this to stop saving comment text.
					c = take();
				}
				//buffer_print(strbuf);
				replace(c); // return the last char
				return make_token(leading_space, TYCOMMENT, buffer, 0);
			}
			if (p == '*') {
				c = take();
				while (true) {
					if (c == '*' && peek() == '/') {
						break;
					}
					if (c == EOF) {
						log_warning("multiline comment was never closed");
						break;
					}
					string_append_char(buffer, c);
					c = take();
				}
				DISCARD(); // eat the leading '/'
				return make_token(leading_space, TYCOMMENT, buffer, 0);
			}
            if (p == '=') {
                    DISCARD();
                    return make_token(leading_space, TYSYMBOL, NULL, OP_A_DIV);
            }
			return make_token(leading_space, TYSYMBOL, NULL, OP_DIV);

#define b(c1, op1, els) \
    t = take(); \
    if (t == c1) return make_token(leading_space, TYSYMBOL, NULL, op1); \
    replace(t); \
    return make_token(leading_space, TYSYMBOL, NULL, els)

#define t(c1, c2, op1, op2, els) \
	t = take(); \
	if (t == c1) return make_token(leading_space, TYSYMBOL, NULL, op1); \
	if (t == c2) return make_token(leading_space, TYSYMBOL, NULL, op2); \
	replace(t); \
	return make_token(leading_space, TYSYMBOL, NULL, els)

        case '=':
			b('=', OP_EQ, OP_ASSIGN);
        case '*':
			b('=', OP_A_MUL, OP_STAR);
        case '!':
			b('=', OP_NE, OP_LOGNOT);
        case '^':
			b('=', OP_A_XOR, OP_BITXOR);
        case '%':
			b('=', OP_A_MOD, OP_MOD);
        case '+':
			t('+', '=', OP_INC, OP_A_ADD, OP_ADD);
        case '&':
			t('=', '&', OP_A_AND, OP_LOGAND, OP_AMP);
        case '|':
			t('=', '|', OP_A_OR, OP_LOGOR, OP_BITOR);
#undef b
#undef t
        case '0'...'9':
            return scan_number(c, leading_space, buffer);
    }
    c = take();
    while (valid_char(c)) {
        string_append_char(buffer, c);
        c = take();
    }
    replace(c);
	int id = keyword_id(string_body(buffer));
	if (id == -1)
        return make_token(leading_space, TYIDENT, buffer, 0);
    return make_token(leading_space, TYKEYWORD, NULL, id);
}

void skip_to_newline() {
    int current;

    while ((current = take()) != '\n') {
        if (current == EOF) {
            // Let the caller handle eof
            replace(current);
            break;
        }
    }
}

Token *make_token(bool leading_space, unsigned int type, String *value, int id) {
	Token *tok = malloc(sizeof(Token));
	tok->type = type;
	tok->leading_space = leading_space;
	switch (type) {
		case TYSYMBOL:
		case TYKEYWORD:
        case TYEOF:
        case TYNEWLINE:
        case TYSPACE:
			tok->id = id;
			break;
		default: {
		    String *s = value;
			tok->value = malloc(sizeof(char) * string_length(s)+1);
			strncpy(tok->value, string_body(s), string_length(s)+1);
			break;
		}
        // case TYIDENT: add pointer to identifier to a table shared with the preprocessor
	}
	return tok;
}

static void push_token(Token *tok) {
	vector_append(tokens, (void*)tok);
}

static void push_token_if_valid(Token *tok) {
    if (tok->type != TYSPACE && tok->type != TYCOMMENT) push_token(tok);
}

int expand_token_list(List *token_list) {
    Token *tok;
    struct list_entry_s *curr = token_list->head;

    while (curr->next != NULL) {
        tok = (Token*)curr->body;
        push_token_if_valid(tok);
        if (tok->type == TYEOF)
            return 0;
        curr = curr->next;
    }

}

int scan_line() {
    Token *tok;

    tok = scan();
    while (!tnewline(tok)) {
        push_token_if_valid(tok);
        if (tok->type == TYEOF)
            return 0;
        tok = scan();
        print_token(tok);
        if (tident(tok) && macro_exists(tok->value)) {
            List *token_list = get_macro(tok->value);
            if ((expand_token_list(token_list)) == 0) {
                return 0;
            }
            tok = scan();
        }
    }
    return 1;
}

Vector *scan_cpp_line() {
    bool space;
    char c, p;
    Token *tok;
    Vector *tokens = make_vector();
    String *buffer = make_string("");

    space = false;
    while ((c = take()) != '\n') {
        switch (c) {
            /*case '_': {
                if (strcmp())
            }*/
            case '#': {
                p = peek();
                if (p == '#') {
                    tok = make_token(space, TYSYMBOL, NULL, OP_CPP_PASTE);
                    vector_append(tokens, (void*)tok);
                    continue;
                }
                tok = make_token(space, TYSYMBOL, NULL, OP_CPP_STRINGIZE);
                vector_append(tokens, (void*)tok);
                continue;
            }
        }
        replace(c);
        tok = scan();
        vector_append(tokens, (void*)tok);
    }
    for (unsigned int i = 0; i < vector_length(tokens); i++) {
        print_token((Token*)vector_get(tokens, i));
    }
    return tokens;
}

void do_lex() {
    File *current_file;
    int flag;
    char p;

    flag = 1;
	tokens = make_vector();
	position = 0;
	current = get_current_module();
	current_file = current->infile;
	buffer = make_string("");
	while (flag) {
        p = peek();
        switch(p) {
            case '#': DISCARD(); flag = parse_cpp_directive(); break;
            case EOF: flag = 0; break;
            default:  flag = scan_line(); break;
        }
        // Return to the last file stream, if one is available
        if (!flag && pop_file())
            flag=1;
	}
	current->tokens = tokens;
}

void do_lex_string() {
    File *current_file;

	tokens = make_vector();
	position = 0;
	current = get_current_module();
	current_file = current->infile;
	buffer = make_string("");
	while (true) {
		Token *tok = scan();
		if (tok->type != TYSPACE) push_token(tok);
		string_clean(buffer);
		if (current_file->position >= string_length(current_file->string_data)) break;
	}
	current->tokens = tokens;
}

void print_token(Token *t) {
    int type;

    type = t->type;
    switch (type) {
        case TYKEYWORD: {
            printf("<type=%s, id='%s'>\n", ty2s(t->type), kw2s(t->id));
            break;
        }
        case TYSYMBOL: {
            printf("<type=%s, id='%s'>\n", ty2s(t->type), op2s(t->id));
            break;
        }
        case TYIDENT:
        case TYNUMBER: {
            printf("<type=%s, value='%s'>\n", ty2s(t->type), t->value);
            break;
        }
        default: printf("<type=%s>\n", ty2s(t->type));
    }
}

void print_tokens() {
    for (unsigned int i = 0; i < vector_length(tokens); i++) {
        print_token((Token*)vector_get(tokens, i));
    }
}

