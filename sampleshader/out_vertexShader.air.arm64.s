	.text
	.file	"vertexShader"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4               // -- Begin function vertexShader
.LCPI0_0:
	.zero	4
	.zero	4
	.word	0                       // float 0
	.word	1065353216              // float 1
	.text
	.globl	vertexShader
	.p2align	2
	.type	vertexShader,@function
vertexShader:                           // @vertexShader
// %bb.0:
	str	d8, [sp, #-32]!         // 8-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 8-byte Folded Spill
	mov	w8, w0
	str	x19, [sp, #8]           // 8-byte Folded Spill
	add	x19, x1, x8, lsl #5
	ldr	d0, [x2]
	ldr	d8, [x19]
	add	x29, sp, #16            // =16
	bl	air.convert.f.v2f32.u.v2i32
	adrp	x8, .LCPI0_0
	ldr	q2, [x8, :lo12:.LCPI0_0]
	fadd	v3.2s, v8.2s, v8.2s
	ldr	q1, [x19, #16]
	ldp	x29, x30, [sp, #16]     // 8-byte Folded Reload
	ldr	x19, [sp, #8]           // 8-byte Folded Reload
	fdiv	v0.2s, v3.2s, v0.2s
	ext	v0.16b, v2.16b, v0.16b, #8
	ext	v0.16b, v0.16b, v0.16b, #8
	ldr	d8, [sp], #32           // 8-byte Folded Reload
	ret
.Lfunc_end0:
	.size	vertexShader, .Lfunc_end0-vertexShader
                                        // -- End function

	.ident	"Apple LLVM version 802.4 (metalfe-802.4.7)"
	.section	".note.GNU-stack","",@progbits
