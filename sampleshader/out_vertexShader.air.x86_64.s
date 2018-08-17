	.text
	.file	"vertexShader"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4               # -- Begin function vertexShader
.LCPI0_0:
	.long	1065353216              # float 1
	.long	1065353216              # float 1
	.long	1065353216              # float 1
	.long	1065353216              # float 1
.LCPI0_1:
	.zero	4
	.zero	4
	.long	0                       # float 0
	.long	1065353216              # float 1
	.text
	.globl	vertexShader
	.p2align	4, 0x90
	.type	vertexShader,@function
vertexShader:                           # @vertexShader
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	subq	$16, %rsp
	movq	%rsi, %r14
	movl	%edi, %ebx
	shlq	$5, %rbx
	movaps	(%r14,%rbx), %xmm0
	movaps	%xmm0, -32(%rbp)        # 16-byte Spill
	movq	(%rdx), %xmm0           # xmm0 = mem[0],zero
	pshufd	$212, %xmm0, %xmm0      # xmm0 = xmm0[0,1,1,3]
	callq	air.convert.f.v2f32.u.v2i32
	rcpps	%xmm0, %xmm1
	mulps	%xmm1, %xmm0
	movaps	.LCPI0_0(%rip), %xmm2   # xmm2 = [1.000000e+00,1.000000e+00,1.000000e+00,1.000000e+00]
	subps	%xmm0, %xmm2
	mulps	%xmm1, %xmm2
	addps	%xmm1, %xmm2
	addps	%xmm2, %xmm2
	mulps	-32(%rbp), %xmm2        # 16-byte Folded Reload
	movapd	.LCPI0_1(%rip), %xmm0   # xmm0 = <u,u,0,1>
	movsd	%xmm2, %xmm0            # xmm0 = xmm2[0],xmm0[1]
	movaps	16(%r14,%rbx), %xmm1
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end0:
	.size	vertexShader, .Lfunc_end0-vertexShader
                                        # -- End function

	.ident	"Apple LLVM version 802.4 (metalfe-802.4.7)"
	.section	".note.GNU-stack","",@progbits
