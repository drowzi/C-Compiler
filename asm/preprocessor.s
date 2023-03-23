	.file	"preprocessor.c"
	.text
	.globl	_make_token_list
	.def	_make_token_list;	.scl	2;	.type	32;	.endef
_make_token_list:
LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	call	_make_list
	movl	%eax, -16(%ebp)
	movl	$0, -12(%ebp)
	jmp	L2
L3:
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_get
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_list_append
	addl	$1, -12(%ebp)
L2:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_length
	cmpl	-12(%ebp), %eax
	ja	L3
	movl	-16(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.section .rdata,"dr"
LC0:
	.ascii "Marked\0"
	.align 4
LC1:
	.ascii "C:\\Users\\Allen\\Desktop\\dev\\Language Design\\CCompiler\\preprocessor.c\0"
LC2:
	.ascii "tident(macro)\0"
	.text
	.globl	_process_define
	.def	_process_define;	.scl	2;	.type	32;	.endef
_process_define:
LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC0, (%esp)
	call	_puts
	call	_scan
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_tident
	testl	%eax, %eax
	jne	L6
	movl	$35, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	__assert
L6:
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_print_token
	call	_make_list
	movl	%eax, -12(%ebp)
	call	_scan
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_tsymbol
	testl	%eax, %eax
	je	L7
	movl	-20(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$514, %eax
	je	L8
L7:
	movl	$LC0, (%esp)
	call	_puts
	call	_scan_cpp_line
	movl	%eax, -12(%ebp)
	movl	$LC0, (%esp)
	call	_puts
L8:
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token_list
	movl	%eax, -24(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_free
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	movl	-24(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_define_macro
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.section .rdata,"dr"
LC3:
	.ascii "tok->type == TYIDENT\0"
	.text
	.globl	_process_undef
	.def	_process_undef;	.scl	2;	.type	32;	.endef
_process_undef:
LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	call	_scan
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	je	L10
	movl	$56, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC3, (%esp)
	call	__assert
L10:
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_remove_macro
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.globl	_process_ifdef
	.def	_process_ifdef;	.scl	2;	.type	32;	.endef
_process_ifdef:
LFB28:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	call	_scan
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	je	L12
	movl	$61, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC3, (%esp)
	call	__assert
L12:
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_macro_exists
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.globl	_process_ifndef
	.def	_process_ifndef;	.scl	2;	.type	32;	.endef
_process_ifndef:
LFB29:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	call	_scan
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	je	L14
	movl	$68, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC3, (%esp)
	call	__assert
L14:
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_macro_exists
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE29:
	.globl	_process_endif
	.def	_process_endif;	.scl	2;	.type	32;	.endef
_process_endif:
LFB30:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	call	_scan
	movl	%eax, -12(%ebp)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE30:
	.section .rdata,"dr"
LC4:
	.ascii "\0"
	.text
	.globl	_process_native_include
	.def	_process_native_include;	.scl	2;	.type	32;	.endef
_process_native_include:
LFB31:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC4, (%esp)
	call	_make_string
	movl	%eax, -12(%ebp)
	jmp	L17
L18:
	movsbl	-13(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_string_append_char
L17:
	call	_take
	movb	%al, -13(%ebp)
	cmpb	$62, -13(%ebp)
	jne	L18
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_string_body
	movl	%eax, -20(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_string_free
	movl	-20(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE31:
	.globl	_process_local_include
	.def	_process_local_include;	.scl	2;	.type	32;	.endef
_process_local_include:
LFB32:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC4, (%esp)
	call	_make_string
	movl	%eax, -12(%ebp)
	jmp	L21
L22:
	movsbl	-13(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_string_append_char
L21:
	call	_take
	movb	%al, -13(%ebp)
	cmpb	$34, -13(%ebp)
	jne	L22
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_string_body
	movl	%eax, -20(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_string_free
	movl	-20(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE32:
	.section .rdata,"dr"
	.align 4
LC5:
	.ascii "Invalid #include directive: expected '<' or '\"', got %c\0"
LC6:
	.ascii "native\0"
LC7:
	.ascii "local\0"
LC8:
	.ascii "<Included %s file: %s>\12\0"
	.text
	.globl	_process_include
	.def	_process_include;	.scl	2;	.type	32;	.endef
_process_include:
LFB33:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
L25:
	call	_take
	movb	%al, -13(%ebp)
	cmpb	$32, -13(%ebp)
	je	L25
	movsbl	-13(%ebp), %eax
	cmpl	$34, %eax
	je	L27
	cmpl	$60, %eax
	jne	L32
	call	_process_native_include
	movl	%eax, -12(%ebp)
	jmp	L29
L27:
	call	_process_local_include
	movl	%eax, -12(%ebp)
	jmp	L29
L32:
	movsbl	-13(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_fatal
L29:
	cmpb	$60, -13(%ebp)
	jne	L30
	movl	$LC6, %edx
	jmp	L31
L30:
	movl	$LC7, %edx
L31:
	movl	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	$LC8, (%esp)
	call	_printf
	call	_skip_to_newline
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_push_file
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE33:
	.globl	_token_union
	.def	_token_union;	.scl	2;	.type	32;	.endef
_token_union:
LFB34:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_strlen
	movl	%eax, %ebx
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_strlen
	addl	%ebx, %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	addl	$1, %eax
	movl	%eax, (%esp)
	call	_malloc
	movl	%eax, -16(%ebp)
	movl	12(%ebp), %eax
	movl	8(%eax), %edx
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	-12(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strncat
	movl	$0, 12(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$9, 4(%esp)
	movl	$0, (%esp)
	call	_make_token
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE34:
	.section .rdata,"dr"
LC9:
	.ascii "define\0"
LC10:
	.ascii "include\0"
LC11:
	.ascii "undef\0"
LC12:
	.ascii "ifdef\0"
LC13:
	.ascii "ifndef\0"
LC14:
	.ascii "endif\0"
LC15:
	.ascii "if\0"
	.align 4
LC16:
	.ascii "Invalid preprocessor directive %s\0"
	.text
	.globl	_parse_cpp_directive
	.def	_parse_cpp_directive;	.scl	2;	.type	32;	.endef
_parse_cpp_directive:
LFB35:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	call	_get_current_module
	movl	%eax, -12(%ebp)
	call	_scan
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	je	L36
	movl	$142, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC3, (%esp)
	call	__assert
L36:
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -20(%ebp)
	movl	$LC9, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L37
	call	_process_define
	jmp	L38
L37:
	movl	$LC10, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L39
	call	_process_include
	jmp	L38
L39:
	movl	$LC11, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L40
	call	_process_undef
	jmp	L38
L40:
	movl	$LC12, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L41
	call	_process_ifdef
	jmp	L38
L41:
	movl	$LC13, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L42
	call	_process_ifndef
	jmp	L38
L42:
	movl	$LC14, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L43
	call	_process_endif
	jmp	L38
L43:
	movl	$LC15, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L44
	call	_process_endif
	jmp	L38
L44:
	movl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC16, (%esp)
	call	_error
L38:
	movl	$1, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE35:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_make_list;	.scl	2;	.type	32;	.endef
	.def	_vector_get;	.scl	2;	.type	32;	.endef
	.def	_list_append;	.scl	2;	.type	32;	.endef
	.def	_vector_length;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_scan;	.scl	2;	.type	32;	.endef
	.def	_tident;	.scl	2;	.type	32;	.endef
	.def	__assert;	.scl	2;	.type	32;	.endef
	.def	_print_token;	.scl	2;	.type	32;	.endef
	.def	_tsymbol;	.scl	2;	.type	32;	.endef
	.def	_scan_cpp_line;	.scl	2;	.type	32;	.endef
	.def	_free;	.scl	2;	.type	32;	.endef
	.def	_define_macro;	.scl	2;	.type	32;	.endef
	.def	_remove_macro;	.scl	2;	.type	32;	.endef
	.def	_macro_exists;	.scl	2;	.type	32;	.endef
	.def	_make_string;	.scl	2;	.type	32;	.endef
	.def	_string_append_char;	.scl	2;	.type	32;	.endef
	.def	_take;	.scl	2;	.type	32;	.endef
	.def	_string_body;	.scl	2;	.type	32;	.endef
	.def	_string_free;	.scl	2;	.type	32;	.endef
	.def	_fatal;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_skip_to_newline;	.scl	2;	.type	32;	.endef
	.def	_push_file;	.scl	2;	.type	32;	.endef
	.def	_strlen;	.scl	2;	.type	32;	.endef
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_strncat;	.scl	2;	.type	32;	.endef
	.def	_make_token;	.scl	2;	.type	32;	.endef
	.def	_get_current_module;	.scl	2;	.type	32;	.endef
	.def	_strcmp;	.scl	2;	.type	32;	.endef
	.def	_error;	.scl	2;	.type	32;	.endef
