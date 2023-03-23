#ifndef TRANSLATION_LIMITS_H_INCLUDED
#define TRANSLATION_LIMITS_H_INCLUDED

/* Translation limits for the C programming language */

/* Check these limits in the following way:
 *  - Copy iterations where available, if none are available, manually count them
 *  - Place the amount of whatever in a shared variable
 *  - Compare that variable with the max amount
 */

/* Max level of block nesting */
#define MAX_BLOCK_NEST 127

/* Max level of macro conditional block nesting */
#define MAX_CPP_CONDITION_INC 63

/* Max combination of *, [], and ()'s per declaration, the standard may suggest 256 */
#define MAX_PTR_ARR_FUNC_PER_DECL 12

/* Max nesting level of parenthesized declarators within a full declarator */
#define MAX_PAREN_DECL 63

/* Max level of parenthesized expressions within a full expression */
#define MAX_PAREN_EXPR 63

/* Max significant initial characters in an internal identifier or macro name */
#define MAX_INTERNAL_SIGNIFICANT_INITIAL_CHARS 63

/* Max significant initial characters in an external identifier */
#define MAX_EXTERNAL_SIGNIFICANT_INITIAL_CHARS 31

/* Max eternal identifiers in one translation unit  */
#define MAX_EXTERNAL_IDENTS 4095

/* Max identifiers declared in one block */
#define MAX_IDENTS_PER_BLOCK 511

/* Max macro identifiers simultaneously defined in one preprocessing unit */
#define MAX_MACRO_IDENTS 4095

/* Max arguments/parameters for a function definition or call */
#define MAX_FUNCTION_PARAMS_ARGS 127

/* Max arguments/parameters for a macro function definition or call */
#define MAX_MACRO_PARAMS_ARGS 127

/* Max characters in a logical source line */
#define MAX_SOURCE_LINE 4095

/* Max characters in a character string literal or wide string literal (after concatenation) */
#define MAX_STRING_LIT_LEN 4095

/* Max bytes for a single object (in a hosted environment only) */
#define MAX_HOSTED_BYTES_PER_OBJ 65535

/* Max nesting level for included files */
#define MAX_INC_FILE_NEST 15

/* Max case labels for a single switch statement (not including nested switch statements) */
#define MAX_CASE_LABEL_PER_SWITCH 1023

/* Max members in a single structure or union */
#define MAX_MEMBERS_PER_RECORD 1023

/* Max enumeration constants in a single enumeration */
#define MAX_MEMBERS_PER_ENUM 1023

/* Max level of nested structure or union definitions in a single struct-declaration-list */
#define MAX_RECORD_NEST 63

#endif // TRANSLATION_LIMITS_H_INCLUDED
