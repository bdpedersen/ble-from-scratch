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
	.file	"SEGGER_RTT.c"
	.text
	.section	.rodata.SEGGER_RTT_ReadNoLock.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Terminal\000"
	.align	2
.LC1:
	.ascii	"RTT\000"
	.align	2
.LC2:
	.ascii	"SEGGER\000"
	.section	.text.SEGGER_RTT_ReadNoLock,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SEGGER_RTT_ReadNoLock
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_ReadNoLock, %function
SEGGER_RTT_ReadNoLock:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L20
	ldrb	r3, [r4]	@ zero_extendqisi2
	sub	sp, sp, #12
	mov	r6, r0
	mov	r10, r1
	mov	r9, r2
	cmp	r3, #0
	beq	.L18
.L2:
	add	r8, r6, r6, lsl #1
	add	r8, r4, r8, lsl #3
	lsl	fp, r6, #1
	ldr	r7, [r8, #88]
	ldr	r3, [r8, #84]
	cmp	r7, r3
	bhi	.L19
	subs	r5, r3, r7
	cmp	r5, r9
	it	cs
	movcs	r5, r9
	cbnz	r5, .L9
.L1:
	mov	r0, r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L9:
	mov	r8, r5
.L7:
	add	r3, fp, r6
	add	r3, r4, r3, lsl #3
	mov	r2, r5
	ldr	r1, [r3, #76]
	mov	r0, r10
	add	r1, r1, r7
	bl	memcpy
	add	r7, r7, r5
	mov	r5, r8
.L5:
	cmp	r5, #0
	beq	.L1
	add	r6, r6, fp
	add	r4, r4, r6, lsl #3
	mov	r0, r5
	str	r7, [r4, #88]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L19:
	ldrd	r1, r5, [r8, #76]
	subs	r5, r5, r7
	cmp	r5, r9
	it	cs
	movcs	r5, r9
	mov	r2, r5
	add	r1, r1, r7
	mov	r0, r10
	str	r3, [sp, #4]
	bl	memcpy
	ldr	r2, [r8, #80]
	ldr	r3, [sp, #4]
	add	r7, r7, r5
	cmp	r2, r7
	sub	r9, r9, r5
	ite	ne
	subne	r3, r3, r7
	moveq	r7, #0
	cmp	r3, r9
	it	cs
	movcs	r3, r9
	cmp	r3, #0
	beq	.L5
	add	r10, r10, r5
	add	r8, r5, r3
	mov	r5, r3
	b	.L7
.L18:
	ldr	r2, .L20+4
	str	r3, [r4, #40]
	movs	r1, #2
	str	r3, [r4, #36]
	str	r3, [r4, #44]
	str	r3, [r4, #88]
	str	r3, [r4, #84]
	str	r3, [r4, #92]
	ldr	r3, .L20+8
	str	r2, [r4, #24]
	strd	r1, r1, [r4, #16]
	str	r2, [r4, #72]
	mov	r1, #1024
	ldr	r2, .L20+12
	str	r3, [r4, #28]
	movs	r3, #16
	str	r3, [r4, #80]
	str	r1, [r4, #32]
	str	r2, [r4, #76]
	ldr	r1, .L20+16
	adds	r0, r4, #7
	bl	strcpy
	ldr	r1, .L20+20
	mov	r0, r4
	bl	strcpy
	movs	r3, #32
	strb	r3, [r4, #6]
	b	.L2
.L21:
	.align	2
.L20:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LANCHOR1
	.word	.LANCHOR2
	.word	.LC1
	.word	.LC2
	.size	SEGGER_RTT_ReadNoLock, .-SEGGER_RTT_ReadNoLock
	.section	.text.SEGGER_RTT_Read,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SEGGER_RTT_Read
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_Read, %function
SEGGER_RTT_Read:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r0
	sub	sp, sp, #12
	mov	r10, r1
	mov	r8, r2
	.syntax unified
@ 603 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	mrs   fp, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r4, .L41
	ldrb	r2, [r4]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L39
.L23:
	add	r7, r5, r5, lsl #1
	add	r7, r4, r7, lsl #3
	lsls	r3, r5, #1
	ldr	r6, [r7, #88]
	ldr	r9, [r7, #84]
	cmp	r6, r9
	bhi	.L40
	sub	r2, r9, r6
	cmp	r2, r8
	it	cs
	movcs	r2, r8
	cbnz	r2, .L30
.L27:
	.syntax unified
@ 611 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	msr   basepri, fp  
	
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r0, r2
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L30:
	mov	r7, r2
.L28:
	adds	r1, r3, r5
	add	r1, r4, r1, lsl #3
	mov	r0, r10
	ldr	r1, [r1, #76]
	str	r3, [sp, #4]
	add	r1, r1, r6
	str	r2, [sp]
	bl	memcpy
	ldr	r2, [sp]
	ldr	r3, [sp, #4]
	add	r6, r6, r2
	mov	r2, r7
.L26:
	cmp	r2, #0
	beq	.L27
	add	r5, r5, r3
	add	r4, r4, r5, lsl #3
	str	r6, [r4, #88]
	b	.L27
.L40:
	ldrd	r1, r2, [r7, #76]
	subs	r2, r2, r6
	cmp	r2, r8
	it	cs
	movcs	r2, r8
	add	r1, r1, r6
	mov	r0, r10
	str	r3, [sp, #4]
	str	r2, [sp]
	bl	memcpy
	ldr	r2, [sp]
	ldr	r1, [r7, #80]
	ldr	r3, [sp, #4]
	add	r6, r6, r2
	cmp	r6, r1
	sub	r8, r8, r2
	ite	ne
	subne	r9, r9, r6
	moveq	r6, #0
	cmp	r9, r8
	it	cs
	movcs	r9, r8
	cmp	r9, #0
	beq	.L26
	add	r10, r10, r2
	add	r7, r2, r9
	mov	r2, r9
	b	.L28
.L39:
	str	r2, [r4, #40]
	movs	r0, #2
	str	r2, [r4, #36]
	str	r2, [r4, #44]
	str	r2, [r4, #88]
	str	r2, [r4, #84]
	str	r2, [r4, #92]
	ldr	r2, .L41+4
	ldr	r1, .L41+8
	str	r2, [r4, #28]
	strd	r0, r0, [r4, #16]
	movs	r2, #16
	ldr	r0, .L41+12
	str	r2, [r4, #80]
	mov	r6, #1024
	str	r1, [r4, #24]
	str	r1, [r4, #72]
	str	r0, [r4, #76]
	ldr	r1, .L41+16
	str	r6, [r4, #32]
	adds	r0, r4, #7
	bl	strcpy
	ldr	r1, .L41+20
	mov	r0, r4
	bl	strcpy
	movs	r2, #32
	strb	r2, [r4, #6]
	b	.L23
.L42:
	.align	2
.L41:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	.LC0
	.word	.LANCHOR2
	.word	.LC1
	.word	.LC2
	.size	SEGGER_RTT_Read, .-SEGGER_RTT_Read
	.section	.text.SEGGER_RTT_WriteWithOverwriteNoLock,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SEGGER_RTT_WriteWithOverwriteNoLock
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_WriteWithOverwriteNoLock, %function
SEGGER_RTT_WriteWithOverwriteNoLock:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	fp, .L57
	add	r3, r0, r0, lsl #1
	add	r3, fp, r3, lsl #3
	mov	r7, r0
	ldr	r4, [r3, #40]
	ldr	r0, [r3, #36]
	cmp	r0, r4
	mov	r6, r1
	mov	r5, r2
	lsl	r8, r7, #1
	beq	.L56
	ldr	r2, [r3, #40]
	cmp	r0, r2
	ldr	r2, [r3, #40]
	itt	cs
	ldrcs	r3, [r3, #32]
	addcs	r2, r2, r3
	subs	r2, r2, #1
	subs	r2, r2, r0
.L45:
	cmp	r2, r5
	bcs	.L47
	add	r3, r8, r7
	add	r3, fp, r3, lsl #3
	ldr	r4, [r3, #40]
	ldr	r1, [r3, #32]
	add	r4, r4, r5
	subs	r2, r4, r2
	str	r2, [r3, #40]
	ldr	r2, [r3, #40]
	cmp	r2, r1
	bcc	.L47
.L48:
	ldr	r2, [r3, #40]
	subs	r2, r2, r1
	str	r2, [r3, #40]
	ldr	r2, [r3, #40]
	cmp	r2, r1
	bcs	.L48
.L47:
	add	r3, r8, r7
	add	r3, fp, r3, lsl #3
	add	r10, r7, #1
	ldr	r4, [r3, #32]
	add	r9, r10, r10, lsl #1
	subs	r4, r4, r0
	lsl	r9, r9, #3
	b	.L51
.L49:
	ldr	r3, [r3, #4]
	add	r0, r0, r3
	bl	memcpy
	add	r3, r8, r7
	add	r3, fp, r3, lsl #3
	subs	r5, r5, r4
	ldr	r2, [r3, #32]
	movs	r0, #0
	add	r6, r6, r4
	str	r0, [r3, #36]
	subs	r4, r2, #1
	cbz	r5, .L43
.L51:
	cmp	r5, r4
	add	r3, fp, r9
	mov	r2, r4
	mov	r1, r6
	bcs	.L49
	add	r10, r10, r10, lsl #1
	add	r10, fp, r10, lsl #3
	add	r7, r7, r8
	ldr	r3, [r10, #4]
	add	fp, fp, r7, lsl #3
	add	r0, r0, r3
	mov	r2, r5
	bl	memcpy
	ldr	r3, [fp, #36]
	add	r5, r5, r3
	str	r5, [fp, #36]
.L43:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L56:
	ldr	r2, [r3, #32]
	subs	r2, r2, #1
	b	.L45
.L58:
	.align	2
.L57:
	.word	.LANCHOR0
	.size	SEGGER_RTT_WriteWithOverwriteNoLock, .-SEGGER_RTT_WriteWithOverwriteNoLock
	.section	.text.SEGGER_RTT_WriteSkipNoLock,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SEGGER_RTT_WriteSkipNoLock
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_WriteSkipNoLock, %function
SEGGER_RTT_WriteSkipNoLock:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L70
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	add	r4, r0, r0, lsl #1
	add	r4, ip, r4, lsl #3
	mov	r5, r2
	ldr	r3, [r4, #40]
	ldr	r6, [r4, #36]
	cmp	r3, r6
	bhi	.L60
	ldr	r9, [r4, #32]
	sub	r8, r9, r6
	add	lr, r8, #-1
	cmp	r2, lr
	bls	.L68
	add	r3, r3, lr
	cmp	r2, r3
	bls	.L69
.L65:
	movs	r0, #0
.L59:
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L60:
	subs	r3, r3, #1
	subs	r3, r3, r6
	cmp	r3, r2
	bcc	.L65
	adds	r0, r0, #1
	add	r0, r0, r0, lsl #1
	add	r0, ip, r0, lsl #3
	ldr	r0, [r0, #4]
	b	.L67
.L69:
	cmp	r8, r2
	bhi	.L68
	adds	r0, r0, #1
	add	r0, r0, r0, lsl #1
	add	r10, ip, r0, lsl #3
	add	r5, r5, r6
	ldr	r0, [r10, #4]
	mov	r7, r1
	mov	r2, r8
	sub	r5, r5, r9
	add	r0, r0, r6
	bl	memcpy
	ldr	r0, [r10, #4]
	add	r1, r7, r8
	mov	r2, r5
	bl	memcpy
	str	r5, [r4, #36]
	movs	r0, #1
	b	.L59
.L68:
	adds	r0, r0, #1
	add	r0, r0, r0, lsl #1
	add	ip, ip, r0, lsl #3
	ldr	r0, [ip, #4]
.L67:
	add	r0, r0, r6
	add	r5, r5, r6
	bl	memcpy
	str	r5, [r4, #36]
	movs	r0, #1
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L71:
	.align	2
.L70:
	.word	.LANCHOR0
	.size	SEGGER_RTT_WriteSkipNoLock, .-SEGGER_RTT_WriteSkipNoLock
	.section	.text.SEGGER_RTT_WriteNoLock,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SEGGER_RTT_WriteNoLock
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_WriteNoLock, %function
SEGGER_RTT_WriteNoLock:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r9, .L100
	add	r5, r0, r0, lsl #1
	add	r5, r9, r5, lsl #3
	sub	sp, sp, #12
	ldr	r6, [r5, #44]
	cmp	r6, #1
	mov	r7, r0
	mov	r10, r1
	mov	r8, r2
	lsl	r4, r0, #1
	beq	.L73
	cmp	r6, #2
	beq	.L74
	cbz	r6, .L95
	movs	r6, #0
.L72:
	mov	r0, r6
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L73:
	ldr	r6, [r5, #40]
	ldr	fp, [r5, #36]
	cmp	r6, fp
	bls	.L96
	subs	r6, r6, #1
	sub	r6, r6, fp
	ldr	r5, [r5, #32]
	cmp	r6, r8
	it	cs
	movcs	r6, r8
	sub	r2, r5, fp
	cmp	r6, r2
	bcs	.L81
.L99:
	adds	r3, r7, #1
	add	r3, r3, r3, lsl #1
	add	r3, r9, r3, lsl #3
	mov	r2, r6
	ldr	r0, [r3, #4]
	mov	r1, r10
	add	r0, r0, fp
	bl	memcpy
	add	r7, r7, r4
	add	r9, r9, r7, lsl #3
	add	r2, r6, fp
	mov	r0, r6
	str	r2, [r9, #36]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L95:
	ldr	r3, [r5, #40]
	ldr	fp, [r5, #36]
	cmp	r3, fp
	itt	ls
	ldrls	r2, [r5, #32]
	addls	r3, r3, r2
	subs	r3, r3, #1
	sub	r3, r3, fp
	cmp	r8, r3
	bhi	.L72
	add	r4, r4, r0
	add	r4, r9, r4, lsl #3
	adds	r7, r7, #1
	ldr	r5, [r4, #32]
	sub	r6, r5, fp
	add	r7, r7, r7, lsl #1
	cmp	r8, r6
	add	r9, r9, r7, lsl #3
	bcs	.L78
	ldr	r0, [r9, #4]
	mov	r2, r8
	add	r0, r0, fp
	bl	memcpy
	add	r3, r8, fp
	str	r3, [r4, #36]
	mov	r6, r8
	b	.L72
.L74:
	adds	r7, r7, #1
	add	r7, r7, r7, lsl #1
	ldr	r4, [r5, #36]
	lsls	r7, r7, #3
	movs	r6, #0
.L87:
	ldr	r3, [r5, #40]
	cmp	r3, r4
	add	r2, r3, #-1
	bls	.L82
.L98:
	subs	r3, r2, r4
	ldr	r2, [r5, #32]
.L83:
	cmp	r3, r8
	add	r1, r9, r7
	sub	fp, r2, r4
	it	cs
	movcs	r3, r8
	cmp	fp, r3
	ldr	r0, [r1, #4]
	it	cs
	movcs	fp, r3
	add	r0, r0, r4
	mov	r1, r10
	mov	r2, fp
	bl	memcpy
	ldr	r3, [r5, #32]
	add	r4, r4, fp
	cmp	r4, r3
	add	r6, r6, fp
	sub	r8, r8, fp
	add	r10, r10, fp
	beq	.L97
	str	r4, [r5, #36]
	cmp	r8, #0
	beq	.L72
	ldr	r3, [r5, #40]
	cmp	r3, r4
	add	r2, r3, #-1
	bhi	.L98
.L82:
	ldr	r2, [r5, #32]
	add	r3, r3, r2
	subs	r3, r3, #1
	subs	r3, r3, r4
	b	.L83
.L97:
	movs	r4, #0
	str	r4, [r5, #36]
	cmp	r8, #0
	bne	.L87
	b	.L72
.L96:
	ldr	r5, [r5, #32]
	add	r6, r6, r5
	subs	r6, r6, #1
	sub	r6, r6, fp
	cmp	r6, r8
	it	cs
	movcs	r6, r8
	sub	r2, r5, fp
	cmp	r6, r2
	bcc	.L99
.L81:
	add	r8, r7, #1
	add	r8, r8, r8, lsl #1
	add	r8, r9, r8, lsl #3
	mov	r1, r10
	ldr	r0, [r8, #4]
	str	r2, [sp, #4]
	add	r0, r0, fp
	bl	memcpy
	subs	r5, r6, r5
	ldr	r2, [sp, #4]
	ldr	r0, [r8, #4]
	add	r5, r5, fp
	add	r1, r10, r2
	mov	r2, r5
	bl	memcpy
	add	r7, r7, r4
	add	r9, r9, r7, lsl #3
	mov	r0, r6
	str	r5, [r9, #36]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L78:
	ldr	r0, [r9, #4]
	add	r0, r0, fp
	add	fp, fp, r8
	mov	r2, r6
	sub	r5, fp, r5
	bl	memcpy
	add	r1, r10, r6
	ldr	r0, [r9, #4]
	mov	r2, r5
	bl	memcpy
	mov	r6, r8
	str	r5, [r4, #36]
	b	.L72
.L101:
	.align	2
.L100:
	.word	.LANCHOR0
	.size	SEGGER_RTT_WriteNoLock, .-SEGGER_RTT_WriteNoLock
	.section	.text.SEGGER_RTT_Write,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SEGGER_RTT_Write
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_Write, %function
SEGGER_RTT_Write:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r7, .L132
	ldrb	r3, [r7]	@ zero_extendqisi2
	sub	sp, sp, #12
	mov	r8, r0
	mov	fp, r1
	mov	r9, r2
	cbz	r3, .L126
.L103:
	.syntax unified
@ 954 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	mrs   r10, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	add	r5, r8, r8, lsl #1
	add	r5, r7, r5, lsl #3
	lsl	r4, r8, #1
	ldr	r6, [r5, #44]
	cmp	r6, #1
	beq	.L104
	cmp	r6, #2
	beq	.L105
	cbz	r6, .L127
	movs	r6, #0
.L106:
	.syntax unified
@ 962 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	msr   basepri, r10  
	
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r0, r6
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L126:
	ldr	r2, .L132+4
	str	r3, [r7, #40]
	movs	r1, #2
	str	r3, [r7, #36]
	str	r3, [r7, #44]
	str	r3, [r7, #88]
	str	r3, [r7, #84]
	str	r3, [r7, #92]
	ldr	r3, .L132+8
	str	r2, [r7, #24]
	strd	r1, r1, [r7, #16]
	str	r2, [r7, #72]
	mov	r1, #1024
	ldr	r2, .L132+12
	str	r3, [r7, #28]
	movs	r3, #16
	str	r3, [r7, #80]
	str	r1, [r7, #32]
	str	r2, [r7, #76]
	ldr	r1, .L132+16
	adds	r0, r7, #7
	bl	strcpy
	ldr	r1, .L132+20
	mov	r0, r7
	bl	strcpy
	movs	r3, #32
	strb	r3, [r7, #6]
	b	.L103
.L127:
	ldr	r2, [r5, #40]
	ldr	r3, [r5, #36]
	cmp	r2, r3
	itt	ls
	ldrls	r1, [r5, #32]
	addls	r2, r2, r1
	subs	r2, r2, #1
	subs	r2, r2, r3
	cmp	r9, r2
	bhi	.L106
	add	r4, r4, r8
	add	r4, r7, r4, lsl #3
	add	r8, r8, #1
	ldr	r5, [r4, #32]
	subs	r6, r5, r3
	add	r8, r8, r8, lsl #1
	cmp	r9, r6
	add	r7, r7, r8, lsl #3
	bcs	.L109
	ldr	r0, [r7, #4]
	str	r3, [sp]
	add	r0, r0, r3
	mov	r1, fp
	mov	r2, r9
	bl	memcpy
	ldr	r3, [sp]
	add	r3, r3, r9
	str	r3, [r4, #36]
	mov	r6, r9
	b	.L106
.L105:
	add	r8, r8, #1
	add	r8, r8, r8, lsl #1
	lsl	r3, r8, #3
	ldr	r4, [r5, #36]
	str	r3, [sp]
	movs	r6, #0
.L118:
	ldr	r3, [r5, #40]
	cmp	r3, r4
	add	r2, r3, #-1
	bls	.L113
.L129:
	ldr	r1, [r5, #32]
	subs	r2, r2, r4
.L114:
	ldr	r3, [sp]
	cmp	r2, r9
	add	r3, r7, r3
	sub	r8, r1, r4
	it	cs
	movcs	r2, r9
	cmp	r8, r2
	ldr	r0, [r3, #4]
	it	cs
	movcs	r8, r2
	add	r0, r0, r4
	mov	r1, fp
	mov	r2, r8
	bl	memcpy
	ldr	r3, [r5, #32]
	add	r4, r4, r8
	cmp	r4, r3
	add	r6, r6, r8
	sub	r9, r9, r8
	add	fp, fp, r8
	beq	.L128
	str	r4, [r5, #36]
	cmp	r9, #0
	beq	.L106
	ldr	r3, [r5, #40]
	cmp	r3, r4
	add	r2, r3, #-1
	bhi	.L129
.L113:
	ldr	r1, [r5, #32]
	adds	r2, r3, r1
	subs	r2, r2, #1
	subs	r2, r2, r4
	b	.L114
.L128:
	movs	r4, #0
	str	r4, [r5, #36]
	cmp	r9, #0
	bne	.L118
	b	.L106
.L104:
	ldr	r6, [r5, #40]
	ldr	r3, [r5, #36]
	cmp	r6, r3
	bls	.L130
	subs	r6, r6, #1
	subs	r6, r6, r3
	ldr	r5, [r5, #32]
	cmp	r6, r9
	it	cs
	movcs	r6, r9
	subs	r2, r5, r3
	cmp	r6, r2
	bcs	.L112
.L131:
	add	r2, r8, #1
	add	r2, r2, r2, lsl #1
	add	r2, r7, r2, lsl #3
	mov	r1, fp
	ldr	r0, [r2, #4]
	str	r3, [sp]
	add	r0, r0, r3
	mov	r2, r6
	bl	memcpy
	add	r8, r8, r4
	ldr	r3, [sp]
	add	r7, r7, r8, lsl #3
	add	r3, r3, r6
	str	r3, [r7, #36]
	b	.L106
.L130:
	ldr	r5, [r5, #32]
	add	r6, r6, r5
	subs	r6, r6, #1
	subs	r6, r6, r3
	cmp	r6, r9
	it	cs
	movcs	r6, r9
	subs	r2, r5, r3
	cmp	r6, r2
	bcc	.L131
.L112:
	add	r9, r8, #1
	add	r9, r9, r9, lsl #1
	add	r9, r7, r9, lsl #3
	mov	r1, fp
	ldr	r0, [r9, #4]
	str	r2, [sp, #4]
	add	r0, r0, r3
	str	r3, [sp]
	bl	memcpy
	ldr	r3, [sp]
	ldr	r2, [sp, #4]
	ldr	r0, [r9, #4]
	subs	r5, r6, r5
	add	r8, r8, r4
	add	r5, r5, r3
	add	r7, r7, r8, lsl #3
	add	r1, fp, r2
	mov	r2, r5
	bl	memcpy
	str	r5, [r7, #36]
	b	.L106
.L109:
	ldr	r0, [r7, #4]
	str	r3, [sp]
	mov	r2, r6
	mov	r1, fp
	add	r0, r0, r3
	bl	memcpy
	ldr	r3, [sp]
	ldr	r0, [r7, #4]
	add	r3, r3, r9
	subs	r5, r3, r5
	add	r1, fp, r6
	mov	r2, r5
	bl	memcpy
	mov	r6, r9
	str	r5, [r4, #36]
	b	.L106
.L133:
	.align	2
.L132:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LANCHOR1
	.word	.LANCHOR2
	.word	.LC1
	.word	.LC2
	.size	SEGGER_RTT_Write, .-SEGGER_RTT_Write
	.section	.text.SEGGER_RTT_WriteString,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SEGGER_RTT_WriteString
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_WriteString, %function
SEGGER_RTT_WriteString:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r7, .L164
	sub	sp, sp, #12
	mov	r8, r0
	mov	r0, r1
	mov	fp, r1
	bl	strlen
	ldrb	r3, [r7]	@ zero_extendqisi2
	mov	r9, r0
	cbz	r3, .L158
.L135:
	.syntax unified
@ 954 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	mrs   r10, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	add	r5, r8, r8, lsl #1
	add	r5, r7, r5, lsl #3
	lsl	r4, r8, #1
	ldr	r6, [r5, #44]
	cmp	r6, #1
	beq	.L136
	cmp	r6, #2
	beq	.L137
	cbz	r6, .L159
	movs	r6, #0
.L138:
	.syntax unified
@ 962 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	msr   basepri, r10  
	
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r0, r6
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L158:
	ldr	r2, .L164+4
	str	r3, [r7, #40]
	movs	r1, #2
	str	r3, [r7, #36]
	str	r3, [r7, #44]
	str	r3, [r7, #88]
	str	r3, [r7, #84]
	str	r3, [r7, #92]
	ldr	r3, .L164+8
	str	r2, [r7, #24]
	strd	r1, r1, [r7, #16]
	str	r2, [r7, #72]
	mov	r1, #1024
	ldr	r2, .L164+12
	str	r3, [r7, #28]
	movs	r3, #16
	str	r3, [r7, #80]
	str	r1, [r7, #32]
	str	r2, [r7, #76]
	ldr	r1, .L164+16
	adds	r0, r7, #7
	bl	strcpy
	ldr	r1, .L164+20
	mov	r0, r7
	bl	strcpy
	movs	r3, #32
	strb	r3, [r7, #6]
	b	.L135
.L159:
	ldr	r2, [r5, #40]
	ldr	r3, [r5, #36]
	cmp	r2, r3
	itt	ls
	ldrls	r1, [r5, #32]
	addls	r2, r2, r1
	subs	r2, r2, #1
	subs	r2, r2, r3
	cmp	r9, r2
	bhi	.L138
	add	r4, r4, r8
	add	r4, r7, r4, lsl #3
	add	r8, r8, #1
	ldr	r5, [r4, #32]
	subs	r6, r5, r3
	add	r8, r8, r8, lsl #1
	cmp	r9, r6
	add	r7, r7, r8, lsl #3
	bcs	.L141
	ldr	r0, [r7, #4]
	str	r3, [sp]
	add	r0, r0, r3
	mov	r1, fp
	mov	r2, r9
	bl	memcpy
	ldr	r3, [sp]
	add	r3, r3, r9
	str	r3, [r4, #36]
	mov	r6, r9
	b	.L138
.L137:
	add	r8, r8, #1
	add	r8, r8, r8, lsl #1
	lsl	r3, r8, #3
	ldr	r4, [r5, #36]
	str	r3, [sp]
	movs	r6, #0
.L150:
	ldr	r3, [r5, #40]
	cmp	r3, r4
	add	r2, r3, #-1
	bls	.L145
.L161:
	ldr	r1, [r5, #32]
	subs	r2, r2, r4
.L146:
	ldr	r3, [sp]
	cmp	r2, r9
	add	r3, r7, r3
	sub	r8, r1, r4
	it	cs
	movcs	r2, r9
	cmp	r8, r2
	ldr	r0, [r3, #4]
	it	cs
	movcs	r8, r2
	add	r0, r0, r4
	mov	r1, fp
	mov	r2, r8
	bl	memcpy
	ldr	r3, [r5, #32]
	add	r4, r4, r8
	cmp	r4, r3
	add	r6, r6, r8
	sub	r9, r9, r8
	add	fp, fp, r8
	beq	.L160
	str	r4, [r5, #36]
	cmp	r9, #0
	beq	.L138
	ldr	r3, [r5, #40]
	cmp	r3, r4
	add	r2, r3, #-1
	bhi	.L161
.L145:
	ldr	r1, [r5, #32]
	adds	r2, r3, r1
	subs	r2, r2, #1
	subs	r2, r2, r4
	b	.L146
.L160:
	movs	r4, #0
	str	r4, [r5, #36]
	cmp	r9, #0
	bne	.L150
	b	.L138
.L136:
	ldr	r6, [r5, #40]
	ldr	r3, [r5, #36]
	cmp	r6, r3
	bls	.L162
	subs	r6, r6, #1
	subs	r6, r6, r3
	ldr	r5, [r5, #32]
	cmp	r6, r9
	it	cs
	movcs	r6, r9
	subs	r2, r5, r3
	cmp	r6, r2
	bcs	.L144
.L163:
	add	r2, r8, #1
	add	r2, r2, r2, lsl #1
	add	r2, r7, r2, lsl #3
	mov	r1, fp
	ldr	r0, [r2, #4]
	str	r3, [sp]
	add	r0, r0, r3
	mov	r2, r6
	bl	memcpy
	add	r8, r8, r4
	ldr	r3, [sp]
	add	r7, r7, r8, lsl #3
	add	r3, r3, r6
	str	r3, [r7, #36]
	b	.L138
.L162:
	ldr	r5, [r5, #32]
	add	r6, r6, r5
	subs	r6, r6, #1
	subs	r6, r6, r3
	cmp	r6, r9
	it	cs
	movcs	r6, r9
	subs	r2, r5, r3
	cmp	r6, r2
	bcc	.L163
.L144:
	add	r9, r8, #1
	add	r9, r9, r9, lsl #1
	add	r9, r7, r9, lsl #3
	mov	r1, fp
	ldr	r0, [r9, #4]
	str	r2, [sp, #4]
	add	r0, r0, r3
	str	r3, [sp]
	bl	memcpy
	ldr	r3, [sp]
	ldr	r2, [sp, #4]
	ldr	r0, [r9, #4]
	subs	r5, r6, r5
	add	r8, r8, r4
	add	r5, r5, r3
	add	r7, r7, r8, lsl #3
	add	r1, fp, r2
	mov	r2, r5
	bl	memcpy
	str	r5, [r7, #36]
	b	.L138
.L141:
	ldr	r0, [r7, #4]
	str	r3, [sp]
	mov	r2, r6
	mov	r1, fp
	add	r0, r0, r3
	bl	memcpy
	ldr	r3, [sp]
	ldr	r0, [r7, #4]
	subs	r5, r3, r5
	add	r5, r5, r9
	add	r1, fp, r6
	mov	r2, r5
	bl	memcpy
	mov	r6, r9
	str	r5, [r4, #36]
	b	.L138
.L165:
	.align	2
.L164:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LANCHOR1
	.word	.LANCHOR2
	.word	.LC1
	.word	.LC2
	.size	SEGGER_RTT_WriteString, .-SEGGER_RTT_WriteString
	.section	.text.SEGGER_RTT_PutCharSkipNoLock,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SEGGER_RTT_PutCharSkipNoLock
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_PutCharSkipNoLock, %function
SEGGER_RTT_PutCharSkipNoLock:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7}
	ldr	r4, .L171
	add	r3, r0, r0, lsl #1
	add	r3, r4, r3, lsl #3
	ldrd	r7, r5, [r3, #32]
	ldr	r6, [r3, #40]
	adds	r2, r5, #1
	cmp	r7, r2
	it	eq
	moveq	r2, #0
	cmp	r6, r2
	beq	.L169
	adds	r0, r0, #1
	add	r0, r0, r0, lsl #1
	add	r4, r4, r0, lsl #3
	movs	r0, #1
	ldr	r4, [r4, #4]
	strb	r1, [r4, r5]
	str	r2, [r3, #36]
	pop	{r4, r5, r6, r7}
	bx	lr
.L169:
	movs	r0, #0
	pop	{r4, r5, r6, r7}
	bx	lr
.L172:
	.align	2
.L171:
	.word	.LANCHOR0
	.size	SEGGER_RTT_PutCharSkipNoLock, .-SEGGER_RTT_PutCharSkipNoLock
	.section	.text.SEGGER_RTT_PutCharSkip,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SEGGER_RTT_PutCharSkip
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_PutCharSkip, %function
SEGGER_RTT_PutCharSkip:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L180
	ldrb	r3, [r4]	@ zero_extendqisi2
	mov	r5, r0
	mov	r8, r1
	cbz	r3, .L179
.L174:
	.syntax unified
@ 1072 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	mrs   r7, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r5, r5, lsl #1
	add	r3, r4, r3, lsl #3
	ldr	r1, [r3, #36]
	ldr	r6, [r3, #32]
	ldr	r0, [r3, #40]
	adds	r2, r1, #1
	cmp	r6, r2
	it	eq
	moveq	r2, #0
	cmp	r0, r2
	beq	.L177
	adds	r5, r5, #1
	add	r5, r5, r5, lsl #1
	add	r4, r4, r5, lsl #3
	movs	r0, #1
	ldr	r4, [r4, #4]
	strb	r8, [r4, r1]
	str	r2, [r3, #36]
	.syntax unified
@ 1097 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	msr   basepri, r7  
	
@ 0 "" 2
	.thumb
	.syntax unified
	pop	{r4, r5, r6, r7, r8, pc}
.L177:
	movs	r0, #0
	.syntax unified
@ 1097 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	msr   basepri, r7  
	
@ 0 "" 2
	.thumb
	.syntax unified
	pop	{r4, r5, r6, r7, r8, pc}
.L179:
	ldr	r2, .L180+4
	str	r3, [r4, #40]
	movs	r1, #2
	str	r3, [r4, #36]
	str	r3, [r4, #44]
	str	r3, [r4, #88]
	str	r3, [r4, #84]
	str	r3, [r4, #92]
	ldr	r3, .L180+8
	str	r2, [r4, #24]
	strd	r1, r1, [r4, #16]
	str	r2, [r4, #72]
	mov	r1, #1024
	ldr	r2, .L180+12
	str	r3, [r4, #28]
	movs	r3, #16
	str	r3, [r4, #80]
	str	r1, [r4, #32]
	str	r2, [r4, #76]
	ldr	r1, .L180+16
	adds	r0, r4, #7
	bl	strcpy
	ldr	r1, .L180+20
	mov	r0, r4
	bl	strcpy
	movs	r3, #32
	strb	r3, [r4, #6]
	b	.L174
.L181:
	.align	2
.L180:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LANCHOR1
	.word	.LANCHOR2
	.word	.LC1
	.word	.LC2
	.size	SEGGER_RTT_PutCharSkip, .-SEGGER_RTT_PutCharSkip
	.section	.text.SEGGER_RTT_PutChar,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SEGGER_RTT_PutChar
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_PutChar, %function
SEGGER_RTT_PutChar:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	ldr	r4, .L193
	ldrb	r3, [r4]	@ zero_extendqisi2
	mov	r5, r0
	mov	r6, r1
	cmp	r3, #0
	beq	.L192
.L183:
	.syntax unified
@ 1128 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	mrs   r7, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r5, r5, lsl #1
	add	r3, r4, r3, lsl #3
	ldrd	r0, ip, [r3, #32]
	ldr	r1, [r3, #44]
	add	r2, ip, #1
	cmp	r0, r2
	it	eq
	moveq	r2, #0
	cmp	r1, #2
	lsl	lr, r5, #1
	beq	.L186
.L185:
	add	r3, lr, r5
	add	r3, r4, r3, lsl #3
	ldr	r1, [r3, #40]
	cmp	r1, r2
	beq	.L188
	adds	r5, r5, #1
	add	r5, r5, r5, lsl #1
	add	r4, r4, r5, lsl #3
	movs	r0, #1
	ldr	r1, [r4, #4]
	strb	r6, [r1, ip]
	str	r2, [r3, #36]
	.syntax unified
@ 1161 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	msr   basepri, r7  
	
@ 0 "" 2
	.thumb
	.syntax unified
	pop	{r3, r4, r5, r6, r7, pc}
.L186:
	ldr	r1, [r3, #40]
	cmp	r1, r2
	bne	.L185
	ldr	r1, [r3, #40]
	cmp	r1, r2
	beq	.L186
	b	.L185
.L188:
	movs	r0, #0
	.syntax unified
@ 1161 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	msr   basepri, r7  
	
@ 0 "" 2
	.thumb
	.syntax unified
	pop	{r3, r4, r5, r6, r7, pc}
.L192:
	ldr	r2, .L193+4
	str	r3, [r4, #40]
	movs	r1, #2
	str	r3, [r4, #36]
	str	r3, [r4, #44]
	str	r3, [r4, #88]
	str	r3, [r4, #84]
	str	r3, [r4, #92]
	ldr	r3, .L193+8
	str	r2, [r4, #24]
	strd	r1, r1, [r4, #16]
	str	r2, [r4, #72]
	mov	r1, #1024
	ldr	r2, .L193+12
	str	r3, [r4, #28]
	movs	r3, #16
	str	r3, [r4, #80]
	str	r1, [r4, #32]
	str	r2, [r4, #76]
	ldr	r1, .L193+16
	adds	r0, r4, #7
	bl	strcpy
	ldr	r1, .L193+20
	mov	r0, r4
	bl	strcpy
	movs	r3, #32
	strb	r3, [r4, #6]
	b	.L183
.L194:
	.align	2
.L193:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LANCHOR1
	.word	.LANCHOR2
	.word	.LC1
	.word	.LC2
	.size	SEGGER_RTT_PutChar, .-SEGGER_RTT_PutChar
	.section	.text.SEGGER_RTT_GetKey,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SEGGER_RTT_GetKey
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_GetKey, %function
SEGGER_RTT_GetKey:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	sub	sp, sp, #12
	.syntax unified
@ 603 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	mrs   r8, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r4, .L215
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L212
.L196:
	ldr	r5, [r4, #88]
	ldr	r7, [r4, #84]
	cmp	r5, r7
	bhi	.L213
	bne	.L205
.L210:
	.syntax unified
@ 611 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	msr   basepri, r8  
	
@ 0 "" 2
	.thumb
	.syntax unified
.L211:
	mov	r0, #-1
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L205:
	movs	r6, #1
	add	r0, sp, #7
.L203:
	ldr	r1, [r4, #76]
	movs	r2, #1
	add	r1, r1, r5
	adds	r5, r5, #1
	bl	memcpy
	str	r5, [r4, #88]
	.syntax unified
@ 611 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	msr   basepri, r8  
	
@ 0 "" 2
	.thumb
	.syntax unified
	cmp	r6, #1
	bne	.L211
.L200:
	ldrb	r0, [sp, #7]	@ zero_extendqisi2
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L213:
	ldrd	r1, r9, [r4, #76]
	sub	r6, r9, r5
	cmp	r6, #1
	it	cs
	movcs	r6, #1
	mov	r2, r6
	add	r1, r1, r5
	add	r0, sp, #7
	bl	memcpy
	ldr	r2, [r4, #80]
	adds	r1, r5, r6
	cmp	r1, r2
	rsb	r3, r6, #1
	ite	ne
	subne	r7, r7, r1
	moveq	r1, #0
	cmp	r7, r3
	it	cs
	movcs	r7, r3
	cbnz	r7, .L214
	cmp	r5, r9
	beq	.L210
	str	r1, [r4, #88]
	.syntax unified
@ 611 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	msr   basepri, r8  
	
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L200
.L212:
	movs	r1, #2
	mov	r0, #1024
	ldr	r5, .L215+4
	ldr	r2, .L215+8
	str	r3, [r4, #40]
	strd	r1, r1, [r4, #16]
	str	r3, [r4, #36]
	ldr	r1, .L215+12
	str	r3, [r4, #44]
	str	r3, [r4, #88]
	str	r3, [r4, #84]
	str	r3, [r4, #92]
	str	r0, [r4, #32]
	movs	r3, #16
	ldr	r6, .L215+16
	str	r2, [r4, #24]
	adds	r0, r4, #7
	strd	r5, r3, [r4, #76]
	str	r2, [r4, #72]
	str	r6, [r4, #28]
	bl	strcpy
	ldr	r1, .L215+20
	mov	r0, r4
	bl	strcpy
	movs	r3, #32
	strb	r3, [r4, #6]
	b	.L196
.L214:
	add	r3, sp, #7
	adds	r0, r3, r6
	mov	r5, r1
	adds	r6, r6, #1
	b	.L203
.L216:
	.align	2
.L215:
	.word	.LANCHOR0
	.word	.LANCHOR2
	.word	.LC0
	.word	.LC1
	.word	.LANCHOR1
	.word	.LC2
	.size	SEGGER_RTT_GetKey, .-SEGGER_RTT_GetKey
	.section	.text.SEGGER_RTT_WaitKey,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SEGGER_RTT_WaitKey
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_WaitKey, %function
SEGGER_RTT_WaitKey:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L239
	ldr	r8, .L239+20
	ldr	r10, .L239+24
	sub	sp, sp, #12
.L225:
	.syntax unified
@ 603 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	mrs   fp, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	ldrb	r3, [r4]	@ zero_extendqisi2
	cbz	r3, .L236
	ldr	r5, [r4, #88]
	ldr	r7, [r4, #84]
	cmp	r5, r7
	bhi	.L237
.L219:
	bne	.L228
.L234:
	.syntax unified
@ 611 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	msr   basepri, fp  
	
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L225
.L236:
	movs	r2, #2
	ldr	r1, .L239+4
	ldr	r7, .L239+8
	ldr	r0, .L239+12
	str	r3, [r4, #40]
	movs	r5, #16
	mov	r6, #1024
	str	r3, [r4, #36]
	str	r3, [r4, #44]
	str	r3, [r4, #88]
	str	r3, [r4, #84]
	str	r3, [r4, #92]
	strd	r2, r2, [r4, #16]
	str	r7, [r4, #76]
	str	r5, [r4, #80]
	strd	r8, r10, [r4, #24]
	str	r8, [r4, #72]
	str	r6, [r4, #32]
	bl	strcpy
	ldr	r1, .L239+16
	ldr	r0, .L239
	bl	strcpy
	ldr	r5, [r4, #88]
	ldr	r7, [r4, #84]
	movs	r3, #32
	cmp	r5, r7
	strb	r3, [r4, #6]
	bls	.L219
.L237:
	ldrd	r1, r9, [r4, #76]
	sub	r6, r9, r5
	cmp	r6, #1
	it	cs
	movcs	r6, #1
	mov	r2, r6
	add	r1, r1, r5
	add	r0, sp, #7
	bl	memcpy
	ldr	r1, [r4, #80]
	adds	r0, r5, r6
	cmp	r0, r1
	rsb	r2, r6, #1
	ite	ne
	subne	r7, r7, r0
	moveq	r0, #0
	cmp	r7, r2
	it	cs
	movcs	r7, r2
	cbnz	r7, .L238
	cmp	r5, r9
	beq	.L234
	str	r0, [r4, #88]
	.syntax unified
@ 611 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	msr   basepri, fp  
	
@ 0 "" 2
	.thumb
	.syntax unified
	ldrb	r0, [sp, #7]	@ zero_extendqisi2
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L228:
	movs	r6, #1
	add	r0, sp, #7
.L226:
	ldr	r1, [r4, #76]
	movs	r2, #1
	add	r1, r1, r5
	adds	r5, r5, #1
	bl	memcpy
	str	r5, [r4, #88]
	.syntax unified
@ 611 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	msr   basepri, fp  
	
@ 0 "" 2
	.thumb
	.syntax unified
	cmp	r6, #1
	bne	.L225
	ldrb	r0, [sp, #7]	@ zero_extendqisi2
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L238:
	add	r3, sp, #7
	mov	r5, r0
	adds	r0, r3, r6
	adds	r6, r6, #1
	b	.L226
.L240:
	.align	2
.L239:
	.word	.LANCHOR0
	.word	.LC1
	.word	.LANCHOR2
	.word	.LANCHOR0+7
	.word	.LC2
	.word	.LC0
	.word	.LANCHOR1
	.size	SEGGER_RTT_WaitKey, .-SEGGER_RTT_WaitKey
	.section	.text.SEGGER_RTT_HasKey,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SEGGER_RTT_HasKey
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_HasKey, %function
SEGGER_RTT_HasKey:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L245
	ldrb	r3, [r4]	@ zero_extendqisi2
	cbz	r3, .L244
.L242:
	ldr	r3, [r4, #84]
	ldr	r0, [r4, #88]
	subs	r0, r0, r3
	it	ne
	movne	r0, #1
	pop	{r4, r5, r6, pc}
.L244:
	ldr	r0, .L245+4
	ldr	r5, .L245+8
	ldr	r2, .L245+12
	str	r3, [r4, #40]
	movs	r1, #2
	strd	r1, r1, [r4, #16]
	str	r3, [r4, #36]
	ldr	r1, .L245+16
	str	r3, [r4, #44]
	str	r3, [r4, #88]
	str	r3, [r4, #84]
	str	r3, [r4, #92]
	str	r0, [r4, #28]
	movs	r3, #16
	mov	r6, #1024
	adds	r0, r4, #7
	strd	r5, r3, [r4, #76]
	str	r2, [r4, #24]
	str	r2, [r4, #72]
	str	r6, [r4, #32]
	bl	strcpy
	ldr	r1, .L245+20
	mov	r0, r4
	bl	strcpy
	movs	r3, #32
	strb	r3, [r4, #6]
	b	.L242
.L246:
	.align	2
.L245:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	.LANCHOR2
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.size	SEGGER_RTT_HasKey, .-SEGGER_RTT_HasKey
	.section	.text.SEGGER_RTT_HasData,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SEGGER_RTT_HasData
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_HasData, %function
SEGGER_RTT_HasData:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L248
	add	r0, r0, r0, lsl #1
	add	r3, r3, r0, lsl #3
	ldr	r0, [r3, #84]
	ldr	r3, [r3, #88]
	subs	r0, r0, r3
	bx	lr
.L249:
	.align	2
.L248:
	.word	.LANCHOR0
	.size	SEGGER_RTT_HasData, .-SEGGER_RTT_HasData
	.section	.text.SEGGER_RTT_HasDataUp,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SEGGER_RTT_HasDataUp
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_HasDataUp, %function
SEGGER_RTT_HasDataUp:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L251
	add	r0, r0, r0, lsl #1
	add	r3, r3, r0, lsl #3
	ldr	r2, [r3, #40]
	ldr	r0, [r3, #36]
	subs	r0, r0, r2
	bx	lr
.L252:
	.align	2
.L251:
	.word	.LANCHOR0
	.size	SEGGER_RTT_HasDataUp, .-SEGGER_RTT_HasDataUp
	.section	.text.SEGGER_RTT_AllocDownBuffer,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SEGGER_RTT_AllocDownBuffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_AllocDownBuffer, %function
SEGGER_RTT_AllocDownBuffer:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, lr}
	ldr	r4, .L264
	ldrb	r5, [r4]	@ zero_extendqisi2
	mov	r9, r0
	mov	r8, r1
	mov	r7, r2
	mov	r6, r3
	cbz	r5, .L263
.L254:
	.syntax unified
@ 1311 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	mrs   r2, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r0, [r4, #76]
	ldr	r3, [r4, #20]
	cbz	r0, .L256
	cmp	r3, #1
	ble	.L261
	ldr	r1, [r4, #100]
	cmp	r1, #0
	beq	.L260
	movs	r0, #2
.L256:
	cmp	r3, r0
	ble	.L261
.L258:
	add	r3, r0, r0, lsl #1
	add	r4, r4, r3, lsl #3
	movs	r3, #0
	strd	r9, r8, [r4, #72]
	strd	r3, r6, [r4, #88]
	str	r7, [r4, #80]
	str	r3, [r4, #84]
.L257:
	.syntax unified
@ 1329 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	msr   basepri, r2  
	
@ 0 "" 2
	.thumb
	.syntax unified
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
.L263:
	ldr	r3, .L264+4
	ldr	r0, .L264+8
	str	r3, [r4, #24]
	movs	r2, #2
	strd	r2, r2, [r4, #16]
	mov	r1, #1024
	ldr	r2, .L264+12
	str	r3, [r4, #72]
	movs	r3, #16
	str	r3, [r4, #80]
	str	r5, [r4, #40]
	str	r0, [r4, #28]
	str	r1, [r4, #32]
	str	r2, [r4, #76]
	ldr	r1, .L264+16
	str	r5, [r4, #36]
	str	r5, [r4, #44]
	str	r5, [r4, #88]
	str	r5, [r4, #84]
	str	r5, [r4, #92]
	adds	r0, r4, #7
	bl	strcpy
	ldr	r1, .L264+20
	mov	r0, r4
	bl	strcpy
	movs	r3, #32
	strb	r3, [r4, #6]
	b	.L254
.L261:
	mov	r0, #-1
	b	.L257
.L260:
	movs	r0, #1
	b	.L258
.L265:
	.align	2
.L264:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LANCHOR1
	.word	.LANCHOR2
	.word	.LC1
	.word	.LC2
	.size	SEGGER_RTT_AllocDownBuffer, .-SEGGER_RTT_AllocDownBuffer
	.section	.text.SEGGER_RTT_AllocUpBuffer,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SEGGER_RTT_AllocUpBuffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_AllocUpBuffer, %function
SEGGER_RTT_AllocUpBuffer:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L277
	ldrb	r5, [r4]	@ zero_extendqisi2
	mov	r10, r0
	mov	r9, r1
	mov	r8, r2
	mov	r7, r3
	cbz	r5, .L276
.L267:
	.syntax unified
@ 1356 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r0, [r4, #28]
	ldr	r2, [r4, #16]
	cbz	r0, .L269
	cmp	r2, #1
	ble	.L274
	ldr	r1, [r4, #52]
	cmp	r1, #0
	beq	.L273
	movs	r0, #2
.L269:
	cmp	r2, r0
	ble	.L274
.L271:
	adds	r5, r0, #1
	add	r5, r5, r5, lsl #1
	lsls	r5, r5, #3
	add	r6, r0, r0, lsl #1
	add	r6, r4, r6, lsl #3
	str	r10, [r4, r5]
	add	r4, r4, r5
	movs	r2, #0
	str	r9, [r4, #4]
	str	r8, [r6, #32]
	str	r7, [r6, #44]
	str	r2, [r6, #40]
	str	r2, [r6, #36]
.L270:
	.syntax unified
@ 1374 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L276:
	ldr	r3, .L277+4
	ldr	r0, .L277+8
	str	r3, [r4, #24]
	movs	r2, #2
	strd	r2, r2, [r4, #16]
	mov	r1, #1024
	ldr	r2, .L277+12
	str	r3, [r4, #72]
	movs	r3, #16
	str	r3, [r4, #80]
	str	r5, [r4, #40]
	str	r0, [r4, #28]
	str	r1, [r4, #32]
	str	r2, [r4, #76]
	ldr	r1, .L277+16
	str	r5, [r4, #36]
	str	r5, [r4, #44]
	str	r5, [r4, #88]
	str	r5, [r4, #84]
	str	r5, [r4, #92]
	adds	r0, r4, #7
	bl	strcpy
	ldr	r1, .L277+20
	mov	r0, r4
	bl	strcpy
	movs	r3, #32
	strb	r3, [r4, #6]
	b	.L267
.L274:
	mov	r0, #-1
	b	.L270
.L273:
	movs	r0, #1
	b	.L271
.L278:
	.align	2
.L277:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LANCHOR1
	.word	.LANCHOR2
	.word	.LC1
	.word	.LC2
	.size	SEGGER_RTT_AllocUpBuffer, .-SEGGER_RTT_AllocUpBuffer
	.section	.text.SEGGER_RTT_ConfigUpBuffer,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SEGGER_RTT_ConfigUpBuffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_ConfigUpBuffer, %function
SEGGER_RTT_ConfigUpBuffer:
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, lr}
	ldr	r4, .L289
	ldrb	r6, [r4]	@ zero_extendqisi2
	mov	r5, r0
	mov	r9, r1
	mov	r8, r2
	mov	r7, r3
	cbz	r6, .L288
.L280:
	ldr	r3, [r4, #16]
	cmp	r3, r5
	bls	.L283
	.syntax unified
@ 1408 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	cbnz	r5, .L286
	mov	r0, r5
.L282:
	add	r5, r5, r0
	add	r4, r4, r5, lsl #3
	ldr	r2, [sp, #32]
	str	r2, [r4, #44]
	.syntax unified
@ 1417 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r0, #0
.L279:
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
.L286:
	adds	r0, r5, #1
	add	r0, r0, r0, lsl #1
	lsls	r0, r0, #3
	add	r2, r5, r5, lsl #1
	add	r2, r4, r2, lsl #3
	str	r9, [r4, r0]
	add	r0, r0, r4
	movs	r1, #0
	str	r8, [r0, #4]
	str	r7, [r2, #32]
	str	r1, [r2, #40]
	str	r1, [r2, #36]
	lsls	r0, r5, #1
	b	.L282
.L288:
	ldr	r3, .L289+4
	ldr	r0, .L289+8
	str	r3, [r4, #24]
	movs	r2, #2
	strd	r2, r2, [r4, #16]
	mov	r1, #1024
	ldr	r2, .L289+12
	str	r3, [r4, #72]
	movs	r3, #16
	str	r3, [r4, #80]
	str	r6, [r4, #40]
	str	r0, [r4, #28]
	str	r1, [r4, #32]
	str	r2, [r4, #76]
	ldr	r1, .L289+16
	str	r6, [r4, #36]
	str	r6, [r4, #44]
	str	r6, [r4, #88]
	str	r6, [r4, #84]
	str	r6, [r4, #92]
	adds	r0, r4, #7
	bl	strcpy
	ldr	r1, .L289+20
	mov	r0, r4
	bl	strcpy
	movs	r3, #32
	strb	r3, [r4, #6]
	b	.L280
.L283:
	mov	r0, #-1
	b	.L279
.L290:
	.align	2
.L289:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LANCHOR1
	.word	.LANCHOR2
	.word	.LC1
	.word	.LC2
	.size	SEGGER_RTT_ConfigUpBuffer, .-SEGGER_RTT_ConfigUpBuffer
	.section	.text.SEGGER_RTT_ConfigDownBuffer,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SEGGER_RTT_ConfigDownBuffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_ConfigDownBuffer, %function
SEGGER_RTT_ConfigDownBuffer:
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, lr}
	ldr	r4, .L301
	ldrb	r6, [r4]	@ zero_extendqisi2
	mov	r5, r0
	mov	r8, r1
	mov	r9, r2
	mov	r7, r3
	cbz	r6, .L300
.L292:
	ldr	r0, [r4, #20]
	cmp	r0, r5
	bls	.L295
	.syntax unified
@ 1455 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	cbnz	r5, .L298
	mov	r0, r5
.L294:
	add	r5, r5, r0
	add	r4, r4, r5, lsl #3
	ldr	r2, [sp, #32]
	str	r2, [r4, #92]
	.syntax unified
@ 1464 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r0, #0
.L291:
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
.L298:
	add	r0, r5, r5, lsl #1
	add	r0, r4, r0, lsl #3
	movs	r2, #0
	strd	r8, r9, [r0, #72]
	str	r7, [r0, #80]
	str	r2, [r0, #88]
	str	r2, [r0, #84]
	lsls	r0, r5, #1
	b	.L294
.L300:
	ldr	r3, .L301+4
	ldr	r0, .L301+8
	str	r3, [r4, #24]
	movs	r2, #2
	strd	r2, r2, [r4, #16]
	mov	r1, #1024
	ldr	r2, .L301+12
	str	r3, [r4, #72]
	movs	r3, #16
	str	r3, [r4, #80]
	str	r6, [r4, #40]
	str	r0, [r4, #28]
	str	r1, [r4, #32]
	str	r2, [r4, #76]
	ldr	r1, .L301+16
	str	r6, [r4, #36]
	str	r6, [r4, #44]
	str	r6, [r4, #88]
	str	r6, [r4, #84]
	str	r6, [r4, #92]
	adds	r0, r4, #7
	bl	strcpy
	ldr	r1, .L301+20
	mov	r0, r4
	bl	strcpy
	movs	r3, #32
	strb	r3, [r4, #6]
	b	.L292
.L295:
	mov	r0, #-1
	b	.L291
.L302:
	.align	2
.L301:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LANCHOR1
	.word	.LANCHOR2
	.word	.LC1
	.word	.LC2
	.size	SEGGER_RTT_ConfigDownBuffer, .-SEGGER_RTT_ConfigDownBuffer
	.section	.text.SEGGER_RTT_SetNameUpBuffer,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SEGGER_RTT_SetNameUpBuffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_SetNameUpBuffer, %function
SEGGER_RTT_SetNameUpBuffer:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L309
	ldrb	r3, [r5]	@ zero_extendqisi2
	mov	r4, r0
	mov	r6, r1
	cbz	r3, .L308
.L304:
	ldr	r3, [r5, #16]
	cmp	r3, r4
	bls	.L306
	.syntax unified
@ 1493 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	adds	r4, r4, #1
	add	r4, r4, r4, lsl #1
	str	r6, [r5, r4, lsl #3]
	.syntax unified
@ 1495 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L308:
	movs	r1, #2
	ldr	r2, .L309+4
	str	r3, [r5, #40]
	strd	r1, r1, [r5, #16]
	str	r3, [r5, #36]
	str	r3, [r5, #44]
	str	r3, [r5, #88]
	str	r3, [r5, #84]
	str	r3, [r5, #92]
	mov	r1, #1024
	ldr	r3, .L309+8
	str	r2, [r5, #24]
	str	r2, [r5, #72]
	str	r3, [r5, #28]
	ldr	r2, .L309+12
	str	r1, [r5, #32]
	movs	r3, #16
	ldr	r1, .L309+16
	str	r3, [r5, #80]
	adds	r0, r5, #7
	str	r2, [r5, #76]
	bl	strcpy
	ldr	r1, .L309+20
	mov	r0, r5
	bl	strcpy
	movs	r3, #32
	strb	r3, [r5, #6]
	b	.L304
.L306:
	mov	r0, #-1
	pop	{r4, r5, r6, pc}
.L310:
	.align	2
.L309:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LANCHOR1
	.word	.LANCHOR2
	.word	.LC1
	.word	.LC2
	.size	SEGGER_RTT_SetNameUpBuffer, .-SEGGER_RTT_SetNameUpBuffer
	.section	.text.SEGGER_RTT_SetNameDownBuffer,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SEGGER_RTT_SetNameDownBuffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_SetNameDownBuffer, %function
SEGGER_RTT_SetNameDownBuffer:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L317
	ldrb	r3, [r4]	@ zero_extendqisi2
	mov	r5, r0
	mov	r6, r1
	cbz	r3, .L316
.L312:
	ldr	r3, [r4, #20]
	cmp	r3, r5
	bls	.L314
	.syntax unified
@ 1524 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	add	r5, r5, r5, lsl #1
	add	r4, r4, r5, lsl #3
	str	r6, [r4, #72]
	.syntax unified
@ 1526 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L316:
	ldr	r2, .L317+4
	str	r3, [r4, #40]
	movs	r1, #2
	str	r3, [r4, #36]
	str	r3, [r4, #44]
	str	r3, [r4, #88]
	str	r3, [r4, #84]
	str	r3, [r4, #92]
	ldr	r3, .L317+8
	str	r2, [r4, #24]
	strd	r1, r1, [r4, #16]
	str	r2, [r4, #72]
	mov	r1, #1024
	ldr	r2, .L317+12
	str	r3, [r4, #28]
	movs	r3, #16
	str	r3, [r4, #80]
	str	r1, [r4, #32]
	str	r2, [r4, #76]
	ldr	r1, .L317+16
	adds	r0, r4, #7
	bl	strcpy
	ldr	r1, .L317+20
	mov	r0, r4
	bl	strcpy
	movs	r3, #32
	strb	r3, [r4, #6]
	b	.L312
.L314:
	mov	r0, #-1
	pop	{r4, r5, r6, pc}
.L318:
	.align	2
.L317:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LANCHOR1
	.word	.LANCHOR2
	.word	.LC1
	.word	.LC2
	.size	SEGGER_RTT_SetNameDownBuffer, .-SEGGER_RTT_SetNameDownBuffer
	.section	.text.SEGGER_RTT_SetFlagsUpBuffer,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SEGGER_RTT_SetFlagsUpBuffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_SetFlagsUpBuffer, %function
SEGGER_RTT_SetFlagsUpBuffer:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L325
	ldrb	r3, [r4]	@ zero_extendqisi2
	mov	r5, r0
	mov	r6, r1
	cbz	r3, .L324
.L320:
	ldr	r3, [r4, #16]
	cmp	r3, r5
	bls	.L322
	.syntax unified
@ 1555 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	add	r5, r5, r5, lsl #1
	add	r4, r4, r5, lsl #3
	str	r6, [r4, #44]
	.syntax unified
@ 1557 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L324:
	ldr	r2, .L325+4
	str	r3, [r4, #40]
	movs	r1, #2
	str	r3, [r4, #36]
	str	r3, [r4, #44]
	str	r3, [r4, #88]
	str	r3, [r4, #84]
	str	r3, [r4, #92]
	ldr	r3, .L325+8
	str	r2, [r4, #24]
	strd	r1, r1, [r4, #16]
	str	r2, [r4, #72]
	mov	r1, #1024
	ldr	r2, .L325+12
	str	r3, [r4, #28]
	movs	r3, #16
	str	r3, [r4, #80]
	str	r1, [r4, #32]
	str	r2, [r4, #76]
	ldr	r1, .L325+16
	adds	r0, r4, #7
	bl	strcpy
	ldr	r1, .L325+20
	mov	r0, r4
	bl	strcpy
	movs	r3, #32
	strb	r3, [r4, #6]
	b	.L320
.L322:
	mov	r0, #-1
	pop	{r4, r5, r6, pc}
.L326:
	.align	2
.L325:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LANCHOR1
	.word	.LANCHOR2
	.word	.LC1
	.word	.LC2
	.size	SEGGER_RTT_SetFlagsUpBuffer, .-SEGGER_RTT_SetFlagsUpBuffer
	.section	.text.SEGGER_RTT_SetFlagsDownBuffer,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SEGGER_RTT_SetFlagsDownBuffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_SetFlagsDownBuffer, %function
SEGGER_RTT_SetFlagsDownBuffer:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L333
	ldrb	r3, [r4]	@ zero_extendqisi2
	mov	r5, r0
	mov	r6, r1
	cbz	r3, .L332
.L328:
	ldr	r3, [r4, #20]
	cmp	r3, r5
	bls	.L330
	.syntax unified
@ 1586 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	add	r5, r5, r5, lsl #1
	add	r4, r4, r5, lsl #3
	str	r6, [r4, #92]
	.syntax unified
@ 1588 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L332:
	ldr	r2, .L333+4
	str	r3, [r4, #40]
	movs	r1, #2
	str	r3, [r4, #36]
	str	r3, [r4, #44]
	str	r3, [r4, #88]
	str	r3, [r4, #84]
	str	r3, [r4, #92]
	ldr	r3, .L333+8
	str	r2, [r4, #24]
	strd	r1, r1, [r4, #16]
	str	r2, [r4, #72]
	mov	r1, #1024
	ldr	r2, .L333+12
	str	r3, [r4, #28]
	movs	r3, #16
	str	r3, [r4, #80]
	str	r1, [r4, #32]
	str	r2, [r4, #76]
	ldr	r1, .L333+16
	adds	r0, r4, #7
	bl	strcpy
	ldr	r1, .L333+20
	mov	r0, r4
	bl	strcpy
	movs	r3, #32
	strb	r3, [r4, #6]
	b	.L328
.L330:
	mov	r0, #-1
	pop	{r4, r5, r6, pc}
.L334:
	.align	2
.L333:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LANCHOR1
	.word	.LANCHOR2
	.word	.LC1
	.word	.LC2
	.size	SEGGER_RTT_SetFlagsDownBuffer, .-SEGGER_RTT_SetFlagsDownBuffer
	.section	.text.SEGGER_RTT_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SEGGER_RTT_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_Init, %function
SEGGER_RTT_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	ldr	r4, .L337
	ldr	r3, .L337+4
	ldr	r0, .L337+8
	str	r3, [r4, #28]
	movs	r5, #16
	mov	r3, #1024
	ldr	r2, .L337+12
	ldr	r1, .L337+16
	str	r3, [r4, #32]
	str	r0, [r4, #76]
	movs	r3, #0
	str	r5, [r4, #80]
	adds	r0, r4, #7
	movs	r5, #2
	str	r3, [r4, #40]
	str	r3, [r4, #36]
	str	r3, [r4, #44]
	str	r3, [r4, #88]
	str	r3, [r4, #84]
	str	r3, [r4, #92]
	str	r2, [r4, #24]
	str	r2, [r4, #72]
	strd	r5, r5, [r4, #16]
	bl	strcpy
	ldr	r1, .L337+20
	mov	r0, r4
	bl	strcpy
	movs	r3, #32
	strb	r3, [r4, #6]
	pop	{r3, r4, r5, pc}
.L338:
	.align	2
.L337:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	.LANCHOR2
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.size	SEGGER_RTT_Init, .-SEGGER_RTT_Init
	.section	.text.SEGGER_RTT_SetTerminal,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SEGGER_RTT_SetTerminal
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_SetTerminal, %function
SEGGER_RTT_SetTerminal:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L364
	ldrb	r3, [r4]	@ zero_extendqisi2
	sub	sp, sp, #8
	mov	r8, r0
	cmp	r3, #0
	beq	.L359
.L340:
	movs	r3, #255
	cmp	r8, #15
	strb	r3, [sp, #4]
	bhi	.L352
	ldr	r3, .L364+4
	ldrb	r3, [r3, r8]	@ zero_extendqisi2
	strb	r3, [sp, #5]
	.syntax unified
@ 1636 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	mrs   r7, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r5, [r4, #44]
	and	r5, r5, #3
	cmp	r5, #2
	beq	.L360
	ldr	r3, [r4, #40]
	ldr	r5, [r4, #36]
	cmp	r3, r5
	itt	ls
	ldrls	r2, [r4, #32]
	addls	r3, r3, r2
	subs	r3, r3, #1
	subs	r3, r3, r5
	cmp	r3, #1
	bhi	.L361
	mov	r0, #-1
.L347:
	.syntax unified
@ 1649 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	msr   basepri, r7  
	
@ 0 "" 2
	.thumb
	.syntax unified
.L339:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L361:
	ldr	r9, [r4, #32]
	ldr	r3, .L364+8
	ldr	r0, [r4, #28]
	strb	r8, [r3]
	sub	r6, r9, r5
	cmp	r6, #2
	bhi	.L362
	add	r0, r0, r5
	add	r1, sp, #4
	mov	r2, r6
	adds	r5, r5, #2
	bl	memcpy
	sub	r5, r5, r9
	add	r3, sp, #4
	ldr	r0, [r4, #28]
	adds	r1, r3, r6
	mov	r2, r5
	bl	memcpy
	str	r5, [r4, #36]
.L358:
	movs	r0, #0
	b	.L347
.L359:
	movs	r1, #2
	mov	r0, #1024
	ldr	r5, .L364+12
	ldr	r2, .L364+16
	str	r3, [r4, #40]
	strd	r1, r1, [r4, #16]
	str	r3, [r4, #36]
	ldr	r1, .L364+20
	str	r3, [r4, #44]
	str	r3, [r4, #88]
	str	r3, [r4, #84]
	str	r3, [r4, #92]
	str	r0, [r4, #32]
	movs	r3, #16
	ldr	r6, .L364+24
	str	r2, [r4, #24]
	adds	r0, r4, #7
	strd	r5, r3, [r4, #76]
	str	r2, [r4, #72]
	str	r6, [r4, #28]
	bl	strcpy
	ldr	r1, .L364+28
	mov	r0, r4
	bl	strcpy
	movs	r3, #32
	strb	r3, [r4, #6]
	b	.L340
.L362:
	add	r0, r0, r5
	movs	r2, #2
	add	r1, sp, #4
	adds	r5, r5, #2
	bl	memcpy
	str	r5, [r4, #36]
	movs	r0, #0
	b	.L347
.L360:
	ldr	r3, .L364+8
	ldrd	r1, r6, [r4, #32]
	strb	r8, [r3]
	add	r9, sp, #4
	mov	r8, #0
.L348:
	ldr	r3, [r4, #40]
	ldr	r0, [r4, #28]
	cmp	r3, r6
	sub	r10, r1, r6
	add	r2, r3, #-1
	itt	ls
	addls	r2, r3, #-1
	addls	r2, r2, r1
	cmp	r10, r5
	it	cs
	movcs	r10, r5
	subs	r2, r2, r6
	cmp	r10, r2
	it	cs
	movcs	r10, r2
	mov	r1, r9
	add	r0, r0, r6
	mov	r2, r10
	bl	memcpy
	ldr	r1, [r4, #32]
	add	r6, r6, r10
	cmp	r6, r1
	sub	r5, r5, r10
	add	r9, r9, r10
	beq	.L363
	str	r6, [r4, #36]
	cmp	r5, #0
	bne	.L348
	b	.L358
.L363:
	str	r8, [r4, #36]
	cmp	r5, #0
	beq	.L358
	movs	r6, #0
	b	.L348
.L352:
	mov	r0, #-1
	b	.L339
.L365:
	.align	2
.L364:
	.word	.LANCHOR0
	.word	.LANCHOR3
	.word	.LANCHOR4
	.word	.LANCHOR2
	.word	.LC0
	.word	.LC1
	.word	.LANCHOR1
	.word	.LC2
	.size	SEGGER_RTT_SetTerminal, .-SEGGER_RTT_SetTerminal
	.section	.text.SEGGER_RTT_TerminalOut,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SEGGER_RTT_TerminalOut
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_TerminalOut, %function
SEGGER_RTT_TerminalOut:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, .L496
	ldrb	r3, [r5]	@ zero_extendqisi2
	sub	sp, sp, #28
	mov	r9, r0
	mov	r7, r1
	cbz	r3, .L478
.L367:
	cmp	r9, #15
	bhi	.L428
	mov	r0, r7
	bl	strlen
	mov	r8, r0
	.syntax unified
@ 1696 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	mrs   r10, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r5, #40]
	ldr	r4, [r5, #36]
	ldr	r6, [r5, #44]
	cmp	r3, r4
	it	ls
	ldrls	r2, [r5, #32]
	and	r6, r6, #3
	it	ls
	addls	r3, r3, r2
	subs	r3, r3, #1
	cmp	r6, #1
	sub	fp, r3, r4
	beq	.L371
	cmp	r6, #2
	beq	.L372
	cbz	r6, .L479
.L434:
	mov	r9, #-1
.L373:
	.syntax unified
@ 1741 "/Users/brian/src/ble-from-scratch/part4/SEGGER_RTT.c" 1
	msr   basepri, r10  
	
@ 0 "" 2
	.thumb
	.syntax unified
.L366:
	mov	r0, r9
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L478:
	movs	r1, #2
	ldr	r2, .L496+4
	str	r3, [r5, #40]
	strd	r1, r1, [r5, #16]
	str	r3, [r5, #36]
	str	r3, [r5, #44]
	str	r3, [r5, #88]
	str	r3, [r5, #84]
	str	r3, [r5, #92]
	mov	r1, #1024
	ldr	r3, .L496+8
	str	r2, [r5, #24]
	str	r2, [r5, #72]
	str	r3, [r5, #28]
	ldr	r2, .L496+12
	str	r1, [r5, #32]
	movs	r3, #16
	ldr	r1, .L496+16
	str	r3, [r5, #80]
	adds	r0, r5, #7
	str	r2, [r5, #76]
	bl	strcpy
	ldr	r1, .L496+20
	mov	r0, r5
	bl	strcpy
	movs	r3, #32
	strb	r3, [r5, #6]
	b	.L367
.L479:
	adds	r2, r0, #4
	cmp	r2, fp
	bls	.L480
	mov	r9, r6
	b	.L373
.L372:
	ldr	r3, .L496+24
	ldr	r0, [r5, #32]
	str	r3, [sp, #8]
	ldrb	r3, [r3, r9]	@ zero_extendqisi2
	strb	r3, [sp, #21]
	add	r2, sp, #20
	movs	r3, #255
	str	r2, [sp, #12]
	mov	r1, r2
	strb	r3, [sp, #20]
	mov	r9, r6
	mov	r2, r0
.L415:
	ldr	r3, [r5, #40]
	ldr	r0, [r5, #28]
	str	r1, [sp, #4]
	cmp	r3, r4
	add	fp, r3, #-1
	itt	ls
	addls	fp, r3, #-1
	addls	fp, fp, r2
	subs	r2, r2, r4
	cmp	r2, r9
	sub	fp, fp, r4
	it	cs
	movcs	r2, r9
	cmp	fp, r2
	it	cs
	movcs	fp, r2
	mov	r2, fp
	add	r0, r0, r4
	bl	memcpy
	ldr	r2, [r5, #32]
	ldr	r1, [sp, #4]
	add	r4, r4, fp
	cmp	r4, r2
	sub	r9, r9, fp
	add	r1, r1, fp
	beq	.L481
	str	r4, [r5, #36]
	cmp	r9, #0
	bne	.L415
	mov	r0, r2
.L414:
	mov	r9, #0
.L421:
	ldr	r3, [r5, #40]
	cmp	r3, r4
	sub	fp, r0, r4
	add	r2, r3, #-1
	itt	ls
	addls	r2, r3, #-1
	addls	r2, r2, r0
	cmp	fp, r8
	it	cs
	movcs	fp, r8
	subs	r2, r2, r4
	cmp	fp, r2
	ldr	r0, [r5, #28]
	it	cs
	movcs	fp, r2
	add	r0, r0, r4
	mov	r1, r7
	mov	r2, fp
	bl	memcpy
	ldr	r0, [r5, #32]
	add	r4, r4, fp
	cmp	r4, r0
	add	r9, r9, fp
	sub	r8, r8, fp
	add	r7, r7, fp
	beq	.L482
	str	r4, [r5, #36]
	cmp	r8, #0
	bne	.L421
.L420:
	ldr	r2, .L496+28
	ldr	r3, [sp, #8]
	ldrb	r2, [r2]	@ zero_extendqisi2
	ldr	r8, [sp, #12]
	ldrb	r2, [r3, r2]	@ zero_extendqisi2
	strb	r2, [sp, #21]
	movs	r2, #255
	strb	r2, [sp, #20]
	movs	r7, #0
.L427:
	ldr	r3, [r5, #40]
	cmp	r3, r4
	sub	fp, r0, r4
	add	r2, r3, #-1
	itt	ls
	addls	r2, r3, #-1
	addls	r2, r2, r0
	cmp	fp, r6
	it	cs
	movcs	fp, r6
	subs	r2, r2, r4
	cmp	fp, r2
	ldr	r0, [r5, #28]
	it	cs
	movcs	fp, r2
	add	r0, r0, r4
	mov	r1, r8
	mov	r2, fp
	bl	memcpy
	ldr	r0, [r5, #32]
	add	r4, r4, fp
	cmp	r4, r0
	sub	r6, r6, fp
	add	r8, r8, fp
	beq	.L483
	str	r4, [r5, #36]
	cmp	r6, #0
	bne	.L427
	b	.L373
.L481:
	movs	r3, #0
	str	r3, [r5, #36]
	cmp	r9, #0
	beq	.L484
	movs	r4, #0
	b	.L415
.L371:
	cmp	fp, #3
	bls	.L434
	ldr	r3, .L496+24
	str	r3, [sp, #8]
	ldrb	r2, [r3, r9]	@ zero_extendqisi2
	strb	r2, [sp, #21]
	add	r3, sp, #20
	movs	r2, #255
	ldr	r0, [r5, #32]
	str	r7, [sp, #4]
	str	r3, [sp, #12]
	strb	r2, [sp, #20]
	movs	r6, #2
	mov	r7, r3
.L397:
	ldr	r3, [r5, #40]
	cmp	r3, r4
	add	r9, r3, #-1
	itt	ls
	addls	r9, r3, #-1
	addls	r9, r9, r0
	subs	r0, r0, r4
	cmp	r0, r6
	sub	r9, r9, r4
	it	cs
	movcs	r0, r6
	cmp	r9, r0
	ldr	r3, [r5, #28]
	it	cs
	movcs	r9, r0
	mov	r1, r7
	adds	r0, r3, r4
	mov	r2, r9
	bl	memcpy
	ldr	r0, [r5, #32]
	add	r4, r4, r9
	cmp	r4, r0
	sub	r6, r6, r9
	add	r7, r7, r9
	beq	.L485
	str	r4, [r5, #36]
	cmp	r6, #0
	bne	.L397
	ldr	r7, [sp, #4]
.L396:
	sub	r3, fp, #4
	mov	r9, #0
	cmp	r8, r3
	it	cs
	movcs	r8, r3
	mov	r6, r9
.L403:
	ldr	r3, [r5, #40]
	cmp	r3, r4
	sub	fp, r0, r4
	add	r2, r3, #-1
	itt	ls
	addls	r2, r3, #-1
	addls	r2, r2, r0
	cmp	fp, r8
	it	cs
	movcs	fp, r8
	subs	r2, r2, r4
	cmp	fp, r2
	ldr	r0, [r5, #28]
	it	cs
	movcs	fp, r2
	add	r0, r0, r4
	mov	r1, r7
	mov	r2, fp
	bl	memcpy
	ldr	r0, [r5, #32]
	add	r4, r4, fp
	cmp	r4, r0
	add	r9, r9, fp
	sub	r8, r8, fp
	add	r7, r7, fp
	beq	.L486
	str	r4, [r5, #36]
	cmp	r8, #0
	bne	.L403
.L402:
	ldr	r3, .L496+28
	ldr	r2, [sp, #8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldr	fp, [sp, #12]
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	strb	r3, [sp, #21]
	movs	r3, #255
	strb	r3, [sp, #20]
	movs	r7, #2
	mov	r8, #0
.L409:
	ldr	r3, [r5, #40]
	cmp	r3, r4
	sub	r6, r0, r4
	add	r2, r3, #-1
	itt	ls
	addls	r2, r3, #-1
	addls	r2, r2, r0
	cmp	r6, r7
	it	cs
	movcs	r6, r7
	subs	r2, r2, r4
	cmp	r6, r2
	ldr	r0, [r5, #28]
	it	cs
	movcs	r6, r2
	add	r0, r0, r4
	mov	r1, fp
	mov	r2, r6
	bl	memcpy
	ldr	r0, [r5, #32]
	add	r4, r4, r6
	cmp	r4, r0
	sub	r7, r7, r6
	add	fp, fp, r6
	beq	.L487
	str	r4, [r5, #36]
	cmp	r7, #0
	bne	.L409
	b	.L373
.L497:
	.align	2
.L496:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LANCHOR1
	.word	.LANCHOR2
	.word	.LC1
	.word	.LC2
	.word	.LANCHOR3
	.word	.LANCHOR4
.L480:
	ldr	r3, .L498
	str	r3, [sp, #8]
	mov	r2, r3
	add	r1, sp, #20
	ldrb	r2, [r2, r9]	@ zero_extendqisi2
	strb	r2, [sp, #21]
	ldr	r3, [r5, #32]
	str	r1, [sp, #12]
	movs	r2, #255
	str	r6, [sp, #4]
	strb	r2, [sp, #20]
	mov	fp, r1
	mov	r9, #2
.L379:
	ldr	r1, [r5, #40]
	ldr	r0, [r5, #28]
	cmp	r1, r4
	sub	r6, r3, r4
	add	r2, r1, #-1
	itt	ls
	addls	r2, r1, #-1
	addls	r2, r2, r3
	cmp	r6, r9
	it	cs
	movcs	r6, r9
	subs	r2, r2, r4
	cmp	r6, r2
	it	cs
	movcs	r6, r2
	add	r0, r0, r4
	mov	r1, fp
	mov	r2, r6
	bl	memcpy
	ldr	r3, [r5, #32]
	add	r4, r4, r6
	cmp	r4, r3
	sub	r9, r9, r6
	add	fp, fp, r6
	beq	.L488
	str	r4, [r5, #36]
	cmp	r9, #0
	bne	.L379
.L378:
	mov	r9, #0
	mov	r6, r9
.L385:
	ldr	r1, [r5, #40]
	ldr	r0, [r5, #28]
	cmp	r1, r4
	sub	fp, r3, r4
	add	r2, r1, #-1
	itt	ls
	addls	r2, r1, #-1
	addls	r2, r2, r3
	cmp	fp, r8
	it	cs
	movcs	fp, r8
	subs	r2, r2, r4
	cmp	fp, r2
	it	cs
	movcs	fp, r2
	add	r0, r0, r4
	mov	r1, r7
	mov	r2, fp
	bl	memcpy
	ldr	r3, [r5, #32]
	add	r4, r4, fp
	cmp	r4, r3
	add	r9, r9, fp
	sub	r8, r8, fp
	add	r7, r7, fp
	beq	.L489
	str	r4, [r5, #36]
	cmp	r8, #0
	bne	.L385
.L384:
	ldr	r2, .L498+4
	ldr	r1, [sp, #8]
	ldrb	r2, [r2]	@ zero_extendqisi2
	ldr	fp, [sp, #12]
	ldrb	r2, [r1, r2]	@ zero_extendqisi2
	strb	r2, [sp, #21]
	movs	r2, #255
	strb	r2, [sp, #20]
	movs	r7, #2
	mov	r8, #0
.L391:
	ldr	r1, [r5, #40]
	ldr	r0, [r5, #28]
	cmp	r1, r4
	sub	r6, r3, r4
	add	r2, r1, #-1
	itt	ls
	addls	r2, r1, #-1
	addls	r2, r2, r3
	cmp	r6, r7
	it	cs
	movcs	r6, r7
	subs	r2, r2, r4
	cmp	r6, r2
	it	cs
	movcs	r6, r2
	add	r0, r0, r4
	mov	r1, fp
	mov	r2, r6
	bl	memcpy
	ldr	r3, [r5, #32]
	add	r4, r4, r6
	cmp	r4, r3
	sub	r7, r7, r6
	add	fp, fp, r6
	beq	.L490
	str	r4, [r5, #36]
	cmp	r7, #0
	bne	.L391
	b	.L373
.L482:
	movs	r3, #0
	str	r3, [r5, #36]
	cmp	r8, #0
	beq	.L491
	movs	r4, #0
	b	.L421
.L483:
	str	r7, [r5, #36]
	cmp	r6, #0
	beq	.L373
	movs	r4, #0
	b	.L427
.L486:
	str	r6, [r5, #36]
	cmp	r8, #0
	beq	.L492
	movs	r4, #0
	b	.L403
.L489:
	str	r6, [r5, #36]
	cmp	r8, #0
	beq	.L493
	movs	r4, #0
	b	.L385
.L488:
	ldr	r2, [sp, #4]
	str	r2, [r5, #36]
	cmp	r9, #0
	beq	.L494
	movs	r4, #0
	b	.L379
.L487:
	str	r8, [r5, #36]
	cmp	r7, #0
	beq	.L373
	movs	r4, #0
	b	.L409
.L485:
	movs	r3, #0
	str	r3, [r5, #36]
	cbz	r6, .L495
	movs	r4, #0
	b	.L397
.L490:
	str	r8, [r5, #36]
	cmp	r7, #0
	beq	.L373
	movs	r4, #0
	b	.L391
.L484:
	mov	r0, r2
	mov	r4, r9
	b	.L414
.L491:
	mov	r4, r8
	b	.L420
.L428:
	mov	r9, #-1
	b	.L366
.L495:
	ldr	r7, [sp, #4]
	mov	r4, r6
	b	.L396
.L494:
	mov	r4, r9
	b	.L378
.L493:
	mov	r4, r8
	b	.L384
.L492:
	mov	r4, r8
	b	.L402
.L499:
	.align	2
.L498:
	.word	.LANCHOR3
	.word	.LANCHOR4
	.size	SEGGER_RTT_TerminalOut, .-SEGGER_RTT_TerminalOut
	.global	_SEGGER_RTT
	.section	.bss._ActiveTerminal,"aw",%nobits
	.set	.LANCHOR4,. + 0
	.type	_ActiveTerminal, %object
	.size	_ActiveTerminal, 1
_ActiveTerminal:
	.space	1
	.section	.bss._SEGGER_RTT,"aw",%nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_SEGGER_RTT, %object
	.size	_SEGGER_RTT, 120
_SEGGER_RTT:
	.space	120
	.section	.bss._acDownBuffer,"aw",%nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_acDownBuffer, %object
	.size	_acDownBuffer, 16
_acDownBuffer:
	.space	16
	.section	.bss._acUpBuffer,"aw",%nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_acUpBuffer, %object
	.size	_acUpBuffer, 1024
_acUpBuffer:
	.space	1024
	.section	.rodata._aTerminalId,"a"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_aTerminalId, %object
	.size	_aTerminalId, 16
_aTerminalId:
	.ascii	"0123456789ABCDEF"
	.ident	"GCC: (GNU) 9.3.1 20200408 (release)"
