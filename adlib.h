#ifndef __ADLIB_H__
#define __ADLIB_H__

#include <windows.h>

#define INTERNAL_WARNINGS 1
#define INTERNAL_ERRORS 1

// util.c
unsigned int get_nalloc(unsigned int i);
char *ltoa(long N, char *str, int base);

// string.c
#define DEFAULT_STR_LEN 256
#define BASE_VASTR_SIZE 2048
typedef struct string_s {
    unsigned int length;
    unsigned int nalloc;
    char *body;
} String;
String *make_string(char *string_body);
String *make_fmt_string(char *fmt, ...);
String *to_string(int i);
String *to_stringl(long l);
String *string_substring(String *s, int start, int end);
int string_equal(String *s1, String *s2);
int string_equal_const(String *s1, const char *s2);
void string_concat(String *dest, String *src);
void string_concat_const(String *dest, char *src);
unsigned int string_length(String *s);
// Returns a fresh copy of the body of the string
char *string_body(String *s);
void string_prepend_char(String *s, char c);
void string_append_char(String *s, char c);
char string_get_char(String *s, unsigned int index);
unsigned int string_length(String *s);
void string_clean(String *s);
void string_free(String *s);
char *unstring(String *s);

// queue.c
#define DEFAULT_QUEUE_LEN 512
typedef struct {
    int nalloc;
    int tail; // LO
    int head; // FO
    void **body;
} Queue;
Queue *make_queue(void);
void queue_enqueue(Queue *q, void *val);
int queue_empty(Queue *q);
int queue_full(Queue *q);
void *queue_dequeue(Queue *q);
void queue_free(Queue *q);

// list.c
typedef struct list_entry_s list_entry;
struct list_entry_s {
    void *body;
    list_entry *prev;
    list_entry *next;
};
typedef struct list_s {
    unsigned int length;
    list_entry *head;
} List;
void list_append(List *l, void *body);
void list_prepend(List *l, void *body);
void *list_get(List *l, unsigned int index);
void list_delete(List *l, unsigned int index);
void list_map(List *l, void*(*callback)(void *));
List *make_list(void);

// vector.c
#define DEFAULT_VEC_LEN 512
typedef struct vector_s {
    unsigned int length;
    unsigned int nalloc;
    void **body;
} Vector;
Vector *make_small_vector(void);
Vector *make_vector(void);
void vector_append(Vector *v, void *val);
void vector_join(Vector *dest, Vector *src);
void *vector_get(Vector *v, unsigned int index);
void *vector_top(Vector *v);
void vector_insert(Vector *v, void *val, unsigned int index);
void vector_delete(Vector *v, unsigned int index);
int vector_empty(Vector *v);
unsigned int vector_length(Vector *v);
void *vector_pop(Vector *v);
void vector_free(Vector *v);

// logging.c
enum {
    LOG_CRITICAL = 50,
    LOG_ERROR = 40,
    LOG_WARNING = 30,
    LOG_DEBUG = 20,
    LOG_INFO = 10,
    LOG_ALL = 0,
};
void set_log_level(unsigned int level);
void log_debug(char *fmt, ...);
void log_info(char *fmt, ...);
void log_warning(char *fmt, ...);
void log_error(char *fmt, ...);
void log_critical(char *fmt, ...);
void adlib_error(char *fmt, ...);
void adlib_warn(char *fmt, ...);

// prototypes
typedef struct chained_string {
    char *begin;
    char *end;
} rope;

#ifdef BUILD_DLL
    #define DLL_EXPORT __declspec(dllexport)
#else
    #define DLL_EXPORT __declspec(dllimport)
#endif


#ifdef __cplusplus
extern "C"
{
#endif

#ifdef __cplusplus
}
#endif

#endif // __MAIN_H__
