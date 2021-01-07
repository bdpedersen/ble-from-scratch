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
	.file	"system_nrf52.c"
	.section	.init,"ax",%progbits

	.section	.init.SystemCoreClockUpdate,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SystemCoreClockUpdate
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SystemCoreClockUpdate, %function
SystemCoreClockUpdate:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	ldr	r2, .L3+4
	str	r2, [r3]
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.word	64000000
	.size	SystemCoreClockUpdate, .-SystemCoreClockUpdate
	.section	.init.SystemInit,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SystemInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SystemInit, %function
SystemInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L63
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #6
	push	{r4, r5}
	beq	.L57
.L37:
	ldr	r2, .L63+4
	ldr	r3, [r2, #136]
	orr	r3, r3, #15728640
	str	r3, [r2, #136]
	.syntax unified
@ 433 "/Users/brian/src/ble-from-scratch/part4/CMSIS_4/CMSIS/Include/cmsis_gcc.h" 1
	dsb 0xF
@ 0 "" 2
@ 422 "/Users/brian/src/ble-from-scratch/part4/CMSIS_4/CMSIS/Include/cmsis_gcc.h" 1
	isb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, .L63+8
	ldr	r2, .L63+12
	str	r2, [r3]
	pop	{r4, r5}
	bx	lr
.L57:
	ldr	r3, .L63+16
	ldr	r3, [r3]
	lsls	r5, r3, #28
	bne	.L37
	ldr	r3, .L63+20
	ldr	r3, [r3]
	and	r2, r3, #240
	cmp	r2, #48
	beq	.L8
	and	r3, r3, #224
	cmp	r3, #64
	beq	.L8
.L9:
	ldr	r3, .L63+20
	ldr	r3, [r3]
	and	r3, r3, #240
	cmp	r3, #48
	beq	.L58
.L10:
	ldr	r3, .L63+20
	ldr	r3, [r3]
	and	r2, r3, #240
	cmp	r2, #48
	beq	.L13
	and	r3, r3, #224
	cmp	r3, #64
	beq	.L13
.L14:
	ldr	r3, .L63+20
	ldr	r3, [r3]
	and	r3, r3, #240
	cmp	r3, #48
	beq	.L59
.L17:
	ldr	r3, .L63+20
	ldr	r3, [r3]
	and	r2, r3, #240
	cmp	r2, #48
	beq	.L20
	and	r3, r3, #224
	cmp	r3, #64
	beq	.L20
.L21:
	ldr	r3, .L63+20
	ldr	r3, [r3]
	and	r3, r3, #240
	cmp	r3, #48
	beq	.L60
.L24:
	ldr	r3, .L63+20
	ldr	r3, [r3]
	and	r3, r3, #240
	cmp	r3, #48
	beq	.L61
.L27:
	ldr	r3, .L63+20
	ldr	r3, [r3]
	and	r3, r3, #240
	cmp	r3, #80
	beq	.L62
.L30:
	ldr	r3, .L63+20
	ldr	r3, [r3]
	and	r2, r3, #240
	cmp	r2, #48
	beq	.L33
	and	r3, r3, #224
	cmp	r3, #64
	beq	.L33
.L34:
	ldr	r3, .L63+20
	ldr	r3, [r3]
	and	r2, r3, #240
	cmp	r2, #48
	beq	.L36
	and	r3, r3, #224
	cmp	r3, #64
	bne	.L37
.L36:
	mov	r3, #1073741824
	ldr	r2, [r3, #1024]
	lsls	r2, r2, #31
	itt	mi
	mvnmi	r2, #1
	strmi	r2, [r3, #1024]
	b	.L37
.L33:
	ldr	r3, .L63+24
	ldr	r2, .L63
	ldr	r3, [r3]
	ldrb	r2, [r2]	@ zero_extendqisi2
	ldr	r1, .L63+28
	and	r3, r3, #79
	cmp	r2, #6
	str	r3, [r1]
	bne	.L37
	ldr	r3, .L63+16
	ldr	r3, [r3]
	lsls	r1, r3, #28
	bne	.L37
	b	.L34
.L20:
	ldr	r2, .L63
	ldrb	r1, [r2]	@ zero_extendqisi2
	mov	r3, #1073741824
	movs	r2, #0
	cmp	r1, #6
	str	r2, [r3, #268]
	str	r2, [r3, #272]
	str	r2, [r3, #1336]
	bne	.L37
	ldr	r3, .L63+16
	ldr	r3, [r3]
	lsls	r3, r3, #28
	bne	.L37
	b	.L21
.L13:
	ldr	r3, .L63+32
	ldr	r2, .L63
	ldr	r3, [r3]
	ldrb	r2, [r2]	@ zero_extendqisi2
	ldr	r1, .L63+36
	ubfx	r3, r3, #13, #3
	cmp	r2, #6
	str	r3, [r1]
	bne	.L37
	ldr	r3, .L63+16
	ldr	r3, [r3]
	lsls	r1, r3, #28
	bne	.L37
	b	.L14
.L8:
	ldr	r3, .L63+40
	ldr	r2, .L63
	ldr	r3, [r3]
	ldrb	r2, [r2]	@ zero_extendqisi2
	ldr	r1, .L63+44
	ubfx	r3, r3, #8, #5
	cmp	r2, #6
	str	r3, [r1]
	bne	.L37
	ldr	r3, .L63+16
	ldr	r3, [r3]
	lsls	r4, r3, #28
	bne	.L37
	b	.L9
.L58:
	ldr	r3, .L63
	ldr	r2, .L63+48
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldr	r1, .L63+52
	str	r1, [r2]
	cmp	r3, #6
	bne	.L37
	ldr	r3, .L63+16
	ldr	r3, [r3]
	lsls	r0, r3, #28
	bne	.L37
	b	.L10
.L62:
	mov	r2, #268435456
	ldr	r3, .L63+56
	ldr	r1, [r2, #1028]
	str	r1, [r3, #1312]
	ldr	r1, [r2, #1032]
	str	r1, [r3, #1316]
	ldr	r1, [r2, #1036]
	str	r1, [r3, #1320]
	ldr	r1, [r2, #1040]
	str	r1, [r3, #1324]
	ldr	r1, [r2, #1044]
	str	r1, [r3, #1328]
	ldr	r1, [r2, #1048]
	str	r1, [r3, #1332]
	ldr	r1, [r2, #1052]
	str	r1, [r3, #1344]
	ldr	r1, [r2, #1056]
	str	r1, [r3, #1348]
	ldr	r1, [r2, #1060]
	str	r1, [r3, #1352]
	ldr	r1, [r2, #1064]
	str	r1, [r3, #1356]
	ldr	r1, [r2, #1068]
	str	r1, [r3, #1360]
	ldr	r1, [r2, #1072]
	str	r1, [r3, #1364]
	ldr	r1, [r2, #1076]
	str	r1, [r3, #1376]
	ldr	r1, [r2, #1080]
	str	r1, [r3, #1380]
	ldr	r1, [r2, #1084]
	str	r1, [r3, #1384]
	ldr	r1, [r2, #1088]
	ldr	r0, .L63
	str	r1, [r3, #1388]
	ldr	r1, [r2, #1092]
	ldrb	r2, [r0]	@ zero_extendqisi2
	str	r1, [r3, #1392]
	cmp	r2, #6
	bne	.L37
	ldr	r3, .L63+16
	ldr	r3, [r3]
	lsls	r0, r3, #28
	bne	.L37
	b	.L30
.L61:
	ldr	r3, .L63
	ldr	r4, .L63+60
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldr	r1, .L63+64
	ldr	r0, .L63+68
	ldr	r2, .L63+72
	movs	r5, #5
	str	r5, [r4]
	movs	r5, #1
	str	r5, [r1]
	movs	r4, #0
	movs	r1, #63
	cmp	r3, #6
	str	r4, [r0]
	str	r1, [r2]
	bne	.L37
	ldr	r3, .L63+16
	ldr	r3, [r3]
	lsls	r4, r3, #28
	bne	.L37
	b	.L27
.L60:
	ldr	r3, .L63
	ldr	r2, .L63+76
	ldrb	r3, [r3]	@ zero_extendqisi2
	movs	r1, #3
	cmp	r3, #6
	str	r1, [r2]
	bne	.L37
	ldr	r3, .L63+16
	ldr	r3, [r3]
	lsls	r5, r3, #28
	bne	.L37
	b	.L24
.L59:
	ldr	r2, .L63+80
	ldr	r1, .L63
	ldr	r3, [r2, #12]
	ldrb	r1, [r1]	@ zero_extendqisi2
	bic	r3, r3, #16777216
	cmp	r1, #6
	str	r3, [r2, #12]
	bne	.L37
	ldr	r3, .L63+16
	ldr	r3, [r3]
	lsls	r2, r3, #28
	bne	.L37
	b	.L17
.L64:
	.align	2
.L63:
	.word	-268431392
	.word	-536810240
	.word	.LANCHOR0
	.word	64000000
	.word	-268431388
	.word	-268431384
	.word	268436056
	.word	1073745636
	.word	268436036
	.word	1073743164
	.word	268436260
	.word	1073820992
	.word	1074249844
	.word	-1163005939
	.word	1073790976
	.word	1073763856
	.word	1073763976
	.word	1073763864
	.word	1073763860
	.word	1073743264
	.word	-536810000
	.size	SystemInit, .-SystemInit
	.global	SystemCoreClock
	.section	.data.SystemCoreClock,"aw"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	SystemCoreClock, %object
	.size	SystemCoreClock, 4
SystemCoreClock:
	.word	64000000
	.ident	"GCC: (GNU) 9.3.1 20200408 (release)"
