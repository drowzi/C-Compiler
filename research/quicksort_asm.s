
#params:
	#arr = 8
	#start = 12
	#end = 16
#locals:
	#i = -4
	#j = -8
	#pivot = -12
	#tmp = -16
#branches:
	#L21 = for conditional and closing statements
	#L22 = for assignment
	#L23 = for block

LFE15:
	.def	_qs_p;	.scl	3;	.type	32;	.endef
_qs_p:
LFB16:
	# open frame
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	# load _qs_p parameters
	movl	16(%ebp), %eax 		# load end into eax
	leal	0(,%eax,4), %edx 	# load size end * 4 (arr + (index * datasize)) into edx
	movl	8(%ebp), %eax 		# load arr into eax
	addl	%edx, %eax 			# add end to arr address, gives us the position in memory of arr[end]
	movl	(%eax), %eax 		# dereference arr[end] and place into eax (pivot)
	movl	%eax, -12(%ebp) 	# store pivot in local memory
	movl	12(%ebp), %eax 		# load start into eax
	subl	$1, %eax 			# subtract one from start (i)
	movl	%eax, -4(%ebp) 		# store i in local memory
	movl	12(%ebp), %eax 		# load start into eax (j)
	movl	%eax, -8(%ebp) 		# store j in local memory
	jmp	L21 					# goto for block
L23:
	movl	-8(%ebp), %eax		# load j into eax
	leal	0(,%eax,4), %edx	# load j index into edx
	movl	8(%ebp), %eax		# load arr into eax
	addl	%edx, %eax			# store arr+j into eax
	movl	(%eax), %eax		# load *arr+j into eax
	cmpl	-12(%ebp), %eax		# compare pivot with arr[j]
	jg	L22						# if greater, reiterate
	addl	$1, -4(%ebp)		# i++
	movl	-8(%ebp), %eax		# load j into eax
	leal	0(,%eax,4), %edx	# store j in edx
	movl	8(%ebp), %eax		# load arr into eax
	addl	%edx, %eax			# add arr+j into eax
	movl	(%eax), %eax		# load arr[j] into eax
	movl	%eax, -16(%ebp)		# store arr[j] in tmp
	movl	-8(%ebp), %eax		# load j into eax
	leal	0(,%eax,4), %edx	# store j index in edx
	movl	8(%ebp), %eax		# load arr into eax
	addl	%eax, %edx			# add arr+j into eax
	movl	-4(%ebp), %eax		# load i into eax
	leal	0(,%eax,4), %ecx	# move i into ecx
	movl	8(%ebp), %eax		# load arr into eax
	addl	%ecx, %eax			# add arr+i into eax
	movl	(%eax), %eax		# store arr[i] into eax
	movl	%eax, (%edx)		# store arr[i] in arr[j]
	movl	-4(%ebp), %eax		# load i into eax
	leal	0(,%eax,4), %edx	# store i in edx
	movl	8(%ebp), %eax		# load arr into eax
	addl	%eax, %edx			# add arr+i into edx
	movl	-16(%ebp), %eax		# load tmp into eax
	movl	%eax, (%edx)		# store tmp in arr[i]
L22:
	addl	$1, -8(%ebp)		# j++
L21:
	movl	16(%ebp), %eax		# load end into eax
	leal	-1(%eax), %edx		# store the address end-1 into edx
	movl	-8(%ebp), %eax		# load j into eax
	cmpl	%eax, %edx			# compare j and arr-1
	jnb	L23						# jump to L23
	movl	16(%ebp), %eax		# load end into eax
	leal	0(,%eax,4), %edx	# store end index into edx
	movl	8(%ebp), %eax		# load arr into eax
	addl	%edx, %eax			# store arr+end into eax
	movl	(%eax), %eax		# dereference arr[end] into eax (tmp)
	movl	%eax, -16(%ebp)		# store tmp in local memory
	movl	16(%ebp), %eax		# load end into eax
	leal	0(,%eax,4), %edx	# store end+4 into edx
	movl	8(%ebp), %eax		# load arr into eax
	addl	%eax, %edx			# store arr+end into edx
	movl	-4(%ebp), %eax		# load i into eax
	addl	$1, %eax			# eax++
	leal	0(,%eax,4), %ecx	# load i+1 index into ecx
	movl	8(%ebp), %eax		# load arr into eax
	addl	%ecx, %eax			# add arr+i
	movl	(%eax), %eax		# load arr[i+1] into eax
	movl	%eax, (%edx)		# store arr[i+1] into arr[edx]
	movl	-4(%ebp), %eax		# load j into eax
	addl	$1, %eax			# add 1 to eax
	leal	0(,%eax,4), %edx	# load j+1 index into edx
	movl	8(%ebp), %eax		# load arr into eax
	addl	%eax, %edx			# store arr+j+1 into edx
	movl	-16(%ebp), %eax		# load tmp into eax
	movl	%eax, (%edx)		# arr[j+1] = arr[tmp]
	movl	-4(%ebp), %eax		# load j into eax
	addl	$1, %eax			# eax++
	leave						# return eax
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.globl	_qs
	.def	_qs;	.scl	2;	.type	32;	.endef
