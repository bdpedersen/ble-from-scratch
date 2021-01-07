	.cpu cortex-m4
	.eabi_attribute 27, 1
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"uuids.cc"
	.text
	.section	.text._ZN4UUIDC2EPKc,"axG",%progbits,_ZN4UUIDC5EPKc,comdat
	.align	1
	.p2align 2,,3
	.weak	_ZN4UUIDC2EPKc
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	_ZN4UUIDC2EPKc, %function
_ZN4UUIDC2EPKc:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6}
	movs	r3, #0
	strb	r3, [r0, #31]
	ldrb	r6, [r1]	@ zero_extendqisi2
	cbz	r6, .L2
	mov	r3, r1
	rsb	r5, r1, #1
.L3:
	adds	r4, r5, r3
	ldrb	r2, [r3, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3
	cmp	r4, #6
	beq	.L65
.L2:
	ldrb	r3, [r1, #35]	@ zero_extendqisi2
	subs	r3, r3, #49
	uxtb	r3, r3
	cmp	r3, #53
	mov	r2, #16
	strb	r2, [r0, #31]
	itt	ls
	ldrls	r2, .L85
	ldrsbls	r2, [r2, r3]
	ldrb	r3, [r1, #34]	@ zero_extendqisi2
	sub	r3, r3, #49
	uxtb	r3, r3
	it	hi
	movhi	r2, #0
	cmp	r3, #53
	bls	.L66
.L10:
	ldrb	r3, [r1, #33]	@ zero_extendqisi2
	strb	r2, [r0]
	subs	r3, r3, #49
	uxtb	r3, r3
	cmp	r3, #53
	itt	ls
	ldrls	r2, .L85
	ldrsbls	r2, [r2, r3]
	ldrb	r3, [r1, #32]	@ zero_extendqisi2
	sub	r3, r3, #49
	uxtb	r3, r3
	it	hi
	movhi	r2, #0
	cmp	r3, #53
	bls	.L67
.L12:
	ldrb	r3, [r1, #31]	@ zero_extendqisi2
	strb	r2, [r0, #1]
	subs	r3, r3, #49
	uxtb	r3, r3
	cmp	r3, #53
	itt	ls
	ldrls	r2, .L85
	ldrsbls	r2, [r2, r3]
	ldrb	r3, [r1, #30]	@ zero_extendqisi2
	sub	r3, r3, #49
	uxtb	r3, r3
	it	hi
	movhi	r2, #0
	cmp	r3, #53
	bls	.L68
.L14:
	ldrb	r3, [r1, #29]	@ zero_extendqisi2
	strb	r2, [r0, #2]
	subs	r3, r3, #49
	uxtb	r3, r3
	cmp	r3, #53
	itt	ls
	ldrls	r2, .L85
	ldrsbls	r2, [r2, r3]
	ldrb	r3, [r1, #28]	@ zero_extendqisi2
	sub	r3, r3, #49
	uxtb	r3, r3
	it	hi
	movhi	r2, #0
	cmp	r3, #53
	bls	.L69
.L16:
	ldrb	r3, [r1, #27]	@ zero_extendqisi2
	strb	r2, [r0, #3]
	subs	r3, r3, #49
	uxtb	r3, r3
	cmp	r3, #53
	itt	ls
	ldrls	r2, .L85
	ldrsbls	r2, [r2, r3]
	ldrb	r3, [r1, #26]	@ zero_extendqisi2
	sub	r3, r3, #49
	uxtb	r3, r3
	it	hi
	movhi	r2, #0
	cmp	r3, #53
	bls	.L70
.L18:
	ldrb	r3, [r1, #25]	@ zero_extendqisi2
	strb	r2, [r0, #4]
	subs	r3, r3, #49
	uxtb	r3, r3
	cmp	r3, #53
	itt	ls
	ldrls	r2, .L85
	ldrsbls	r2, [r2, r3]
	ldrb	r3, [r1, #24]	@ zero_extendqisi2
	sub	r3, r3, #49
	uxtb	r3, r3
	it	hi
	movhi	r2, #0
	cmp	r3, #53
	bls	.L71
.L20:
	ldrb	r3, [r1, #22]	@ zero_extendqisi2
	strb	r2, [r0, #5]
	subs	r3, r3, #49
	uxtb	r3, r3
	cmp	r3, #53
	itt	ls
	ldrls	r2, .L85
	ldrsbls	r2, [r2, r3]
	ldrb	r3, [r1, #21]	@ zero_extendqisi2
	sub	r3, r3, #49
	uxtb	r3, r3
	it	hi
	movhi	r2, #0
	cmp	r3, #53
	bls	.L72
.L22:
	ldrb	r3, [r1, #20]	@ zero_extendqisi2
	strb	r2, [r0, #6]
	subs	r3, r3, #49
	uxtb	r3, r3
	cmp	r3, #53
	itt	ls
	ldrls	r2, .L85
	ldrsbls	r2, [r2, r3]
	ldrb	r3, [r1, #19]	@ zero_extendqisi2
	sub	r3, r3, #49
	uxtb	r3, r3
	it	hi
	movhi	r2, #0
	cmp	r3, #53
	bls	.L73
.L24:
	ldrb	r3, [r1, #17]	@ zero_extendqisi2
	strb	r2, [r0, #7]
	subs	r3, r3, #49
	uxtb	r3, r3
	cmp	r3, #53
	itt	ls
	ldrls	r2, .L85
	ldrsbls	r2, [r2, r3]
	ldrb	r3, [r1, #16]	@ zero_extendqisi2
	sub	r3, r3, #49
	uxtb	r3, r3
	it	hi
	movhi	r2, #0
	cmp	r3, #53
	bls	.L74
.L26:
	ldrb	r3, [r1, #15]	@ zero_extendqisi2
	strb	r2, [r0, #8]
	subs	r3, r3, #49
	uxtb	r3, r3
	cmp	r3, #53
	itt	ls
	ldrls	r2, .L85
	ldrsbls	r2, [r2, r3]
	ldrb	r3, [r1, #14]	@ zero_extendqisi2
	sub	r3, r3, #49
	uxtb	r3, r3
	it	hi
	movhi	r2, #0
	cmp	r3, #53
	bls	.L75
.L28:
	ldrb	r3, [r1, #12]	@ zero_extendqisi2
	strb	r2, [r0, #9]
	subs	r3, r3, #49
	uxtb	r3, r3
	cmp	r3, #53
	itt	ls
	ldrls	r2, .L85
	ldrsbls	r2, [r2, r3]
	ldrb	r3, [r1, #11]	@ zero_extendqisi2
	sub	r3, r3, #49
	uxtb	r3, r3
	it	hi
	movhi	r2, #0
	cmp	r3, #53
	bls	.L76
.L30:
	ldrb	r3, [r1, #10]	@ zero_extendqisi2
	strb	r2, [r0, #10]
	subs	r3, r3, #49
	uxtb	r3, r3
	cmp	r3, #53
	itt	ls
	ldrls	r2, .L85
	ldrsbls	r2, [r2, r3]
	ldrb	r3, [r1, #9]	@ zero_extendqisi2
	sub	r3, r3, #49
	uxtb	r3, r3
	it	hi
	movhi	r2, #0
	cmp	r3, #53
	bls	.L77
.L32:
	ldrb	r3, [r1, #7]	@ zero_extendqisi2
	strb	r2, [r0, #11]
	subs	r3, r3, #49
	uxtb	r3, r3
	cmp	r3, #53
	itt	ls
	ldrls	r2, .L85
	ldrsbls	r2, [r2, r3]
	ldrb	r3, [r1, #6]	@ zero_extendqisi2
	sub	r3, r3, #49
	uxtb	r3, r3
	it	hi
	movhi	r2, #0
	cmp	r3, #53
	bls	.L78
.L34:
	ldrb	r3, [r1, #5]	@ zero_extendqisi2
	strb	r2, [r0, #12]
	subs	r3, r3, #49
	uxtb	r3, r3
	cmp	r3, #53
	itt	ls
	ldrls	r2, .L85
	ldrsbls	r2, [r2, r3]
	ldrb	r3, [r1, #4]	@ zero_extendqisi2
	sub	r3, r3, #49
	uxtb	r3, r3
	it	hi
	movhi	r2, #0
	cmp	r3, #53
	bls	.L79
.L36:
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	strb	r2, [r0, #13]
	subs	r3, r3, #49
	uxtb	r3, r3
	cmp	r3, #53
	itt	ls
	ldrls	r2, .L85
	ldrsbls	r2, [r2, r3]
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	sub	r3, r3, #49
	uxtb	r3, r3
	it	hi
	movhi	r2, #0
	cmp	r3, #53
	bls	.L80
.L38:
	ldrb	r3, [r1, #1]	@ zero_extendqisi2
	strb	r2, [r0, #14]
	subs	r3, r3, #49
	uxtb	r3, r3
	cmp	r3, #53
	it	ls
	ldrls	r2, .L85
	sub	r6, r6, #49
	uxtb	r6, r6
	ite	ls
	ldrsbls	r3, [r2, r3]
	movhi	r3, #0
	cmp	r6, #53
	bls	.L81
.L40:
	pop	{r4, r5, r6}
	strb	r3, [r0, #15]
	bx	lr
.L81:
	ldr	r2, .L85
	ldrsb	r2, [r2, r6]
	add	r3, r3, r2, lsl #4
	b	.L40
.L80:
	ldr	r4, .L85
	ldrsb	r3, [r4, r3]
	add	r2, r2, r3, lsl #4
	b	.L38
.L79:
	ldr	r4, .L85
	ldrsb	r3, [r4, r3]
	add	r2, r2, r3, lsl #4
	b	.L36
.L78:
	ldr	r4, .L85
	ldrsb	r3, [r4, r3]
	add	r2, r2, r3, lsl #4
	b	.L34
.L77:
	ldr	r4, .L85
	ldrsb	r3, [r4, r3]
	add	r2, r2, r3, lsl #4
	b	.L32
.L76:
	ldr	r4, .L85
	ldrsb	r3, [r4, r3]
	add	r2, r2, r3, lsl #4
	b	.L30
.L75:
	ldr	r4, .L85
	ldrsb	r3, [r4, r3]
	add	r2, r2, r3, lsl #4
	b	.L28
.L74:
	ldr	r4, .L85
	ldrsb	r3, [r4, r3]
	add	r2, r2, r3, lsl #4
	b	.L26
.L73:
	ldr	r4, .L85
	ldrsb	r3, [r4, r3]
	add	r2, r2, r3, lsl #4
	b	.L24
.L72:
	ldr	r4, .L85
	ldrsb	r3, [r4, r3]
	add	r2, r2, r3, lsl #4
	b	.L22
.L71:
	ldr	r4, .L85
	ldrsb	r3, [r4, r3]
	add	r2, r2, r3, lsl #4
	b	.L20
.L70:
	ldr	r4, .L85
	ldrsb	r3, [r4, r3]
	add	r2, r2, r3, lsl #4
	b	.L18
.L69:
	ldr	r4, .L85
	ldrsb	r3, [r4, r3]
	add	r2, r2, r3, lsl #4
	b	.L16
.L68:
	ldr	r4, .L85
	ldrsb	r3, [r4, r3]
	add	r2, r2, r3, lsl #4
	b	.L14
.L86:
	.align	2
.L85:
	.word	.LANCHOR0
.L67:
	ldr	r4, .L87
	ldrsb	r3, [r4, r3]
	add	r2, r2, r3, lsl #4
	b	.L12
.L66:
	ldr	r4, .L87
	ldrsb	r3, [r4, r3]
	add	r2, r2, r3, lsl #4
	b	.L10
.L65:
	ldrb	r3, [r1, #5]	@ zero_extendqisi2
	subs	r3, r3, #49
	uxtb	r3, r3
	cmp	r3, #53
	itt	ls
	ldrls	r2, .L87
	ldrsbls	r2, [r2, r3]
	ldrb	r3, [r1, #4]	@ zero_extendqisi2
	subs	r3, r3, #49
	uxtb	r3, r3
	movs	r4, #2
	cmp	r3, #53
	strb	r4, [r0, #31]
	bls	.L82
.L5:
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	strb	r2, [r0]
	subs	r3, r3, #49
	uxtb	r3, r3
	cmp	r3, #53
	itt	ls
	ldrls	r2, .L87
	ldrsbls	r2, [r2, r3]
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	sub	r3, r3, #49
	uxtb	r3, r3
	it	hi
	movhi	r2, #0
	cmp	r3, #53
	bls	.L83
	strb	r2, [r0, #1]
.L84:
	pop	{r4, r5, r6}
	bx	lr
.L83:
	ldr	r1, .L87
	ldrsb	r3, [r1, r3]
	add	r2, r2, r3, lsl #4
	strb	r2, [r0, #1]
	b	.L84
.L82:
	ldr	r4, .L87
	ldrsb	r3, [r4, r3]
	add	r2, r2, r3, lsl #4
	b	.L5
.L88:
	.align	2
.L87:
	.word	.LANCHOR0
	.size	_ZN4UUIDC2EPKc, .-_ZN4UUIDC2EPKc
	.weak	_ZN4UUIDC1EPKc
	.thumb_set _ZN4UUIDC1EPKc,_ZN4UUIDC2EPKc
	.section	.rodata._GLOBAL__sub_I_ui_service.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"6723df6e-82d5-479b-8416-54ac203d3e6e\000"
	.section	.text.startup._GLOBAL__sub_I_ui_service,"ax",%progbits
	.align	1
	.p2align 2,,3
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	_GLOBAL__sub_I_ui_service, %function
_GLOBAL__sub_I_ui_service:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	ldr	r1, .L91
	ldr	r0, .L91+4
	bl	_ZN4UUIDC1EPKc
	pop	{r3, pc}
.L92:
	.align	2
.L91:
	.word	.LC0
	.word	.LANCHOR1
	.size	_GLOBAL__sub_I_ui_service, .-_GLOBAL__sub_I_ui_service
	.section	.init_array,"aw",%init_array
	.align	2
	.word	_GLOBAL__sub_I_ui_service(target1)
	.global	ui_service
	.section	.bss.ui_service,"aw",%nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	ui_service, %object
	.size	ui_service, 32
ui_service:
	.space	32
	.section	.rodata.CSWTCH.4,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	CSWTCH.4, %object
	.size	CSWTCH.4, 54
CSWTCH.4:
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.ident	"GCC: (GNU) 9.3.1 20200408 (release)"
