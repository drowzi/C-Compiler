	.file	"file.c"
.lcomm _current_module,4,4
.lcomm _current_file,4,4
.lcomm _file_stream,4,4
.lcomm _take_func,4,4
.lcomm _peek_func,4,4
	.section .rdata,"dr"
LC0:
	.ascii "r\0"
	.text
	.globl	_open_instream
	.def	_open_instream;	.scl	2;	.type	32;	.endef
_open_instream:
LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$16, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	$1, (%eax)
	movl	-12(%ebp), %eax
	movl	$0, 4(%eax)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_string
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	$LC0, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_fopen
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%edx, 12(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.section .rdata,"dr"
LC1:
	.ascii "cstringout.c\0"
	.text
	.globl	_open_code_string
	.def	_open_code_string;	.scl	2;	.type	32;	.endef
_open_code_string:
LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$16, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	$0, (%eax)
	movl	-12(%ebp), %eax
	movl	$0, 4(%eax)
	movl	$LC1, (%esp)
	call	_make_string
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.globl	_close_input_stream
	.def	_close_input_stream;	.scl	2;	.type	32;	.endef
_close_input_stream:
LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	_current_file, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L7
	movl	_current_file, %eax
	movl	12(%eax), %eax
	testl	%eax, %eax
	je	L7
	movl	_current_file, %eax
	movl	12(%eax), %eax
	movl	%eax, (%esp)
	call	_fclose
L7:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.globl	_push_file
	.def	_push_file;	.scl	2;	.type	32;	.endef
_push_file:
LFB28:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_open_instream
	movl	%eax, -12(%ebp)
	movl	_file_stream, %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_vector_append
	movl	-12(%ebp), %eax
	movl	%eax, _current_file
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.globl	_pop_file
	.def	_pop_file;	.scl	2;	.type	32;	.endef
_pop_file:
LFB29:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	_file_stream, %eax
	movl	%eax, (%esp)
	call	_vector_pop
	movl	_file_stream, %eax
	movl	%eax, (%esp)
	call	_vector_empty
	testl	%eax, %eax
	je	L10
	movl	$0, %eax
	jmp	L11
L10:
	movl	_file_stream, %eax
	movl	%eax, (%esp)
	call	_vector_top
	movl	%eax, _current_file
	movl	$1, %eax
L11:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE29:
	.globl	_set_current_file
	.def	_set_current_file;	.scl	2;	.type	32;	.endef
_set_current_file:
LFB30:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	call	_make_vector
	movl	%eax, _file_stream
	call	_get_current_file
	movl	%eax, _current_file
	movl	_current_file, %edx
	movl	_file_stream, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_vector_append
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE30:
	.def	_file_take;	.scl	3;	.type	32;	.endef
_file_take:
LFB31:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	_current_file, %eax
	movl	12(%eax), %eax
	movl	%eax, (%esp)
	call	_getc
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE31:
	.def	_string_take;	.scl	3;	.type	32;	.endef
_string_take:
LFB32:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	_current_file, %eax
	movl	12(%eax), %eax
	movl	8(%eax), %edx
	movl	_current_file, %eax
	movl	4(%eax), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE32:
	.def	_file_peek;	.scl	3;	.type	32;	.endef
_file_peek:
LFB33:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	_current_file, %eax
	movl	12(%eax), %eax
	movl	%eax, (%esp)
	call	_getc
	movb	%al, -9(%ebp)
	movl	_current_file, %eax
	movl	12(%eax), %edx
	movsbl	-9(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ungetc
	movzbl	-9(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE33:
	.def	_string_peek;	.scl	3;	.type	32;	.endef
_string_peek:
LFB34:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	_current_file, %eax
	movl	12(%eax), %eax
	movl	8(%eax), %edx
	movl	_current_file, %eax
	movl	4(%eax), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE34:
	.globl	_set_input_type
	.def	_set_input_type;	.scl	2;	.type	32;	.endef
_set_input_type:
LFB35:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	cmpl	$1, 8(%ebp)
	jne	L22
	movl	$_file_take, _take_func
	movl	$_file_peek, _peek_func
	jmp	L24
L22:
	movl	$_string_take, _take_func
	movl	$_string_peek, _peek_func
L24:
	nop
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE35:
	.globl	_take
	.def	_take;	.scl	2;	.type	32;	.endef
_take:
LFB36:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	_take_func, %eax
	call	*%eax
	movb	%al, -9(%ebp)
	movl	_current_file, %eax
	movl	4(%eax), %edx
	addl	$1, %edx
	movl	%edx, 4(%eax)
	movzbl	-9(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE36:
	.globl	_peek
	.def	_peek;	.scl	2;	.type	32;	.endef
_peek:
LFB37:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	movl	_peek_func, %eax
	call	*%eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE37:
	.globl	_replace
	.def	_replace;	.scl	2;	.type	32;	.endef
_replace:
LFB38:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movb	%al, -12(%ebp)
	movl	_current_file, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L30
	movl	_current_file, %eax
	movl	12(%eax), %edx
	movsbl	-12(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ungetc
L30:
	movl	_current_file, %eax
	movl	4(%eax), %edx
	subl	$1, %edx
	movl	%edx, 4(%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE38:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_make_string;	.scl	2;	.type	32;	.endef
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	_fclose;	.scl	2;	.type	32;	.endef
	.def	_vector_append;	.scl	2;	.type	32;	.endef
	.def	_vector_pop;	.scl	2;	.type	32;	.endef
	.def	_vector_empty;	.scl	2;	.type	32;	.endef
	.def	_vector_top;	.scl	2;	.type	32;	.endef
	.def	_make_vector;	.scl	2;	.type	32;	.endef
	.def	_get_current_file;	.scl	2;	.type	32;	.endef
	.def	_getc;	.scl	2;	.type	32;	.endef
	.def	_ungetc;	.scl	2;	.type	32;	.endef
