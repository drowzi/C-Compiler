	.file	"scan.c"
.lcomm _tokens,4,4
.lcomm _buffer,4,4
.lcomm _position,4,4
.lcomm _current,4,4
	.section .rdata,"dr"
	.align 4
_skipped_tokens:
	.long	0
	.long	3
	.text
	.globl	_tident
	.def	_tident;	.scl	2;	.type	32;	.endef
_tident:
LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	sete	%al
	movzbl	%al, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.globl	_tkeyword
	.def	_tkeyword;	.scl	2;	.type	32;	.endef
_tkeyword:
LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$5, %eax
	sete	%al
	movzbl	%al, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.globl	_tnumber
	.def	_tnumber;	.scl	2;	.type	32;	.endef
_tnumber:
LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$6, %eax
	sete	%al
	movzbl	%al, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.globl	_tsymbol
	.def	_tsymbol;	.scl	2;	.type	32;	.endef
_tsymbol:
LFB28:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$7, %eax
	sete	%al
	movzbl	%al, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.globl	_tchar
	.def	_tchar;	.scl	2;	.type	32;	.endef
_tchar:
LFB29:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$8, %eax
	sete	%al
	movzbl	%al, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE29:
	.globl	_tstring
	.def	_tstring;	.scl	2;	.type	32;	.endef
_tstring:
LFB30:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$9, %eax
	sete	%al
	movzbl	%al, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE30:
	.globl	_tnewline
	.def	_tnewline;	.scl	2;	.type	32;	.endef
_tnewline:
LFB31:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	sete	%al
	movzbl	%al, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE31:
	.globl	_tokens_left
	.def	_tokens_left;	.scl	2;	.type	32;	.endef
_tokens_left:
LFB32:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	_tokens, %eax
	movl	(%eax), %edx
	movl	_position, %eax
	cmpl	%eax, %edx
	seta	%al
	movzbl	%al, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE32:
	.globl	_get_token
	.def	_get_token;	.scl	2;	.type	32;	.endef
_get_token:
LFB33:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	_position, %eax
	leal	1(%eax), %edx
	movl	%edx, _position
	movl	_tokens, %edx
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_vector_get
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE33:
	.globl	_next_token
	.def	_next_token;	.scl	2;	.type	32;	.endef
_next_token:
LFB34:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	_position, %edx
	movl	_tokens, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_vector_get
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE34:
	.section .rdata,"dr"
	.align 4
LC0:
	.ascii "C:\\Users\\Allen\\Desktop\\dev\\Language Design\\CCompiler\\scan.c\0"
LC1:
	.ascii "position > 0\0"
	.text
	.globl	_last_token
	.def	_last_token;	.scl	2;	.type	32;	.endef
_last_token:
LFB35:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	_position, %eax
	testl	%eax, %eax
	jne	L22
	movl	$63, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	$LC1, (%esp)
	call	__assert
L22:
	movl	_position, %eax
	leal	-1(%eax), %edx
	movl	_tokens, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_vector_get
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE35:
	.globl	_skip_token
	.def	_skip_token;	.scl	2;	.type	32;	.endef
_skip_token:
LFB36:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	_position, %eax
	addl	$1, %eax
	movl	%eax, _position
	nop
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE36:
	.section .rdata,"dr"
	.align 4
LC2:
	.ascii "requested to peek %d tokens ahead with vec_len %d\0"
	.text
	.globl	_peek_token
	.def	_peek_token;	.scl	2;	.type	32;	.endef
_peek_token:
LFB37:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	_position, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -12(%ebp)
	movl	_tokens, %eax
	movl	%eax, (%esp)
	call	_vector_length
	cmpl	-12(%ebp), %eax
	jl	L26
	cmpl	$0, -12(%ebp)
	jns	L27
L26:
	movl	_tokens, %eax
	movl	%eax, (%esp)
	call	_vector_length
	movl	%eax, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_log_error
L27:
	movl	-12(%ebp), %edx
	movl	_tokens, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_vector_get
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE37:
	.globl	_peek_next_token
	.def	_peek_next_token;	.scl	2;	.type	32;	.endef
_peek_next_token:
LFB38:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$0, (%esp)
	call	_peek_token
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE38:
	.globl	_peek_last_token
	.def	_peek_last_token;	.scl	2;	.type	32;	.endef
_peek_last_token:
LFB39:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$-2, (%esp)
	call	_peek_token
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE39:
	.globl	_unwind_token_pos
	.def	_unwind_token_pos;	.scl	2;	.type	32;	.endef
_unwind_token_pos:
LFB40:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	_position, %eax
	testl	%eax, %eax
	je	L35
	movl	_position, %eax
	subl	$1, %eax
	movl	%eax, _position
L35:
	nop
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE40:
	.section .rdata,"dr"
LC3:
	.ascii "Expected %d, got %d\0"
	.text
	.globl	_expect
	.def	_expect;	.scl	2;	.type	32;	.endef
_expect:
LFB41:
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
	movl	8(%eax), %eax
	cmpl	8(%ebp), %eax
	je	L38
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_log_error
L38:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE41:
	.section .rdata,"dr"
	.align 4
