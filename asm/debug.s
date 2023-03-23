	.file	"debug.c"
.lcomm _debug_memory,4,4
	.section .rdata,"dr"
LC0:
	.ascii "TYSPACE\0"
LC1:
	.ascii "TYNEWLINE\0"
LC2:
	.ascii "TYEOF\0"
LC3:
	.ascii "TYCOMMENT\0"
LC4:
	.ascii "TYIDENT\0"
LC5:
	.ascii "TYKEYWORD\0"
LC6:
	.ascii "TYNUMBER\0"
LC7:
	.ascii "TYSYMBOL\0"
LC8:
	.ascii "TYCHAR\0"
LC9:
	.ascii "TYSTRING\0"
LC10:
	.ascii "TYNOTFOUND\0"
	.text
	.globl	_ty2s
	.def	_ty2s;	.scl	2;	.type	32;	.endef
_ty2s:
LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	cmpl	$9, 8(%ebp)
	ja	L2
	movl	8(%ebp), %eax
	sall	$2, %eax
	addl	$L4, %eax
	movl	(%eax), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L4:
	.long	L3
	.long	L5
	.long	L6
	.long	L7
	.long	L8
	.long	L9
	.long	L10
	.long	L11
	.long	L12
	.long	L13
	.text
L3:
	movl	$LC0, %eax
	jmp	L14
L5:
	movl	$LC1, %eax
	jmp	L14
L6:
	movl	$LC2, %eax
	jmp	L14
L7:
	movl	$LC3, %eax
	jmp	L14
L8:
	movl	$LC4, %eax
	jmp	L14
L9:
	movl	$LC5, %eax
	jmp	L14
L10:
	movl	$LC6, %eax
	jmp	L14
L11:
	movl	$LC7, %eax
	jmp	L14
L12:
	movl	$LC8, %eax
	jmp	L14
L13:
	movl	$LC9, %eax
	jmp	L14
L2:
	movl	$LC10, %eax
L14:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.section .rdata,"dr"
LC11:
	.ascii "<type=%s, id='%s'>\12\0"
LC12:
	.ascii "<type=%s, value='%s'>\12\0"
LC13:
	.ascii "<type=%s>\12\0"
	.text
	.globl	_tok2s
	.def	_tok2s;	.scl	2;	.type	32;	.endef
_tok2s:
LFB26:
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
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	cmpl	$5, %eax
	je	L17
	cmpl	$5, %eax
	jg	L18
	cmpl	$4, %eax
	je	L19
	jmp	L16
L18:
	cmpl	$6, %eax
	je	L19
	cmpl	$7, %eax
	je	L20
	jmp	L16
L17:
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
	movl	$LC11, (%esp)
	call	_make_fmt_string
	movl	%eax, -12(%ebp)
	jmp	L21
L20:
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
	movl	$LC11, (%esp)
	call	_make_fmt_string
	movl	%eax, -12(%ebp)
	jmp	L21
L19:
	movl	8(%ebp), %eax
	movl	8(%eax), %ebx
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_ty2s
	movl	%ebx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC12, (%esp)
	call	_make_fmt_string
	movl	%eax, -12(%ebp)
	jmp	L21
L16:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_ty2s
	movl	%eax, 4(%esp)
	movl	$LC13, (%esp)
	call	_make_fmt_string
	movl	%eax, -12(%ebp)
L21:
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_string_body
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.section .rdata,"dr"
LC14:
	.ascii "auto\0"
LC15:
	.ascii "break\0"
LC16:
	.ascii "case\0"
LC17:
	.ascii "char\0"
LC18:
	.ascii "const\0"
LC19:
	.ascii "continue\0"
LC20:
	.ascii "default\0"
LC21:
	.ascii "do\0"
LC22:
	.ascii "double\0"
LC23:
	.ascii "else\0"
LC24:
	.ascii "enum\0"
LC25:
	.ascii "extern\0"
LC26:
	.ascii "float\0"
LC27:
	.ascii "for\0"
LC28:
	.ascii "goto\0"
LC29:
	.ascii "if\0"
LC30:
	.ascii "int\0"
LC31:
	.ascii "long\0"
LC32:
	.ascii "register\0"
LC33:
	.ascii "return\0"
LC34:
	.ascii "short\0"
LC35:
	.ascii "signed\0"
LC36:
	.ascii "sizeof\0"
LC37:
	.ascii "static\0"
