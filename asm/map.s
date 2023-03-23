	.file	"map.c"
	.text
	.def	_hash;	.scl	3;	.type	32;	.endef
_hash:
LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$-2128831035, -4(%ebp)
	jmp	L2
L3:
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	xorl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	imull	$16777619, %eax, %eax
	movl	%eax, -4(%ebp)
	addl	$1, 8(%ebp)
L2:
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	L3
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.def	_do_make_map;	.scl	3;	.type	32;	.endef
_do_make_map:
LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$24, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, (%eax)
	movl	12(%ebp), %eax
	movl	$4, 4(%esp)
	movl	%eax, (%esp)
	call	_calloc
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%edx, 4(%eax)
	movl	12(%ebp), %eax
	movl	$4, 4(%esp)
	movl	%eax, (%esp)
	call	_calloc
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	-12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	-12(%ebp), %eax
	movl	$0, 16(%eax)
	movl	-12(%ebp), %eax
	movl	$0, 20(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.def	_maybe_rehash;	.scl	3;	.type	32;	.endef
_maybe_rehash:
LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	L8
	movl	$4, 4(%esp)
	movl	$16, (%esp)
	call	_calloc
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 4(%eax)
	movl	$4, 4(%esp)
	movl	$16, (%esp)
	call	_calloc
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	8(%ebp), %eax
	movl	$16, 12(%eax)
	jmp	L7
L8:
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	movl	%eax, -44(%ebp)
	fildl	-44(%ebp)
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -44(%ebp)
	fildl	-44(%ebp)
	fldl	LC0
	fmulp	%st, %st(1)
	fucompp
	fnstsw	%ax
	sahf
	ja	L24
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, -44(%ebp)
	fildl	-44(%ebp)
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -44(%ebp)
	fildl	-44(%ebp)
	fldl	LC1
	fmulp	%st, %st(1)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L23
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	jmp	L14
L23:
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	addl	%eax, %eax
L14:
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	movl	$4, 4(%esp)
	movl	%eax, (%esp)
	call	_calloc
	movl	%eax, -24(%ebp)
	movl	-20(%ebp), %eax
	movl	$4, 4(%esp)
	movl	%eax, (%esp)
	call	_calloc
	movl	%eax, -28(%ebp)
	movl	-20(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -32(%ebp)
	movl	$0, -12(%ebp)
	jmp	L15
L21:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L25
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	$-1, %eax
	je	L25
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_hash
	movl	%eax, %edx
	movl	-32(%ebp), %eax
	andl	%edx, %eax
	movl	%eax, -16(%ebp)
L20:
	movl	-16(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-24(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L19
	movl	-16(%ebp), %eax
	addl	$1, %eax
	andl	-32(%ebp), %eax
	movl	%eax, -16(%ebp)
	jmp	L20
L19:
	movl	-16(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-24(%ebp), %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	-12(%ebp), %ecx
	sall	$2, %ecx
	addl	%ecx, %eax
	movl	(%eax), %eax
	movl	%eax, (%edx)
	movl	-16(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-28(%ebp), %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	-12(%ebp), %ecx
	sall	$2, %ecx
	addl	%ecx, %eax
	movl	(%eax), %eax
	movl	%eax, (%edx)
	jmp	L18
L25:
	nop
L18:
	addl	$1, -12(%ebp)
L15:
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	cmpl	-12(%ebp), %eax
	jg	L21
	movl	8(%ebp), %eax
	movl	-24(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	8(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	8(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	8(%ebp), %eax
	movl	16(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 20(%eax)
	jmp	L7
L24:
	nop
L7:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.globl	_make_map
	.def	_make_map;	.scl	2;	.type	32;	.endef
_make_map:
LFB28:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$16, 4(%esp)
	movl	$0, (%esp)
	call	_do_make_map
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.globl	_make_map_parent
	.def	_make_map_parent;	.scl	2;	.type	32;	.endef
_make_map_parent:
LFB29:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$16, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_do_make_map
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE29:
	.def	_map_get_nostack;	.scl	3;	.type	32;	.endef
_map_get_nostack:
LFB30:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	L31
	movl	$0, %eax
	jmp	L32
L31:
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	subl	$1, %eax
	movl	%eax, -16(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_hash
	movl	%eax, %edx
	movl	-16(%ebp), %eax
	andl	%edx, %eax
	movl	%eax, -12(%ebp)
	jmp	L33
L35:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	$-1, %eax
	je	L34
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L34
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	jmp	L32
L34:
	movl	-12(%ebp), %eax
	addl	$1, %eax
	andl	-16(%ebp), %eax
	movl	%eax, -12(%ebp)
L33:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L35
	movl	$0, %eax
L32:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE30:
	.globl	_map_get
	.def	_map_get;	.scl	2;	.type	32;	.endef
_map_get:
LFB31:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_map_get_nostack
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	je	L37
	movl	-12(%ebp), %eax
	jmp	L38
L37:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L39
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_map_get
	jmp	L38
L39:
	movl	$0, %eax
L38:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE31:
	.globl	_map_put
	.def	_map_put;	.scl	2;	.type	32;	.endef
_map_put:
LFB32:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_maybe_rehash
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	subl	$1, %eax
	movl	%eax, -16(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_hash
	movl	%eax, %edx
	movl	-16(%ebp), %eax
	andl	%edx, %eax
	movl	%eax, -12(%ebp)
L46:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, -20(%ebp)
	cmpl	$0, -20(%ebp)
	je	L41
	cmpl	$-1, -20(%ebp)
	jne	L42
L41:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	%eax, (%edx)
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%eax, %edx
	movl	16(%ebp), %eax
	movl	%eax, (%edx)
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 16(%eax)
	cmpl	$0, -20(%ebp)
	jne	L47
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 20(%eax)
	jmp	L47
L42:
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L45
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%eax, %edx
	movl	16(%ebp), %eax
	movl	%eax, (%edx)
	jmp	L40
L45:
	movl	-12(%ebp), %eax
	addl	$1, %eax
	andl	-16(%ebp), %eax
	movl	%eax, -12(%ebp)
	jmp	L46
L47:
	nop
L40:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE32:
	.globl	_map_remove
	.def	_map_remove;	.scl	2;	.type	32;	.endef
_map_remove:
LFB33:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	je	L55
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	subl	$1, %eax
	movl	%eax, -16(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_hash
	movl	%eax, %edx
	movl	-16(%ebp), %eax
	andl	%edx, %eax
	movl	%eax, -12(%ebp)
	jmp	L51
L54:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	$-1, %eax
	je	L52
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	je	L53
L52:
	movl	-12(%ebp), %eax
	addl	$1, %eax
	andl	-16(%ebp), %eax
	movl	%eax, -12(%ebp)
	jmp	L51
L53:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	$-1, (%eax)
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	$0, (%eax)
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	leal	-1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 16(%eax)
	jmp	L48
L51:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L54
	jmp	L48
L55:
	nop
L48:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE33:
	.globl	_map_len
	.def	_map_len;	.scl	2;	.type	32;	.endef
_map_len:
LFB34:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE34:
	.section .rdata,"dr"
	.align 8
LC0:
	.long	1717986918
	.long	1072064102
	.align 8
LC1:
	.long	1717986918
	.long	1071015526
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_calloc;	.scl	2;	.type	32;	.endef
	.def	_strcmp;	.scl	2;	.type	32;	.endef