_qs:
LFB17:
	# open frame
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	# _qs
	movl	12(%ebp), %eax		# load start into eax
	cmpl	16(%ebp), %eax		# compare start with end
	jnb	L27						# jump if no bit is set, unsigned start < unsigned end
	movl	16(%ebp), %eax		# load end into eax
	movl	%eax, 8(%esp)		# store end in params(-8)
	movl	12(%ebp), %eax		# load start into eax
	movl	%eax, 4(%esp)		# store start in params(-4)
	movl	8(%ebp), %eax		# load arr into eax
	movl	%eax, (%esp)		# store arr in params(0)
	call	_qs_p				# call qs_p
	movl	%eax, -12(%ebp)		# store return (pivot) in local memory (-12)
	movl	-12(%ebp), %eax		# load pivot into eax
	subl	$1, %eax			# eax--
	movl	%eax, 8(%esp)		# store pivot-1 in params(-8)
	movl	12(%ebp), %eax		# load start into eax
	movl	%eax, 4(%esp)		# store start in params(-4)
	movl	8(%ebp), %eax		# load end into eax
	movl	%eax, (%esp)		# store end in params(0)
	call	_qs					# call qs
	movl	-12(%ebp), %eax		# load pivot into eax
	leal	1(%eax), %edx		# edx = pivot+1
	movl	16(%ebp), %eax		# load end into eax
	movl	%eax, 8(%esp)		# store end in params (-8)
	movl	%edx, 4(%esp)		# store pivot+1 in params(-4)
	movl	8(%ebp), %eax		# load arr into eax							
	movl	%eax, (%esp)		# store arr in params(0)
	call	_qs					# call qs
L27:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
	
	
	
----- FVERBOSE -----



LFE17:
	.def	_qs_p;	.scl	3;	.type	32;	.endef
_qs_p:
LFB18:
	.cfi_startproc
	pushl	%ebp	 #
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp	 #,
	.cfi_def_cfa_register 5
	subl	$16, %esp	 #,
	movl	16(%ebp), %eax	 # end, tmp125
	leal	0(,%eax,4), %edx	 #, D.3464
	movl	8(%ebp), %eax	 # arr, tmp126
	addl	%edx, %eax	 # D.3464, D.3465
	movl	(%eax), %eax	 # *_9, tmp127
	movl	%eax, -12(%ebp)	 # tmp127, pivot
	movl	12(%ebp), %eax	 # start, tmp128
	subl	$1, %eax	 #, D.3464
	movl	%eax, -4(%ebp)	 # D.3464, i
	movl	12(%ebp), %eax	 # start, tmp129
	movl	%eax, -8(%ebp)	 # tmp129, j
	jmp	L37	 #
L39:
	movl	-8(%ebp), %eax	 # j, D.3464
	leal	0(,%eax,4), %edx	 #, D.3464
	movl	8(%ebp), %eax	 # arr, tmp130
	addl	%edx, %eax	 # D.3464, D.3465
	movl	(%eax), %eax	 # *_20, D.3466
	cmpl	-12(%ebp), %eax	 # pivot, D.3466
	jg	L38	 #,
	addl	$1, -4(%ebp)	 #, i
	movl	-8(%ebp), %eax	 # j, D.3464
	leal	0(,%eax,4), %edx	 #, D.3464
	movl	8(%ebp), %eax	 # arr, tmp131
	addl	%edx, %eax	 # D.3464, D.3465
	movl	(%eax), %eax	 # *_25, tmp132
	movl	%eax, -16(%ebp)	 # tmp132, tmp
	movl	-8(%ebp), %eax	 # j, D.3464
	leal	0(,%eax,4), %edx	 #, D.3464
	movl	8(%ebp), %eax	 # arr, tmp133
	addl	%eax, %edx	 # tmp133, D.3465
	movl	-4(%ebp), %eax	 # i, D.3464
	leal	0(,%eax,4), %ecx	 #, D.3464
	movl	8(%ebp), %eax	 # arr, tmp134
	addl	%ecx, %eax	 # D.3464, D.3465
	movl	(%eax), %eax	 # *_32, D.3466
	movl	%eax, (%edx)	 # D.3466, *_29
	movl	-4(%ebp), %eax	 # i, D.3464
	leal	0(,%eax,4), %edx	 #, D.3464
	movl	8(%ebp), %eax	 # arr, tmp135
	addl	%eax, %edx	 # tmp135, D.3465
	movl	-16(%ebp), %eax	 # tmp, tmp136
	movl	%eax, (%edx)	 # tmp136, *_37
