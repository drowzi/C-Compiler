#ifndef __ADLIB_H__
#define __ADLIB_H__

#include <windows.h>

#define INTERNAL_WARNINGS 1
#define INTERNAL_ERRORS 1

// main.c (temp)
unsigned int get_nalloc(unsigned int i);
char *ltoa(long N, char *str, int base);

// string.c
typedef struct {
    unsigned int length;
    unsigned int nalloc;
    char *body;
} string_t;

typedef string_t string;

string *make_string(char *string_body);
// Hot function, avoid usage for anything other than debugging
string *make_fmt_string(char *fmt, ...);
string *to_string(int i);
string *string_substring(string *s, int start, int end);
int string_equal(string *s1, string *s2);
int string_equal_const(string *s1, const char *s2);
void string_concat(string *dest, string *src);
void string_concat_const(string *dest, char *src);
unsigned int string_length(string *s);
char *string_body(string *s);
void string_prepend_char(string *s, char c);
void string_append_char(string *s, char c);

// queue.c
typedef struct {
    int nalloc;
    int tail; // LO
    int head; // FO
    void **body;
} Queue;

Queue *make_queue(int nalloc);
void queue_enqueue(Queue *q, void *val);
int queue_empty(Queue *q);
int queue_full(Queue *q);
void *queue_dequeue(Queue *q);

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
} list;

void list_append(list *l, void *body);
void list_prepend(list *l, void *body);
void *list_get(list *l, unsigned int index);
void list_delete(list *l, unsigned int index);
void list_map(list *l, void*(*callback)(void *));
list *make_list(void);

// vector.c
typedef struct vector_s {
    unsigned int length;
    unsigned int nalloc;
    void **body;
} vector;

vector *make_vector(void);
void vector_append(vector *v, void *val);
void vector_join(vector *dest, vector *src);
void *vector_get(vector *v, unsigned int index);
void vector_insert(vector *v, void *val, unsigned int index);
void vector_delete(vector *v, unsigned int index);
void *vector_pop(vector *v);
void vector_free(vector *v);

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
