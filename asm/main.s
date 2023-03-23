	.file	"main.c"
.lcomm _parse_flags,4,4
.lcomm _files,4,4
.lcomm _modules,4,4
.lcomm _frequency,8,8
.lcomm _start,8,8
.lcomm _end,8,8
.lcomm _COMPILER,8,4
	.comm	_current, 4, 2
	.text
	.globl	_make_module_record
	.def	_make_module_record;	.scl	2;	.type	32;	.endef
_make_module_record:
LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$40, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_open_instream
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%edx, (%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.globl	_get_module_deps
	.def	_get_module_deps;	.scl	2;	.type	32;	.endef
_get_module_deps:
LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	_current, %eax
	movl	24(%eax), %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.def	_start_timer;	.scl	3;	.type	32;	.endef
_start_timer:
LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$_frequency, (%esp)
	call	_QueryPerformanceFrequency@4
	subl	$4, %esp
	movl	$_start, (%esp)
	call	_QueryPerformanceCounter@4
	subl	$4, %esp
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.def	_end_timer;	.scl	3;	.type	32;	.endef
_end_timer:
LFB28:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	movl	$_end, (%esp)
	call	_QueryPerformanceCounter@4
	subl	$4, %esp
	movl	_end, %ecx
	movl	_end+4, %ebx
	movl	_start, %eax
	movl	_start+4, %edx
	subl	%eax, %ecx
	sbbl	%edx, %ebx
	movl	%ecx, -24(%ebp)
	movl	%ebx, -20(%ebp)
	fildq	-24(%ebp)
	fstpl	-16(%ebp)
	fldl	-16(%ebp)
	movl	_frequency, %eax
	movl	_frequency+4, %edx
	movl	%eax, -24(%ebp)
	movl	%edx, -20(%ebp)
	fildq	-24(%ebp)
	fstpl	-16(%ebp)
	fldl	-16(%ebp)
	fdivrp	%st, %st(1)
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.section .rdata,"dr"
	.align 4
LC1:
	.ascii "Usage: ccompiler [-flag] <filename>\12\12    -t       Print tokens\12    -a       Print tree\12    -s       Print assembly\12    -c       Compile but do not link\12    -S       Do not assemble\12    -E       Perform preprocessing only\12    -Wall    Enable all warnings\12    -help    Show help\12\0"
	.text
	.def	_help;	.scl	3;	.type	32;	.endef
_help:
LFB29:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$LC1, (%esp)
	call	_puts
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE29:
	.section .rdata,"dr"
LC2:
	.ascii "-t\0"
	.text
	.def	_parse_args;	.scl	3;	.type	32;	.endef
_parse_args:
LFB30:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	call	_make_vector
	movl	%eax, _files
	movl	$1, -12(%ebp)
	jmp	L10
L14:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movzbl	(%eax), %eax
	cmpb	$45, %al
	jne	L11
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L15
	movl	_parse_flags, %eax
	orl	$1, %eax
	movl	%eax, _parse_flags
	jmp	L15
L11:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %edx
	movl	_files, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_vector_append
	jmp	L13
L15:
	nop
L13:
	addl	$1, -12(%ebp)
L10:
	movl	-12(%ebp), %eax
	cmpl	8(%ebp), %eax
	jl	L14
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE30:
	.globl	_get_current_module
	.def	_get_current_module;	.scl	2;	.type	32;	.endef
_get_current_module:
LFB31:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	_current, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE31:
	.globl	_get_current_file
	.def	_get_current_file;	.scl	2;	.type	32;	.endef
_get_current_file:
LFB32:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	_current, %eax
	movl	(%eax), %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE32:
	.globl	_stash_record
	.def	_stash_record;	.scl	2;	.type	32;	.endef
_stash_record:
LFB33:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	_current, %edx
	movl	_modules, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_vector_append
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE33:
	.section .rdata,"dr"
LC3:
	.ascii "gcc \0"
LC4:
	.ascii "Assembling binary...\12\0"
LC5:
	.ascii "gcc outfile.s\0"
	.text
	.globl	_link_assembly
	.def	_link_assembly;	.scl	2;	.type	32;	.endef
_link_assembly:
LFB34:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC3, (%esp)
	call	_make_string
	movl	%eax, -16(%ebp)
	movl	$0, -12(%ebp)
	jmp	L22
L23:
	movl	_files, %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_vector_get
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_string_concat_const
	addl	$1, -12(%ebp)
L22:
	movl	_files, %eax
	movl	%eax, (%esp)
	call	_vector_length
	cmpl	-12(%ebp), %eax
	ja	L23
	movl	$LC4, (%esp)
	call	_log_debug
	movl	$LC5, (%esp)
	call	_system
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE34:
	.section .rdata,"dr"
LC6:
	.ascii "%s [y/n]: \0"
LC7:
	.ascii "y\0"
	.text
	.globl	_prompt
	.def	_prompt;	.scl	2;	.type	32;	.endef
_prompt:
LFB35:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_printf
	movl	__imp___iob, %eax
	movl	%eax, 8(%esp)
	movl	$10, 4(%esp)
	leal	-18(%ebp), %eax
	movl	%eax, (%esp)
	call	_fgets
	movb	$0, -17(%ebp)
	movl	$LC7, 4(%esp)
	leal	-18(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE35:
	.section .rdata,"dr"
	.align 4
LC8:
	.ascii "Would you like to run the binary?\0"
LC9:
	.ascii "Running binary...\12\0"
LC10:
	.ascii "a.exe\0"
	.text
	.globl	_execute
	.def	_execute;	.scl	2;	.type	32;	.endef
_execute:
LFB36:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$LC8, (%esp)
	call	_prompt
	testl	%eax, %eax
	je	L29
	movl	$LC9, (%esp)
	call	_log_debug
	movl	$LC10, (%esp)
	call	_system
	movl	$10, (%esp)
	call	_putchar
L29:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE36:
	.section .rdata,"dr"
LC11:
	.ascii "w\0"
	.align 4
LC12:
	.ascii "C:\\Users\\Allen\\Desktop\\state_scanner.c\0"
	.align 4
LC13:
	.ascii "static Token *tokenize_%d() {\12\12}\12\0"
	.text
	.globl	_fill_state_file
	.def	_fill_state_file;	.scl	2;	.type	32;	.endef
_fill_state_file:
LFB37:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC11, 4(%esp)
	movl	$LC12, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	movl	$0, -12(%ebp)
	jmp	L31
L32:
	movl	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$LC13, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	addl	$1, -12(%ebp)
L31:
	cmpl	$127, -12(%ebp)
	jbe	L32
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE37:
	.globl	_init_statics
	.def	_init_statics;	.scl	2;	.type	32;	.endef
_init_statics:
LFB38:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	call	_init_builtin_types
	call	_init_symbols
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE38:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC14:
	.ascii "\12Lex\12\0"
LC15:
	.ascii "\12Syntax/Semantics\12\0"
LC16:
	.ascii "\12Generation\12\0"
	.align 4
LC17:
	.ascii "Module %d compiled in %f seconds.\0"
	.align 4
LC18:
	.ascii "Compilation finished in %d seconds with %d error(s), %d warning(s)\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB39:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	andl	$-16, %esp
	subl	$32, %esp
	.cfi_offset 3, -12
	call	___main
	movl	$1, 24(%esp)
	call	_make_vector
	movl	%eax, _modules
	cmpl	$1, 24(%esp)
	jne	L35
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_parse_args
L35:
	movl	24(%esp), %eax
	movl	%eax, (%esp)
	call	_set_input_type
	call	_init_builtin_types
	movl	$0, 28(%esp)
	jmp	L36
L37:
	call	_start_timer
	movl	$LC14, (%esp)
	call	_puts
	movl	_files, %eax
	movl	28(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_vector_get
	movl	%eax, (%esp)
	call	_make_module_record
	movl	%eax, _current
	call	_set_current_file
	call	_init_symbols
	call	_do_lex
	movl	$LC15, (%esp)
	call	_puts
	call	_make_ast
	movl	$LC16, (%esp)
	call	_puts
	call	_do_code_gen
	call	_stash_record
	call	_end_timer
	fstpl	16(%esp)
	fldl	16(%esp)
	fstpl	8(%esp)
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC17, (%esp)
	call	_log_debug
	addl	$1, 28(%esp)
L36:
	movl	_files, %eax
	movl	%eax, (%esp)
	call	_vector_length
	cmpl	28(%esp), %eax
	ja	L37
	call	_print_memory_diagnostics
	call	_link_assembly
	call	_execute
	call	_get_error_count
	movl	%eax, %ebx
	call	_get_warning_count
	movl	%ebx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	$LC18, (%esp)
	call	_log_debug
	movl	$0, %eax
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE39:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_open_instream;	.scl	2;	.type	32;	.endef
	.def	_QueryPerformanceFrequency@4;	.scl	2;	.type	32;	.endef
	.def	_QueryPerformanceCounter@4;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_make_vector;	.scl	2;	.type	32;	.endef
	.def	_strcmp;	.scl	2;	.type	32;	.endef
	.def	_vector_append;	.scl	2;	.type	32;	.endef
	.def	_make_string;	.scl	2;	.type	32;	.endef
	.def	_vector_get;	.scl	2;	.type	32;	.endef
	.def	_string_concat_const;	.scl	2;	.type	32;	.endef
	.def	_vector_length;	.scl	2;	.type	32;	.endef
	.def	_log_debug;	.scl	2;	.type	32;	.endef
	.def	_system;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_fgets;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	_fprintf;	.scl	2;	.type	32;	.endef
	.def	_fclose;	.scl	2;	.type	32;	.endef
	.def	_init_builtin_types;	.scl	2;	.type	32;	.endef
	.def	_init_symbols;	.scl	2;	.type	32;	.endef
	.def	_set_input_type;	.scl	2;	.type	32;	.endef
	.def	_set_current_file;	.scl	2;	.type	32;	.endef
	.def	_do_lex;	.scl	2;	.type	32;	.endef
	.def	_make_ast;	.scl	2;	.type	32;	.endef
	.def	_do_code_gen;	.scl	2;	.type	32;	.endef
	.def	_print_memory_diagnostics;	.scl	2;	.type	32;	.endef
	.def	_get_error_count;	.scl	2;	.type	32;	.endef
	.def	_get_warning_count;	.scl	2;	.type	32;	.endef
