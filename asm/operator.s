	.file	"operator.c"
	.data
	.align 32
_op_table:
	.byte	2
	.byte	0
	.byte	0
	.byte	108
	.byte	2
	.byte	0
	.byte	0
	.byte	114
	.byte	2
	.byte	0
	.byte	0
	.byte	114
	.byte	2
	.byte	0
	.byte	0
	.byte	114
	.byte	2
	.byte	0
	.byte	0
	.byte	114
	.byte	2
	.byte	0
	.byte	0
	.byte	114
	.byte	2
	.byte	0
	.byte	0
	.byte	114
	.byte	2
	.byte	0
	.byte	0
	.byte	114
	.byte	2
	.byte	0
	.byte	0
	.byte	114
	.byte	2
	.byte	0
	.byte	0
	.byte	114
	.byte	2
	.byte	0
	.byte	0
	.byte	114
	.byte	2
	.byte	0
	.byte	0
	.byte	114
	.byte	2
	.byte	0
	.byte	0
	.byte	114
	.byte	2
	.byte	0
	.byte	0
	.byte	108
	.byte	2
	.byte	0
	.byte	0
	.byte	108
	.byte	2
	.byte	0
	.byte	0
	.byte	108
	.byte	2
	.byte	0
	.byte	0
	.byte	108
	.byte	2
	.byte	0
	.byte	0
	.byte	108
	.byte	2
	.byte	0
	.byte	0
	.byte	108
	.byte	2
	.byte	0
	.byte	0
	.byte	108
	.byte	2
	.byte	0
	.byte	0
	.byte	108
	.byte	2
	.byte	0
	.byte	0
	.byte	108
	.byte	2
	.byte	0
	.byte	0
	.byte	108
	.byte	2
	.byte	0
	.byte	0
	.byte	108
	.byte	2
	.byte	0
	.byte	0
	.byte	108
	.byte	2
	.byte	0
	.byte	0
	.byte	108
	.byte	2
	.byte	0
	.byte	0
	.byte	108
	.byte	2
	.byte	0
	.byte	0
	.byte	108
	.byte	2
	.byte	0
	.byte	0
	.byte	108
	.byte	2
	.byte	0
	.byte	0
	.byte	108
	.byte	2
	.byte	0
	.byte	0
	.byte	108
	.byte	1
	.byte	0
	.byte	0
	.byte	114
	.byte	1
	.byte	0
	.byte	0
	.byte	114
	.byte	1
	.byte	0
	.byte	0
	.byte	114
	.byte	1
	.byte	0
	.byte	0
	.byte	114
	.byte	1
	.byte	0
	.byte	0
	.byte	114
	.byte	2
	.byte	0
	.byte	0
	.byte	114
	.byte	2
	.byte	0
	.byte	0
	.byte	114
	.byte	1
	.byte	0
	.byte	0
	.byte	114
	.byte	1
	.byte	0
	.byte	0
	.byte	114
	.byte	1
	.byte	0
	.byte	0
	.byte	114
	.byte	1
	.byte	0
	.byte	0
	.byte	114
	.byte	1
	.byte	0
	.byte	0
	.byte	108
	.byte	2
	.byte	0
	.byte	0
	.byte	108
	.byte	2
	.byte	0
	.byte	0
	.byte	108
	.byte	1
	.byte	0
	.byte	0
	.byte	108
	.byte	1
	.byte	0
	.byte	0
	.byte	108
	.byte	1
	.byte	0
	.byte	0
	.byte	108
	.byte	1
	.byte	0
	.byte	0
	.byte	108
	.text
	.globl	_unset_op
	.def	_unset_op;	.scl	2;	.type	32;	.endef
_unset_op:
LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	cmpl	$532, 8(%ebp)
	setbe	%al
	movzbl	%al, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.globl	_binary_op
	.def	_binary_op;	.scl	2;	.type	32;	.endef
_binary_op:
LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movl	_op_table(,%eax,4), %eax
	sall	$9, %eax
	sarl	$9, %eax
	cmpl	$2, %eax
	sete	%al
	movzbl	%al, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.globl	_unary_op
	.def	_unary_op;	.scl	2;	.type	32;	.endef
_unary_op:
LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movl	_op_table(,%eax,4), %eax
	sall	$9, %eax
	sarl	$9, %eax
	cmpl	$1, %eax
	sete	%al
	movzbl	%al, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.globl	_cond_op
	.def	_cond_op;	.scl	2;	.type	32;	.endef
_cond_op:
LFB28:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	cmpl	$547, 8(%ebp)
	je	L8
	cmpl	$546, 8(%ebp)
	je	L8
	cmpl	$550, 8(%ebp)
	jbe	L9
	cmpl	$556, 8(%ebp)
	ja	L9
L8:
	movl	$1, %eax
	jmp	L10
L9:
	movl	$0, %eax
L10:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.globl	_left_associative
	.def	_left_associative;	.scl	2;	.type	32;	.endef
_left_associative:
LFB29:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movzbl	_op_table+3(,%eax,4), %eax
	cmpb	$108, %al
	sete	%al
	movzbl	%al, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE29:
	.globl	_right_associative
	.def	_right_associative;	.scl	2;	.type	32;	.endef
_right_associative:
LFB30:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movzbl	_op_table+3(,%eax,4), %eax
	cmpb	$114, %al
	sete	%al
	movzbl	%al, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE30:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
