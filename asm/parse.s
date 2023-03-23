	.file	"parse.c"
.lcomm _toplevel,4,4
.lcomm _current_return_label,4,4
.lcomm _current_break_label,4,4
.lcomm _current_cont_label,4,4
	.text
	.def	_make_print_ident_node;	.scl	3;	.type	32;	.endef
_make_print_ident_node:
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
	movl	-12(%ebp), %eax
	movl	$17, (%eax)
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.section .rdata,"dr"
LC0:
	.ascii "tmp%d\0"
	.text
	.globl	_make_tmp_iden_node
	.def	_make_tmp_iden_node;	.scl	2;	.type	32;	.endef
_make_tmp_iden_node:
LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	_tmp_number.33070, %eax
	leal	1(%eax), %edx
	movl	%edx, _tmp_number.33070
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_make_fmt_string
	movl	%eax, -12(%ebp)
	movl	$40, (%esp)
	call	_malloc
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	$2, (%eax)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_string_body
	movl	%eax, %edx
	movl	-16(%ebp), %eax
	movl	%edx, 12(%eax)
	movl	-16(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 16(%eax)
	movl	-16(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_string_free
	movl	-16(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.def	_make_iden_node;	.scl	3;	.type	32;	.endef
_make_iden_node:
LFB27:
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
	movl	-12(%ebp), %eax
	movl	$2, (%eax)
	movl	-12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 16(%eax)
	movl	16(%ebp), %eax
	negl	%eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.def	_make_return_node;	.scl	3;	.type	32;	.endef
_make_return_node:
LFB28:
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
	movl	-12(%ebp), %eax
	movl	$12, (%eax)
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.section .rdata,"dr"
LC1:
	.ascii "l\0"
	.text
	.def	_parse_number;	.scl	3;	.type	32;	.endef
_parse_number:
LFB29:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$0, -12(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_strlen
	movl	%eax, -24(%ebp)
	movl	-12(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -12(%ebp)
	movl	12(%ebp), %edx
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movb	%al, -25(%ebp)
	cmpb	$48, -25(%ebp)
	jne	L10
	cmpl	$1, -24(%ebp)
	jbe	L10
	movl	-12(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -12(%ebp)
	movl	12(%ebp), %edx
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movb	%al, -25(%ebp)
	cmpb	$120, -25(%ebp)
	jne	L11
	movl	$16, -20(%ebp)
	jmp	L13
L11:
	movl	$8, -20(%ebp)
	subl	$1, -12(%ebp)
	jmp	L13
L10:
	movl	$10, -20(%ebp)
L13:
	jmp	L14
L17:
	movl	12(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movb	%al, -25(%ebp)
	cmpb	$46, -25(%ebp)
	jne	L15
	cmpl	$0, -16(%ebp)
	jne	L15
	movl	$1, -16(%ebp)
L15:
	cmpb	$102, -25(%ebp)
	je	L16
	cmpb	$117, -25(%ebp)
	je	L16
	movsbl	-25(%ebp), %eax
	cmpl	$LC1, %eax
	je	L16
	addl	$1, -12(%ebp)
L14:
	movl	-12(%ebp), %eax
	cmpl	-24(%ebp), %eax
	jb	L17
L16:
	movl	8(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	$0, (%esp)
	call	_get_number_type
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 32(%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE29:
	.def	_make_number_node;	.scl	3;	.type	32;	.endef
_make_number_node:
LFB30:
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
	movl	-12(%ebp), %eax
	movl	$3, (%eax)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_parse_number
	cmpl	$0, 8(%ebp)
	je	L19
	movl	$10, 8(%esp)
	movl	$0, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_strtol
	cltd
	jmp	L20
L19:
	movl	16(%ebp), %eax
	cltd
L20:
	movl	-12(%ebp), %ecx
	movl	%eax, 24(%ecx)
	movl	%edx, 28(%ecx)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE30:
	.def	_make_expr_node;	.scl	3;	.type	32;	.endef
_make_expr_node:
LFB31:
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
	movl	-12(%ebp), %eax
	movl	$1, (%eax)
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE31:
	.def	_make_function_call_node;	.scl	3;	.type	32;	.endef
_make_function_call_node:
LFB32:
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
	movl	-12(%ebp), %eax
	movl	$7, (%eax)
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE32:
	.def	_make_function_decl_node;	.scl	3;	.type	32;	.endef
_make_function_decl_node:
LFB33:
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
	movl	-12(%ebp), %eax
	movl	$6, (%eax)
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 20(%eax)
	movl	16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_string
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-12(%ebp), %eax
	movl	20(%ebp), %edx
	movl	%edx, 28(%eax)
	movl	-12(%ebp), %eax
	movl	24(%ebp), %edx
	movl	%edx, 32(%eax)
	call	_get_function_block_label
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%edx, 12(%eax)
	call	_get_function_entry_label
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%edx, 16(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE33:
	.def	_make_assign_node;	.scl	3;	.type	32;	.endef
_make_assign_node:
LFB34:
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
	movl	-12(%ebp), %eax
	movl	$0, (%eax)
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE34:
	.def	_make_binop_node;	.scl	3;	.type	32;	.endef
_make_binop_node:
LFB35:
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
	movl	-12(%ebp), %eax
	movl	$4, (%eax)
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	-12(%ebp), %eax
	movl	16(%ebp), %edx
	movl	%edx, 16(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE35:
	.def	_make_unop_node;	.scl	3;	.type	32;	.endef
_make_unop_node:
LFB36:
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
	movl	-12(%ebp), %eax
	movl	$5, (%eax)
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE36:
	.def	_make_if_node;	.scl	3;	.type	32;	.endef
_make_if_node:
LFB37:
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
	movl	-12(%ebp), %eax
	movl	$9, (%eax)
	call	_get_generic_label
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%edx, 8(%eax)
	call	_get_generic_label
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%edx, 12(%eax)
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 16(%eax)
	movl	-12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 20(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE37:
	.def	_make_for_node;	.scl	3;	.type	32;	.endef
_make_for_node:
LFB38:
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
	movl	-12(%ebp), %eax
	movl	$10, (%eax)
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE38:
	.def	_make_while_node;	.scl	3;	.type	32;	.endef
_make_while_node:
LFB39:
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
	movl	-12(%ebp), %eax
	movl	$11, (%eax)
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 20(%eax)
	movl	-12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 24(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE39:
	.def	_make_struct_node;	.scl	3;	.type	32;	.endef
_make_struct_node:
LFB40:
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
	movl	-12(%ebp), %eax
	movl	$13, (%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE40:
	.def	_make_union_node;	.scl	3;	.type	32;	.endef
_make_union_node:
LFB41:
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
	movl	-12(%ebp), %eax
	movl	$14, (%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE41:
	.def	_make_enum_node;	.scl	3;	.type	32;	.endef
_make_enum_node:
LFB42:
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
	movl	-12(%ebp), %eax
	movl	$15, (%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE42:
	.def	_make_stub_node;	.scl	3;	.type	32;	.endef
_make_stub_node:
LFB43:
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
	movl	-12(%ebp), %eax
	movl	$16, (%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE43:
	.section .rdata,"dr"
	.align 4
LC2:
	.ascii "C:\\Users\\Allen\\Desktop\\dev\\Language Design\\CCompiler\\parse.c\0"
	.align 4
LC3:
	.ascii "tok->type == TYIDENT || tok->type == TYNUMBER\0"
	.text
	.def	_make_token_node;	.scl	3;	.type	32;	.endef
_make_token_node:
LFB44:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	je	L49
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$6, %eax
	je	L49
	movl	$262, 8(%esp)
	movl	$LC2, 4(%esp)
	movl	$LC3, (%esp)
	call	__assert
L49:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	je	L51
	cmpl	$6, %eax
	je	L52
	jmp	L50
L51:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_assert_lvar_exists
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_get_lvar
	movl	%eax, -12(%ebp)
	jmp	L50
L52:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -16(%ebp)
	movl	$0, 8(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	call	_make_number_node
	movl	%eax, -12(%ebp)
	nop
L50:
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE44:
	.globl	_ast_link_toplevel
	.def	_ast_link_toplevel;	.scl	2;	.type	32;	.endef
_ast_link_toplevel:
LFB45:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	cmpl	$0, 8(%ebp)
	je	L56
	movl	_toplevel, %eax
	movl	8(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_vector_append
L56:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE45:
	.section .rdata,"dr"
LC4:
	.ascii "ret->type == CTYPECHAR\0"
	.align 4
LC5:
	.ascii "Return statement type does not match function's return type.\0"
	.text
	.def	_parse_return_stmt;	.scl	3;	.type	32;	.endef
_parse_return_stmt:
LFB46:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	call	_peek_next_token
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	subl	$8, %eax
	cmpl	$2, %eax
	ja	L58
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L62
	movl	$297, 8(%esp)
	movl	$LC2, 4(%esp)
	movl	$LC4, (%esp)
	call	__assert
L58:
	movl	$_ectx_default_sentinel, (%esp)
	call	_parse_expr
	movl	%eax, -20(%ebp)
	movl	$LC5, (%esp)
	call	_warn
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_return_node
	movl	%eax, -12(%ebp)
	jmp	L61
L62:
	nop
L61:
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_vector_append
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE46:
	.section .rdata,"dr"
LC6:
	.ascii "tok->type == TYSYMBOL\0"
LC7:
	.ascii "local reassignment\0"
	.align 4
LC8:
	.ascii "Unexpected behavior, node_type: %s\0"
	.text
	.def	_parse_local_decl_reassignment;	.scl	3;	.type	32;	.endef
_parse_local_decl_reassignment:
LFB47:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	call	_get_token
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$7, %eax
	je	L64
	movl	$315, 8(%esp)
	movl	$LC2, 4(%esp)
	movl	$LC6, (%esp)
	call	__assert
L64:
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$514, %eax
	je	L70
	cmpl	$544, %eax
	jne	L69
	movl	$LC7, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_parse_assignment_tail
	movl	%eax, -16(%ebp)
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_vector_append
	jmp	L68
L69:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_ty2s
	movl	%eax, 4(%esp)
	movl	$LC8, (%esp)
	call	_log_error
	jmp	L68
L70:
	nop
L68:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE47:
	.section .rdata,"dr"
	.align 4
LC9:
	.ascii "peek->type == TYSYMBOL && peek->id == OP_CPAREN\0"
LC10:
	.ascii "expected identifier here\0"
	.text
	.def	_parse_param_types;	.scl	3;	.type	32;	.endef
_parse_param_types:
LFB48:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	call	_make_vector
	movl	%eax, -16(%ebp)
	movl	$0, -12(%ebp)
L80:
	call	_get_token
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$7, %eax
	jne	L72
	movl	-20(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$515, %eax
	je	L82
L72:
	movl	-20(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	je	L74
	movl	-20(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$5, %eax
	jne	L80
L74:
	call	_parse_fparam_type
	movl	%eax, -24(%ebp)
	call	_get_token
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	jne	L76
	movl	-20(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -28(%ebp)
	movl	-24(%ebp), %eax
	movl	4(%eax), %eax
	addl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_iden_node
	movl	%eax, -32(%ebp)
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_assert_lvar_doesnt_exist
	movl	-32(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_define_lvar
	movl	-32(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_append
	call	_peek_next_token
	movl	%eax, -36(%ebp)
	movl	-36(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$7, %eax
	jne	L77
	movl	-36(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$533, %eax
	jne	L77
	call	_skip_token
	jmp	L75
L77:
	movl	-36(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$7, %eax
	jne	L78
	movl	-36(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$515, %eax
	je	L79
L78:
	movl	$363, 8(%esp)
	movl	$LC2, 4(%esp)
	movl	$LC9, (%esp)
	call	__assert
L79:
	call	_skip_token
	jmp	L73
L76:
	movl	$LC10, (%esp)
	call	_log_error
L75:
	jmp	L80
L82:
	nop
L73:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	%eax, 8(%ebp)
	movl	-16(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE48:
	.section .rdata,"dr"
LC11:
	.ascii "peek->id == OP_CPAREN\0"
LC12:
	.ascii "get_token()->id == OP_CPAREN\0"
	.text
	.def	_parse_function_call;	.scl	3;	.type	32;	.endef
_parse_function_call:
LFB49:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$0, (%esp)
	call	_peek_token
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$7, %eax
	jne	L84
	movl	-20(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$514, %eax
	jne	L84
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_assert_gvar_exists
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_get_gvar
	movl	%eax, -24(%ebp)
	call	_make_vector
	movl	%eax, -28(%ebp)
	call	_get_token
	movl	-24(%ebp), %eax
	movl	28(%eax), %eax
	movl	(%eax), %eax
	movl	%eax, -32(%ebp)
	cmpl	$0, -32(%ebp)
	je	L85
	movl	$0, -16(%ebp)
	jmp	L86
L87:
	movl	$_ectx_farg_sentinel, (%esp)
	call	_parse_expr
	movl	%eax, -36(%ebp)
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_append
	addl	$1, -16(%ebp)
L86:
	movl	-16(%ebp), %eax
	cmpl	-32(%ebp), %eax
	jl	L87
	movl	$-1, (%esp)
	call	_peek_token
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$515, %eax
	je	L84
	movl	$395, 8(%esp)
	movl	$LC2, 4(%esp)
	movl	$LC11, (%esp)
	call	__assert
L85:
	movl	-28(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_function_call_node
	movl	%eax, -12(%ebp)
	call	_get_token
	movl	8(%eax), %eax
	cmpl	$515, %eax
	je	L84
	movl	$399, 8(%esp)
	movl	$LC2, 4(%esp)
	movl	$LC12, (%esp)
	call	__assert
L84:
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE49:
	.section .rdata,"dr"
LC13:
	.ascii "tident(tok)\0"
	.text
	.def	_parse_pre_inc_or_dec;	.scl	3;	.type	32;	.endef
_parse_pre_inc_or_dec:
LFB50:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	call	_get_token
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_tident
	testl	%eax, %eax
	jne	L90
	movl	$411, 8(%esp)
	movl	$LC2, 4(%esp)
	movl	$LC13, (%esp)
	call	__assert
L90:
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_assert_lvar_exists
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_get_lvar
	movl	%eax, -16(%ebp)
	cmpl	$512, 8(%ebp)
	jne	L91
	movl	$573, %eax
	jmp	L92
L91:
	movl	$574, %eax
L92:
	movl	%eax, -20(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_unop_node
	movl	%eax, -24(%ebp)
	movl	-24(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE50:
	.def	_get_iden;	.scl	3;	.type	32;	.endef
_get_iden:
LFB51:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_lvar_exists
	testl	%eax, %eax
	je	L95
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_get_lvar
	movl	%eax, -12(%ebp)
	jmp	L96
L95:
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_iden_node
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_define_lvar
L96:
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE51:
	.section .rdata,"dr"
	.align 4
LC14:
	.ascii "Assignment node (%s) created: \12LHS = %sRHS = %s\0"
	.text
	.def	_parse_assignment_tail;	.scl	3;	.type	32;	.endef
_parse_assignment_tail:
LFB52:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	movl	$_ectx_default_sentinel, (%esp)
	call	_parse_expr
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_assign_node
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_node2s
	movl	%eax, %ebx
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_node2s
	movl	%ebx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC14, (%esp)
	call	_log_debug
	movl	-16(%ebp), %eax
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE52:
	.section .rdata,"dr"
LC15:
	.ascii "local\0"
	.text
	.def	_parse_local_decl_assignment;	.scl	3;	.type	32;	.endef
_parse_local_decl_assignment:
LFB53:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_get_iden
	movl	$LC15, 4(%esp)
	movl	%eax, (%esp)
	call	_parse_assignment_tail
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE53:
	.section .rdata,"dr"
LC16:
	.ascii "global\0"
	.text
	.def	_parse_global_decl_assignment;	.scl	3;	.type	32;	.endef
_parse_global_decl_assignment:
LFB54:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_assert_gvar_doesnt_exist
	movl	$0, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_iden_node
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_define_gvar
	movl	$LC16, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_parse_assignment_tail
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE54:
	.def	_declare_identifier;	.scl	3;	.type	32;	.endef
_declare_identifier:
LFB55:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_iden_node
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_define_lvar
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE55:
	.section .rdata,"dr"
LC17:
	.ascii "iden->type == TYIDENT\0"
	.align 4
LC18:
	.ascii "Incomplete identifier declaration list\0"
	.text
	.def	_parse_local_decl;	.scl	3;	.type	32;	.endef
_parse_local_decl:
LFB56:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	call	_unwind_token_pos
	call	_parse_local_decl_type
	movl	%eax, -12(%ebp)
	call	_get_token
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	je	L106
	movl	$470, 8(%esp)
	movl	$LC2, 4(%esp)
	movl	$LC17, (%esp)
	call	__assert
L106:
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	call	_get_token
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_tsymbol
	testl	%eax, %eax
	je	L107
	movl	-20(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$533, %eax
	je	L108
	cmpl	$544, %eax
	je	L109
	cmpl	$523, %eax
	je	L110
	jmp	L107
L109:
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -24(%ebp)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, 8(%esp)
	movl	-24(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_parse_local_decl_assignment
	movl	%eax, -28(%ebp)
	movl	-28(%ebp), %eax
	jmp	L105
L110:
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	movl	8(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_declare_identifier
	movl	$0, %eax
	jmp	L105
L108:
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	movl	8(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_declare_identifier
L117:
	call	_get_token
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	je	L112
	movl	$491, 8(%esp)
	movl	$LC2, 4(%esp)
	movl	$LC17, (%esp)
	call	__assert
L112:
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	call	_get_token
	movl	%eax, -20(%ebp)
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	movl	8(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_declare_identifier
	movl	-20(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$7, %eax
	jne	L113
	movl	-20(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$533, %eax
	je	L119
	movl	-20(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$523, %eax
	je	L120
L113:
	movl	$LC18, (%esp)
	call	_log_error
	jmp	L117
L119:
	nop
	jmp	L117
L120:
	nop
	movl	$0, %eax
	jmp	L105
L107:
L105:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE56:
	.def	_parse_while_stmt;	.scl	3;	.type	32;	.endef
_parse_while_stmt:
LFB57:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -24(%ebp)
	movl	$514, (%esp)
	call	_expect
	movl	$_ectx_enclosed_cond_sentinel, (%esp)
	call	_parse_expr
	movl	%eax, -12(%ebp)
	movl	$515, (%esp)
	call	_expect
	movl	$526, (%esp)
	call	_expect
	leal	-24(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	call	_parse_block
	movl	%eax, -16(%ebp)
	movl	$527, (%esp)
	call	_expect
	call	_make_stub_node
	movl	%eax, -20(%ebp)
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	-20(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_vector_append
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE57:
	.def	_parse_for_stmt;	.scl	3;	.type	32;	.endef
_parse_for_stmt:
LFB58:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -20(%ebp)
	movl	$514, (%esp)
	call	_expect
	movl	$523, (%esp)
	call	_expect
	movl	$523, (%esp)
	call	_expect
	movl	$515, (%esp)
	call	_expect
	movl	$526, (%esp)
	call	_expect
	leal	-20(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	call	_parse_block
	movl	%eax, -12(%ebp)
	movl	$527, (%esp)
	call	_expect
	call	_make_stub_node
	movl	%eax, -16(%ebp)
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_vector_append
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE58:
	.def	_parse_if_stmt;	.scl	3;	.type	32;	.endef
_parse_if_stmt:
LFB59:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$0, -28(%ebp)
	movl	$514, (%esp)
	call	_expect
	movl	$_ectx_enclosed_cond_sentinel, (%esp)
	call	_parse_expr
	movl	%eax, -12(%ebp)
	call	_peek_next_token
	movl	%eax, -16(%ebp)
	leal	-28(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	call	_parse_block
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_if_node
	movl	%eax, -24(%ebp)
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	-24(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_vector_append
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE59:
	.section .rdata,"dr"
LC19:
	.ascii "curr->id == OP_OBRACE\0"
	.align 4
LC20:
	.ascii "Unexpected symbol at beginning of statement: %s\0"
	.text
	.def	_parse_block;	.scl	3;	.type	32;	.endef
_parse_block:
LFB60:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	call	_make_vector
	movl	%eax, -32(%ebp)
	call	_get_token
	movl	%eax, -12(%ebp)
	movl	$0, -36(%ebp)
	cmpl	$0, 8(%ebp)
	je	L125
	call	_push_localenv
L125:
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$526, %eax
	je	L126
	movl	$569, 8(%esp)
	movl	$LC2, 4(%esp)
	movl	$LC19, (%esp)
	call	__assert
L126:
	call	_get_token
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -16(%ebp)
	cmpl	$1, -16(%ebp)
	je	L149
	cmpl	$7, -16(%ebp)
	jne	L129
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$527, %eax
	je	L150
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	subl	$512, %eax
	cmpl	$1, %eax
	ja	L132
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_parse_pre_inc_or_dec
	movl	%eax, -28(%ebp)
	movl	$523, (%esp)
	call	_expect
	movl	-32(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_vector_append
	nop
	jmp	L128
L132:
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_op2s
	movl	%eax, 4(%esp)
	movl	$LC20, (%esp)
	call	_log_error
	jmp	L128
L129:
	cmpl	$5, -16(%ebp)
	jne	L135
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	subl	$13, %eax
	cmpl	$19, %eax
	ja	L151
	movl	L138(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L138:
	.long	L137
	.long	L151
	.long	L139
	.long	L151
	.long	L151
	.long	L151
	.long	L140
	.long	L151
	.long	L151
	.long	L151
	.long	L151
	.long	L151
	.long	L151
	.long	L151
	.long	L151
	.long	L151
	.long	L151
	.long	L151
	.long	L141
	.long	L142
	.text
L142:
	movl	$514, (%esp)
	call	_expect
	call	_get_token
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_get_lvar
	movl	%eax, (%esp)
	call	_make_print_ident_node
	movl	%eax, %edx
	movl	-32(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_vector_append
	movl	$515, (%esp)
	call	_expect
	movl	$523, (%esp)
	call	_expect
	jmp	L143
L140:
	leal	-32(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_parse_return_stmt
	jmp	L143
L139:
	leal	-32(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_parse_if_stmt
	jmp	L143
L141:
	leal	-32(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_parse_while_stmt
	jmp	L143
L137:
	leal	-32(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_parse_for_stmt
	nop
L143:
	jmp	L128
L135:
	cmpl	$4, -16(%ebp)
	jne	L144
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_get_lvar
	movl	%eax, -20(%ebp)
	cmpl	$0, -20(%ebp)
	je	L145
	leal	-32(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_parse_local_decl_reassignment
	jmp	L128
L145:
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_assert_type_exists
	call	_unwind_token_pos
	jmp	L144
L151:
	nop
L144:
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_parse_local_decl
	movl	%eax, -24(%ebp)
	cmpl	$0, -24(%ebp)
	je	L126
	movl	-32(%ebp), %eax
	movl	-24(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_vector_append
	jmp	L126
L149:
	nop
L128:
	jmp	L126
L150:
	nop
	movl	16(%ebp), %eax
	movl	(%eax), %edx
	movl	-36(%ebp), %eax
	addl	%eax, %edx
	movl	16(%ebp), %eax
	movl	%edx, (%eax)
	cmpl	$0, 8(%ebp)
	je	L146
	call	_pop_localenv
L146:
	movl	-32(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE60:
	.section .rdata,"dr"
LC21:
	.ascii "def->f_block == NULL\0"
	.text
	.def	_parse_function_def;	.scl	3;	.type	32;	.endef
_parse_function_def:
LFB61:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	16(%ebp), %eax
	movl	%eax, (%esp)
	call	_get_gvar
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	L153
	movl	8(%ebp), %eax
	movl	24(%ebp), %edx
	movl	%edx, 16(%esp)
	movl	20(%ebp), %edx
	movl	%edx, 12(%esp)
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_make_function_decl_node
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	16(%ebp), %eax
	movl	%eax, (%esp)
	call	_define_gvar
	jmp	L154
L153:
	movl	-12(%ebp), %eax
	movl	32(%eax), %eax
	testl	%eax, %eax
	je	L155
	movl	$659, 8(%esp)
	movl	$LC2, 4(%esp)
	movl	$LC21, (%esp)
	call	__assert
L155:
	movl	24(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fill_function_decl
L154:
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE61:
	.section .rdata,"dr"
	.align 4
LC22:
	.ascii "Found declaration for function %s.\0"
	.text
	.def	_parse_function_decl;	.scl	3;	.type	32;	.endef
_parse_function_decl:
LFB62:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	16(%ebp), %eax
	movl	%eax, (%esp)
	call	_assert_gvar_doesnt_exist
	movl	8(%ebp), %eax
	movl	$0, 16(%esp)
	movl	20(%ebp), %edx
	movl	%edx, 12(%esp)
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_make_function_decl_node
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	16(%ebp), %eax
	movl	%eax, (%esp)
	call	_define_gvar
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC22, (%esp)
	call	_log_debug
	call	_skip_token
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE62:
	.section .rdata,"dr"
LC23:
	.ascii "peek->type == TYSYMBOL\0"
	.align 4
LC24:
	.ascii "Unexpected token %s after function parameters.\0"
	.text
	.def	_parse_function;	.scl	3;	.type	32;	.endef
_parse_function:
LFB63:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
	call	_push_localenv
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -28(%ebp)
	leal	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_parse_param_types
	movl	%eax, -16(%ebp)
	call	_peek_next_token
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$7, %eax
	je	L160
	movl	$691, 8(%esp)
	movl	$LC2, 4(%esp)
	movl	$LC23, (%esp)
	call	__assert
L160:
	movl	-20(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$523, %eax
	je	L162
	cmpl	$526, %eax
	jne	L166
	leal	-28(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$0, (%esp)
	call	_parse_block
	movl	%eax, -24(%ebp)
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %edx
	movl	%edx, 16(%esp)
	movl	-16(%ebp), %edx
	movl	%edx, 12(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	8(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_parse_function_def
	movl	%eax, -12(%ebp)
	jmp	L164
L162:
	movl	-28(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	%edx, 12(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	8(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_parse_function_decl
	movl	%eax, -12(%ebp)
	jmp	L164
L166:
	movl	-20(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_op2s
	movl	%eax, 4(%esp)
	movl	$LC24, (%esp)
	call	_log_error
L164:
	call	_pop_localenv
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE63:
	.section .rdata,"dr"
	.align 4
LC25:
	.ascii "Expected valid symbol after identifier in global namespace, got %s.\0"
	.text
	.def	_parse_global_decl;	.scl	3;	.type	32;	.endef
_parse_global_decl:
LFB64:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	je	L168
	movl	$715, 8(%esp)
	movl	$LC2, 4(%esp)
	movl	$LC17, (%esp)
	call	__assert
L168:
	call	_get_token
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_tsymbol
	testl	%eax, %eax
	je	L169
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$514, %eax
	je	L171
	cmpl	$544, %eax
	je	L172
	jmp	L170
L171:
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_parse_function
	movl	%eax, -12(%ebp)
	jmp	L170
L172:
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_parse_global_decl_assignment
	movl	%eax, -12(%ebp)
	nop
L170:
	movl	-12(%ebp), %eax
	jmp	L173
L169:
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_ty2s
	movl	%eax, 4(%esp)
	movl	$LC25, (%esp)
	call	_log_error
	movl	$0, %eax
L173:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE64:
	.def	___moddi3;	.scl	2;	.type	32;	.endef
	.def	___divdi3;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 4
LC26:
	.ascii "Failed to fold constants: invalid operator %s\0"
	.text
	.def	_fold_constants;	.scl	3;	.type	32;	.endef
_fold_constants:
LFB65:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$92, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	12(%ebp), %eax
	movl	28(%eax), %edx
	movl	24(%eax), %eax
	movl	%eax, -40(%ebp)
	movl	%edx, -36(%ebp)
	movl	8(%ebp), %eax
	movl	28(%eax), %edx
	movl	24(%eax), %eax
	movl	%eax, -48(%ebp)
	movl	%edx, -44(%ebp)
	movl	16(%ebp), %eax
	movl	8(%eax), %eax
	subl	$546, %eax
	cmpl	$17, %eax
	ja	L175
	movl	L177(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L177:
	.long	L176
	.long	L178
	.long	L179
	.long	L180
	.long	L181
	.long	L182
	.long	L183
	.long	L184
	.long	L185
	.long	L186
	.long	L187
	.long	L188
	.long	L189
	.long	L190
	.long	L191
	.long	L192
	.long	L193
	.long	L194
	.text
L176:
	movl	-48(%ebp), %eax
	xorb	$0, %ah
	movl	%eax, -64(%ebp)
	movl	-44(%ebp), %eax
	xorb	$0, %ah
	movl	%eax, -60(%ebp)
	movl	-64(%ebp), %ebx
	movl	-60(%ebp), %esi
	movl	%esi, %eax
	orl	%ebx, %eax
	testl	%eax, %eax
	jne	L195
	movl	-40(%ebp), %eax
	xorb	$0, %ah
	movl	%eax, -72(%ebp)
	movl	-36(%ebp), %eax
	xorb	$0, %ah
	movl	%eax, -68(%ebp)
	movl	-72(%ebp), %edx
	movl	-68(%ebp), %ecx
	movl	%ecx, %eax
	orl	%edx, %eax
	testl	%eax, %eax
	je	L196
L195:
	movl	$1, %eax
	jmp	L197
L196:
	movl	$0, %eax
L197:
	cltd
	movl	%eax, -32(%ebp)
	movl	%edx, -28(%ebp)
	jmp	L198
L178:
	movl	-48(%ebp), %eax
	xorb	$0, %ah
	movl	%eax, -80(%ebp)
	movl	-44(%ebp), %eax
	xorb	$0, %ah
	movl	%eax, -76(%ebp)
	movl	-80(%ebp), %ebx
	movl	-76(%ebp), %esi
	movl	%esi, %eax
	orl	%ebx, %eax
	testl	%eax, %eax
	je	L199
	movl	-40(%ebp), %eax
	xorb	$0, %ah
	movl	%eax, -88(%ebp)
	movl	-36(%ebp), %eax
	xorb	$0, %ah
	movl	%eax, -84(%ebp)
	movl	-88(%ebp), %edx
	movl	-84(%ebp), %ecx
	movl	%ecx, %eax
	orl	%edx, %eax
	testl	%eax, %eax
	je	L199
	movl	$1, %eax
	jmp	L200
L199:
	movl	$0, %eax
L200:
	cltd
	movl	%eax, -32(%ebp)
	movl	%edx, -28(%ebp)
	jmp	L198
L179:
	movl	-48(%ebp), %eax
	orl	-40(%ebp), %eax
	movl	%eax, -32(%ebp)
	movl	-44(%ebp), %eax
	orl	-36(%ebp), %eax
	movl	%eax, -28(%ebp)
	jmp	L198
L180:
	movl	-48(%ebp), %eax
	xorl	-40(%ebp), %eax
	movl	%eax, -32(%ebp)
	movl	-44(%ebp), %eax
	xorl	-36(%ebp), %eax
	movl	%eax, -28(%ebp)
	jmp	L198
L181:
	movl	-48(%ebp), %eax
	andl	-40(%ebp), %eax
	movl	%eax, -32(%ebp)
	movl	-44(%ebp), %eax
	andl	-36(%ebp), %eax
	movl	%eax, -28(%ebp)
	jmp	L198
L182:
	movl	-48(%ebp), %eax
	xorl	-40(%ebp), %eax
	movl	%eax, %esi
	movl	-44(%ebp), %eax
	xorl	-36(%ebp), %eax
	movl	%eax, %edi
	movl	%esi, %eax
	orl	%edi, %eax
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	movl	%eax, -32(%ebp)
	movl	$0, -28(%ebp)
	jmp	L198
L183:
	movl	-48(%ebp), %eax
	xorl	-40(%ebp), %eax
	movl	%eax, %ecx
	movl	-44(%ebp), %eax
	xorl	-36(%ebp), %eax
	movl	%eax, %ebx
	movl	%ecx, %eax
	orl	%ebx, %eax
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, -32(%ebp)
	movl	$0, -28(%ebp)
	jmp	L198
L184:
	movl	$1, %ecx
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %edx
	cmpl	-36(%ebp), %edx
	jg	L201
	cmpl	-36(%ebp), %edx
	jl	L202
	cmpl	-40(%ebp), %eax
	jnb	L201
L202:
	movl	$0, %ecx
L201:
	movzbl	%cl, %eax
	movl	%eax, -32(%ebp)
	movl	$0, -28(%ebp)
	jmp	L198
L185:
	movl	$1, %ecx
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %edx
	cmpl	-36(%ebp), %edx
	jg	L203
	cmpl	-36(%ebp), %edx
	jl	L204
	cmpl	-40(%ebp), %eax
	ja	L203
L204:
	movl	$0, %ecx
L203:
	movzbl	%cl, %eax
	movl	%eax, -32(%ebp)
	movl	$0, -28(%ebp)
	jmp	L198
L186:
	movl	$1, %ecx
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %edx
	cmpl	-36(%ebp), %edx
	jl	L205
	cmpl	-36(%ebp), %edx
	jg	L206
	cmpl	-40(%ebp), %eax
	jbe	L205
L206:
	movl	$0, %ecx
L205:
	movzbl	%cl, %eax
	movl	%eax, -32(%ebp)
	movl	$0, -28(%ebp)
	jmp	L198
L187:
	movl	$1, %ecx
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %edx
	cmpl	-36(%ebp), %edx
	jl	L207
	cmpl	-36(%ebp), %edx
	jg	L208
	cmpl	-40(%ebp), %eax
	jb	L207
L208:
	movl	$0, %ecx
L207:
	movzbl	%cl, %eax
	movl	%eax, -32(%ebp)
	movl	$0, -28(%ebp)
	jmp	L198
L188:
	movl	-40(%ebp), %ecx
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %edx
	shrdl	%cl, %edx, %eax
	sarl	%cl, %edx
	testb	$32, %cl
	je	L211
	movl	%edx, %eax
	sarl	$31, %edx
L211:
	movl	%eax, -32(%ebp)
	movl	%edx, -28(%ebp)
	jmp	L198
L189:
	movl	-40(%ebp), %ecx
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %edx
	shldl	%cl, %eax, %edx
	sall	%cl, %eax
	testb	$32, %cl
	je	L210
	movl	%eax, %edx
	xorl	%eax, %eax
L210:
	movl	%eax, -32(%ebp)
	movl	%edx, -28(%ebp)
	jmp	L198
L190:
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %edx
	subl	-40(%ebp), %eax
	sbbl	-36(%ebp), %edx
	movl	%eax, -32(%ebp)
	movl	%edx, -28(%ebp)
	jmp	L198
L191:
	movl	-48(%ebp), %ecx
	movl	-44(%ebp), %ebx
	movl	-40(%ebp), %eax
	movl	-36(%ebp), %edx
	addl	%ecx, %eax
	adcl	%ebx, %edx
	movl	%eax, -32(%ebp)
	movl	%edx, -28(%ebp)
	jmp	L198
L192:
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %edx
	movl	-40(%ebp), %ecx
	movl	-36(%ebp), %ebx
	movl	%ecx, 8(%esp)
	movl	%ebx, 12(%esp)
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	___moddi3
	movl	%eax, -32(%ebp)
	movl	%edx, -28(%ebp)
	jmp	L198
L193:
	movl	-40(%ebp), %eax
	movl	-36(%ebp), %edx
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	___divdi3
	movl	%eax, -32(%ebp)
	movl	%edx, -28(%ebp)
	jmp	L198
L194:
	movl	-44(%ebp), %eax
	imull	-40(%ebp), %eax
	movl	%eax, %edx
	movl	-36(%ebp), %eax
	imull	-48(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	-40(%ebp), %eax
	mull	-48(%ebp)
	addl	%edx, %ecx
	movl	%ecx, %edx
	movl	%eax, -32(%ebp)
	movl	%edx, -28(%ebp)
	movl	%eax, -32(%ebp)
	movl	%edx, -28(%ebp)
	jmp	L198
L175:
	movl	16(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_op2s
	movl	%eax, 4(%esp)
	movl	$LC26, (%esp)
	call	_log_error
L198:
	movl	-32(%ebp), %eax
	movl	-28(%ebp), %edx
	addl	$92, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE65:
	.section .rdata,"dr"
	.align 4
LC27:
	.ascii "vector_length(operand_stack) > 0\0"
	.align 4
LC28:
	.ascii "vector_length(operand_stack) > 1\0"
	.text
	.def	_pop_and_link_tree;	.scl	3;	.type	32;	.endef
_pop_and_link_tree:
LFB66:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$104, %esp
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_unary_op
	testl	%eax, %eax
	je	L213
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_length
	testl	%eax, %eax
	jne	L214
	movl	$770, 8(%esp)
	movl	$LC2, 4(%esp)
	movl	$LC27, (%esp)
	call	__assert
L214:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_pop
	movl	%eax, -12(%ebp)
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_make_unop_node
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_append
	jmp	L212
L213:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_length
	cmpl	$1, %eax
	ja	L216
	movl	$777, 8(%esp)
	movl	$LC2, 4(%esp)
	movl	$LC28, (%esp)
	call	__assert
L216:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_pop
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_pop
	movl	%eax, -16(%ebp)
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_make_binop_node
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_append
L212:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE66:
	.def	_ectx_default_sentinel;	.scl	3;	.type	32;	.endef
_ectx_default_sentinel:
LFB67:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$523, %eax
	sete	%al
	movzbl	%al, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE67:
	.def	_ectx_index_sentinel;	.scl	3;	.type	32;	.endef
_ectx_index_sentinel:
LFB68:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$525, %eax
	sete	%al
	movzbl	%al, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE68:
	.def	_ectx_farg_sentinel;	.scl	3;	.type	32;	.endef
_ectx_farg_sentinel:
LFB69:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$533, %eax
	je	L222
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$515, %eax
	jne	L223
L222:
	movl	$1, %eax
	jmp	L224
L223:
	movl	$0, %eax
L224:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE69:
	.def	_ectx_enclosed_cond_sentinel;	.scl	3;	.type	32;	.endef
_ectx_enclosed_cond_sentinel:
LFB70:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$515, %eax
	sete	%al
	movzbl	%al, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE70:
	.section .rdata,"dr"
LC29:
	.ascii "parse_expr returned null\0"
LC30:
	.ascii "Expression output as: \0"
	.text
	.def	_parse_expr;	.scl	3;	.type	32;	.endef
_parse_expr:
LFB71:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$88, %esp
	call	_make_vector
	movl	%eax, -16(%ebp)
	call	_make_vector
	movl	%eax, -20(%ebp)
	movl	$0, -24(%ebp)
	movl	$0, -12(%ebp)
L249:
	call	_get_token
	movl	%eax, -28(%ebp)
	movl	-28(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$7, %eax
	jne	L229
	cmpl	$0, -24(%ebp)
	jne	L230
	cmpl	$0, -12(%ebp)
	jne	L230
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	movl	8(%ebp), %eax
	call	*%eax
	testl	%eax, %eax
	jne	L257
L230:
	movl	-28(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$515, %eax
	je	L233
	cmpl	$524, %eax
	je	L234
	cmpl	$514, %eax
	je	L235
	jmp	L255
L234:
	movl	$_ectx_index_sentinel, (%esp)
	call	_parse_expr
	movl	%eax, -44(%ebp)
	jmp	L236
L235:
	call	_peek_next_token
	movl	%eax, -32(%ebp)
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	_is_valid_type
	addl	$1, -12(%ebp)
	movl	-28(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_append
	jmp	L236
L233:
	subl	$1, -12(%ebp)
	jmp	L237
L240:
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_pop
	movl	%eax, -48(%ebp)
	movl	-48(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$514, %eax
	je	L258
	movl	-48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_pop_and_link_tree
L237:
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_empty
	testl	%eax, %eax
	je	L240
	jmp	L236
L258:
	nop
	jmp	L236
L255:
	movl	-28(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$516, %eax
	jne	L243
	call	_peek_next_token
	movl	%eax, -32(%ebp)
	call	_peek_last_token
	movl	%eax, -52(%ebp)
	movl	-32(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	jne	L242
	movl	-52(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$7, %eax
	jne	L242
	movl	-52(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_binary_op
	testl	%eax, %eax
	jne	L242
	movl	-32(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_assert_lvar_exists
	movl	-28(%ebp), %eax
	movl	$567, 8(%eax)
	jmp	L241
L242:
	movl	-28(%ebp), %eax
	movl	$563, 8(%eax)
L241:
	jmp	L243
L247:
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_top
	movl	%eax, -56(%ebp)
	movl	-56(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -60(%ebp)
	movl	-28(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -64(%ebp)
	movl	-60(%ebp), %eax
	cmpl	-64(%ebp), %eax
	ja	L244
	movl	-60(%ebp), %eax
	cmpl	-64(%ebp), %eax
	jne	L259
	movl	-60(%ebp), %eax
	movl	%eax, (%esp)
	call	_left_associative
	testl	%eax, %eax
	je	L259
L244:
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_pop
	movl	-56(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_pop_and_link_tree
	nop
L243:
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_empty
	testl	%eax, %eax
	je	L247
	jmp	L246
L259:
	nop
L246:
	movl	-28(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_append
	jmp	L249
L229:
	movl	-28(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	jne	L248
	call	_peek_next_token
	movl	%eax, -32(%ebp)
	movl	-32(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$7, %eax
	jne	L248
	movl	-32(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$514, %eax
	jne	L248
	movl	-28(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_parse_function_call
	movl	%eax, -36(%ebp)
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_append
	jmp	L236
L248:
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token_node
	movl	%eax, -40(%ebp)
	movl	-40(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_append
L236:
	jmp	L249
L257:
	nop
	jmp	L250
L251:
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_pop
	movl	%eax, -48(%ebp)
	movl	-48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_pop_and_link_tree
L250:
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_empty
	testl	%eax, %eax
	je	L251
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_empty
	testl	%eax, %eax
	je	L252
	movl	$LC29, (%esp)
	call	_log_warning
	movl	$0, %eax
	jmp	L253
L252:
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_pop
	movl	%eax, -68(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_free
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_free
	movl	$LC30, (%esp)
	call	_printf
	movl	-68(%ebp), %eax
	movl	%eax, (%esp)
	call	_print_expr
	movl	$10, (%esp)
	call	_putchar
	movl	-68(%ebp), %eax
L253:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE71:
	.def	_parse_sizeof;	.scl	3;	.type	32;	.endef
_parse_sizeof:
LFB72:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	nop
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE72:
	.def	_get_fixed_offset;	.scl	3;	.type	32;	.endef
_get_fixed_offset:
LFB73:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	_offset.33450, %eax
	addl	$4, %eax
	movl	%eax, _offset.33450
	movl	_offset.33450, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE73:
	.globl	_print_nodes
	.def	_print_nodes;	.scl	2;	.type	32;	.endef
_print_nodes:
LFB74:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L264
L265:
	movl	_toplevel, %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_vector_get
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_print_node
	addl	$1, -12(%ebp)
L264:
	movl	_toplevel, %eax
	movl	(%eax), %eax
	cmpl	-12(%ebp), %eax
	ja	L265
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE74:
	.section .rdata,"dr"
LC31:
	.ascii "%s \0"
LC32:
	.ascii "%lld \0"
	.text
	.globl	_print_expr
	.def	_print_expr;	.scl	2;	.type	32;	.endef
_print_expr:
LFB75:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	cmpl	$3, %eax
	je	L268
	cmpl	$3, %eax
	ja	L269
	cmpl	$2, %eax
	je	L270
	jmp	L267
L269:
	cmpl	$4, %eax
	je	L271
	cmpl	$5, %eax
	jne	L267
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_op2s
	movl	%eax, 4(%esp)
	movl	$LC31, (%esp)
	call	_printf
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, (%esp)
	call	_print_expr
	jmp	L273
L271:
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, (%esp)
	call	_print_expr
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_op2s
	movl	%eax, 4(%esp)
	movl	$LC31, (%esp)
	call	_printf
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, (%esp)
	call	_print_expr
	jmp	L273
L268:
	movl	8(%ebp), %eax
	movl	28(%eax), %edx
	movl	24(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	movl	$LC32, (%esp)
	call	_printf
	jmp	L273
L270:
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC31, (%esp)
	call	_printf
	jmp	L273
L267:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_node2s
	movl	%eax, 4(%esp)
	movl	$LC31, (%esp)
	call	_printf
	nop
L273:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE75:
	.section .rdata,"dr"
LC33:
	.ascii "%s\0"
	.text
	.globl	_print_node
	.def	_print_node;	.scl	2;	.type	32;	.endef
_print_node:
LFB76:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_node2s
	movl	%eax, 4(%esp)
	movl	$LC33, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE76:
	.section .rdata,"dr"
	.align 4
LC34:
	.ascii "missplaced token in global scope:\0"
	.text
	.globl	_make_ast
	.def	_make_ast;	.scl	2;	.type	32;	.endef
_make_ast:
LFB77:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	call	_get_current_module
	movl	%eax, -12(%ebp)
	call	_make_vector
	movl	%eax, _toplevel
	jmp	L276
L279:
	call	_get_token
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	je	L277
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$5, %eax
	jne	L278
L277:
	call	_unwind_token_pos
	call	_parse_global_decl_type
	movl	%eax, -20(%ebp)
	call	_get_token
	movl	%eax, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_parse_global_decl
	movl	%eax, -24(%ebp)
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	_ast_link_toplevel
	jmp	L276
L278:
	movl	$LC34, (%esp)
	call	_log_warning
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_print_token
L276:
	call	_tokens_left
	testl	%eax, %eax
	jne	L279
	movl	_toplevel, %edx
	movl	-12(%ebp), %eax
	movl	%edx, 20(%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE77:
.lcomm _tmp_number.33070,4,4
.lcomm _offset.33450,4,4
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_make_fmt_string;	.scl	2;	.type	32;	.endef
	.def	_string_body;	.scl	2;	.type	32;	.endef
	.def	_string_free;	.scl	2;	.type	32;	.endef
	.def	_strlen;	.scl	2;	.type	32;	.endef
	.def	_get_number_type;	.scl	2;	.type	32;	.endef
	.def	_strtol;	.scl	2;	.type	32;	.endef
	.def	_make_string;	.scl	2;	.type	32;	.endef
	.def	_get_function_block_label;	.scl	2;	.type	32;	.endef
	.def	_get_function_entry_label;	.scl	2;	.type	32;	.endef
	.def	_get_generic_label;	.scl	2;	.type	32;	.endef
	.def	__assert;	.scl	2;	.type	32;	.endef
	.def	_assert_lvar_exists;	.scl	2;	.type	32;	.endef
	.def	_get_lvar;	.scl	2;	.type	32;	.endef
	.def	_vector_append;	.scl	2;	.type	32;	.endef
	.def	_peek_next_token;	.scl	2;	.type	32;	.endef
	.def	_warn;	.scl	2;	.type	32;	.endef
	.def	_get_token;	.scl	2;	.type	32;	.endef
	.def	_ty2s;	.scl	2;	.type	32;	.endef
	.def	_log_error;	.scl	2;	.type	32;	.endef
	.def	_make_vector;	.scl	2;	.type	32;	.endef
	.def	_parse_fparam_type;	.scl	2;	.type	32;	.endef
	.def	_assert_lvar_doesnt_exist;	.scl	2;	.type	32;	.endef
	.def	_define_lvar;	.scl	2;	.type	32;	.endef
	.def	_skip_token;	.scl	2;	.type	32;	.endef
	.def	_peek_token;	.scl	2;	.type	32;	.endef
	.def	_assert_gvar_exists;	.scl	2;	.type	32;	.endef
	.def	_get_gvar;	.scl	2;	.type	32;	.endef
	.def	_tident;	.scl	2;	.type	32;	.endef
	.def	_lvar_exists;	.scl	2;	.type	32;	.endef
	.def	_node2s;	.scl	2;	.type	32;	.endef
	.def	_log_debug;	.scl	2;	.type	32;	.endef
	.def	_assert_gvar_doesnt_exist;	.scl	2;	.type	32;	.endef
	.def	_define_gvar;	.scl	2;	.type	32;	.endef
	.def	_unwind_token_pos;	.scl	2;	.type	32;	.endef
	.def	_parse_local_decl_type;	.scl	2;	.type	32;	.endef
	.def	_tsymbol;	.scl	2;	.type	32;	.endef
	.def	_expect;	.scl	2;	.type	32;	.endef
	.def	_push_localenv;	.scl	2;	.type	32;	.endef
	.def	_op2s;	.scl	2;	.type	32;	.endef
	.def	_assert_type_exists;	.scl	2;	.type	32;	.endef
	.def	_pop_localenv;	.scl	2;	.type	32;	.endef
	.def	_fill_function_decl;	.scl	2;	.type	32;	.endef
	.def	_unary_op;	.scl	2;	.type	32;	.endef
	.def	_vector_length;	.scl	2;	.type	32;	.endef
	.def	_vector_pop;	.scl	2;	.type	32;	.endef
	.def	_is_valid_type;	.scl	2;	.type	32;	.endef
	.def	_vector_empty;	.scl	2;	.type	32;	.endef
	.def	_peek_last_token;	.scl	2;	.type	32;	.endef
	.def	_binary_op;	.scl	2;	.type	32;	.endef
	.def	_vector_top;	.scl	2;	.type	32;	.endef
	.def	_left_associative;	.scl	2;	.type	32;	.endef
	.def	_log_warning;	.scl	2;	.type	32;	.endef
	.def	_vector_free;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_vector_get;	.scl	2;	.type	32;	.endef
	.def	_get_current_module;	.scl	2;	.type	32;	.endef
	.def	_parse_global_decl_type;	.scl	2;	.type	32;	.endef
	.def	_print_token;	.scl	2;	.type	32;	.endef
	.def	_tokens_left;	.scl	2;	.type	32;	.endef
