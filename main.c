#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/timeb.h>
#include "cc.h"

/* Main
 *  How it works: this file creates a module for each given file and fully compiles it into assembly.
 */

static int parse_flags = 0x0000;
static Vector *files;
static Vector *modules;
static LARGE_INTEGER frequency, start, end;

// Windows timer
typedef struct {
    LARGE_INTEGER f, s, e;
} Wtime;

static struct {
	unsigned int flags;
	Vector *module_records;
} COMPILER;

C_Module *current;

C_Module *make_module_record(char *module_name) {
    C_Module *record = malloc(sizeof(C_Module));
    record->infile = open_instream(module_name);
    return record;
}

Vector *get_module_deps() {
    return current->deps;
}

static void start_timer() {
    QueryPerformanceFrequency(&frequency);
    QueryPerformanceCounter(&start);
}

static double end_timer() {
    QueryPerformanceCounter(&end);
    return (double)(end.QuadPart - start.QuadPart) / frequency.QuadPart;
}

static void help() {
    printf("Usage: ccompiler [-flag] <filename>\n\n"
           "    -t       Print tokens\n"
           "    -a       Print tree\n"
           "    -s       Print assembly\n"
           "    -c       Compile but do not link\n"
           "    -S       Do not assemble\n"
           "    -E       Perform preprocessing only\n"
           "    -Wall    Enable all warnings\n"
           "    -help    Show help\n\n");
}

static void parse_args(int argc, char **argv) {
    files = make_vector();
    for (int i = 1; i < argc; i++) {
        if (argv[i][0] == '-') {
            if (strcmp("-t", argv[i]) == 0) parse_flags |= 0x0001; continue;
            if (strcmp("-a", argv[i]) == 0) parse_flags |= 0x0010; continue;
            if (strcmp("-s", argv[i]) == 0) parse_flags |= 0x0100; continue;
            if (strcmp("-Wall", argv[i]) == 0) parse_flags |= 0x1000; continue;
            if (strcmp("-help", argv[i]) == 0) help(); continue;
            log_debug("Flag not supported %s\n", argv[i]);
            continue;
        }
        vector_append(files, argv[i]);
    }
}

C_Module *get_current_module() {
    return current;
}

File *get_current_file() {
    return current->infile;
}

void stash_record() {
    vector_append(modules, (void*)current);
}

int link_assembly() {
    String *command = make_string("gcc ");
    for (unsigned int i = 0; i < vector_length(files); i++) {
        char *filename = vector_get(files, i);
        string_concat_const(command, filename);
        //string_concat_const(command, " ");
    }
    log_debug("Assembling binary...\n");
    return system("gcc outfile.s");
    //return system(string_body(command));
}

bool prompt(char *question) {
    char answer[10];
    printf("%s [y/n]: ", question);
    fgets(answer, 10, stdin);
    answer[1] = 0;
    return strcmp(answer, "y") == 0;
}

void execute() {
    if (prompt("Would you like to run the binary?")) {
        log_debug("Running binary...\n");
        system("a.exe");
        printf("\n");
    }
}

void fill_state_file() {
    FILE *f = fopen("C:\\Users\\Allen\\Desktop\\state_scanner.c", "w");
    for (unsigned int i = 0; i <= 127; i++) {
        fprintf(f, "static Token *tokenize_%d() {\n\n}\n", i);
    }
    fclose(f);
}

void init_statics()
{
    init_builtin_types();
    init_symbols();
}

/* Previous version benchmark - lex: 1.50 ms, parse: 0.08 ms, codegen: 80.00 ms */
int main(int argc, char **argv) {
    int input_type;
    double compilation_timer, module_timer;

    input_type = IOTYPEF;
    modules = make_vector();

    if (input_type == IOTYPEF)
        parse_args(argc, argv);

    set_input_type(input_type);
    init_builtin_types();
    //init_statics();

    //evaluate_file_stats(); // Probe the input for data to be passed to the threading module

    for (unsigned int i = 0; i < vector_length(files); i++) {
        start_timer();
        printf("\nLex\n\n");
        current = make_module_record((char*)vector_get(files, i));
        set_current_file();
        init_symbols();
        do_lex();
        //print_tokens();
        printf("\nSyntax/Semantics\n\n");
        make_ast();
        printf("\nGeneration\n\n");
        do_code_gen();
        stash_record();
        module_timer = end_timer();
        log_debug("Module %d compiled in %f seconds.", i, module_timer);
    }

    print_memory_diagnostics();
    link_assembly();
    execute();
    log_debug("Compilation finished in %d seconds with %d error(s), %d warning(s)", 0, get_warning_count(), get_error_count());
    return 0;
}