_tok_auto:
	.long	7
	.long	0
	.long	0
	.align 4
_tok_break:
	.long	7
	.long	0
	.long	1
	.align 4
_tok_case:
	.long	7
	.long	0
	.long	2
	.align 4
_tok_char:
	.long	7
	.long	0
	.long	3
	.align 4
_tok_const:
	.long	7
	.long	0
	.long	4
	.align 4
_tok_continue:
	.long	7
	.long	0
	.long	5
	.align 4
_tok_default:
	.long	7
	.long	0
	.long	6
	.align 4
_tok_do:
	.long	7
	.long	0
	.long	7
	.align 4
_tok_double:
	.long	7
	.long	0
	.long	8
	.align 4
_tok_else:
	.long	7
	.long	0
	.long	9
	.align 4
_tok_enum:
	.long	7
	.long	0
	.long	10
	.align 4
_tok_extern:
	.long	7
	.long	0
	.long	11
	.align 4
_tok_float:
	.long	7
	.long	0
	.long	12
	.align 4
_tok_for:
	.long	7
	.long	0
	.long	13
	.align 4
_tok_goto:
	.long	7
	.long	0
	.long	14
	.align 4
_tok_if:
	.long	7
	.long	0
	.long	15
	.align 4
_tok_int:
	.long	7
	.long	0
	.long	16
	.align 4
_tok_long:
	.long	7
	.long	0
	.long	17
	.align 4
_tok_register:
	.long	7
	.long	0
	.long	18
	.align 4
_tok_return:
	.long	7
	.long	0
	.long	19
	.align 4
_tok_short:
	.long	7
	.long	0
	.long	20
	.align 4
_tok_signed:
	.long	7
	.long	0
	.long	21
	.align 4
_tok_sizeof:
	.long	7
	.long	0
	.long	22
	.align 4
_tok_static:
	.long	7
	.long	0
	.long	23
	.align 4
_tok_struct:
	.long	7
	.long	0
	.long	24
	.align 4
_tok_switch:
	.long	7
	.long	0
	.long	25
	.align 4
_tok_typedef:
	.long	7
	.long	0
	.long	26
	.align 4
_tok_unsigned:
	.long	7
	.long	0
	.long	28
	.align 4
_tok_union:
	.long	7
	.long	0
	.long	27
	.align 4
_tok_void:
	.long	7
	.long	0
	.long	29
	.align 4
_tok_volatile:
	.long	7
	.long	0
	.long	30
	.align 4
_tok_while:
	.long	7
	.long	0
	.long	31
	.align 4
_tok_printident:
	.long	7
	.long	0
	.long	32
LC4:
	.ascii "auto\0"
LC5:
	.ascii "break\0"
LC6:
	.ascii "case\0"
LC7:
	.ascii "char\0"
LC8:
	.ascii "const\0"
LC9:
	.ascii "continue\0"
LC10:
	.ascii "default\0"
LC11:
	.ascii "do\0"
LC12:
	.ascii "double\0"
LC13:
	.ascii "else\0"
LC14:
	.ascii "enum\0"
LC15:
	.ascii "extern\0"
LC16:
	.ascii "float\0"
LC17:
	.ascii "for\0"
LC18:
	.ascii "goto\0"
LC19:
	.ascii "if\0"
LC20:
	.ascii "int\0"
LC21:
	.ascii "long\0"
LC22:
	.ascii "register\0"
LC23:
	.ascii "return\0"
LC24:
	.ascii "short\0"
LC25:
	.ascii "signed\0"
LC26:
	.ascii "sizeof\0"
LC27:
	.ascii "static\0"
LC28:
	.ascii "struct\0"
LC29:
	.ascii "switch\0"
LC30:
	.ascii "typedef\0"
LC31:
	.ascii "unsigned\0"
LC32:
	.ascii "union\0"
LC33:
	.ascii "void\0"
LC34:
	.ascii "volatile\0"
LC35:
	.ascii "while\0"
LC36:
	.ascii "__printident\0"
	.text
	.def	_keyword_id;	.scl	3;	.type	32;	.endef
