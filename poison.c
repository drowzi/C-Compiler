#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>
#include "cc.h"

/* Consider adding some kind of list to track all allocated memory so we can later free it,
 *  maybe an arena like LCC, allocate one large block of memory and control it's usage.
 */

extern unsigned int heap_space_allocated = 0;
extern unsigned int heap_space_freed = 0;

void print_memory_diagnostics() {
    printf("Heap space used: %d b\n", heap_space_allocated);
}

#ifdef ALLOW_ALLOC_POISON

void* malloc(size_t size) {
    static void* (*real_malloc)(size_t) = NULL;
    if (!real_malloc)
        real_malloc = dlsym(RTLD_NEXT, "malloc");
    void *p = real_malloc(size);
    heap_space_allocated += size;
    return p;
}

void free(void *mem) {
    static void (*real_free)(void*) = NULL;
    if (!real_free)
        real_free = dlsym(RTLD_NEXT, "free");
    real_free(mem);
    // Probably always 'sizeof(void pointer)', sadly
    heap_space_freed += sizeof(mem);
}

#endif // ALLOW_ALLOC_POISON
