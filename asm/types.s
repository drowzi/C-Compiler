	.file	"types.c"
.lcomm _type_char,4,4
.lcomm _type_short,4,4
.lcomm _type_int,4,4
.lcomm _type_longlong,4,4
.lcomm _type_long,4,4
.lcomm _type_double,4,4
.lcomm _type_longdouble,4,4
.lcomm _type_float,4,4
.lcomm _type_enum,4,4
.lcomm _type_void,4,4
.lcomm _type_uchar,4,4
.lcomm _type_ushort,4,4
.lcomm _type_uint,4,4
.lcomm _type_ulong,4,4
.lcomm _type_ulonglong,4,4
	.text
	.def	_define_builtin_type;	.scl	3;	.type	32;	.endef
_define_builtin_type:
LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$48, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %edx
	movl	-12(%ebp), %eax
	movl	%edx, 4(%eax)
	movl	12(%ebp), %edx
	movl	-12(%ebp), %eax
	movl	%edx, (%eax)
	movl	16(%ebp), %edx
	movl	-12(%ebp), %eax
	movl	%edx, 12(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.globl	_init_builtin_types
	.def	_init_builtin_types;	.scl	2;	.type	32;	.endef
_init_builtin_types:
LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	movl	$1, (%esp)
	call	_define_builtin_type
	movl	%eax, _type_char
	movl	$0, 8(%esp)
	movl	$1, 4(%esp)
	movl	$2, (%esp)
	call	_define_builtin_type
	movl	%eax, _type_short
	movl	$0, 8(%esp)
	movl	$3, 4(%esp)
	movl	$4, (%esp)
	call	_define_builtin_type
	movl	%eax, _type_int
	movl	$0, 8(%esp)
	movl	$4, 4(%esp)
	movl	$8, (%esp)
	call	_define_builtin_type
	movl	%eax, _type_long
	movl	$0, 8(%esp)
	movl	$10, 4(%esp)
	movl	$8, (%esp)
	call	_define_builtin_type
	movl	%eax, _type_longlong
	movl	$0, 8(%esp)
	movl	$9, 4(%esp)
	movl	$8, (%esp)
	call	_define_builtin_type
	movl	%eax, _type_longdouble
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	$8, (%esp)
	call	_define_builtin_type
	movl	%eax, _type_double
	movl	$0, 8(%esp)
	movl	$8, 4(%esp)
	movl	$4, (%esp)
	call	_define_builtin_type
	movl	%eax, _type_float
	movl	$0, 8(%esp)
	movl	$11, 4(%esp)
	movl	$0, (%esp)
	call	_define_builtin_type
	movl	%eax, _type_void
	movl	$1, 8(%esp)
	movl	$0, 4(%esp)
	movl	$1, (%esp)
	call	_define_builtin_type
	movl	%eax, _type_uchar
	movl	$1, 8(%esp)
	movl	$1, 4(%esp)
	movl	$2, (%esp)
	call	_define_builtin_type
	movl	%eax, _type_ushort
	movl	$1, 8(%esp)
	movl	$3, 4(%esp)
	movl	$4, (%esp)
	call	_define_builtin_type
	movl	%eax, _type_uint
	movl	$1, 8(%esp)
	movl	$4, 4(%esp)
	movl	$8, (%esp)
	call	_define_builtin_type
	movl	%eax, _type_ulong
	movl	$1, 8(%esp)
	movl	$10, 4(%esp)
	movl	$8, (%esp)
	call	_define_builtin_type
	movl	%eax, _type_ulonglong
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.globl	_make_base_type
	.def	_make_base_type;	.scl	2;	.type	32;	.endef
_make_base_type:
LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$48, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	$0, 40(%eax)
	movl	-12(%ebp), %eax
	movl	$0, 8(%eax)
	movl	-12(%ebp), %eax
	movl	$14, (%eax)
	movl	-12(%ebp), %eax
	movl	$0, 4(%eax)
	movl	-12(%ebp), %eax
	movl	$0, 12(%eax)
	movl	-12(%ebp), %eax
	movl	$0, 16(%eax)
	movl	-12(%ebp), %eax
	movl	$0, 20(%eax)
	movl	-12(%ebp), %eax
	movl	$0, 24(%eax)
	movl	-12(%ebp), %eax
	movl	$0, 28(%eax)
	movl	-12(%ebp), %eax
	movl	$0, 40(%eax)
	movl	-12(%ebp), %eax
	movl	$0, 44(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.globl	_make_func_type
	.def	_make_func_type;	.scl	2;	.type	32;	.endef
_make_func_type:
LFB28:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	call	_make_base_type
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 40(%eax)
	movl	-12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 44(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.section .rdata,"dr"
LC0:
	.ascii "[TYPE INFO] \0"
LC1:
	.ascii "const\0"
LC2:
	.ascii "\0"
LC3:
	.ascii "%s pointer to \0"
LC4:
	.ascii "const \0"
LC5:
	.ascii "unsigned \0"
LC6:
	.ascii "signed \0"
LC7:
	.ascii "%s%s\0"
LC8:
	.ascii "%s \0"
LC9:
	.ascii "with storage type %s\12\0"
	.text
	.globl	_print_type
	.def	_print_type;	.scl	2;	.type	32;	.endef
_print_type:
LFB29:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$LC0, (%esp)
	call	_printf
	jmp	L9
L12:
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	testl	%eax, %eax
	je	L10
	movl	$LC1, %eax
	jmp	L11
L10:
	movl	$LC2, %eax
L11:
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	movl	8(%ebp), %eax
	movl	40(%eax), %eax
	movl	%eax, 8(%ebp)
L9:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$13, %eax
	je	L12
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	testl	%eax, %eax
	je	L13
	movl	$LC4, %edx
	jmp	L14
L13:
	movl	$LC2, %edx
L14:
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	testl	%eax, %eax
	je	L15
	movl	$LC5, %eax
	jmp	L16
L15:
	movl	$LC6, %eax
L16:
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_ctypekind2s
	movl	%eax, 4(%esp)
	movl	$LC8, (%esp)
	call	_printf
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	movl	%eax, (%esp)
	call	_storagetype2s
	movl	%eax, 4(%esp)
	movl	$LC9, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE29:
	.def	_maybe_parse_record_type;	.scl	3;	.type	32;	.endef
_maybe_parse_record_type:
LFB30:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	call	_get_token
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	$0, 24(%eax)
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$5, %eax
	jne	L18
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$24, %eax
	je	L19
	cmpl	$27, %eax
	je	L20
	jmp	L18
L19:
	movl	8(%ebp), %eax
	movl	$1, 24(%eax)
	jmp	L17
L20:
	movl	8(%ebp), %eax
	movl	$2, 24(%eax)
	jmp	L17
L18:
	call	_unwind_token_pos
L17:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE30:
	.def	_maybe_parse_const;	.scl	3;	.type	32;	.endef
_maybe_parse_const:
LFB31:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	call	_get_token
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$5, %eax
	jne	L23
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$4, %eax
	jne	L23
	movl	8(%ebp), %eax
	movl	$1, 16(%eax)
	jmp	L24
L23:
	call	_unwind_token_pos
L24:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE31:
	.section .rdata,"dr"
	.align 4
LC10:
	.ascii "keyword %s is not supported as a valid c type\0"
	.text
	.def	_parse_base_type;	.scl	3;	.type	32;	.endef
_parse_base_type:
LFB32:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	call	_get_token
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	$14, (%eax)
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$5, %eax
	jne	L26
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$28, %eax
	jne	L26
	movl	8(%ebp), %eax
	movl	$1, 12(%eax)
	call	_get_token
	movl	%eax, -12(%ebp)
L26:
	movl	$0, (%esp)
	call	_peek_token
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$5, %eax
	jne	L27
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	subl	$3, %eax
	cmpl	$26, %eax
	ja	L28
	movl	L30(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L30:
	.long	L29
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L31
	.long	L28
	.long	L28
	.long	L28
	.long	L32
	.long	L28
	.long	L28
	.long	L28
	.long	L33
	.long	L34
	.long	L28
	.long	L28
	.long	L35
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L36
	.text
L29:
	movl	_type_char, %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	8(%ebp), %eax
	movl	$1, 4(%eax)
	movl	8(%ebp), %eax
	movl	$0, (%eax)
	jmp	L46
L35:
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$5, %eax
	jne	L38
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$16, %eax
	jne	L38
	movl	_type_int, %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	8(%ebp), %eax
	movl	$4, 4(%eax)
	movl	8(%ebp), %eax
	movl	$2, (%eax)
	call	_take
	jmp	L46
L38:
	movl	_type_short, %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	8(%ebp), %eax
	movl	$2, 4(%eax)
	movl	8(%ebp), %eax
	movl	$1, (%eax)
	jmp	L46
L33:
	movl	_type_int, %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	8(%ebp), %eax
	movl	$4, 4(%eax)
	movl	8(%ebp), %eax
	movl	$3, (%eax)
	jmp	L46
L34:
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$5, %eax
	jne	L40
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$16, %eax
	jne	L40
	movl	_type_longlong, %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	8(%ebp), %eax
	movl	$8, 4(%eax)
	movl	8(%ebp), %eax
	movl	$5, (%eax)
	call	_take
	jmp	L41
L40:
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$5, %eax
	jne	L42
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$8, %eax
	jne	L42
	movl	_type_longdouble, %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	8(%ebp), %eax
	movl	$8, 4(%eax)
	movl	8(%ebp), %eax
	movl	$9, (%eax)
	call	_take
	jmp	L41
L42:
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$5, %eax
	jne	L43
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$17, %eax
	jne	L43
	movl	$1, (%esp)
	call	_peek_token
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$5, %eax
	jne	L44
	movl	-20(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$16, %eax
	jne	L44
	movl	_type_longlong, %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	8(%ebp), %eax
	movl	$8, 4(%eax)
	movl	8(%ebp), %eax
	movl	$6, (%eax)
	call	_take
	call	_take
	jmp	L41
L44:
	movl	_type_longlong, %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	8(%ebp), %eax
	movl	$8, 4(%eax)
	movl	8(%ebp), %eax
	movl	$10, (%eax)
	call	_take
	jmp	L41
L43:
	movl	_type_long, %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	8(%ebp), %eax
	movl	$8, 4(%eax)
	movl	8(%ebp), %eax
	movl	$4, (%eax)
	jmp	L46
L41:
	jmp	L46
L31:
	movl	_type_double, %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	8(%ebp), %eax
	movl	$8, 4(%eax)
	movl	8(%ebp), %eax
	movl	$7, (%eax)
	jmp	L46
L32:
	movl	_type_float, %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	8(%ebp), %eax
	movl	$4, 4(%eax)
	movl	8(%ebp), %eax
	movl	$8, (%eax)
	jmp	L46
L36:
	movl	_type_void, %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	8(%ebp), %eax
	movl	$0, 4(%eax)
	movl	8(%ebp), %eax
	movl	$11, (%eax)
	jmp	L46
L28:
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_kw2s
	movl	%eax, 4(%esp)
	movl	$LC10, (%esp)
	call	_log_error
	jmp	L47
L27:
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_get_utype
	movl	%eax, 8(%ebp)
	jmp	L47
L46:
L47:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE32:
	.def	_parse_storage_type;	.scl	3;	.type	32;	.endef
_parse_storage_type:
LFB33:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	$0, 20(%eax)
	movl	$0, (%esp)
	call	_peek_token
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$5, %eax
	jne	L55
	call	_get_token
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$18, %eax
	je	L51
	cmpl	$23, %eax
	je	L52
	cmpl	$11, %eax
	je	L53
	jmp	L54
L52:
	movl	8(%ebp), %eax
	movl	$2, 20(%eax)
	jmp	L49
L53:
	movl	8(%ebp), %eax
	movl	$1, 20(%eax)
	jmp	L49
L51:
	movl	8(%ebp), %eax
	movl	$3, 20(%eax)
	jmp	L49
L54:
	movl	8(%ebp), %eax
	movl	$0, 20(%eax)
	call	_unwind_token_pos
	nop
L49:
L55:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE33:
	.def	_parse_cast_type;	.scl	3;	.type	32;	.endef
_parse_cast_type:
LFB34:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	call	_make_base_type
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_maybe_parse_record_type
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_parse_base_type
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE34:
	.def	_parse_function_def;	.scl	3;	.type	32;	.endef
_parse_function_def:
LFB35:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	call	_make_base_type
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_parse_storage_type
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_maybe_parse_record_type
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE35:
	.def	_parse_function_param_def;	.scl	3;	.type	32;	.endef
_parse_function_param_def:
LFB36:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	call	_make_base_type
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_maybe_parse_record_type
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_parse_base_type
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE36:
	.def	_parse_lvar_def;	.scl	3;	.type	32;	.endef
_parse_lvar_def:
LFB37:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	call	_make_base_type
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_parse_storage_type
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_maybe_parse_record_type
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_parse_base_type
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE37:
	.def	_parse_type;	.scl	3;	.type	32;	.endef
_parse_type:
LFB38:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	call	_make_base_type
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE38:
	.section .rdata,"dr"
	.align 4
LC11:
	.ascii "register is not a valid storage class for a global variable\0"
	.align 4
LC12:
	.ascii "auto is not a valid storage class for a global variable\0"
	.text
	.def	_parse_global_storage_type;	.scl	3;	.type	32;	.endef
_parse_global_storage_type:
LFB39:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	$1, 20(%eax)
	movl	$0, (%esp)
	call	_peek_token
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$5, %eax
	jne	L74
	call	_get_token
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$11, %eax
	je	L75
	cmpl	$11, %eax
	ja	L70
	testl	%eax, %eax
	je	L71
	jmp	L68
L70:
	cmpl	$18, %eax
	je	L72
	cmpl	$23, %eax
	jne	L68
	movl	8(%ebp), %eax
	movl	$2, 20(%eax)
	jmp	L67
L72:
	movl	$LC11, (%esp)
	call	_log_error
	jmp	L67
L71:
	movl	$LC12, (%esp)
	call	_log_error
	jmp	L67
L68:
	call	_unwind_token_pos
	jmp	L67
L75:
	nop
L67:
L74:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE39:
	.section .rdata,"dr"
	.align 4
LC13:
	.ascii "C:\\Users\\Allen\\Desktop\\dev\\Language Design\\CCompiler\\types.c\0"
LC14:
	.ascii "tok->type == TYIDENT\0"
	.align 4
LC15:
	.ascii "tok->type == TYSYMBOL && tok->id == OP_OPAREN\0"
	.text
	.def	_parse_fptr_type;	.scl	3;	.type	32;	.endef
_parse_fptr_type:
LFB40:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	call	_get_token
	movl	%eax, -12(%ebp)
	jmp	L77
L79:
	call	_make_base_type
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	$13, (%eax)
	movl	-16(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 40(%eax)
	movl	-16(%ebp), %eax
	movl	%eax, 8(%ebp)
	call	_get_token
	movl	%eax, -12(%ebp)
L77:
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$7, %eax
	jne	L78
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$516, %eax
	je	L79
L78:
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	je	L80
	movl	$327, 8(%esp)
	movl	$LC13, 4(%esp)
	movl	$LC14, (%esp)
	call	__assert
L80:
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -20(%ebp)
	call	_get_token
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$7, %eax
	jne	L81
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$514, %eax
	je	L82
L81:
	movl	$330, 8(%esp)
	movl	$LC13, 4(%esp)
	movl	$LC15, (%esp)
	call	__assert
L82:
	call	_make_vector
	movl	%eax, -24(%ebp)
L86:
	call	_make_base_type
	movl	%eax, -28(%ebp)
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$7, %eax
	jne	L83
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$515, %eax
	je	L87
L83:
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_parse_base_type
	call	_get_token
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$7, %eax
	jne	L88
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$533, %eax
	jne	L88
	jmp	L86
L87:
	nop
	jmp	L84
L88:
	nop
L84:
	movl	8(%ebp), %eax
	movl	-24(%ebp), %edx
	movl	%edx, 44(%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE40:
	.def	_parse_wildcard;	.scl	3;	.type	32;	.endef
_parse_wildcard:
LFB41:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
L98:
	call	_get_token
	movl	%eax, -16(%ebp)
	cmpl	$0, -12(%ebp)
	jne	L90
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$7, %eax
	jne	L90
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$514, %eax
	jne	L90
	movl	$0, (%esp)
	call	_peek_token
	movl	%eax, -24(%ebp)
	movl	-24(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$7, %eax
	jne	L90
	movl	-24(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$516, %eax
	jne	L90
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_parse_fptr_type
	jmp	L91
L90:
	cmpl	$0, -12(%ebp)
	je	L92
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	jne	L92
	call	_unwind_token_pos
	jmp	L91
L92:
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$5, %eax
	jne	L93
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$4, %eax
	jne	L93
	call	_unwind_token_pos
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_maybe_parse_const
	jmp	L94
L93:
	cmpl	$0, -12(%ebp)
	jne	L95
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	je	L96
L95:
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$5, %eax
	jne	L97
L96:
	call	_unwind_token_pos
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_parse_base_type
	movl	$1, -12(%ebp)
	jmp	L94
L97:
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$7, %eax
	jne	L98
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$516, %eax
	jne	L98
	call	_make_base_type
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	movl	$13, (%eax)
	movl	-20(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 40(%eax)
	movl	-20(%ebp), %eax
	movl	%eax, 8(%ebp)
L94:
	jmp	L98
L91:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE41:
	.globl	_get_number_type
	.def	_get_number_type;	.scl	2;	.type	32;	.endef
_get_number_type:
LFB42:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	_type_int, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE42:
	.globl	_parse_fparam_type
	.def	_parse_fparam_type;	.scl	2;	.type	32;	.endef
_parse_fparam_type:
LFB43:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	call	_make_base_type
	movl	%eax, -12(%ebp)
	call	_unwind_token_pos
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_maybe_parse_const
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_parse_base_type
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE43:
	.globl	_parse_global_decl_type
	.def	_parse_global_decl_type;	.scl	2;	.type	32;	.endef
_parse_global_decl_type:
LFB44:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	call	_make_base_type
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_parse_global_storage_type
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_maybe_parse_record_type
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_parse_wildcard
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_print_type
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE44:
	.globl	_parse_local_decl_type
	.def	_parse_local_decl_type;	.scl	2;	.type	32;	.endef
_parse_local_decl_type:
LFB45:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	call	_make_base_type
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_parse_storage_type
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_parse_wildcard
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_print_type
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE45:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_ctypekind2s;	.scl	2;	.type	32;	.endef
	.def	_storagetype2s;	.scl	2;	.type	32;	.endef
	.def	_get_token;	.scl	2;	.type	32;	.endef
	.def	_unwind_token_pos;	.scl	2;	.type	32;	.endef
	.def	_peek_token;	.scl	2;	.type	32;	.endef
	.def	_take;	.scl	2;	.type	32;	.endef
	.def	_kw2s;	.scl	2;	.type	32;	.endef
	.def	_log_error;	.scl	2;	.type	32;	.endef
	.def	_get_utype;	.scl	2;	.type	32;	.endef
	.def	__assert;	.scl	2;	.type	32;	.endef
	.def	_make_vector;	.scl	2;	.type	32;	.endef
