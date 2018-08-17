	.text
	.file	"fragmentShader"
	.globl	fragmentShader          // -- Begin function fragmentShader
	.p2align	2
	.type	fragmentShader,@function
fragmentShader:                         // @fragmentShader
// %bb.0:
	mov	v0.16b, v1.16b
	ret
.Lfunc_end0:
	.size	fragmentShader, .Lfunc_end0-fragmentShader
                                        // -- End function

	.ident	"Apple LLVM version 802.4 (metalfe-802.4.7)"
	.section	".note.GNU-stack","",@progbits
