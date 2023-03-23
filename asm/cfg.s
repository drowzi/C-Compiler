	.file	"cfg.c"
	.comm	_quad_symbols, 4, 2
	.comm	_quad_code, 4, 2
	.text
	.globl	_make_quadcode
	.def	_make_quadcode;	.scl	2;	.type	32;	.endef
_make_quadcode:
LFB25:
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
LFE25:
	.globl	_make_entry_bb
	.def	_make_entry_bb;	.scl	2;	.type	32;	.endef
_make_entry_bb:
LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	$0, (%eax)
	movl	-12(%ebp), %eax
	movl	$0, 4(%eax)
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.globl	_make_cfg
	.def	_make_cfg;	.scl	2;	.type	32;	.endef
_make_cfg:
LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$4, (%esp)
	call	_malloc
	movl	%eax, -16(%ebp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_entry_bb
	movl	%eax, %edx
	movl	-16(%ebp), %eax
	movl	%edx, (%eax)
	movl	$0, -12(%ebp)
	jmp	L5
L6:
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_get
	movl	%eax, -24(%ebp)
	addl	$1, -12(%ebp)
L5:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_length
	cmpl	-12(%ebp), %eax
	ja	L6
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_vector_get;	.scl	2;	.type	32;	.endef
	.def	_vector_length;	.scl	2;	.type	32;	.endef
