#include <stdio.h>
#include <stdlib.h>
#include "cc.h"

/*

typedef struct {
  unsigned int id;
  char *name;
  struct instream *infile;
  String *input;
  Vector *tokens;
  Map *cpptable;
  Vector *ast;
  Vector *deps;
  String *generated_code;
  struct debug_info *debug;
  FILE *outfile;
} Module;

static Module *current;

Module *make_module_record(char *module_name) {
    static unsigned int id = 0;
    Module *record = malloc(sizeof(Module));
    record->id = id++;
    record->name = module_name;
    record->infile = open_code_file(module_name);
    record->tokens = NULL;
    record->cpptable = NULL;
    record->ast = NULL;
    record->deps = NULL;
    record->generated_code = NULL;
    record->debug = NULL;
    record->outfile = NULL;
    return record;
}

void module_set_infile(struct instream *infile) {
    current->infile = infile;
}

void module_set_tokens(Vector *tokens) {
    current->tokens = tokens;
}

void module_set_cpptable(Map *cpptable) {
    current->cpptable = cpptable;
}

void module_set_ast(Vector *ast) {
    current->ast = ast;
}

void module_set_deps(Vector *deps) {
    current->deps = deps;
}

void module_set_generated_code(String *generated_code) {
    current->generated_code = generated_code;
}

void module_set_debug(struct debug_info *debug) {
    current->debug = debug;
}

void module_set_outfile(FILE *outfile) {
    current->outfile = outfile;
}

*/


