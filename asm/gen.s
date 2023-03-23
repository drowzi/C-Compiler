	.file	"gen.c"
.lcomm _stack_size,4,4
.lcomm _default_outfile,4,4
.lcomm _patch_labels,4,4
	.section .rdata,"dr"
LC0:
	.ascii "movl\0"
LC1:
	.ascii "addl\0"
LC2:
	.ascii "subl\0"
LC3:
	.ascii "imull\0"
LC4:
	.ascii "divi\0"
LC5:
	.ascii "pushl\0"
LC6:
	.ascii "popl\0"
LC7:
	.ascii "sarl\0"
LC8:
	.ascii "sall\0"
LC9:
	.ascii "cmpl\0"
LC10:
	.ascii "xorl\0"
LC11:
	.ascii "testl\0"
LC12:
	.ascii "al\0"
LC13:
	.ascii "ah\0"
LC14:
	.ascii "ax\0"
LC15:
	.ascii "eax\0"
LC16:
	.ascii "bl\0"
LC17:
	.ascii "bh\0"
LC18:
	.ascii "bx\0"
LC19:
	.ascii "ebx\0"
LC20:
	.ascii "cl\0"
LC21:
	.ascii "ch\0"
LC22:
	.ascii "cx\0"
LC23:
	.ascii "ecx\0"
LC24:
	.ascii "dl\0"
LC25:
	.ascii "dh\0"
LC26:
	.ascii "dx\0"
LC27:
	.ascii "edx\0"
LC28:
	.ascii "esi\0"
LC29:
	.ascii "edi\0"
LC30:
	.ascii "ebp\0"
LC31:
	.ascii "esp\0"
	.data
	.align 32
_mnemonics:
	.long	LC0
	.long	LC1
	.long	LC2
	.long	LC3
	.long	LC4
	.long	LC5
	.long	LC6
	.long	LC7
	.long	LC8
	.long	LC9
	.long	LC10
	.long	LC11
	.long	LC12
	.long	LC13
	.long	LC14
	.long	LC15
	.long	LC16
	.long	LC17
	.long	LC18
	.long	LC19
	.long	LC20
	.long	LC21
	.long	LC22
	.long	LC23
	.long	LC24
	.long	LC25
	.long	LC26
	.long	LC27
	.long	LC28
	.long	LC29
	.long	LC30
	.long	LC31
	.align 4
_eax:
	.long	LC15
	.align 4
_ebx:
	.long	LC19
	.align 4
_ecx:
	.long	LC23
	.align 4
_edx:
	.long	LC27
	.align 4
_movl:
	.long	LC0
	.align 4
_addl:
	.long	LC1
	.align 4
_subl:
	.long	LC2
	.align 4
_imull:
	.long	LC3
	.align 4
_divi:
	.long	LC4
	.align 4
_tmpheaders:
	.long	100
.lcomm _code,4,4
	.section .rdata,"dr"
LC32:
	.ascii "%s%d\0"
	.text
	.def	_generate_label;	.scl	3;	.type	32;	.endef