_keyword_id:
LFB42:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$-1, -12(%ebp)
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$95, %eax
	cmpl	$24, %eax
	ja	L40
	movl	L42(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L42:
	.long	L41
	.long	L40
	.long	L43
	.long	L44
	.long	L45
	.long	L46
	.long	L47
	.long	L48
	.long	L49
	.long	L40
	.long	L50
	.long	L40
	.long	L40
	.long	L51
	.long	L40
	.long	L40
	.long	L40
	.long	L40
	.long	L40
	.long	L52
	.long	L53
	.long	L54
	.long	L55
	.long	L56
	.long	L57
	.text
L43:
	movl	$LC4, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L92
	movl	$0, -12(%ebp)
	jmp	L92
L44:
	movl	$LC5, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L93
	movl	$1, -12(%ebp)
	jmp	L93
L45:
	movl	$LC6, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L60
	movl	$2, -12(%ebp)
	jmp	L94
L60:
	movl	$LC7, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L62
	movl	$3, -12(%ebp)
	jmp	L94
L62:
	movl	$LC8, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L63
	movl	$4, -12(%ebp)
	jmp	L94
L63:
	movl	$LC9, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L94
	movl	$5, -12(%ebp)
	jmp	L94
L46:
	movl	$LC10, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L64
	movl	$6, -12(%ebp)
	jmp	L95
L64:
	movl	$LC11, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L66
	movl	$7, -12(%ebp)
	jmp	L95
L66:
	movl	$LC12, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L95
	movl	$8, -12(%ebp)
	jmp	L95
L47:
	movl	$LC13, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L67
	movl	$9, -12(%ebp)
	jmp	L96
L67:
	movl	$LC14, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L69
	movl	$10, -12(%ebp)
	jmp	L96
L69:
	movl	$LC15, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L96
	movl	$11, -12(%ebp)
	jmp	L96
L48:
	movl	$LC16, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L70
	movl	$12, -12(%ebp)
	jmp	L97
L70:
	movl	$LC17, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L97
	movl	$13, -12(%ebp)
	jmp	L97
L49:
	movl	$LC18, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L98
	movl	$14, -12(%ebp)
	jmp	L98
L50:
	movl	$LC19, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L73
	movl	$15, -12(%ebp)
	jmp	L99
L73:
	movl	$LC20, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L99
	movl	$16, -12(%ebp)
	jmp	L99
L51:
	movl	$LC21, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L100
	movl	$17, -12(%ebp)
	jmp	L100
L52:
	movl	$LC22, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L76
	movl	$18, -12(%ebp)
	jmp	L101
L76:
	movl	$LC23, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L101
	movl	$19, -12(%ebp)
	jmp	L101
L53:
	movl	$LC24, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L78
	movl	$20, -12(%ebp)
	jmp	L102
L78:
	movl	$LC25, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L80
	movl	$21, -12(%ebp)
	jmp	L102
L80:
	movl	$LC26, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L81
	movl	$22, -12(%ebp)
	jmp	L102
L81:
	movl	$LC27, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L82
	movl	$23, -12(%ebp)
	jmp	L102
L82:
	movl	$LC28, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L83
	movl	$24, -12(%ebp)
	jmp	L102
L83:
	movl	$LC29, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L102
	movl	$25, -12(%ebp)
	jmp	L102
L54:
	movl	$LC30, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L103
	movl	$26, -12(%ebp)
	jmp	L103
L55:
	movl	$LC31, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L85
	movl	$28, -12(%ebp)
	jmp	L104
L85:
	movl	$LC32, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L104
	movl	$27, -12(%ebp)
	jmp	L104
L56:
	movl	$LC33, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L87
	movl	$29, -12(%ebp)
	jmp	L105
L87:
	movl	$LC34, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L105
	movl	$30, -12(%ebp)
	jmp	L105
L57:
	movl	$LC35, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L106
	movl	$31, -12(%ebp)
	jmp	L106
L41:
	movl	$LC36, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L107
	movl	$32, -12(%ebp)
	jmp	L107
L92:
	nop
	jmp	L40
L93:
	nop
	jmp	L40
L94:
	nop
	jmp	L40
L95:
	nop
	jmp	L40
L96:
	nop
	jmp	L40
L97:
	nop
	jmp	L40
L98:
	nop
	jmp	L40
L99:
	nop
	jmp	L40
L100:
	nop
	jmp	L40
L101:
	nop
	jmp	L40
L102:
	nop
	jmp	L40
L103:
	nop
	jmp	L40
L104:
	nop
	jmp	L40
L105:
	nop
	jmp	L40
L106:
	nop
	jmp	L40
L107:
	nop
L40:
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE42:
	.def	_valid_char;	.scl	3;	.type	32;	.endef
_valid_char:
LFB43:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$4, %esp
	movl	8(%ebp), %eax
	movb	%al, -4(%ebp)
	cmpb	$96, -4(%ebp)
	jle	L109
	cmpb	$122, -4(%ebp)
	jle	L110
L109:
	cmpb	$64, -4(%ebp)
	jle	L111
	cmpb	$90, -4(%ebp)
	jle	L110
L111:
	cmpb	$47, -4(%ebp)
	jle	L112
	cmpb	$57, -4(%ebp)
	jle	L110
L112:
	cmpb	$95, -4(%ebp)
	jne	L113
L110:
	movl	$1, %eax
	jmp	L114
L113:
	movl	$0, %eax
L114:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE43:
	.def	_valid_number;	.scl	3;	.type	32;	.endef
_valid_number:
LFB44:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$4, %esp
	movl	8(%ebp), %eax
	movb	%al, -4(%ebp)
	cmpb	$46, -4(%ebp)
	je	L117
	cmpb	$101, -4(%ebp)
	je	L117
	cmpb	$47, -4(%ebp)
	jle	L118
	cmpb	$57, -4(%ebp)
	jg	L118
L117:
	movl	$1, %eax
	jmp	L119
L118:
	movl	$0, %eax
L119:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE44:
	.def	_scan_number_tail;	.scl	3;	.type	32;	.endef
_scan_number_tail:
LFB45:
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
LFE45:
	.section .rdata,"dr"
	.align 4
LC37:
	.ascii "multiple decimals in numeric constant\0"
	.align 4
LC38:
	.ascii "invalid usage of scientific notation: 'e' char cannot follow decimal\0"
	.align 4
LC39:
	.ascii "invalid usage of scientific notation: 'e' char cannot come before the decimal\0"
	.text
	.globl	_scan_number
	.def	_scan_number;	.scl	2;	.type	32;	.endef
_scan_number:
LFB46:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
	movl	8(%ebp), %eax
	movb	%al, -44(%ebp)
	movl	$0, -24(%ebp)
	call	_take
	movb	%al, -9(%ebp)
	jmp	L123
L136:
	cmpb	$46, -9(%ebp)
	jne	L124
	movl	$0, -16(%ebp)
	call	_take
	movsbl	%al, %eax
	movl	%eax, -20(%ebp)
	jmp	L125
L133:
	cmpl	$46, -20(%ebp)
	jne	L126
	movl	$LC37, (%esp)
	call	_log_error
L126:
	cmpl	$101, -20(%ebp)
	jne	L127
	cmpl	$0, -16(%ebp)
	jne	L128
	movl	$LC38, (%esp)
	call	_log_error
L128:
	call	_take
	movsbl	%al, %eax
	movl	%eax, -20(%ebp)
	jmp	L129
L131:
	movl	-20(%ebp), %eax
	movsbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	16(%ebp), %eax
	movl	%eax, (%esp)
	call	_string_append_char
	call	_take
	movsbl	%al, %eax
	movl	%eax, -20(%ebp)
L129:
	cmpl	$47, -20(%ebp)
	jbe	L138
	cmpl	$57, -20(%ebp)
	jbe	L131
	jmp	L138
L127:
	movl	-20(%ebp), %eax
	movsbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	16(%ebp), %eax
	movl	%eax, (%esp)
	call	_string_append_char
	addl	$1, -16(%ebp)
	call	_take
	movsbl	%al, %eax
	movl	%eax, -20(%ebp)
L125:
	movl	-20(%ebp), %eax
	movsbl	%al, %eax
	movl	%eax, (%esp)
	call	_valid_number
	testl	%eax, %eax
	jne	L133
	jmp	L134
L138:
	nop
	jmp	L134
L124:
	cmpb	$101, -9(%ebp)
	jne	L135
	movl	$LC39, (%esp)
	call	_log_error
L135:
	movsbl	-9(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	16(%ebp), %eax
	movl	%eax, (%esp)
	call	_string_append_char
	call	_take
	movb	%al, -9(%ebp)
L123:
	movsbl	-9(%ebp), %eax
	movl	%eax, (%esp)
	call	_valid_number
	testl	%eax, %eax
	jne	L136
L134:
	movsbl	-9(%ebp), %eax
	movl	%eax, (%esp)
	call	_replace
	movl	16(%ebp), %eax
	movl	%eax, (%esp)
	call	_scan_number_tail
	movl	$0, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$6, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE46:
	.section .rdata,"dr"
LC40:
	.ascii "unclosed string\0"
LC41:
	.ascii "take() == '\\''\0"
	.align 4
LC42:
	.ascii "multiline comment was never closed\0"
	.text
	.globl	_scan
	.def	_scan;	.scl	2;	.type	32;	.endef
_scan:
LFB47:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -16(%ebp)
	movl	_buffer, %eax
	movl	%eax, (%esp)
	call	_string_clean
L140:
	call	_take
	movb	%al, -9(%ebp)
	movsbl	-9(%ebp), %edx
	movl	_buffer, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_string_append_char
	call	_peek
	movb	%al, -10(%ebp)
	movsbl	-9(%ebp), %eax
	addl	$1, %eax
	cmpl	$127, %eax
	ja	L141
	movl	L143(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L143:
	.long	L142
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L144
	.long	L145
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L144
	.long	L146
	.long	L147
	.long	L148
	.long	L141
	.long	L149
	.long	L150
	.long	L151
	.long	L152
	.long	L153
	.long	L154
	.long	L155
	.long	L156
	.long	L157
	.long	L141
	.long	L158
	.long	L159
	.long	L159
	.long	L159
	.long	L159
	.long	L159
	.long	L159
	.long	L159
	.long	L159
	.long	L159
	.long	L159
	.long	L160
	.long	L161
	.long	L162
	.long	L163
	.long	L164
	.long	L165
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L166
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L167
	.long	L141
	.long	L168
	.long	L169
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L170
	.long	L171
	.long	L172
	.long	L173
	.text
L144:
	movl	$1, -16(%ebp)
	movl	_buffer, %eax
	movl	%eax, (%esp)
	call	_string_clean
	jmp	L140
L145:
	movl	$521, 12(%esp)
	movl	$0, 8(%esp)
	movl	$1, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L142:
	movl	$520, 12(%esp)
	movl	$0, 8(%esp)
	movl	$2, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L157:
	call	_take
	movb	%al, -17(%ebp)
	movsbl	-17(%ebp), %eax
	cmpl	$61, %eax
	je	L176
	cmpl	$62, %eax
	je	L177
	cmpl	$45, %eax
	je	L178
	jmp	L233
L177:
	movl	$576, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L178:
	movl	$512, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L176:
	movl	$542, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L233:
	movsbl	-17(%ebp), %eax
	movl	%eax, (%esp)
	call	_replace
	movl	$559, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L164:
	call	_take
	movb	%al, -17(%ebp)
	movsbl	-17(%ebp), %eax
	cmpl	$61, %eax
	je	L180
	cmpl	$62, %eax
	jne	L234
	movl	$557, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L180:
	movl	$537, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L234:
	movsbl	-17(%ebp), %eax
	movl	%eax, (%esp)
	call	_replace
	movl	$554, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L162:
	call	_take
	movb	%al, -17(%ebp)
	movsbl	-17(%ebp), %eax
	cmpl	$60, %eax
	je	L183
	cmpl	$61, %eax
	je	L184
	jmp	L235
L183:
	movl	$558, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L184:
	movl	$538, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L235:
	movsbl	-17(%ebp), %eax
	movl	%eax, (%esp)
	call	_replace
	movl	$556, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L152:
	movl	$514, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L153:
	movl	$515, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L156:
	movl	$533, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L161:
	movl	$523, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L167:
	movl	$524, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L168:
	movl	$525, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L170:
	movl	$526, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L172:
	movl	$527, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L160:
	movl	$530, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L173:
	movl	$569, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L148:
	movl	$518, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L165:
	cmpb	$63, -10(%ebp)
	jne	L166
	call	_take
	call	_take
	movb	%al, -9(%ebp)
	movsbl	-9(%ebp), %eax
	subl	$33, %eax
	cmpl	$29, %eax
	ja	L185
	movl	L187(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L187:
	.long	L186
	.long	L185
	.long	L185
	.long	L185
	.long	L185
	.long	L185
	.long	L188
	.long	L189
	.long	L190
	.long	L185
	.long	L185
	.long	L185
	.long	L191
	.long	L185
	.long	L192
	.long	L185
	.long	L185
	.long	L185
	.long	L185
	.long	L185
	.long	L185
	.long	L185
	.long	L185
	.long	L185
	.long	L185
	.long	L185
	.long	L185
	.long	L193
	.long	L194
	.long	L195
	.text
L189:
	movl	$524, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L190:
	movl	$525, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L193:
	movl	$526, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L195:
	movl	$527, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L194:
	movl	$518, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L192:
	movl	$529, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L188:
	movl	$549, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L186:
	movl	$548, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L191:
	movl	$569, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L185:
	movsbl	-9(%ebp), %eax
	movl	%eax, (%esp)
	call	_replace
	movsbl	-10(%ebp), %eax
	movl	%eax, (%esp)
	call	_replace
	movl	$528, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L166:
	cmpb	$34, -10(%ebp)
	jne	L236
	call	_take
	movb	%al, -9(%ebp)
	call	_peek
	movb	%al, -10(%ebp)
	jmp	L197
L201:
	cmpb	$92, -9(%ebp)
	jne	L198
	cmpb	$34, -10(%ebp)
	jne	L198
	call	_take
	call	_take
	movsbl	-9(%ebp), %edx
	movl	_buffer, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_string_append_char
	movsbl	-10(%ebp), %edx
	movl	_buffer, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_string_append_char
	jmp	L197
L198:
	cmpb	$-1, -9(%ebp)
	je	L199
	cmpb	$10, -9(%ebp)
	jne	L200
L199:
	movl	$LC40, (%esp)
	call	_log_error
L200:
	movsbl	-9(%ebp), %edx
	movl	_buffer, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_string_append_char
	call	_take
	movb	%al, -9(%ebp)
	call	_peek
	movb	%al, -10(%ebp)
L197:
	cmpb	$34, -9(%ebp)
	jne	L201
	movl	_buffer, %eax
	movl	$0, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$10, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L151:
	cmpb	$92, -10(%ebp)
	jne	L202
	call	_take
	movsbl	%al, %edx
	movl	_buffer, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_string_append_char
L202:
	call	_take
	movsbl	%al, %edx
	movl	_buffer, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_string_append_char
	call	_take
	cmpb	$39, %al
	je	L203
	movl	$430, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	$LC41, (%esp)
	call	__assert
L203:
	movl	_buffer, %eax
	movl	$0, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$8, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L147:
	call	_take
	movb	%al, -9(%ebp)
	call	_peek
	movb	%al, -10(%ebp)
	jmp	L204
L208:
	cmpb	$92, -9(%ebp)
	jne	L205
	cmpb	$34, -10(%ebp)
	jne	L205
	call	_take
	call	_take
	movsbl	-9(%ebp), %edx
	movl	_buffer, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_string_append_char
	movsbl	-10(%ebp), %edx
	movl	_buffer, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_string_append_char
	jmp	L204
L205:
	cmpb	$-1, -9(%ebp)
	je	L206
	cmpb	$10, -9(%ebp)
	jne	L207
L206:
	movl	$LC40, (%esp)
	call	_log_error
L207:
	movsbl	-9(%ebp), %edx
	movl	_buffer, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_string_append_char
	call	_take
	movb	%al, -9(%ebp)
	call	_peek
	movb	%al, -10(%ebp)
L204:
	cmpb	$34, -9(%ebp)
	jne	L208
	movl	_buffer, %eax
	movl	$0, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$9, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L158:
	cmpb	$47, -10(%ebp)
	jne	L209
	call	_take
	movb	%al, -9(%ebp)
	jmp	L210
L212:
	movsbl	-9(%ebp), %edx
	movl	_buffer, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_string_append_char
	call	_take
	movb	%al, -9(%ebp)
L210:
	cmpb	$10, -9(%ebp)
	je	L211
	cmpb	$-1, -9(%ebp)
	jne	L212
L211:
	movsbl	-9(%ebp), %eax
	movl	%eax, (%esp)
	call	_replace
	movl	_buffer, %eax
	movl	$0, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$3, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L209:
	cmpb	$42, -10(%ebp)
	jne	L213
	call	_take
	movb	%al, -9(%ebp)
L217:
	cmpb	$42, -9(%ebp)
	jne	L214
	call	_peek
	cmpb	$47, %al
	je	L237
L214:
	cmpb	$-1, -9(%ebp)
	jne	L216
	movl	$LC42, (%esp)
	call	_log_warning
	jmp	L215
L216:
	movsbl	-9(%ebp), %edx
	movl	_buffer, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_string_append_char
	call	_take
	movb	%al, -9(%ebp)
	jmp	L217
L237:
	nop
L215:
	call	_take
	movl	_buffer, %eax
	movl	$0, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$3, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L213:
	cmpb	$61, -10(%ebp)
	jne	L218
	call	_take
	movl	$540, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L218:
	movl	$562, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L163:
	call	_take
	movb	%al, -17(%ebp)
	cmpb	$61, -17(%ebp)
	jne	L219
	movl	$552, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L219:
	movsbl	-17(%ebp), %eax
	movl	%eax, (%esp)
	call	_replace
	movl	$544, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L154:
	call	_take
	movb	%al, -17(%ebp)
	cmpb	$61, -17(%ebp)
	jne	L220
	movl	$541, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L220:
	movsbl	-17(%ebp), %eax
	movl	%eax, (%esp)
	call	_replace
	movl	$516, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L146:
	call	_take
	movb	%al, -17(%ebp)
	cmpb	$61, -17(%ebp)
	jne	L221
	movl	$551, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L221:
	movsbl	-17(%ebp), %eax
	movl	%eax, (%esp)
	call	_replace
	movl	$570, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L169:
	call	_take
	movb	%al, -17(%ebp)
	cmpb	$61, -17(%ebp)
	jne	L222
	movl	$535, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L222:
	movsbl	-17(%ebp), %eax
	movl	%eax, (%esp)
	call	_replace
	movl	$549, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L149:
	call	_take
	movb	%al, -17(%ebp)
	cmpb	$61, -17(%ebp)
	jne	L223
	movl	$539, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L223:
	movsbl	-17(%ebp), %eax
	movl	%eax, (%esp)
	call	_replace
	movl	$561, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L155:
	call	_take
	movb	%al, -17(%ebp)
	cmpb	$43, -17(%ebp)
	jne	L224
	movl	$513, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L224:
	cmpb	$61, -17(%ebp)
	jne	L225
	movl	$543, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L225:
	movsbl	-17(%ebp), %eax
	movl	%eax, (%esp)
	call	_replace
	movl	$560, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L150:
	call	_take
	movb	%al, -17(%ebp)
	cmpb	$61, -17(%ebp)
	jne	L226
	movl	$536, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L226:
	cmpb	$38, -17(%ebp)
	jne	L227
	movl	$547, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L227:
	movsbl	-17(%ebp), %eax
	movl	%eax, (%esp)
	call	_replace
	movl	$517, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L171:
	call	_take
	movb	%al, -17(%ebp)
	cmpb	$61, -17(%ebp)
	jne	L228
	movl	$534, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L228:
	cmpb	$124, -17(%ebp)
	jne	L229
	movl	$546, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L229:
	movsbl	-17(%ebp), %eax
	movl	%eax, (%esp)
	call	_replace
	movl	$548, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L159:
	movl	_buffer, %edx
	movsbl	-9(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	-16(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_scan_number
	jmp	L174
L236:
	nop
L141:
	call	_take
	movb	%al, -9(%ebp)
	jmp	L230
L231:
	movsbl	-9(%ebp), %edx
	movl	_buffer, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_string_append_char
	call	_take
	movb	%al, -9(%ebp)
L230:
	movsbl	-9(%ebp), %eax
	movl	%eax, (%esp)
	call	_valid_char
	testl	%eax, %eax
	jne	L231
	movsbl	-9(%ebp), %eax
	movl	%eax, (%esp)
	call	_replace
	movl	_buffer, %eax
	movl	%eax, (%esp)
	call	_string_body
	movl	%eax, (%esp)
	call	_keyword_id
	movl	%eax, -24(%ebp)
	cmpl	$-1, -24(%ebp)
	jne	L232
	movl	_buffer, %eax
	movl	$0, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$4, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	jmp	L174
L232:
	movl	-24(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$0, 8(%esp)
	movl	$5, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
L174:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE47:
	.globl	_skip_to_newline
	.def	_skip_to_newline;	.scl	2;	.type	32;	.endef
_skip_to_newline:
LFB48:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	jmp	L239
L241:
	cmpl	$-1, -12(%ebp)
	jne	L239
	movl	-12(%ebp), %eax
	movsbl	%al, %eax
	movl	%eax, (%esp)
	call	_replace
	jmp	L240
L239:
	call	_take
	movsbl	%al, %eax
	movl	%eax, -12(%ebp)
	cmpl	$10, -12(%ebp)
	jne	L241
L240:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE48:
	.globl	_make_token
	.def	_make_token;	.scl	2;	.type	32;	.endef
_make_token:
LFB49:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, (%eax)
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	12(%ebp), %eax
	cmpl	$5, %eax
	je	L244
	cmpl	$5, %eax
	ja	L245
	cmpl	$2, %eax
	ja	L243
	jmp	L244
L245:
	cmpl	$7, %eax
	jne	L243
L244:
	movl	20(%ebp), %edx
	movl	-12(%ebp), %eax
	movl	%edx, 8(%eax)
	jmp	L246
L243:
	movl	16(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_string_length
	addl	$1, %eax
	movl	%eax, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_string_length
	leal	1(%eax), %ebx
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_string_body
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%ebx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strncpy
	nop
L246:
	movl	-12(%ebp), %eax
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE49:
	.def	_push_token;	.scl	3;	.type	32;	.endef
_push_token:
LFB50:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	_tokens, %eax
	movl	8(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_vector_append
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE50:
	.def	_push_token_if_valid;	.scl	3;	.type	32;	.endef
_push_token_if_valid:
LFB51:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L251
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	je	L251
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_push_token
L251:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE51:
	.globl	_expand_token_list
	.def	_expand_token_list;	.scl	2;	.type	32;	.endef
_expand_token_list:
LFB52:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -12(%ebp)
	jmp	L253
L256:
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_push_token_if_valid
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$2, %eax
	jne	L254
	movl	$0, %eax
	jmp	L252
L254:
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -12(%ebp)
L253:
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	jne	L256
L252:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE52:
	.globl	_scan_line
	.def	_scan_line;	.scl	2;	.type	32;	.endef
_scan_line:
LFB53:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	call	_scan
	movl	%eax, -12(%ebp)
	jmp	L258
L262:
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_push_token_if_valid
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$2, %eax
	jne	L259
	movl	$0, %eax
	jmp	L260
L259:
	call	_scan
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_print_token
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_tident
	testl	%eax, %eax
	je	L258
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_macro_exists
	testl	%eax, %eax
	je	L258
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_get_macro
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_expand_token_list
	testl	%eax, %eax
	jne	L261
	movl	$0, %eax
	jmp	L260
L261:
	call	_scan
	movl	%eax, -12(%ebp)
L258:
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_tnewline
	testl	%eax, %eax
	je	L262
	movl	$1, %eax
L260:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE53:
	.section .rdata,"dr"
LC43:
	.ascii "\0"
	.text
	.globl	_scan_cpp_line
	.def	_scan_cpp_line;	.scl	2;	.type	32;	.endef
_scan_cpp_line:
LFB54:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	call	_make_vector
	movl	%eax, -16(%ebp)
	movl	$LC43, (%esp)
	call	_make_string
	movl	%eax, -20(%ebp)
	movl	$0, -24(%ebp)
	jmp	L264
L268:
	movsbl	-25(%ebp), %eax
	cmpl	$35, %eax
	jne	L272
	call	_peek
	movb	%al, -26(%ebp)
	cmpb	$35, -26(%ebp)
	jne	L267
	movl	$532, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	movl	%eax, -32(%ebp)
	movl	-32(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_append
	jmp	L264
L267:
	movl	$531, 12(%esp)
	movl	$0, 8(%esp)
	movl	$7, 4(%esp)
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_token
	movl	%eax, -32(%ebp)
	movl	-32(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_append
	jmp	L264
L272:
	movsbl	-25(%ebp), %eax
	movl	%eax, (%esp)
	call	_replace
	call	_scan
	movl	%eax, -32(%ebp)
	movl	-32(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_append
L264:
	call	_take
	movb	%al, -25(%ebp)
	cmpb	$10, -25(%ebp)
	jne	L268
	movl	$0, -12(%ebp)
	jmp	L269
L270:
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_get
	movl	%eax, (%esp)
	call	_print_token
	addl	$1, -12(%ebp)
L269:
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_length
	cmpl	-12(%ebp), %eax
	ja	L270
	movl	-16(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE54:
	.globl	_do_lex
	.def	_do_lex;	.scl	2;	.type	32;	.endef
_do_lex:
LFB55:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$1, -12(%ebp)
	call	_make_vector
	movl	%eax, _tokens
	movl	$0, _position
	call	_get_current_module
	movl	%eax, _current
	movl	_current, %eax
	movl	(%eax), %eax
	movl	%eax, -16(%ebp)
	movl	$LC43, (%esp)
	call	_make_string
	movl	%eax, _buffer
	jmp	L274
L279:
	call	_peek
	movb	%al, -17(%ebp)
	movsbl	-17(%ebp), %eax
	cmpl	$-1, %eax
	je	L276
	cmpl	$35, %eax
	jne	L280
	call	_take
	call	_parse_cpp_directive
	movl	%eax, -12(%ebp)
	jmp	L278
L276:
	movl	$0, -12(%ebp)
	jmp	L278
L280:
	call	_scan_line
	movl	%eax, -12(%ebp)
	nop
L278:
	cmpl	$0, -12(%ebp)
	jne	L274
	call	_pop_file
	testl	%eax, %eax
	je	L274
	movl	$1, -12(%ebp)
L274:
	cmpl	$0, -12(%ebp)
	jne	L279
	movl	_current, %eax
	movl	_tokens, %edx
	movl	%edx, 12(%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE55:
	.globl	_do_lex_string
	.def	_do_lex_string;	.scl	2;	.type	32;	.endef
_do_lex_string:
LFB56:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	call	_make_vector
	movl	%eax, _tokens
	movl	$0, _position
	call	_get_current_module
	movl	%eax, _current
	movl	_current, %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	$LC43, (%esp)
	call	_make_string
	movl	%eax, _buffer
L285:
	call	_scan
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L282
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_push_token
L282:
	movl	_buffer, %eax
	movl	%eax, (%esp)
	call	_string_clean
	movl	-12(%ebp), %eax
	movl	4(%eax), %ebx
	movl	-12(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, (%esp)
	call	_string_length
	cmpl	%eax, %ebx
	jnb	L287
	jmp	L285
L287:
	nop
	movl	_current, %eax
	movl	_tokens, %edx
	movl	%edx, 12(%eax)
	nop
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE56:
	.section .rdata,"dr"
LC44:
	.ascii "<type=%s, id='%s'>\12\0"
LC45:
	.ascii "<type=%s, value='%s'>\12\0"
LC46:
	.ascii "<type=%s>\12\0"
	.text
	.globl	_print_token
	.def	_print_token;	.scl	2;	.type	32;	.endef
_print_token:
LFB57:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	cmpl	$5, %eax
	je	L290
	cmpl	$5, %eax
	jg	L291
	cmpl	$4, %eax
	je	L292
	jmp	L289
L291:
	cmpl	$6, %eax
	je	L292
	cmpl	$7, %eax
	je	L293
	jmp	L289
L290:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_kw2s
	movl	%eax, %ebx
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_ty2s
	movl	%ebx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC44, (%esp)
	call	_printf
	jmp	L294
L293:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_op2s
	movl	%eax, %ebx
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_ty2s
	movl	%ebx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC44, (%esp)
	call	_printf
	jmp	L294
L292:
	movl	8(%ebp), %eax
	movl	8(%eax), %ebx
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_ty2s
	movl	%ebx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC45, (%esp)
	call	_printf
	jmp	L294
L289:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_ty2s
	movl	%eax, 4(%esp)
	movl	$LC46, (%esp)
	call	_printf
L294:
	nop
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE57:
	.globl	_print_tokens
	.def	_print_tokens;	.scl	2;	.type	32;	.endef
_print_tokens:
LFB58:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L296
L297:
	movl	_tokens, %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_vector_get
	movl	%eax, (%esp)
	call	_print_token
	addl	$1, -12(%ebp)
L296:
	movl	_tokens, %eax
	movl	%eax, (%esp)
	call	_vector_length
	cmpl	-12(%ebp), %eax
	ja	L297
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE58:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_vector_get;	.scl	2;	.type	32;	.endef
	.def	__assert;	.scl	2;	.type	32;	.endef
	.def	_vector_length;	.scl	2;	.type	32;	.endef
	.def	_log_error;	.scl	2;	.type	32;	.endef
	.def	_strcmp;	.scl	2;	.type	32;	.endef
	.def	_take;	.scl	2;	.type	32;	.endef
	.def	_string_append_char;	.scl	2;	.type	32;	.endef
	.def	_replace;	.scl	2;	.type	32;	.endef
	.def	_string_clean;	.scl	2;	.type	32;	.endef
	.def	_peek;	.scl	2;	.type	32;	.endef
	.def	_log_warning;	.scl	2;	.type	32;	.endef
	.def	_string_body;	.scl	2;	.type	32;	.endef
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_string_length;	.scl	2;	.type	32;	.endef
	.def	_strncpy;	.scl	2;	.type	32;	.endef
	.def	_vector_append;	.scl	2;	.type	32;	.endef
	.def	_macro_exists;	.scl	2;	.type	32;	.endef
	.def	_get_macro;	.scl	2;	.type	32;	.endef
	.def	_make_vector;	.scl	2;	.type	32;	.endef
	.def	_make_string;	.scl	2;	.type	32;	.endef
	.def	_get_current_module;	.scl	2;	.type	32;	.endef
	.def	_parse_cpp_directive;	.scl	2;	.type	32;	.endef
	.def	_pop_file;	.scl	2;	.type	32;	.endef
	.def	_kw2s;	.scl	2;	.type	32;	.endef
	.def	_ty2s;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_op2s;	.scl	2;	.type	32;	.endef