L38:
	addl	$1, -8(%ebp)	 #, j
L37:
	movl	16(%ebp), %eax	 # end, tmp137
	leal	-1(%eax), %edx	 #, D.3464
	movl	-8(%ebp), %eax	 # j, D.3464
	cmpl	%eax, %edx	 # D.3464, D.3464
	jnb	L39	 #,
	movl	16(%ebp), %eax	 # end, tmp138
	leal	0(,%eax,4), %edx	 #, D.3464
	movl	8(%ebp), %eax	 # arr, tmp139
	addl	%edx, %eax	 # D.3464, D.3465
	movl	(%eax), %eax	 # *_41, tmp140
	movl	%eax, -16(%ebp)	 # tmp140, tmp
	movl	16(%ebp), %eax	 # end, tmp141
	leal	0(,%eax,4), %edx	 #, D.3464
	movl	8(%ebp), %eax	 # arr, tmp142
	addl	%eax, %edx	 # tmp142, D.3465
	movl	-4(%ebp), %eax	 # i, D.3467
	addl	$1, %eax	 #, D.3467
	leal	0(,%eax,4), %ecx	 #, D.3467
	movl	8(%ebp), %eax	 # arr, tmp143
	addl	%ecx, %eax	 # D.3467, D.3465
	movl	(%eax), %eax	 # *_48, D.3466
	movl	%eax, (%edx)	 # D.3466, *_44
	movl	-4(%ebp), %eax	 # i, D.3467
	addl	$1, %eax	 #, D.3467
	leal	0(,%eax,4), %edx	 #, D.3467
	movl	8(%ebp), %eax	 # arr, tmp144
	addl	%eax, %edx	 # tmp144, D.3465
	movl	-16(%ebp), %eax	 # tmp, tmp145
	movl	%eax, (%edx)	 # tmp145, *_54
	movl	-4(%ebp), %eax	 # i, tmp146
	addl	$1, %eax	 #, D.3466
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_qs
	.def	_qs;	.scl	2;	.type	32;	.endef
_qs:
LFB19:
	.cfi_startproc
	pushl	%ebp	 #
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp	 #,
	.cfi_def_cfa_register 5
	subl	$40, %esp	 #,
	movl	12(%ebp), %eax	 # start, tmp89
	cmpl	16(%ebp), %eax	 # end, tmp89
	jnb	L43	 #,
	movl	16(%ebp), %eax	 # end, tmp90
	movl	%eax, 8(%esp)	 # tmp90,
	movl	12(%ebp), %eax	 # start, tmp91
	movl	%eax, 4(%esp)	 # tmp91,
	movl	8(%ebp), %eax	 # arr, tmp92
	movl	%eax, (%esp)	 # tmp92,
	call	_qs_p	 #
	movl	%eax, -12(%ebp)	 # tmp93, pivot
	movl	-12(%ebp), %eax	 # pivot, tmp94
	subl	$1, %eax	 #, D.3468
	movl	%eax, 8(%esp)	 # D.3468,
	movl	12(%ebp), %eax	 # start, tmp95
	movl	%eax, 4(%esp)	 # tmp95,
	movl	8(%ebp), %eax	 # arr, tmp96
	movl	%eax, (%esp)	 # tmp96,
	call	_qs	 #
	movl	-12(%ebp), %eax	 # pivot, tmp97
	leal	1(%eax), %edx	 #, D.3468
	movl	16(%ebp), %eax	 # end, tmp98
	movl	%eax, 8(%esp)	 # tmp98,
	movl	%edx, 4(%esp)	 # D.3468,
	movl	8(%ebp), %eax	 # arr, tmp99
	movl	%eax, (%esp)	 # tmp99,
	call	_qs	 #
L43:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc