	.text
	.file	"fragmentShader"
	.globl	fragmentShader          # -- Begin function fragmentShader
	.p2align	4, 0x90
	.type	fragmentShader,@function
fragmentShader:                         # @fragmentShader
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movaps	%xmm1, %xmm0
	popq	%rbp
	retq
.Lfunc_end0:
	.size	fragmentShader, .Lfunc_end0-fragmentShader
                                        # -- End function

	.ident	"Apple LLVM version 802.4 (metalfe-802.4.7)"
	.section	".note.GNU-stack","",@progbits
