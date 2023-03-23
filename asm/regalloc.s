	.file	"regalloc.c"
	.text
	.def	_ast_regalloc_block;	.scl	3;	.type	32;	.endef
_ast_regalloc_block:
LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$0, -20(%ebp)
	jmp	L2
L12:
	movl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_get
	movl	%eax, -24(%ebp)
	movl	-24(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -28(%ebp)
	movl	-28(%ebp), %eax
	cmpl	$6, %eax
	je	L4
	cmpl	$9, %eax
	je	L5
	testl	%eax, %eax
	jne	L3
	movl	-24(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, (%esp)
	call	_ast_regalloc_branch
	movl	%eax, -12(%ebp)
	movl	-24(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%eax)
	jmp	L3
L5:
	movl	-24(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, (%esp)
	call	_ast_regalloc_branch
	movl	%eax, -32(%ebp)
	movl	-24(%ebp), %eax
	movl	20(%eax), %eax
	movl	%eax, (%esp)
	call	_ast_regalloc_block
	movl	%eax, -36(%ebp)
	movl	-32(%ebp), %edx
	movl	-36(%ebp), %eax
	cmpl	%edx, %eax
	jnb	L7
	movl	%edx, %eax
L7:
	movl	%eax, -12(%ebp)
	movl	-32(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jne	L8
	addl	$1, -12(%ebp)
L8:
	movl	-24(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%eax)
	jmp	L3
L4:
	movl	-24(%ebp), %eax
	movl	32(%eax), %eax
	movl	%eax, (%esp)
	call	_ast_regalloc_branch
	movl	%eax, -32(%ebp)
	movl	-24(%ebp), %eax
	movl	28(%eax), %eax
	movl	%eax, (%esp)
	call	_ast_regalloc_block
	movl	%eax, -36(%ebp)
	movl	-32(%ebp), %edx
	movl	-36(%ebp), %eax
	cmpl	%edx, %eax
	jnb	L9
	movl	%edx, %eax
L9:
	movl	%eax, -12(%ebp)
	movl	-32(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jne	L10
	addl	$1, -12(%ebp)
L10:
	movl	-24(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%eax)
	nop
L3:
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	cmpl	%edx, %eax
	jnb	L11
	movl	%edx, %eax
L11:
	movl	%eax, -16(%ebp)
	addl	$1, -20(%ebp)
L2:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	-20(%ebp), %eax
	ja	L12
	movl	-16(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.def	_ast_regalloc_branch;	.scl	3;	.type	32;	.endef
_ast_regalloc_branch:
LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -16(%ebp)
	cmpl	$7, -16(%ebp)
	ja	L15
	movl	-16(%ebp), %eax
	sall	$2, %eax
	addl	$L17, %eax
	movl	(%eax), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L17:
	.long	L15
	.long	L15
	.long	L16
	.long	L18
	.long	L19
	.long	L20
	.long	L15
	.long	L15
	.text
L18:
	movl	$0, -12(%ebp)
	jmp	L15
L16:
	movl	$1, -12(%ebp)
	jmp	L15
L20:
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, (%esp)
	call	_ast_regalloc_branch
	movl	%eax, -12(%ebp)
	jmp	L15
L19:
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, (%esp)
	call	_ast_regalloc_branch
	movl	%eax, -20(%ebp)
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, (%esp)
	call	_ast_regalloc_branch
	movl	%eax, -24(%ebp)
	movl	-20(%ebp), %edx
	movl	-24(%ebp), %eax
	cmpl	%edx, %eax
	jnb	L22
	movl	%edx, %eax
L22:
	movl	%eax, -12(%ebp)
	movl	-20(%ebp), %eax
	cmpl	-24(%ebp), %eax
	jne	L25
	addl	$1, -12(%ebp)
L25:
	nop
L15:
	movl	8(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.globl	_ast_regalloc
	.def	_ast_regalloc;	.scl	2;	.type	32;	.endef
_ast_regalloc:
LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$0, -16(%ebp)
	jmp	L27
L36:
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_get
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -24(%ebp)
	movl	-24(%ebp), %eax
	cmpl	$6, %eax
	je	L29
	cmpl	$9, %eax
	je	L30
	testl	%eax, %eax
	jne	L28
	movl	-20(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, (%esp)
	call	_ast_regalloc_branch
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L28
L30:
	movl	-20(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, (%esp)
	call	_ast_regalloc_branch
	movl	%eax, -28(%ebp)
	movl	-20(%ebp), %eax
	movl	20(%eax), %eax
	movl	%eax, (%esp)
	call	_ast_regalloc_block
	movl	%eax, -32(%ebp)
	movl	-28(%ebp), %edx
	movl	-32(%ebp), %eax
	cmpl	%edx, %eax
	jnb	L32
	movl	%edx, %eax
L32:
	movl	%eax, -12(%ebp)
	movl	-28(%ebp), %eax
	cmpl	-32(%ebp), %eax
	jne	L33
	addl	$1, -12(%ebp)
L33:
	movl	-20(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%eax)
	jmp	L28
L29:
	movl	-20(%ebp), %eax
	movl	32(%eax), %eax
	movl	%eax, (%esp)
	call	_ast_regalloc_block
	movl	%eax, -28(%ebp)
	movl	-20(%ebp), %eax
	movl	28(%eax), %eax
	movl	%eax, (%esp)
	call	_ast_regalloc_block
	movl	%eax, -32(%ebp)
	movl	-28(%ebp), %edx
	movl	-32(%ebp), %eax
	cmpl	%edx, %eax
	jnb	L34
	movl	%edx, %eax
L34:
	movl	%eax, -12(%ebp)
	movl	-28(%ebp), %eax
	cmpl	-32(%ebp), %eax
	jne	L35
	addl	$1, -12(%ebp)
L35:
	movl	-20(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%eax)
	nop
L28:
	addl	$1, -16(%ebp)
L27:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	-16(%ebp), %eax
	ja	L36
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_vector_get;	.scl	2;	.type	32;	.endef
