	.file	"symbols.c"
.lcomm _envchain,4,4
.lcomm _macros,4,4
.lcomm _localenv,4,4
.lcomm _globalenv,4,4
.lcomm _staticenv,4,4
.lcomm _usertypes,4,4
.lcomm _labels,4,4
.lcomm _userstructs,4,4
	.text
	.globl	_init_symbols
	.def	_init_symbols;	.scl	2;	.type	32;	.endef
_init_symbols:
LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	call	_make_map
	movl	%eax, _macros
	call	_make_map
	movl	%eax, _localenv
	movl	_localenv, %eax
	movl	%eax, _globalenv
	call	_make_map
	movl	%eax, _staticenv
	call	_make_map
	movl	%eax, _usertypes
	call	_make_map
	movl	%eax, _labels
	call	_make_map
	movl	%eax, _userstructs
	call	_make_vector
	movl	%eax, _envchain
	movl	_localenv, %edx
	movl	_envchain, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_vector_append
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.globl	_define_lvar
	.def	_define_lvar;	.scl	2;	.type	32;	.endef
_define_lvar:
LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	_localenv, %eax
	movl	12(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	8(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_map_put
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.globl	_get_lvar
	.def	_get_lvar;	.scl	2;	.type	32;	.endef
_get_lvar:
LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	movl	_envchain, %eax
	movl	(%eax), %eax
	subl	$1, %eax
	movl	%eax, -16(%ebp)
	jmp	L4
L6:
	movl	-16(%ebp), %edx
	movl	_envchain, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_vector_get
	movl	%eax, -20(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_map_get
	movl	%eax, -12(%ebp)
	subl	$1, -16(%ebp)
L4:
	cmpl	$0, -16(%ebp)
	js	L5
	cmpl	$0, -12(%ebp)
	je	L6
L5:
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.globl	_lvar_exists
	.def	_lvar_exists;	.scl	2;	.type	32;	.endef
_lvar_exists:
LFB28:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_get_lvar
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.section .rdata,"dr"
	.align 4
LC0:
	.ascii "Syntax: undefined local variable reference to %s.\0"
	.text
	.globl	_assert_lvar_exists
	.def	_assert_lvar_exists;	.scl	2;	.type	32;	.endef
_assert_lvar_exists:
LFB29:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_lvar_exists
	testl	%eax, %eax
	jne	L12
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_log_error
L12:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE29:
	.section .rdata,"dr"
	.align 4
LC1:
	.ascii "expected local variable %s to not exist.\0"
	.text
	.globl	_assert_lvar_doesnt_exist
	.def	_assert_lvar_doesnt_exist;	.scl	2;	.type	32;	.endef
_assert_lvar_doesnt_exist:
LFB30:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_lvar_exists
	testl	%eax, %eax
	je	L15
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_log_error
L15:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE30:
	.globl	_push_localenv
	.def	_push_localenv;	.scl	2;	.type	32;	.endef
_push_localenv:
LFB31:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	call	_make_map
	movl	%eax, _localenv
	movl	_localenv, %edx
	movl	_envchain, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_vector_append
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE31:
	.globl	_pop_localenv
	.def	_pop_localenv;	.scl	2;	.type	32;	.endef
_pop_localenv:
LFB32:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	_envchain, %eax
	movl	%eax, (%esp)
	call	_vector_pop
	movl	_envchain, %eax
	movl	%eax, (%esp)
	call	_vector_top
	movl	%eax, _localenv
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE32:
	.globl	_get_gvar
	.def	_get_gvar;	.scl	2;	.type	32;	.endef
_get_gvar:
LFB33:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	_globalenv, %eax
	movl	8(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_map_get
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE33:
	.globl	_gvar_exists
	.def	_gvar_exists;	.scl	2;	.type	32;	.endef
_gvar_exists:
LFB34:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_get_gvar
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE34:
	.globl	_define_gvar
	.def	_define_gvar;	.scl	2;	.type	32;	.endef
_define_gvar:
LFB35:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_gvar_exists
	testl	%eax, %eax
	jne	L24
	movl	_globalenv, %eax
	movl	12(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	8(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_map_put
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	20(%eax), %eax
	cmpl	$2, %eax
	jne	L24
	movl	_staticenv, %eax
	movl	12(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	8(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_map_put
L24:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE35:
	.section .rdata,"dr"
	.align 4
LC2:
	.ascii "C:\\Users\\Allen\\Desktop\\dev\\Language Design\\CCompiler\\symbols.c\0"
	.align 4
LC3:
	.ascii "f->type == AST_FUNCDEF && f->f_block == NULL\0"
	.text
	.globl	_fill_function_decl
	.def	_fill_function_decl;	.scl	2;	.type	32;	.endef
_fill_function_decl:
LFB36:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_get_gvar
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$6, %eax
	jne	L26
	movl	-12(%ebp), %eax
	movl	32(%eax), %eax
	testl	%eax, %eax
	je	L27
L26:
	movl	$96, 8(%esp)
	movl	$LC2, 4(%esp)
	movl	$LC3, (%esp)
	call	__assert
L27:
	movl	-12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 32(%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE36:
	.section .rdata,"dr"
	.align 4
LC4:
	.ascii "expected global variable %s to exist\0"
	.text
	.globl	_assert_gvar_exists
	.def	_assert_gvar_exists;	.scl	2;	.type	32;	.endef
_assert_gvar_exists:
LFB37:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_gvar_exists
	testl	%eax, %eax
	jne	L30
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_log_error
L30:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE37:
	.section .rdata,"dr"
	.align 4
LC5:
	.ascii "expected global variable %s to not exist, cc currently doesnt support function overloading\0"
	.text
	.globl	_assert_gvar_doesnt_exist
	.def	_assert_gvar_doesnt_exist;	.scl	2;	.type	32;	.endef
_assert_gvar_doesnt_exist:
LFB38:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_gvar_exists
	testl	%eax, %eax
	je	L33
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_log_error
L33:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE38:
	.section .rdata,"dr"
LC6:
	.ascii "expected variable %s to exist\0"
	.text
	.globl	_assert_var_exists
	.def	_assert_var_exists;	.scl	2;	.type	32;	.endef
_assert_var_exists:
LFB39:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_get_lvar
	testl	%eax, %eax
	jne	L36
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_get_gvar
	testl	%eax, %eax
	jne	L36
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_log_error
L36:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE39:
	.globl	_is_builtin_type
	.def	_is_builtin_type;	.scl	2;	.type	32;	.endef
_is_builtin_type:
LFB40:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$5, %eax
	jne	L38
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	subl	$3, %eax
	cmpl	$17, %eax
	ja	L38
	movl	L40(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L40:
	.long	L39
	.long	L38
	.long	L38
	.long	L38
	.long	L38
	.long	L39
	.long	L38
	.long	L38
	.long	L38
	.long	L39
	.long	L38
	.long	L38
	.long	L38
	.long	L39
	.long	L39
	.long	L38
	.long	L38
	.long	L39
	.text
L39:
	movl	$1, %eax
	jmp	L41
L38:
	movl	$0, %eax
L41:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE40:
	.globl	_is_userdefined_type
	.def	_is_userdefined_type;	.scl	2;	.type	32;	.endef
_is_userdefined_type:
LFB41:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	jne	L43
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	movl	_usertypes, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_map_get
	testl	%eax, %eax
	je	L43
	movl	$1, %eax
	jmp	L44
L43:
	movl	$0, %eax
L44:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE41:
	.globl	_is_valid_type
	.def	_is_valid_type;	.scl	2;	.type	32;	.endef
_is_valid_type:
LFB42:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_is_builtin_type
	testl	%eax, %eax
	jne	L47
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_is_userdefined_type
	testl	%eax, %eax
	je	L48
L47:
	movl	$1, %eax
	jmp	L49
L48:
	movl	$0, %eax
L49:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE42:
	.section .rdata,"dr"
	.align 4
LC7:
	.ascii "Syntax: undefined type reference to %s.\0"
	.text
	.globl	_assert_type_exists
	.def	_assert_type_exists;	.scl	2;	.type	32;	.endef
_assert_type_exists:
LFB43:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_is_userdefined_type
	testl	%eax, %eax
	jne	L53
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_log_error
L53:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE43:
	.globl	_get_utype
	.def	_get_utype;	.scl	2;	.type	32;	.endef
_get_utype:
LFB44:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_assert_type_exists
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	movl	_usertypes, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_map_get
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE44:
	.globl	_define_macro
	.def	_define_macro;	.scl	2;	.type	32;	.endef
_define_macro:
LFB45:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	_macros, %eax
	movl	12(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	8(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_map_put
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE45:
	.globl	_remove_macro
	.def	_remove_macro;	.scl	2;	.type	32;	.endef
_remove_macro:
LFB46:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	_macros, %eax
	movl	$0, 8(%esp)
	movl	8(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_map_put
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE46:
	.globl	_macro_exists
	.def	_macro_exists;	.scl	2;	.type	32;	.endef
_macro_exists:
LFB47:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	_macros, %eax
	movl	8(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_map_get
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE47:
	.globl	_get_macro
	.def	_get_macro;	.scl	2;	.type	32;	.endef
_get_macro:
LFB48:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_macro_exists
	testl	%eax, %eax
	je	L61
	movl	_macros, %eax
	movl	8(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_map_get
	jmp	L62
L61:
	movl	$0, %eax
L62:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE48:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_make_map;	.scl	2;	.type	32;	.endef
	.def	_make_vector;	.scl	2;	.type	32;	.endef
	.def	_vector_append;	.scl	2;	.type	32;	.endef
	.def	_map_put;	.scl	2;	.type	32;	.endef
	.def	_vector_get;	.scl	2;	.type	32;	.endef
	.def	_map_get;	.scl	2;	.type	32;	.endef
	.def	_log_error;	.scl	2;	.type	32;	.endef
	.def	_vector_pop;	.scl	2;	.type	32;	.endef
	.def	_vector_top;	.scl	2;	.type	32;	.endef
	.def	__assert;	.scl	2;	.type	32;	.endef
