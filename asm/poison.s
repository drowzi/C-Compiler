	.file	"poison.c"
	.globl	_heap_space_allocated
	.bss
	.align 4
_heap_space_allocated:
	.space 4
	.globl	_heap_space_freed
	.align 4
_heap_space_freed:
	.space 4
	.section .rdata,"dr"
LC0:
	.ascii "Heap space used: %d b\12\0"
	.text
	.globl	_print_memory_diagnostics
	.def	_print_memory_diagnostics;	.scl	2;	.type	32;	.endef
_print_memory_diagnostics:
LFB29:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	_heap_space_allocated, %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE29:
	.section .rdata,"dr"
LC1:
	.ascii "malloc\0"
	.text
	.globl	_malloc
	.def	_malloc;	.scl	2;	.type	32;	.endef
_malloc:
LFB30:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	_real_malloc.32954, %eax
	testl	%eax, %eax
	jne	L3
	movl	$-3, -16(%ebp)
	movl	$LC1, -20(%ebp)
	movl	___mingw_dlfcn+4, %eax
	movl	-20(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	-16(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _real_malloc.32954
L3:
	movl	_real_malloc.32954, %eax
	movl	8(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, -12(%ebp)
	movl	_heap_space_allocated, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, _heap_space_allocated
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE30:
	.section .rdata,"dr"
LC2:
	.ascii "free\0"
	.text
	.globl	_free
	.def	_free;	.scl	2;	.type	32;	.endef
_free:
LFB31:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	_real_free.32960, %eax
	testl	%eax, %eax
	jne	L7
	movl	$-3, -12(%ebp)
	movl	$LC2, -16(%ebp)
	movl	___mingw_dlfcn+4, %eax
	movl	-16(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	-12(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _real_free.32960
L7:
	movl	_real_free.32960, %eax
	movl	8(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	_heap_space_freed, %eax
	addl	$4, %eax
	movl	%eax, _heap_space_freed
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE31:
.lcomm _real_malloc.32954,4,4
.lcomm _real_free.32960,4,4
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
