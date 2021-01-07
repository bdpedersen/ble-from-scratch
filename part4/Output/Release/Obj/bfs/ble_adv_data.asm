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
	.file	"ble_adv_data.cc"
	.text
	.section	.text.startup._GLOBAL__sub_I_devicename,"ax",%progbits
	.align	1
	.p2align 2,,3
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	_GLOBAL__sub_I_devicename, %function
_GLOBAL__sub_I_devicename:
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6}
	ldr	r3, .L87
	ldr	r3, [r3]
	sub	sp, sp, #108
	ldrb	r2, [r3]	@ zero_extendqisi2
	mov	r0, #258
	movs	r1, #6
	strh	r0, [sp, #4]	@ movhi
	strb	r1, [sp, #6]
	cmp	r2, #0
	beq	.L2
	mov	r1, r3
	movs	r6, #0
.L4:
	ldrb	r2, [r1, #1]!	@ zero_extendqisi2
	mov	r5, r6
	adds	r6, r6, #1
	cmp	r2, #0
	bne	.L4
	uxtb	r1, r6
	adds	r0, r1, #2
	movs	r4, #9
	adds	r1, r1, #1
	cmp	r5, #2
	uxtb	r0, r0
	strb	r1, [sp, #36]
	strb	r4, [sp, #37]
	ble	.L6
	ldr	r2, [r3]	@ unaligned
	str	r2, [sp, #38]	@ unaligned
	lsrs	r2, r6, #2
	cmp	r2, #1
	beq	.L7
	ldr	r1, [r3, #4]	@ unaligned
	str	r1, [sp, #42]	@ unaligned
	cmp	r2, #2
	beq	.L7
	ldr	r1, [r3, #8]	@ unaligned
	str	r1, [sp, #46]	@ unaligned
	cmp	r2, #3
	beq	.L7
	ldr	r1, [r3, #12]	@ unaligned
	str	r1, [sp, #50]	@ unaligned
	cmp	r2, #4
	beq	.L7
	ldr	r1, [r3, #16]	@ unaligned
	str	r1, [sp, #54]	@ unaligned
	cmp	r2, #5
	beq	.L7
	ldr	r1, [r3, #20]	@ unaligned
	str	r1, [sp, #58]	@ unaligned
	cmp	r2, #6
	beq	.L7
	ldr	r2, [r3, #24]	@ unaligned
	str	r2, [sp, #62]	@ unaligned
.L7:
	lsls	r1, r6, #30
	bic	r2, r6, #3
	beq	.L11
.L6:
	add	r1, sp, #104
	add	r1, r1, r2
	ldrb	r4, [r3, r2]	@ zero_extendqisi2
	strb	r4, [r1, #-66]
	cmp	r5, r2
	add	r4, r2, #1
	ble	.L11
	ldrb	r6, [r3, r4]	@ zero_extendqisi2
	strb	r6, [r1, #-65]
	cmp	r5, r4
	add	r2, r2, #2
	ble	.L11
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	strb	r3, [r1, #-64]
.L11:
	mov	r2, r0
	cmp	r0, #0
	beq	.L85
	cmp	r0, #1
	mov	r4, r0
	it	cc
	movcc	r4, #1
	cmp	r0, #3
	ble	.L24
	ldr	r3, [sp, #36]
	str	r3, [sp, #7]	@ unaligned
	lsrs	r3, r4, #2
	cmp	r3, #1
	beq	.L13
	ldr	r1, [sp, #40]
	str	r1, [sp, #11]	@ unaligned
	cmp	r3, #2
	beq	.L13
	ldr	r1, [sp, #44]
	str	r1, [sp, #15]	@ unaligned
	cmp	r3, #3
	beq	.L13
	ldr	r1, [sp, #48]
	str	r1, [sp, #19]	@ unaligned
	cmp	r3, #4
	beq	.L13
	ldr	r1, [sp, #52]
	str	r1, [sp, #23]	@ unaligned
	cmp	r3, #5
	beq	.L13
	ldr	r1, [sp, #56]
	str	r1, [sp, #27]	@ unaligned
	cmp	r3, #6
	beq	.L13
	ldr	r3, [sp, #60]
	str	r3, [sp, #31]	@ unaligned
.L13:
	bic	r1, r4, #3
	adds	r3, r1, #3
	cmp	r4, r1
	uxtb	r3, r3
	beq	.L14
.L12:
	add	r4, sp, #104
	add	r4, r4, r1
	ldrb	r5, [r4, #-68]	@ zero_extendqisi2
	add	r4, sp, #104
	add	r4, r4, r3
	strb	r5, [r4, #-100]
	adds	r5, r1, #1
	adds	r4, r3, #1
	cmp	r0, r5
	uxtb	r4, r4
	ble	.L14
	add	r6, sp, #104
	add	r5, r5, r6
	add	r4, r4, r6
	adds	r1, r1, #2
	ldrb	r5, [r5, #-68]	@ zero_extendqisi2
	strb	r5, [r4, #-100]
	adds	r3, r3, #2
	cmp	r0, r1
	uxtb	r3, r3
	ble	.L14
	add	r1, r1, r6
	add	r3, r3, r6
	ldrb	r1, [r1, #-68]	@ zero_extendqisi2
	strb	r1, [r3, #-100]
.L14:
	cmp	r2, #0
	add	r2, r2, #3
	it	le
	movle	r2, #4
	uxtb	r2, r2
.L9:
	ldr	r4, .L87+4
	ldrb	r3, [r4, #31]	@ zero_extendqisi2
	movs	r1, #6
	adds	r0, r3, #1
	strb	r0, [sp, #68]
	strb	r1, [sp, #69]
	cmp	r3, #0
	beq	.L86
	subs	r1, r3, #1
	cmp	r1, #2
	bls	.L25
	ldr	r1, [r4]	@ unaligned
	str	r1, [sp, #70]	@ unaligned
	lsrs	r1, r3, #2
	cmp	r1, #1
	beq	.L19
	ldr	r0, [r4, #4]	@ unaligned
	str	r0, [sp, #74]	@ unaligned
	cmp	r1, #2
	beq	.L19
	ldr	r0, [r4, #8]	@ unaligned
	str	r0, [sp, #78]	@ unaligned
	cmp	r1, #3
	beq	.L19
	ldr	r0, [r4, #12]	@ unaligned
	str	r0, [sp, #82]	@ unaligned
	cmp	r1, #4
	beq	.L19
	ldr	r0, [r4, #16]	@ unaligned
	str	r0, [sp, #86]	@ unaligned
	cmp	r1, #5
	beq	.L19
	ldr	r0, [r4, #20]	@ unaligned
	str	r0, [sp, #90]	@ unaligned
	cmp	r1, #6
	beq	.L19
	ldr	r1, [r4, #24]	@ unaligned
	str	r1, [sp, #94]	@ unaligned
.L19:
	bic	r0, r3, #3
	adds	r1, r0, #2
	cmp	r3, r0
	uxtb	r1, r1
	beq	.L21
.L18:
	add	r5, sp, #104
	add	r5, r5, r1
	ldrb	r6, [r4, r0]	@ zero_extendqisi2
	strb	r6, [r5, #-36]
	adds	r6, r0, #1
	adds	r5, r1, #1
	cmp	r3, r6
	uxtb	r5, r5
	ble	.L21
	add	ip, sp, #104
	add	r5, r5, ip
	adds	r0, r0, #2
	ldrb	r6, [r4, r6]	@ zero_extendqisi2
	strb	r6, [r5, #-36]
	adds	r1, r1, #2
	cmp	r0, r3
	uxtb	r1, r1
	bge	.L21
	add	r1, r1, ip
	ldrb	r0, [r4, r0]	@ zero_extendqisi2
	strb	r0, [r1, #-36]
.L21:
	adds	r3, r3, #2
	uxtb	r3, r3
.L20:
	add	r3, r3, r2
	uxtb	r3, r3
	add	r1, sp, #68
.L17:
	add	r0, sp, #104
	add	r0, r0, r2
	adds	r2, r2, #1
	uxtb	r2, r2
	ldrb	r4, [r1], #1	@ zero_extendqisi2
	strb	r4, [r0, #-100]
	cmp	r3, r2
	bne	.L17
	strb	r3, [sp, #35]
	add	r5, sp, #4
	ldmia	r5!, {r0, r1, r2, r3}
	ldr	r4, .L87+8
	ldr	r6, .L87+12
	stmia	r4!, {r0, r1, r2, r3}
	ldm	r5, {r0, r1, r2, r3}
	stm	r4, {r0, r1, r2, r3}
	movs	r3, #0
	strb	r3, [r6, #31]
	add	sp, sp, #108
	@ sp needed
	pop	{r4, r5, r6}
	bx	lr
.L2:
	movw	r3, #2305
	lsrs	r2, r3, #8
	strb	r2, [sp, #8]
	strh	r3, [sp, #36]	@ movhi
	strb	r3, [sp, #7]
	movs	r2, #2
	b	.L14
.L85:
	movs	r2, #3
	b	.L9
.L86:
	movs	r3, #2
	b	.L20
.L25:
	movs	r1, #2
	movs	r0, #0
	b	.L18
.L24:
	movs	r3, #3
	movs	r1, #0
	b	.L12
.L88:
	.align	2
.L87:
	.word	.LANCHOR0
	.word	ui_service
	.word	.LANCHOR1
	.word	.LANCHOR2
	.size	_GLOBAL__sub_I_devicename, .-_GLOBAL__sub_I_devicename
	.section	.init_array,"aw",%init_array
	.align	2
	.word	_GLOBAL__sub_I_devicename(target1)
	.global	scan_resp
	.global	adv
	.global	devicename
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"BFS\000"
	.section	.bss.adv,"aw",%nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	adv, %object
	.size	adv, 32
adv:
	.space	32
	.section	.bss.scan_resp,"aw",%nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	scan_resp, %object
	.size	scan_resp, 32
scan_resp:
	.space	32
	.section	.data.devicename,"aw"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	devicename, %object
	.size	devicename, 4
devicename:
	.word	.LC0
	.ident	"GCC: (GNU) 9.3.1 20200408 (release)"
