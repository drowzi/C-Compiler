	.file	"outfile.c"
	.text
LF999:
	.ascii "value: %d\n\0"
LFB0:
	.globl	_other
	.def	_other;	.scl	2;	.type	32; .endef
_other:
LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$16, %esp
	movl	$1, -4(%ebp)
LFE0:
	movl	%ebp, %esp
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFB4:
	.globl	_sum
	.def	_sum;	.scl	2;	.type	32; .endef
_sum:
LFB4:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$16, %esp
	movl	-4(%ebp), %eax
	movl	%eax, 4(%ebp)
	movl	-8(%ebp), %eax
	movl	4(%ebp), %ecx
	addl	%eax, %ecx
	movl	%ecx, 4(%ebp)
	movl	4(%ebp), %eax
LFE4:
	movl	%ebp, %esp
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFB5:
	.globl	_product
	.def	_product;	.scl	2;	.type	32; .endef
_product:
LFB5:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$16, %esp
	movl	-4(%ebp), %eax
	movl	%eax, 4(%ebp)
	movl	-8(%ebp), %eax
	movl	4(%ebp), %ecx
	imul	%eax, %ecx
	movl	%ecx, 4(%ebp)
	movl	4(%ebp), %eax
LFE5:
	movl	%ebp, %esp
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFB3:
	.globl	_test_if
	.def	_test_if;	.scl	2;	.type	32; .endef
_test_if:
LFB3:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$16, %esp
	movl	$1, -4(%ebp)
	movl	$0, -8(%ebp)
	movl	-4(%ebp), %eax
	test %eax, %eax
	mov $0, %eax
	je L4
	movl	-4(%ebp), %eax
	test %eax, %eax
	mov $0, %eax
	je L4
	mov $1, %eax
L4:
	test %eax, %eax
	je L5
	movl	-4(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LF999, (%esp)
	call	_printf
	movl	-4(%ebp), %eax
L5:
	movl	-8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LF999, (%esp)
	call	_printf
	movl	-8(%ebp), %eax
LFE3:
	movl	%ebp, %esp
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFB2:
	.def	___main;	.scl	2;	.type	32; .endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32; .endef
_main:
LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$16, %esp
	movl	$3, -4(%ebp)
	movl	-4(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LF999, (%esp)
	call	_printf
	movl	-4(%ebp), %eax
	movl	%eax, -8(%ebp)
	movl	$1, %ecx
	movl	-4(%ebp), %eax
	subl	%ecx, %eax
	movl	%eax, %ecx
	movl	$10, %eax
	imul	%ecx, %eax
	movl	-8(%ebp), %ecx
	imul	%eax, %ecx
	movl	%ecx, -8(%ebp)
	movl	-8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LF999, (%esp)
	call	_printf
	movl	$5, %ecx
	movl	-4(%ebp), %eax
	imul	%ecx, %eax
	movl	%eax, -12(%ebp)
	movl	-4(%ebp), %eax
	movl	%eax, %ecx
	movl	$9, %eax
	imul	%ecx, %eax
	movl	%eax, %ecx
	movl	$20, %ecx
	movl	-8(%ebp), %eax
	imul	%ecx, %eax
	addl	%ecx, %eax
	movl	-12(%ebp), %ecx
	addl	%eax, %ecx
	movl	%ecx, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LF999, (%esp)
	call	_printf
	addl	$1, -4(%ebp)
	movl	-4(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LF999, (%esp)
	call	_printf
	movl	-4(%ebp), %eax
	movl	%eax, -8(%ebp)
	movl	-8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LF999, (%esp)
	call	_printf
	movl	$1, -16(%ebp)
	movl	$0, -20(%ebp)
	movl	-20(%ebp), %eax
	test %eax, %eax
	mov $1, %eax
	jne L6
	movl	-20(%ebp), %eax
	test %eax, %eax
	mov $1, %eax
	jne L6
	mov $0, %eax
L6:
	test %eax, %eax
	je L7
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LF999, (%esp)
	call	_printf
L7:
	movl	$0, %eax
LFE2:
	movl	%ebp, %esp
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE100:
	.def	_printf;	.scl	2;	.type	32; .endef
