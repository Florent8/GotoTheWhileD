	.file	"bracket.c"
	.comm	OPEN_BRACKETS,3,1
	.comm	openBrackets,1024,32
	.globl	openCursor
	.bss
	.align 4
	.type	openCursor, @object
	.size	openCursor, 4
openCursor:
	.zero	4
	.comm	CLOSE_BRACKETS,3,1
	.comm	closeBrackets,1024,32
	.globl	closeCursor
	.data
	.align 4
	.type	closeCursor, @object
	.size	closeCursor, 4
closeCursor:
	.long	1024
	.text
	.globl	indexOf
	.type	indexOf, @function
indexOf:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movq	%rsi, -32(%rbp)
	movb	%al, -20(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L5:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	-20(%rbp), %al
	jne	.L3
	movl	-4(%rbp), %eax
	jmp	.L4
.L3:
	addl	$1, -4(%rbp)
.L2:
	cmpl	$2, -4(%rbp)
	jle	.L5
	movl	$-1, %eax
.L4:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	indexOf, .-indexOf
	.globl	in_array
	.type	in_array, @function
in_array:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, %eax
	movq	%rsi, -16(%rbp)
	movb	%al, -4(%rbp)
	movsbl	-4(%rbp), %eax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	indexOf
	cmpl	$-1, %eax
	setne	%al
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	in_array, .-in_array
	.globl	checkBrackets
	.type	checkBrackets, @function
checkBrackets:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L9
.L12:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	$OPEN_BRACKETS, %esi
	movl	%eax, %edi
	call	in_array
	testb	%al, %al
	je	.L10
	movl	openCursor(%rip), %eax
	leal	1(%rax), %edx
	movl	%edx, openCursor(%rip)
	movl	-12(%rbp), %edx
	movslq	%edx, %rcx
	movq	-32(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rdx), %edx
	cltq
	movb	%dl, openBrackets(%rax)
	jmp	.L11
.L10:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	$CLOSE_BRACKETS, %esi
	movl	%eax, %edi
	call	in_array
	testb	%al, %al
	je	.L11
	movl	closeCursor(%rip), %eax
	subl	$1, %eax
	movl	%eax, closeCursor(%rip)
	movl	closeCursor(%rip), %eax
	movl	-12(%rbp), %edx
	movslq	%edx, %rcx
	movq	-32(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rdx), %edx
	cltq
	movb	%dl, closeBrackets(%rax)
.L11:
	addl	$1, -12(%rbp)
.L9:
	movl	-12(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L12
	movl	openCursor(%rip), %eax
	movl	$1023, %edx
	subl	%eax, %edx
	movl	closeCursor(%rip), %eax
	cmpl	%eax, %edx
	je	.L13
	movl	$0, %eax
	jmp	.L14
.L13:
	movl	$0, -8(%rbp)
	jmp	.L15
.L17:
	movl	-8(%rbp), %eax
	cltq
	movzbl	openBrackets(%rax), %eax
	movsbl	%al, %eax
	movl	$OPEN_BRACKETS, %esi
	movl	%eax, %edi
	call	indexOf
	movl	%eax, -4(%rbp)
	cmpl	$-1, -4(%rbp)
	je	.L16
	movl	closeCursor(%rip), %eax
	leal	1(%rax), %edx
	movl	%edx, closeCursor(%rip)
	cltq
	movzbl	closeBrackets(%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	movzbl	CLOSE_BRACKETS(%rax), %eax
	cmpb	%al, %dl
	je	.L16
	movl	$0, %eax
	jmp	.L14
.L16:
	addl	$1, -8(%rbp)
.L15:
	movl	openCursor(%rip), %eax
	cmpl	%eax, -8(%rbp)
	jl	.L17
	movl	$1, %eax
.L14:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	checkBrackets, .-checkBrackets
	.section	.rodata
.LC0:
	.string	"YES"
.LC1:
	.string	"NO"
	.text
	.globl	main
	.type	main, @function
main:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movb	$40, OPEN_BRACKETS(%rip)
	movb	$123, OPEN_BRACKETS+1(%rip)
	movb	$91, OPEN_BRACKETS+2(%rip)
	movb	$41, CLOSE_BRACKETS(%rip)
	movb	$125, CLOSE_BRACKETS+1(%rip)
	movb	$93, CLOSE_BRACKETS+2(%rip)
	movq	-32(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rbx
	movq	-32(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rbx, %rsi
	movl	%eax, %edi
	call	checkBrackets
	testb	%al, %al
	je	.L19
	movl	$.LC0, %eax
	jmp	.L20
.L19:
	movl	$.LC1, %eax
.L20:
	movq	%rax, %rdi
	call	puts
	movl	$0, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.5) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