LC38:
	.ascii "struct\0"
LC39:
	.ascii "switch\0"
LC40:
	.ascii "typedef\0"
LC41:
	.ascii "union\0"
LC42:
	.ascii "unsigned\0"
LC43:
	.ascii "void\0"
LC44:
	.ascii "volatile\0"
LC45:
	.ascii "while\0"
LC46:
	.ascii "__printident\0"
LC47:
	.ascii "KWNOTFOUND\0"
	.text
	.globl	_kw2s
	.def	_kw2s;	.scl	2;	.type	32;	.endef
_kw2s:
LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	cmpl	$32, 8(%ebp)
	ja	L24
	movl	8(%ebp), %eax
	sall	$2, %eax
	addl	$L26, %eax
	movl	(%eax), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L26:
	.long	L25
	.long	L27
	.long	L28
	.long	L29
	.long	L30
	.long	L31
	.long	L32
	.long	L33
	.long	L34
	.long	L35
	.long	L36
	.long	L37
	.long	L38
	.long	L39
	.long	L40
	.long	L41
	.long	L42
	.long	L43
	.long	L44
	.long	L45
	.long	L46
	.long	L47
	.long	L48
	.long	L49
	.long	L50
	.long	L51
	.long	L52
	.long	L53
	.long	L54
	.long	L55
	.long	L56
	.long	L57
	.long	L58
	.text
L25:
	movl	$LC14, %eax
	jmp	L59
L27:
	movl	$LC15, %eax
	jmp	L59
L28:
	movl	$LC16, %eax
	jmp	L59
L29:
	movl	$LC17, %eax
	jmp	L59
L30:
	movl	$LC18, %eax
	jmp	L59
L31:
	movl	$LC19, %eax
	jmp	L59
L32:
	movl	$LC20, %eax
	jmp	L59
L33:
	movl	$LC21, %eax
	jmp	L59
L34:
	movl	$LC22, %eax
	jmp	L59
L35:
	movl	$LC23, %eax
	jmp	L59
L36:
	movl	$LC24, %eax
	jmp	L59
L37:
	movl	$LC25, %eax
	jmp	L59
L38:
	movl	$LC26, %eax
	jmp	L59
L39:
	movl	$LC27, %eax
	jmp	L59
L40:
	movl	$LC28, %eax
	jmp	L59
L41:
	movl	$LC29, %eax
	jmp	L59
L42:
	movl	$LC30, %eax
	jmp	L59
L43:
	movl	$LC31, %eax
	jmp	L59
L44:
	movl	$LC32, %eax
	jmp	L59
L45:
	movl	$LC33, %eax
	jmp	L59
L46:
	movl	$LC34, %eax
	jmp	L59
L47:
	movl	$LC35, %eax
	jmp	L59
L48:
	movl	$LC36, %eax
	jmp	L59
L49:
	movl	$LC37, %eax
	jmp	L59
L50:
	movl	$LC38, %eax
	jmp	L59
L51:
	movl	$LC39, %eax
	jmp	L59
L52:
	movl	$LC40, %eax
	jmp	L59
L53:
	movl	$LC41, %eax
	jmp	L59
L54:
	movl	$LC42, %eax
	jmp	L59
L55:
	movl	$LC43, %eax
	jmp	L59
L56:
	movl	$LC44, %eax
	jmp	L59
L57:
	movl	$LC45, %eax
	jmp	L59
L58:
	movl	$LC46, %eax
	jmp	L59
L24:
	movl	$LC47, %eax
L59:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.section .rdata,"dr"
LC48:
	.ascii "=\0"
LC49:
	.ascii "--\0"
LC50:
	.ascii "++\0"
LC51:
	.ascii "(\0"
LC52:
	.ascii ")\0"
LC53:
	.ascii "*\0"
LC54:
	.ascii "&\0"
LC55:
	.ascii "->\0"
LC56:
	.ascii "+=\0"
LC57:
	.ascii "&=\0"
LC58:
	.ascii "/=\0"
LC59:
	.ascii "%=\0"
LC60:
	.ascii "*=\0"
LC61:
	.ascii "|=\0"
LC62:
	.ascii "<<=\0"
LC63:
	.ascii ">>=\0"
LC64:
	.ascii "-=\0"
LC65:
	.ascii "^=\0"
LC66:
	.ascii "==\0"
LC67:
	.ascii ">\0"
LC68:
	.ascii "<\0"
LC69:
	.ascii ">=\0"
LC70:
	.ascii "<=\0"
LC71:
	.ascii "&&\0"
LC72:
	.ascii "||\0"
LC73:
	.ascii "!=\0"
LC74:
	.ascii "-\0"
LC75:
	.ascii "+\0"
LC76:
	.ascii "%\0"
LC77:
	.ascii "/\0"
LC78:
	.ascii "<<\0"
LC79:
	.ascii ">>\0"
LC80:
	.ascii ",\0"
LC81:
	.ascii "alignof\0"
LC82:
	.ascii "typecast\0"
LC83:
	.ascii "^\0"
LC84:
	.ascii "~\0"
LC85:
	.ascii "!\0"
LC86:
	.ascii ".\0"
LC87:
	.ascii "[]\0"
LC88:
	.ascii "()\0"
LC89:
	.ascii "#\0"
LC90:
	.ascii "\\t\0"
LC91:
	.ascii "eof\0"
LC92:
	.ascii "\\n\0"
LC93:
	.ascii "\\s\0"
LC94:
	.ascii ";\0"
LC95:
	.ascii "[\0"
LC96:
	.ascii "]\0"
LC97:
	.ascii "{\0"
LC98:
	.ascii "}\0"
LC99:
	.ascii "?\0"
LC100:
	.ascii "\\\0"
LC101:
	.ascii ":\0"
LC102:
	.ascii "OP_NOTFOUND\0"
	.text
	.globl	_op2s
	.def	_op2s;	.scl	2;	.type	32;	.endef
_op2s:
LFB28:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	subl	$512, %eax
	cmpl	$69, %eax
	ja	L61
	movl	L63(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L63:
	.long	L62
	.long	L64
	.long	L65
	.long	L66
	.long	L67
	.long	L68
	.long	L69
	.long	L70
	.long	L71
	.long	L72
	.long	L73
	.long	L74
	.long	L75
	.long	L76
	.long	L77
	.long	L78
	.long	L79
	.long	L80
	.long	L81
	.long	L61
	.long	L61
	.long	L82
	.long	L83
	.long	L84
	.long	L85
	.long	L86
	.long	L87
	.long	L88
	.long	L89
	.long	L90
	.long	L91
	.long	L92
	.long	L93
	.long	L61
	.long	L94
	.long	L95
	.long	L61
	.long	L96
	.long	L68
	.long	L97
	.long	L98
	.long	L99
	.long	L100
	.long	L101
	.long	L102
	.long	L103
	.long	L104
	.long	L105
	.long	L106
	.long	L107
	.long	L108
	.long	L109
	.long	L110
	.long	L111
	.long	L68
	.long	L109
	.long	L112
	.long	L113
	.long	L114
	.long	L105
	.long	L106
	.long	L62
	.long	L64
	.long	L61
	.long	L115
	.long	L116
	.long	L117
	.long	L118
	.long	L62
	.long	L64
	.text
L93:
	movl	$LC48, %eax
	jmp	L119
L62:
	movl	$LC49, %eax
	jmp	L119
L64:
	movl	$LC50, %eax
	jmp	L119
L65:
	movl	$LC51, %eax
	jmp	L119
L66:
	movl	$LC52, %eax
	jmp	L119
L67:
	movl	$LC53, %eax
	jmp	L119
L68:
	movl	$LC54, %eax
	jmp	L119
L115:
	movl	$LC55, %eax
	jmp	L119
L92:
	movl	$LC56, %eax
	jmp	L119
L85:
	movl	$LC57, %eax
	jmp	L119
L89:
	movl	$LC58, %eax
	jmp	L119
L88:
	movl	$LC59, %eax
	jmp	L119
L90:
	movl	$LC60, %eax
	jmp	L119
L83:
	movl	$LC61, %eax
	jmp	L119
L87:
	movl	$LC62, %eax
	jmp	L119
L86:
	movl	$LC63, %eax
	jmp	L119
L91:
	movl	$LC64, %eax
	jmp	L119
L84:
	movl	$LC65, %eax
	jmp	L119
L98:
	movl	$LC66, %eax
	jmp	L119
L100:
	movl	$LC67, %eax
	jmp	L119
L102:
	movl	$LC68, %eax
	jmp	L119
L99:
	movl	$LC69, %eax
	jmp	L119
L101:
	movl	$LC70, %eax
	jmp	L119
L95:
	movl	$LC71, %eax
	jmp	L119
L94:
	movl	$LC72, %eax
	jmp	L119
L97:
	movl	$LC73, %eax
	jmp	L119
L105:
	movl	$LC74, %eax
	jmp	L119
L106:
	movl	$LC75, %eax
	jmp	L119
L107:
	movl	$LC76, %eax
	jmp	L119
L108:
	movl	$LC77, %eax
	jmp	L119
L109:
	movl	$LC53, %eax
	jmp	L119
L104:
	movl	$LC78, %eax
	jmp	L119
L103:
	movl	$LC79, %eax
	jmp	L119
L82:
	movl	$LC80, %eax
	jmp	L119
L110:
	movl	$LC81, %eax
	jmp	L119
L111:
	movl	$LC36, %eax
	jmp	L119
L112:
	movl	$LC82, %eax
	jmp	L119
L96:
	movl	$LC83, %eax
	jmp	L119
L113:
	movl	$LC84, %eax
	jmp	L119
L114:
	movl	$LC85, %eax
	jmp	L119
L116:
	movl	$LC86, %eax
	jmp	L119
L117:
	movl	$LC87, %eax
	jmp	L119
L118:
	movl	$LC88, %eax
	jmp	L119
L69:
	movl	$LC89, %eax
	jmp	L119
L70:
	movl	$LC90, %eax
	jmp	L119
L71:
	movl	$LC91, %eax
	jmp	L119
L72:
	movl	$LC92, %eax
	jmp	L119
L73:
	movl	$LC93, %eax
	jmp	L119
L74:
	movl	$LC94, %eax
	jmp	L119
L75:
	movl	$LC95, %eax
	jmp	L119
L76:
	movl	$LC96, %eax
	jmp	L119
L77:
	movl	$LC97, %eax
	jmp	L119
L78:
	movl	$LC98, %eax
	jmp	L119
L79:
	movl	$LC99, %eax
	jmp	L119
L80:
	movl	$LC100, %eax
	jmp	L119
L81:
	movl	$LC101, %eax
	jmp	L119
L61:
	movl	$LC102, %eax
L119:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.section .rdata,"dr"
LC103:
	.ascii "STORAGE_NOTSET\0"
	.text
	.globl	_storagetype2s
	.def	_storagetype2s;	.scl	2;	.type	32;	.endef
_storagetype2s:
LFB29:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	cmpl	$1, %eax
	je	L122
	cmpl	$1, %eax
	jg	L123
	testl	%eax, %eax
	je	L124
	jmp	L121
L123:
	cmpl	$2, %eax
	je	L125
	cmpl	$3, %eax
	je	L126
	jmp	L121
L124:
	movl	$LC14, %eax
	jmp	L127
L122:
	movl	$LC25, %eax
	jmp	L127
L125:
	movl	$LC37, %eax
	jmp	L127
L126:
	movl	$LC32, %eax
	jmp	L127
L121:
	movl	$LC103, %eax
L127:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE29:
	.section .rdata,"dr"
LC104:
	.ascii "RECTYPE_NOTSET\0"
	.text
	.globl	_recordtype2s
	.def	_recordtype2s;	.scl	2;	.type	32;	.endef
_recordtype2s:
LFB30:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	cmpl	$1, %eax
	je	L130
	cmpl	$2, %eax
	je	L131
	testl	%eax, %eax
	jne	L134
	movl	$LC20, %eax
	jmp	L133
L130:
	movl	$LC38, %eax
	jmp	L133
L131:
	movl	$LC41, %eax
	jmp	L133
L134:
	movl	$LC104, %eax
L133:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE30:
	.section .rdata,"dr"
LC105:
	.ascii "long long\0"
LC106:
	.ascii "stub\0"
LC107:
	.ascii "CTYPENOTSET\0"
	.text
	.globl	_ctypekind2s
	.def	_ctypekind2s;	.scl	2;	.type	32;	.endef
_ctypekind2s:
LFB31:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$14, %eax
	ja	L136
	movl	L138(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L138:
	.long	L137
	.long	L139
	.long	L136
	.long	L140
	.long	L141
	.long	L136
	.long	L136
	.long	L142
	.long	L143
	.long	L136
	.long	L144
	.long	L145
	.long	L146
	.long	L136
	.long	L147
	.text
L137:
	movl	$LC17, %eax
	jmp	L148
L139:
	movl	$LC34, %eax
	jmp	L148
L140:
	movl	$LC30, %eax
	jmp	L148
L141:
	movl	$LC31, %eax
	jmp	L148
L142:
	movl	$LC22, %eax
	jmp	L148
L143:
	movl	$LC26, %eax
	jmp	L148
L144:
	movl	$LC105, %eax
	jmp	L148
L145:
	movl	$LC43, %eax
	jmp	L148
L146:
	movl	$LC38, %eax
	jmp	L148
L147:
	movl	$LC106, %eax
	jmp	L148
L136:
	movl	$LC107, %eax
L148:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE31:
	.section .rdata,"dr"
	.align 4
LC108:
	.ascii "(Type: kind:%s, bytes:%d, unsigned:%d, const:%d, storage:%s, record:%s, ptr:%d, params:%d)\0"
	.text
	.globl	_ctype2s
	.def	_ctype2s;	.scl	2;	.type	32;	.endef
_ctype2s:
LFB32:
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
	movl	8(%ebp), %eax
	movl	44(%eax), %eax
	testl	%eax, %eax
	je	L150
	movl	8(%ebp), %eax
	movl	44(%eax), %eax
	movl	(%eax), %ebx
	jmp	L151
L150:
	movl	$0, %ebx
L151:
	movl	8(%ebp), %eax
	movl	40(%eax), %eax
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	movl	%eax, -44(%ebp)
	movl	8(%ebp), %eax
	movl	24(%eax), %eax
	movl	%eax, (%esp)
	call	_recordtype2s
	movl	%eax, -48(%ebp)
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	movl	%eax, (%esp)
	call	_storagetype2s
	movl	%eax, -52(%ebp)
	movl	8(%ebp), %eax
	movl	16(%eax), %ecx
	movl	%ecx, -56(%ebp)
	movl	8(%ebp), %eax
	movl	12(%eax), %edi
	movl	8(%ebp), %eax
	movl	4(%eax), %esi
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_ctypekind2s
	movl	%ebx, 32(%esp)
	movl	-44(%ebp), %edx
	movl	%edx, 28(%esp)
	movl	-48(%ebp), %edx
	movl	%edx, 24(%esp)
	movl	-52(%ebp), %ebx
	movl	%ebx, 20(%esp)
	movl	-56(%ebp), %ecx
	movl	%ecx, 16(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC108, (%esp)
	call	_make_fmt_string
	movl	%eax, -28(%ebp)
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_string_body
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
LFE32:
	.section .rdata,"dr"
LC109:
	.ascii "AST_NUMBER\0"
LC110:
	.ascii "(Node: kind:%s, ival:%d)\12\0"
	.text
	.globl	_ast_number_2s
	.def	_ast_number_2s;	.scl	2;	.type	32;	.endef
_ast_number_2s:
LFB33:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %edx
	movl	24(%eax), %eax
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	movl	$LC109, 4(%esp)
	movl	$LC110, (%esp)
	call	_make_fmt_string
	movl	%eax, (%esp)
	call	_string_body
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE33:
	.section .rdata,"dr"
LC111:
	.ascii "AST_IDENT\0"
	.align 4
LC112:
	.ascii "(Node: kind:%s, ident_type:%s, ident_offset:%d)\12\0"
	.text
	.globl	_ast_ident_2s
	.def	_ast_ident_2s;	.scl	2;	.type	32;	.endef
_ast_ident_2s:
LFB34:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	movl	8(%ebp), %eax
	movl	8(%eax), %ebx
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, (%esp)
	call	_ctype2s
	movl	%ebx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$LC111, 4(%esp)
	movl	$LC112, (%esp)
	call	_make_fmt_string
	movl	%eax, (%esp)
	call	_string_body
	addl	$20, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE34:
	.section .rdata,"dr"
LC113:
	.ascii "AST_ASSIGN\0"
	.align 4
LC114:
	.ascii "(Node: kind:%s, offset:%d, valtype:wip)\12\0"
	.text
	.globl	_ast_assign_2s
	.def	_ast_assign_2s;	.scl	2;	.type	32;	.endef
_ast_assign_2s:
LFB35:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	8(%eax), %eax
	movl	%eax, 8(%esp)
	movl	$LC113, 4(%esp)
	movl	$LC114, (%esp)
	call	_make_fmt_string
	movl	%eax, (%esp)
	call	_string_body
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE35:
	.section .rdata,"dr"
LC115:
	.ascii "AST_BINOP\0"
	.align 4
LC116:
	.ascii "(Node: kind:%s, symbol:%s, lchild:%s, rchild:%s)\12\0"
	.text
	.globl	_ast_binop_2s
	.def	_ast_binop_2s;	.scl	2;	.type	32;	.endef
_ast_binop_2s:
LFB36:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$32, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	jne	L160
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_op2s
	movl	%eax, %ebx
	jmp	L161
L160:
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, (%esp)
	call	_node2s
	movl	%eax, %ebx
L161:
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	16(%eax), %eax
	movl	%eax, (%esp)
	call	_ctype2s
	movl	%eax, %esi
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_op2s
	movl	%ebx, 16(%esp)
	movl	%esi, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$LC115, 4(%esp)
	movl	$LC116, (%esp)
	call	_make_fmt_string
	movl	%eax, (%esp)
	call	_string_body
	addl	$32, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE36:
	.section .rdata,"dr"
LC117:
	.ascii "AST_FUNCDEF\0"
	.align 4
LC118:
	.ascii "(Node: kind:%s, fblabel:%s, felabel:%s, fsize:%d, fparams:%d, fstmts:%d, frettype:%s)\12\0"
	.text
	.globl	_ast_funcdef_2s
	.def	_ast_funcdef_2s;	.scl	2;	.type	32;	.endef
_ast_funcdef_2s:
LFB37:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$44, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	movl	%eax, (%esp)
	call	_ctype2s
	movl	%eax, %edi
	movl	8(%ebp), %eax
	movl	32(%eax), %eax
	testl	%eax, %eax
	je	L164
	movl	8(%ebp), %eax
	movl	32(%eax), %eax
	movl	(%eax), %edx
	jmp	L165
L164:
	movl	$0, %edx
L165:
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	testl	%eax, %eax
	je	L166
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	(%eax), %eax
	jmp	L167
L166:
	movl	$0, %eax
L167:
	movl	8(%ebp), %ecx
	movl	8(%ecx), %esi
	movl	8(%ebp), %ecx
	movl	16(%ecx), %ebx
	movl	8(%ebp), %ecx
	movl	12(%ecx), %ecx
	movl	%edi, 28(%esp)
	movl	%edx, 24(%esp)
	movl	%eax, 20(%esp)
	movl	%esi, 16(%esp)
	movl	%ebx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	$LC117, 4(%esp)
	movl	$LC118, (%esp)
	call	_make_fmt_string
	movl	%eax, (%esp)
	call	_string_body
	addl	$44, %esp
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
LFE37:
	.section .rdata,"dr"
LC119:
	.ascii "AST_FUNCCALL\0"
	.align 4
LC120:
	.ascii "(Node: kind:%s, fcptrname:%s, fcparamsize:%d)\12\0"
	.text
	.globl	_ast_funccall_2s
	.def	_ast_funccall_2s;	.scl	2;	.type	32;	.endef
_ast_funccall_2s:
LFB38:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	(%eax), %edx
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	24(%eax), %eax
	movl	8(%eax), %eax
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$LC119, 4(%esp)
	movl	$LC120, (%esp)
	call	_make_fmt_string
	movl	%eax, (%esp)
	call	_string_body
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE38:
	.section .rdata,"dr"
LC121:
	.ascii "BINOP\12\0"
LC122:
	.ascii "Node type not yet supported\12\0"
	.text
	.globl	_node2s
	.def	_node2s;	.scl	2;	.type	32;	.endef
_node2s:
LFB39:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$7, %eax
	ja	L172
	movl	L174(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L174:
	.long	L173
	.long	L172
	.long	L175
	.long	L176
	.long	L177
	.long	L172
	.long	L178
	.long	L179
	.text
L175:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_ast_ident_2s
	jmp	L180
L176:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_ast_number_2s
	jmp	L180
L173:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_ast_assign_2s
	jmp	L180
L177:
	movl	$LC121, %eax
	jmp	L180
L178:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_ast_funcdef_2s
	jmp	L180
L179:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_ast_funccall_2s
	jmp	L180
L172:
	movl	$LC122, %eax
L180:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE39:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_make_fmt_string;	.scl	2;	.type	32;	.endef
	.def	_string_body;	.scl	2;	.type	32;	.endef
