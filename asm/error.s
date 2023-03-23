	.file	"error.c"
.lcomm _error_count,4,4
.lcomm _warning_count,4,4
	.text
	.globl	_get_error_count
	.def	_get_error_count;	.scl	2;	.type	32;	.endef
_get_error_count:
LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	_error_count, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.globl	_get_warning_count
	.def	_get_warning_count;	.scl	2;	.type	32;	.endef
_get_warning_count:
LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	_warning_count, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.section .rdata,"dr"
LC0:
	.ascii "Warning: \0"
LC1:
	.ascii "Too many warnings\0"
	.text
	.globl	_warn
	.def	_warn;	.scl	2;	.type	32;	.endef
_warn:
LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	leal	12(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	$LC0, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_vprintf
	movl	$10, (%esp)
	call	_putchar
	movl	_error_count, %eax
	addl	$1, %eax
	movl	%eax, _error_count
	movl	_warning_count, %eax
	cmpl	$100, %eax
	jne	L7
	movl	$LC1, (%esp)
	call	_fatal
L7:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.section .rdata,"dr"
LC2:
	.ascii "Error: \0"
LC3:
	.ascii "Too many errors\0"
	.text
	.globl	_error
	.def	_error;	.scl	2;	.type	32;	.endef
_error:
LFB28:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	leal	12(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	$LC2, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_vprintf
	movl	$10, (%esp)
	call	_putchar
	movl	_error_count, %eax
	addl	$1, %eax
	movl	%eax, _error_count
	movl	_error_count, %eax
	cmpl	$1, %eax
	jne	L10
	movl	$LC3, (%esp)
	call	_fatal
L10:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.section .rdata,"dr"
LC4:
	.ascii "Fatal: \0"
	.text
	.globl	_fatal
	.def	_fatal;	.scl	2;	.type	32;	.endef
_fatal:
LFB29:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	leal	12(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	$LC4, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_vprintf
	movl	$10, (%esp)
	call	_putchar
	movl	_error_count, %eax
	addl	$1, %eax
	movl	%eax, _error_count
	movl	$1, (%esp)
	call	_exit
	.cfi_endproc
LFE29:
	.section .rdata,"dr"
LC5:
	.ascii "Syntax Error: %s\12\0"
	.text
	.globl	_syntaxerror
	.def	_syntaxerror;	.scl	2;	.type	32;	.endef
_syntaxerror:
LFB30:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	movl	$1, (%esp)
	call	_exit
	.cfi_endproc
LFE30:
	.section .rdata,"dr"
LC6:
	.ascii "Internal Error: %s\12\0"
	.text
	.globl	_internalerror
	.def	_internalerror;	.scl	2;	.type	32;	.endef
_internalerror:
LFB31:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_printf
	movl	$1, (%esp)
	call	_exit
	.cfi_endproc
LFE31:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_vprintf;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_exit;	.scl	2;	.type	32;	.endef
