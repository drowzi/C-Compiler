	.file	"cdecl.c"
	.text
	.globl	_parse_c_declaration
	.def	_parse_c_declaration;	.scl	2;	.type	32;	.endef
_parse_c_declaration:
LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	call	_get_current_module
	movl	%eax, -16(%ebp)
	movl	$1, -20(%ebp)
	movl	$0, -24(%ebp)
	call	_get_token
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, -28(%ebp)
L5:
	movl	-28(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	jne	L2
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$7, %eax
	jne	L2
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$514, %eax
	jne	L2
	movl	$0, -20(%ebp)
	jmp	L3
L2:
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$7, %eax
	jne	L4
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$523, %eax
	je	L6
L4:
	call	_get_token
	movl	%eax, -12(%ebp)
	jmp	L5
L6:
	nop
L3:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_get_current_module;	.scl	2;	.type	32;	.endef
	.def	_get_token;	.scl	2;	.type	32;	.endef