_generate_label:
LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC32, (%esp)
	call	_make_fmt_string
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_string_body
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_free
	movl	-16(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.section .rdata,"dr"
LC33:
	.ascii "LFE\0"
	.text
	.globl	_get_function_entry_label
	.def	_get_function_entry_label;	.scl	2;	.type	32;	.endef
_get_function_entry_label:
LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	_id.33009, %eax
	leal	1(%eax), %edx
	movl	%edx, _id.33009
	movl	%eax, 4(%esp)
	movl	$LC33, (%esp)
	call	_generate_label
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.section .rdata,"dr"
LC34:
	.ascii "LFB\0"
	.text
	.globl	_get_function_block_label
	.def	_get_function_block_label;	.scl	2;	.type	32;	.endef
_get_function_block_label:
LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	_id.33013, %eax
	leal	1(%eax), %edx
	movl	%edx, _id.33013
	movl	%eax, 4(%esp)
	movl	$LC34, (%esp)
	call	_generate_label
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.section .rdata,"dr"
LC35:
	.ascii "L\0"
	.text
	.globl	_get_generic_label
	.def	_get_generic_label;	.scl	2;	.type	32;	.endef
_get_generic_label:
LFB28:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	_id.33017, %eax
	leal	1(%eax), %edx
	movl	%edx, _id.33017
	movl	%eax, 4(%esp)
	movl	$LC35, (%esp)
	call	_generate_label
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.section .rdata,"dr"
LC36:
	.ascii "LC\0"
	.text
	.globl	_get_static_label
	.def	_get_static_label;	.scl	2;	.type	32;	.endef
_get_static_label:
LFB29:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	_id.33021, %eax
	leal	1(%eax), %edx
	movl	%edx, _id.33021
	movl	%eax, 4(%esp)
	movl	$LC36, (%esp)
	call	_generate_label
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE29:
	.section .rdata,"dr"
LC37:
	.ascii "LFE%d:\12\0"
LC38:
	.ascii "printf\0"
	.align 4
LC39:
	.ascii "\11.def\11_%s;\11.scl\11"
	.ascii "2;\11.type\11"
	.ascii "32; .endef\12\0"
	.text
	.def	___imp_printf_def;	.scl	3;	.type	32;	.endef
___imp_printf_def:
LFB30:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	_tmpheaders, %eax
	leal	1(%eax), %edx
	movl	%edx, _tmpheaders
	movl	%eax, 4(%esp)
	movl	$LC37, (%esp)
	call	_emit
	movl	$LC38, 4(%esp)
	movl	$LC39, (%esp)
	call	_emit
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE30:
	.section .rdata,"dr"
LC40:
	.ascii "LF%d:\12\0"
LC41:
	.ascii "\"value: %d\\n\\0\"\0"
LC42:
	.ascii "\11.ascii %s\12\0"
	.text
	.def	___imp_printf_readonly;	.scl	3;	.type	32;	.endef
___imp_printf_readonly:
LFB31:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$999, 4(%esp)
	movl	$LC40, (%esp)
	call	_emit
	movl	$LC41, 4(%esp)
	movl	$LC42, (%esp)
	call	_emit
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE31:
	.section .rdata,"dr"
LC43:
	.ascii "\11movl\11@%s, 4(@esp)\12\0"
LC44:
	.ascii "LF999\0"
LC45:
	.ascii "\11movl\11$%s, (@esp)\12\0"
LC46:
	.ascii "\11call\11_printf\12\0"
	.text
	.def	___print_reg;	.scl	3;	.type	32;	.endef
___print_reg:
LFB32:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC43, (%esp)
	call	_emit
	movl	$LC44, 4(%esp)
	movl	$LC45, (%esp)
	call	_emit
	movl	$LC46, (%esp)
	call	_emit
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE32:
	.def	___print_all_regs;	.scl	3;	.type	32;	.endef
___print_all_regs:
LFB33:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$LC15, (%esp)
	call	___print_reg
	movl	$LC23, (%esp)
	call	___print_reg
	movl	$LC27, (%esp)
	call	___print_reg
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE33:
	.section .rdata,"dr"
LC47:
	.ascii "\11movl\11%d(@ebp), @eax\12\0"
LC48:
	.ascii "\11movl\11@eax, 4(@esp)\12\0"
	.text
	.def	___print_ident;	.scl	3;	.type	32;	.endef
___print_ident:
LFB34:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC47, (%esp)
	call	_emit
	movl	$LC48, (%esp)
	call	_emit
	movl	$LC44, 4(%esp)
	movl	$LC45, (%esp)
	call	_emit
	movl	$LC46, (%esp)
	call	_emit
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE34:
	.section .rdata,"dr"
LC49:
	.ascii "\11movl\11$128, @eax\12\0"
	.text
	.def	___test_print_reg;	.scl	3;	.type	32;	.endef
___test_print_reg:
LFB35:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$LC49, (%esp)
	call	_emit
	movl	$LC15, (%esp)
	call	___print_reg
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE35:
	.section .rdata,"dr"
LC50:
	.ascii "no output file set?\0"
	.text
	.def	_emit_as_string;	.scl	3;	.type	32;	.endef
_emit_as_string:
LFB36:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$168, %esp
	movl	_default_outfile, %eax
	testl	%eax, %eax
	jne	L18
	movl	$LC50, (%esp)
	call	_error
L18:
	leal	12(%ebp), %eax
	movl	%eax, -148(%ebp)
	movl	-148(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$128, 4(%esp)
	leal	-144(%ebp), %eax
	movl	%eax, (%esp)
	call	_vsnprintf
	movl	$0, -12(%ebp)
	jmp	L19
L21:
	leal	-144(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$64, %al
	jne	L20
	leal	-144(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$37, (%eax)
L20:
	addl	$1, -12(%ebp)
L19:
	leal	-144(%ebp), %eax
	movl	%eax, (%esp)
	call	_strlen
	cmpl	-12(%ebp), %eax
	jnb	L21
	leal	-144(%ebp), %eax
	movl	%eax, (%esp)
	call	_make_string
	movl	%eax, -16(%ebp)
	movl	_code, %eax
	movl	-16(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_vector_append
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE36:
	.section .rdata,"dr"
LC51:
	.ascii "%s\0"
	.text
	.def	_emit;	.scl	3;	.type	32;	.endef
_emit:
LFB37:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$168, %esp
	movl	_default_outfile, %eax
	testl	%eax, %eax
	jne	L23
	movl	$LC50, (%esp)
	call	_error
L23:
	leal	12(%ebp), %eax
	movl	%eax, -144(%ebp)
	movl	-144(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$128, 4(%esp)
	leal	-140(%ebp), %eax
	movl	%eax, (%esp)
	call	_vsnprintf
	movl	$0, -12(%ebp)
	jmp	L24
L26:
	leal	-140(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$64, %al
	jne	L25
	leal	-140(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$37, (%eax)
L25:
	addl	$1, -12(%ebp)
L24:
	leal	-140(%ebp), %eax
	movl	%eax, (%esp)
	call	_strlen
	cmpl	-12(%ebp), %eax
	jnb	L26
	leal	-140(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC51, (%esp)
	call	_printf
	movl	_default_outfile, %eax
	movl	%eax, 4(%esp)
	leal	-140(%ebp), %eax
	movl	%eax, (%esp)
	call	_fputs
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE37:
	.section .rdata,"dr"
LC52:
	.ascii "\11nop\12\0"
	.text
	.def	_emit_nop;	.scl	3;	.type	32;	.endef
_emit_nop:
LFB38:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$LC52, (%esp)
	call	_emit
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE38:
	.section .rdata,"dr"
LC53:
	.ascii "\11%s\12\0"
	.text
	.def	_emitln;	.scl	3;	.type	32;	.endef
_emitln:
LFB39:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$168, %esp
	movl	_default_outfile, %eax
	testl	%eax, %eax
	jne	L29
	movl	$LC50, (%esp)
	call	_error
L29:
	leal	12(%ebp), %eax
	movl	%eax, -144(%ebp)
	movl	-144(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$128, 4(%esp)
	leal	-140(%ebp), %eax
	movl	%eax, (%esp)
	call	_vsnprintf
	movl	$0, -12(%ebp)
	jmp	L30
L32:
	leal	-140(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$64, %al
	jne	L31
	leal	-140(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$37, (%eax)
L31:
	addl	$1, -12(%ebp)
L30:
	leal	-140(%ebp), %eax
	movl	%eax, (%esp)
	call	_strlen
	cmpl	-12(%ebp), %eax
	jnb	L32
	leal	-140(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$LC53, 8(%esp)
	movl	$128, 4(%esp)
	leal	-140(%ebp), %eax
	movl	%eax, (%esp)
	call	_snprintf
	leal	-140(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC51, (%esp)
	call	_printf
	movl	_default_outfile, %eax
	movl	%eax, 4(%esp)
	leal	-140(%ebp), %eax
	movl	%eax, (%esp)
	call	_fputs
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE39:
	.section .rdata,"dr"
LC54:
	.ascii "\11.data\12\0"
LC55:
	.ascii "\11.align %d\12\0"
LC56:
	.ascii "_%s.%d:\0"
	.text
	.def	_emit_static_decl;	.scl	3;	.type	32;	.endef
_emit_static_decl:
LFB40:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$LC54, (%esp)
	call	_emit
	movl	$4, 4(%esp)
	movl	$LC55, (%esp)
	call	_emit
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	$1000, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC56, (%esp)
	call	_emit
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE40:
	.section .rdata,"dr"
LC57:
	.ascii "\11.file\11\"%s.c\"\12\0"
LC58:
	.ascii "\11.text\12\0"
	.text
	.def	_emit_fheader;	.scl	3;	.type	32;	.endef
_emit_fheader:
LFB41:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC57, (%esp)
	call	_emit
	movl	$LC58, (%esp)
	call	_emit
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE41:
	.def	_emit_bss;	.scl	3;	.type	32;	.endef
_emit_bss:
LFB42:
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
LFE42:
	.section .rdata,"dr"
LC59:
	.ascii "__main\0"
	.text
	.def	_emit_main;	.scl	3;	.type	32;	.endef
_emit_main:
LFB43:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$LC59, 4(%esp)
	movl	$LC39, (%esp)
	call	_emit
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE43:
	.section .rdata,"dr"
LC60:
	.ascii "\11.globl\11_%s\12\0"
LC61:
	.ascii "_%s:\12\0"
LC62:
	.ascii "%s:\12\0"
	.text
	.def	_emit_function_header;	.scl	3;	.type	32;	.endef
_emit_function_header:
LFB44:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	24(%eax), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC60, (%esp)
	call	_emit
	movl	8(%ebp), %eax
	movl	24(%eax), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC39, (%esp)
	call	_emit
	movl	8(%ebp), %eax
	movl	24(%eax), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC61, (%esp)
	call	_emit
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC62, (%esp)
	call	_emit
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE44:
	.section .rdata,"dr"
LC63:
	.ascii "\11.cfi_startproc\12\0"
LC64:
	.ascii "\11pushl\11@%s\12\0"
LC65:
	.ascii "\11.cfi_def_cfa_offset %d\12\0"
LC66:
	.ascii "\11.cfi_offset %d, %d\12\0"
LC67:
	.ascii "\11%s\11@%s, @%s\12\0"
LC68:
	.ascii "\11.cfi_def_cfa_register %d\12\0"
LC69:
	.ascii "andl\0"
LC70:
	.ascii "\11%s\11$%d, @%s\12\0"
	.text
	.def	_emit_function_decl_init;	.scl	3;	.type	32;	.endef
_emit_function_decl_init:
LFB45:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$LC63, (%esp)
	call	_emit
	movl	$LC30, 4(%esp)
	movl	$LC64, (%esp)
	call	_emit
	movl	$8, 4(%esp)
	movl	$LC65, (%esp)
	call	_emit
	movl	$-8, 8(%esp)
	movl	$5, 4(%esp)
	movl	$LC66, (%esp)
	call	_emit
	movl	$LC30, 12(%esp)
	movl	$LC31, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	$LC67, (%esp)
	call	_emit
	movl	$5, 4(%esp)
	movl	$LC68, (%esp)
	call	_emit
	movl	$LC31, 12(%esp)
	movl	$-16, 8(%esp)
	movl	$LC69, 4(%esp)
	movl	$LC70, (%esp)
	call	_emit
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	$16, 4(%esp)
	movl	%eax, (%esp)
	call	_align
	movl	$LC31, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$LC2, 4(%esp)
	movl	$LC70, (%esp)
	call	_emit
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE45:
	.section .rdata,"dr"
LC71:
	.ascii "\11movl\11@ebp, @esp\12\0"
LC72:
	.ascii "\11popl\11@ebp\12\0"
LC73:
	.ascii "\11.cfi_restore %d\12\0"
LC74:
	.ascii "\11.cfi_def_cfa %d, %d\12\0"
LC75:
	.ascii "\11ret\12\0"
LC76:
	.ascii "\11.cfi_endproc\12\0"
	.text
	.def	_emit_function_return;	.scl	3;	.type	32;	.endef
_emit_function_return:
LFB46:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$LC71, (%esp)
	call	_emit
	movl	$LC72, (%esp)
	call	_emit
	movl	$5, 4(%esp)
	movl	$LC73, (%esp)
	call	_emit
	movl	$4, 8(%esp)
	movl	$4, 4(%esp)
	movl	$LC74, (%esp)
	call	_emit
	movl	$LC75, (%esp)
	call	_emit
	movl	$LC76, (%esp)
	call	_emit
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE46:
	.section .rdata,"dr"
LC77:
	.ascii "LC%d:\12\0"
	.text
	.def	_emit_charlabel;	.scl	3;	.type	32;	.endef
_emit_charlabel:
LFB47:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC77, (%esp)
	call	_emit
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC42, (%esp)
	call	_emit
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE47:
	.def	_maybe_emit_readonly;	.scl	3;	.type	32;	.endef
_maybe_emit_readonly:
LFB48:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	8(%ebp), %eax
	movl	%eax, -4(%ebp)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE48:
	.section .rdata,"dr"
	.align 4
LC78:
	.ascii "C:\\Users\\Allen\\Desktop\\dev\\Language Design\\CCompiler\\gen.c\0"
LC79:
	.ascii "r == 'a' || r == 'c'\0"
LC80:
	.ascii "rax\0"
LC81:
	.ascii "rcx\0"
LC82:
	.ascii "Unknown data size: %s: %d\0"
	.text
	.def	_get_int_reg;	.scl	3;	.type	32;	.endef
_get_int_reg:
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
	movl	12(%ebp), %eax
	movb	%al, -12(%ebp)
	cmpb	$97, -12(%ebp)
	je	L43
	cmpb	$99, -12(%ebp)
	je	L43
	movl	$307, 8(%esp)
	movl	$LC78, 4(%esp)
	movl	$LC79, (%esp)
	call	__assert
L43:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	$2, %eax
	je	L45
	cmpl	$2, %eax
	jg	L46
	cmpl	$1, %eax
	je	L47
	jmp	L44
L46:
	cmpl	$4, %eax
	je	L48
	cmpl	$8, %eax
	je	L49
	jmp	L44
L47:
	cmpb	$97, -12(%ebp)
	jne	L50
	movl	$LC12, %eax
	jmp	L42
L50:
	movl	$LC20, %eax
	jmp	L42
L45:
	cmpb	$97, -12(%ebp)
	jne	L53
	movl	$LC14, %eax
	jmp	L42
L53:
	movl	$LC22, %eax
	jmp	L42
L48:
	cmpb	$97, -12(%ebp)
	jne	L55
	movl	$LC15, %eax
	jmp	L42
L55:
	movl	$LC23, %eax
	jmp	L42
L49:
	cmpb	$97, -12(%ebp)
	jne	L57
	movl	$LC80, %eax
	jmp	L42
L57:
	movl	$LC81, %eax
	jmp	L42
L44:
	movl	8(%ebp), %eax
	movl	4(%eax), %ebx
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_ctype2s
	movl	%ebx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC82, (%esp)
	call	_log_error
L42:
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE49:
	.section .rdata,"dr"
LC83:
	.ascii "movsbq\0"
LC84:
	.ascii "movswq\0"
LC85:
	.ascii "movslq\0"
	.text
	.def	_get_load_inst;	.scl	3;	.type	32;	.endef
_get_load_inst:
LFB50:
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
	movl	4(%eax), %eax
	cmpl	$2, %eax
	je	L61
	cmpl	$2, %eax
	jg	L62
	cmpl	$1, %eax
	je	L63
	jmp	L60
L62:
	cmpl	$4, %eax
	je	L64
	cmpl	$8, %eax
	je	L65
	jmp	L60
L63:
	movl	$LC83, %eax
	jmp	L59
L61:
	movl	$LC84, %eax
	jmp	L59
L64:
	movl	$LC85, %eax
	jmp	L59
L65:
	movl	$LC0, %eax
	jmp	L59
L60:
	movl	8(%ebp), %eax
	movl	4(%eax), %ebx
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_ctype2s
	movl	%ebx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC82, (%esp)
	call	_log_error
L59:
	addl	$20, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE50:
	.def	_align;	.scl	3;	.type	32;	.endef
_align:
LFB51:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	8(%ebp), %eax
	cltd
	idivl	12(%ebp)
	movl	%edx, -4(%ebp)
	cmpl	$0, -4(%ebp)
	je	L68
	movl	8(%ebp), %eax
	subl	-4(%ebp), %eax
	movl	%eax, %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	jmp	L70
L68:
	movl	8(%ebp), %eax
L70:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE51:
	.section .rdata,"dr"
LC86:
	.ascii "divl\0"
LC87:
	.ascii "imul\0"
LC88:
	.ascii "unsupported op %s\0"
LC89:
	.ascii "suppression\0"
	.text
	.def	_get_opcode;	.scl	3;	.type	32;	.endef
_get_opcode:
LFB52:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	cmpl	$560, %eax
	je	L73
	cmpl	$560, %eax
	jg	L74
	cmpl	$559, %eax
	je	L75
	jmp	L72
L74:
	cmpl	$562, %eax
	je	L76
	cmpl	$563, %eax
	je	L77
	jmp	L72
L75:
	movl	$LC2, %eax
	jmp	L78
L73:
	movl	$LC1, %eax
	jmp	L78
L76:
	movl	$LC86, %eax
	jmp	L78
L77:
	movl	$LC87, %eax
	jmp	L78
L72:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_op2s
	movl	%eax, 4(%esp)
	movl	$LC88, (%esp)
	call	_log_error
	movl	$LC89, %eax
L78:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE52:
	.section .rdata,"dr"
LC90:
	.ascii "main\0"
	.text
	.def	_emit_function_decl;	.scl	3;	.type	32;	.endef
_emit_function_decl:
LFB53:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC62, (%esp)
	call	_emit
	movl	8(%ebp), %eax
	movl	24(%eax), %eax
	movl	$LC90, 4(%esp)
	movl	%eax, (%esp)
	call	_string_equal_const
	testl	%eax, %eax
	je	L80
	call	_emit_main
L80:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_emit_function_header
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_maybe_emit_readonly
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	$16, 4(%esp)
	movl	%eax, (%esp)
	call	_align
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_emit_function_decl_init
	movl	8(%ebp), %eax
	movl	32(%eax), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L81
	movl	8(%ebp), %eax
	movl	32(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_gen_statements
L81:
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC62, (%esp)
	call	_emit
	call	_emit_function_return
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE53:
	.def	_emit_dependencies;	.scl	3;	.type	32;	.endef
_emit_dependencies:
LFB54:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	call	_get_module_deps
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_length
	movl	%eax, -20(%ebp)
	movl	$0, -12(%ebp)
	jmp	L83
L84:
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_get
	movl	%eax, -24(%ebp)
	movl	-24(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC39, (%esp)
	call	_emit
	addl	$1, -12(%ebp)
L83:
	movl	-12(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jb	L84
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE54:
	.section .rdata,"dr"
LC91:
	.ascii "\11movl\11$%d, @eax\12\0"
	.align 4
LC92:
	.ascii "OFF-LIMITS! (function call return)\0"
LC93:
	.ascii "\11movl\11@eax, @edx\12\0"
LC94:
	.ascii "\11%s\11@eax, @edx\12\0"
LC95:
	.ascii "\11movl\11@edx, @eax\12\0"
	.text
	.def	_gen_expr_eax;	.scl	3;	.type	32;	.endef
_gen_expr_eax:
LFB55:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	jne	L86
	movl	8(%ebp), %eax
	movl	28(%eax), %edx
	movl	24(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	movl	$LC91, (%esp)
	call	_emit
	jmp	L85
L86:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$2, %eax
	jne	L88
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC47, (%esp)
	call	_emit
	jmp	L85
L88:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$7, %eax
	jne	L89
	movl	$LC92, (%esp)
	call	_puts
	jmp	L85
L89:
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, (%esp)
	call	_gen_expr_traverse
	movl	$LC93, (%esp)
	call	_emit
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, (%esp)
	call	_gen_expr_traverse
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_get_opcode
	movl	%eax, 4(%esp)
	movl	$LC94, (%esp)
	call	_emit
	movl	$LC95, (%esp)
	call	_emit
L85:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE55:
	.section .rdata,"dr"
LC96:
	.ascii "\11%s\11%d(@%s), @%s\12\0"
LC97:
	.ascii "\11movl\11$%lld, @eax\12\0"
	.text
	.def	_gen_return;	.scl	3;	.type	32;	.endef
_gen_return:
LFB56:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	jne	L91
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_gen_expr_eax
	jmp	L90
L91:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$2, %eax
	jne	L93
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	$LC15, 16(%esp)
	movl	$LC30, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	$LC96, (%esp)
	call	_emit
	jmp	L90
L93:
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	jne	L94
	movl	-12(%ebp), %eax
	movl	28(%eax), %edx
	movl	24(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	movl	$LC97, (%esp)
	call	_emit
	jmp	L90
L94:
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	4(%eax), %edx
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_make_tmp_iden_node
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_gen_expr
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	movl	$LC15, 16(%esp)
	movl	$LC30, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	$LC96, (%esp)
	call	_emit
L90:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE56:
	.section .rdata,"dr"
LC98:
	.ascii "\11call\11_%s\12\0"
	.text
	.def	_gen_function_call;	.scl	3;	.type	32;	.endef
_gen_function_call:
LFB57:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$0, -12(%ebp)
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	(%eax), %eax
	movl	%eax, -20(%ebp)
	movl	$0, -16(%ebp)
	jmp	L96
L97:
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	-16(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_vector_get
	movl	%eax, -24(%ebp)
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	28(%eax), %eax
	movl	-16(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_vector_get
	movl	%eax, -28(%ebp)
	movl	-28(%ebp), %eax
	movl	16(%eax), %eax
	movl	4(%eax), %eax
	addl	%eax, -12(%ebp)
	movl	-12(%ebp), %edx
	movl	-28(%ebp), %eax
	movl	16(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_make_tmp_iden_node
	movl	%eax, -32(%ebp)
	movl	-24(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	_gen_expr
	addl	$1, -16(%ebp)
L96:
	movl	-16(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jb	L97
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	24(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC98, (%esp)
	call	_emit
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE57:
	.section .rdata,"dr"
LC99:
	.ascii "\11%s\11@%s, %d(@%s)\12\0"
	.text
	.def	_gen_assignment;	.scl	3;	.type	32;	.endef
_gen_assignment:
LFB58:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$2, %eax
	jne	L99
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	movl	$LC15, 16(%esp)
	movl	$LC30, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	$LC96, (%esp)
	call	_emit
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	$LC30, 16(%esp)
	movl	%eax, 12(%esp)
	movl	$LC15, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	$LC99, (%esp)
	call	_emit
	jmp	L101
L99:
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_gen_expr
L101:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE58:
	.section .rdata,"dr"
LC100:
	.ascii "\11subl\11$1, %d(@ebp)\12\0"
LC101:
	.ascii "\11addl\11$1, %d(@ebp)\12\0"
	.text
	.def	_gen_dec_or_inc;	.scl	3;	.type	32;	.endef
_gen_dec_or_inc:
LFB59:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$574, %eax
	je	L104
	cmpl	$574, %eax
	jg	L105
	cmpl	$573, %eax
	je	L106
	jmp	L107
L105:
	cmpl	$580, %eax
	je	L106
	cmpl	$581, %eax
	je	L104
	jmp	L107
L106:
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC100, (%esp)
	call	_emit
	jmp	L103
L104:
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC101, (%esp)
	call	_emit
	nop
L103:
L107:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE59:
	.section .rdata,"dr"
LC102:
	.ascii "\11test @eax, @eax\12\0"
LC103:
	.ascii "\11je %s\12\0"
	.text
	.def	_gen_if;	.scl	3;	.type	32;	.endef
_gen_if:
LFB60:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	movl	%eax, -16(%ebp)
	movl	8(%ebp), %eax
	movl	12(%eax), %edx
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	$0, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_gen_cond
	call	_get_generic_label
	movl	%eax, -20(%ebp)
	movl	$LC102, (%esp)
	call	_emit
	movl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC103, (%esp)
	call	_emit
	movl	$0, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_gen_statements
	movl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC62, (%esp)
	call	_emit
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE60:
	.section .rdata,"dr"
LC104:
	.ascii "\11cmpl\11$0, @eax\12\0"
LC105:
	.ascii "\11sete\11@al\12\0"
LC106:
	.ascii "\11movzbl\11@al, @eax\12\0"
	.text
	.globl	_cast_bool_eax
	.def	_cast_bool_eax;	.scl	2;	.type	32;	.endef
_cast_bool_eax:
LFB61:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$LC104, (%esp)
	call	_emit
	movl	$LC105, (%esp)
	call	_emit
	movl	$LC106, (%esp)
	call	_emit
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE61:
	.globl	_cast_bool
	.def	_cast_bool;	.scl	2;	.type	32;	.endef
_cast_bool:
LFB62:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	jne	L111
	movl	8(%ebp), %eax
	movl	28(%eax), %edx
	movl	24(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	movl	$LC97, (%esp)
	call	_emit
	call	_cast_bool_eax
	jmp	L113
L111:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$2, %eax
	jne	L113
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC47, (%esp)
	call	_emit
	call	_cast_bool_eax
L113:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE62:
	.def	_push_patch;	.scl	3;	.type	32;	.endef
_push_patch:
LFB63:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	_patch_labels, %eax
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
LFE63:
	.def	_patch;	.scl	3;	.type	32;	.endef
_patch:
LFB64:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	_patch_labels, %eax
	movl	%eax, (%esp)
	call	_vector_empty
	testl	%eax, %eax
	jne	L117
	movl	_patch_labels, %eax
	movl	%eax, (%esp)
	call	_vector_pop
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC62, (%esp)
	call	_emit
L117:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE64:
	.section .rdata,"dr"
LC107:
	.ascii "\11mov $1, @eax\12\0"
LC108:
	.ascii "\11jne %s\12\0"
LC109:
	.ascii "\11mov $0, @eax\12\0"
	.text
	.def	_gen_logor;	.scl	3;	.type	32;	.endef
_gen_logor:
LFB65:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	call	_get_generic_label
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, (%esp)
	call	_gen_expr_eax
	movl	$LC102, (%esp)
	call	_emit
	movl	$LC107, (%esp)
	call	_emit
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC108, (%esp)
	call	_emit
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, (%esp)
	call	_gen_expr_eax
	movl	$LC102, (%esp)
	call	_emit
	movl	$LC107, (%esp)
	call	_emit
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC108, (%esp)
	call	_emit
	movl	$LC109, (%esp)
	call	_emit
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC62, (%esp)
	call	_emit
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE65:
	.def	_gen_logand;	.scl	3;	.type	32;	.endef
_gen_logand:
LFB66:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	call	_get_generic_label
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, (%esp)
	call	_gen_expr_eax
	movl	$LC102, (%esp)
	call	_emit
	movl	$LC109, (%esp)
	call	_emit
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC103, (%esp)
	call	_emit
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, (%esp)
	call	_gen_expr_eax
	movl	$LC102, (%esp)
	call	_emit
	movl	$LC109, (%esp)
	call	_emit
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC103, (%esp)
	call	_emit
	movl	$LC107, (%esp)
	call	_emit
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC62, (%esp)
	call	_emit
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE66:
	.section .rdata,"dr"
LC110:
	.ascii "\11cmpl\11$0, $%lld\12\0"
LC111:
	.ascii "\11jle %s\12\0"
LC112:
	.ascii "\11cmpl\11$0, %d(@ebp)\12\0"
	.align 4
LC113:
	.ascii "Unexpected conditional binary op %s\0"
	.align 4
LC114:
	.ascii "Unexpected ast node within conditional: %s\0"
	.text
	.def	_gen_cond;	.scl	3;	.type	32;	.endef
_gen_cond:
LFB67:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	je	L122
	cmpl	$3, %eax
	jg	L123
	cmpl	$2, %eax
	je	L124
	jmp	L121
L123:
	cmpl	$4, %eax
	je	L125
	cmpl	$5, %eax
	je	L126
	jmp	L121
L122:
	movl	8(%ebp), %eax
	movl	28(%eax), %edx
	movl	24(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	movl	$LC110, (%esp)
	call	_emit
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC111, (%esp)
	call	_emit
	jmp	L127
L124:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC112, (%esp)
	call	_emit
	jmp	L127
L125:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_cond_op
	testl	%eax, %eax
	je	L128
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	subl	$546, %eax
	cmpl	$10, %eax
	ja	L129
	movl	L131(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L131:
	.long	L130
	.long	L132
	.long	L129
	.long	L129
	.long	L129
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.long	L141
	.text
L132:
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_gen_logand
	jmp	L140
L130:
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_gen_logor
	jmp	L140
L129:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_op2s
	movl	%eax, 4(%esp)
	movl	$LC113, (%esp)
	call	_log_warning
	jmp	L127
L128:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_gen_expr_eax
	call	_cast_bool_eax
	jmp	L127
L141:
	nop
L140:
	jmp	L127
L126:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_cast_bool
	jmp	L127
L121:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_node2s
	movl	%eax, 4(%esp)
	movl	$LC114, (%esp)
	call	_log_error
L127:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE67:
	.def	_gen_cond_assignment;	.scl	3;	.type	32;	.endef
_gen_cond_assignment:
LFB68:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	je	L144
	cmpl	$3, %eax
	jg	L145
	cmpl	$2, %eax
	je	L146
	jmp	L143
L145:
	cmpl	$4, %eax
	je	L147
	cmpl	$5, %eax
	je	L148
	jmp	L143
L144:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_cast_bool
	jmp	L149
L146:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_cast_bool
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	$LC15, 16(%esp)
	movl	$LC30, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	$LC96, (%esp)
	call	_emit
	jmp	L149
L147:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_cond_op
	testl	%eax, %eax
	je	L150
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	subl	$546, %eax
	cmpl	$10, %eax
	ja	L151
	movl	L153(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L153:
	.long	L163
	.long	L163
	.long	L151
	.long	L151
	.long	L151
	.long	L163
	.long	L163
	.long	L163
	.long	L163
	.long	L163
	.long	L163
	.text
L151:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_op2s
	movl	%eax, 4(%esp)
	movl	$LC113, (%esp)
	call	_log_warning
	jmp	L149
L150:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_gen_expr_eax
	call	_cast_bool_eax
	jmp	L149
L163:
	nop
	jmp	L149
L148:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_cast_bool
	jmp	L149
L143:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_node2s
	movl	%eax, 4(%esp)
	movl	$LC114, (%esp)
	call	_log_error
L149:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE68:
	.section .rdata,"dr"
	.align 4
LC115:
	.ascii "Node type %d is currently unimplemented\0"
	.text
	.def	_gen_statements;	.scl	3;	.type	32;	.endef
_gen_statements:
LFB69:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	12(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	$0, -12(%ebp)
	jmp	L165
L176:
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_vector_get
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -24(%ebp)
	cmpl	$17, -24(%ebp)
	ja	L166
	movl	-24(%ebp), %eax
	sall	$2, %eax
	addl	$L168, %eax
	movl	(%eax), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L168:
	.long	L167
	.long	L166
	.long	L166
	.long	L166
	.long	L166
	.long	L169
	.long	L170
	.long	L171
	.long	L166
	.long	L172
	.long	L166
	.long	L166
	.long	L173
	.long	L166
	.long	L166
	.long	L166
	.long	L166
	.long	L174
	.text
L170:
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_emit_function_decl
	jmp	L175
L169:
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_gen_dec_or_inc
	jmp	L175
L172:
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_gen_if
	jmp	L175
L173:
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_gen_return
	jmp	L175
L171:
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_gen_function_call
	jmp	L175
L167:
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_gen_assignment
	jmp	L175
L174:
	movl	-20(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	___print_ident
	jmp	L175
L166:
	movl	-24(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC115, (%esp)
	call	_log_warning
L175:
	addl	$1, -12(%ebp)
L165:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	-12(%ebp), %eax
	ja	L176
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE69:
	.section .rdata,"dr"
LC116:
	.ascii "\11movl\11$%lld, @eax\0"
LC117:
	.ascii "\11movl\11$%lld, @ecx\12\0"
	.text
	.def	_gen_expr_traverse;	.scl	3;	.type	32;	.endef
_gen_expr_traverse:
LFB70:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	cmpl	$0, 8(%ebp)
	je	L186
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$2, %eax
	jne	L180
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	$LC15, 16(%esp)
	movl	$LC30, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	$LC96, (%esp)
	call	_emit
	jmp	L177
L180:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	jne	L181
	movl	8(%ebp), %eax
	movl	28(%eax), %edx
	movl	24(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	movl	$LC116, (%esp)
	call	_emit
	jmp	L177
L181:
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	je	L182
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, (%esp)
	call	_gen_expr_traverse
	movl	$LC23, 12(%esp)
	movl	$LC15, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	$LC67, (%esp)
	call	_emit
	jmp	L183
L182:
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	28(%eax), %edx
	movl	24(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	movl	$LC117, (%esp)
	call	_emit
L183:
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	je	L184
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, (%esp)
	call	_gen_expr_traverse
	jmp	L185
L184:
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	28(%eax), %edx
	movl	24(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	movl	$LC97, (%esp)
	call	_emit
L185:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_get_opcode
	movl	$LC15, 12(%esp)
	movl	$LC23, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC67, (%esp)
	call	_emit
	jmp	L177
L186:
	nop
L177:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE70:
	.section .rdata,"dr"
LC118:
	.ascii "\11movl\11$%lld, %d(@ebp)\12\0"
LC119:
	.ascii "\11movl\11%d(@esp), @eax\12\0"
LC120:
	.ascii "\11movl\11@eax, %d(@ebp)\12\0"
LC121:
	.ascii "\11movl\11%d(@ebp), @ecx\12\0"
LC122:
	.ascii "\11%s\11@eax, @ecx\12\0"
LC123:
	.ascii "\11movl\11@ecx, %d(@ebp)\12\0"
	.text
	.def	_gen_expr;	.scl	3;	.type	32;	.endef
_gen_expr:
LFB71:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	jne	L188
	movl	8(%ebp), %eax
	movl	8(%eax), %ecx
	movl	12(%ebp), %eax
	movl	28(%eax), %edx
	movl	24(%eax), %eax
	movl	%ecx, 12(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	movl	$LC118, (%esp)
	call	_emit
	jmp	L194
L188:
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$2, %eax
	jne	L190
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC119, (%esp)
	call	_emit
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC120, (%esp)
	call	_emit
	jmp	L194
L190:
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$7, %eax
	jne	L191
	movl	$0, -16(%ebp)
	movl	12(%ebp), %eax
	movl	12(%eax), %eax
	movl	(%eax), %eax
	movl	%eax, -20(%ebp)
	movl	$0, -12(%ebp)
	jmp	L192
L193:
	movl	12(%ebp), %eax
	movl	12(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_vector_get
	movl	%eax, -24(%ebp)
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	28(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_vector_get
	movl	%eax, -28(%ebp)
	movl	-16(%ebp), %edx
	movl	-28(%ebp), %eax
	movl	16(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_make_tmp_iden_node
	movl	%eax, -32(%ebp)
	movl	-28(%ebp), %eax
	movl	16(%eax), %eax
	movl	4(%eax), %eax
	addl	%eax, -16(%ebp)
	movl	-24(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	_gen_expr
	addl	$1, -12(%ebp)
L192:
	movl	-12(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jb	L193
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	24(%eax), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC98, (%esp)
	call	_emit
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC120, (%esp)
	call	_emit
	jmp	L194
L191:
	movl	12(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, (%esp)
	call	_gen_expr_traverse
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC120, (%esp)
	call	_emit
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, (%esp)
	call	_gen_expr_traverse
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC121, (%esp)
	call	_emit
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_get_opcode
	movl	%eax, 4(%esp)
	movl	$LC122, (%esp)
	call	_emit
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC123, (%esp)
	call	_emit
L194:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE71:
	.section .rdata,"dr"
LC124:
	.ascii "w\0"
LC125:
	.ascii "outfile.s\0"
LC126:
	.ascii "outfile\0"
	.text
	.globl	_do_code_gen
	.def	_do_code_gen;	.scl	2;	.type	32;	.endef
_do_code_gen:
LFB72:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	call	_get_current_module
	movl	%eax, -12(%ebp)
	call	_make_vector
	movl	%eax, _patch_labels
	movl	$LC124, 4(%esp)
	movl	$LC125, (%esp)
	call	_fopen
	movl	%eax, _default_outfile
	movl	$LC126, (%esp)
	call	_emit_fheader
	call	___imp_printf_readonly
	movl	-12(%ebp), %eax
	movl	20(%eax), %eax
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_gen_statements
	call	___imp_printf_def
	movl	_default_outfile, %eax
	movl	%eax, (%esp)
	call	_fclose
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE72:
.lcomm _id.33009,4,4
.lcomm _id.33013,4,4
.lcomm _id.33017,4,4
.lcomm _id.33021,4,4
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_make_fmt_string;	.scl	2;	.type	32;	.endef
	.def	_string_body;	.scl	2;	.type	32;	.endef
	.def	_free;	.scl	2;	.type	32;	.endef
	.def	_error;	.scl	2;	.type	32;	.endef
	.def	_vsnprintf;	.scl	2;	.type	32;	.endef
	.def	_strlen;	.scl	2;	.type	32;	.endef
	.def	_make_string;	.scl	2;	.type	32;	.endef
	.def	_vector_append;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_fputs;	.scl	2;	.type	32;	.endef
	.def	_snprintf;	.scl	2;	.type	32;	.endef
	.def	__assert;	.scl	2;	.type	32;	.endef
	.def	_ctype2s;	.scl	2;	.type	32;	.endef
	.def	_log_error;	.scl	2;	.type	32;	.endef
	.def	_op2s;	.scl	2;	.type	32;	.endef
	.def	_string_equal_const;	.scl	2;	.type	32;	.endef
	.def	_get_module_deps;	.scl	2;	.type	32;	.endef
	.def	_vector_length;	.scl	2;	.type	32;	.endef
	.def	_vector_get;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_make_tmp_iden_node;	.scl	2;	.type	32;	.endef
	.def	_vector_empty;	.scl	2;	.type	32;	.endef
	.def	_vector_pop;	.scl	2;	.type	32;	.endef
	.def	_cond_op;	.scl	2;	.type	32;	.endef
	.def	_log_warning;	.scl	2;	.type	32;	.endef
	.def	_node2s;	.scl	2;	.type	32;	.endef
	.def	_get_current_module;	.scl	2;	.type	32;	.endef
	.def	_make_vector;	.scl	2;	.type	32;	.endef
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	_fclose;	.scl	2;	.type	32;	.endef
