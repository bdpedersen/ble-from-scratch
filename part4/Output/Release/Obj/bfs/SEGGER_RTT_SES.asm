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
	.file	"SEGGER_RTT_SES.c"
	.text
	.section	.text.printf,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	printf
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	printf, %function
printf:
	@ args = 4, pretend = 16, frame = 136
	@ frame_needed = 0, uses_anonymous_args = 1
	push	{r0, r1, r2, r3}
	push	{r4, lr}
	sub	sp, sp, #136
	add	r3, sp, #144
	add	r0, sp, #8
	ldr	r2, [r3], #4
	str	r3, [sp, #4]
	movs	r1, #128
	bl	vsnprintf
	add	r1, sp, #8
	mov	r4, r0
	mov	r2, r0
	movs	r0, #0
	bl	SEGGER_RTT_Write
	mov	r0, r4
	add	sp, sp, #136
	@ sp needed
	pop	{r4, lr}
	add	sp, sp, #16
	bx	lr
	.size	printf, .-printf
	.section	.text.puts,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	puts
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	puts, %function
puts:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, r0
	movs	r0, #0
	b	SEGGER_RTT_WriteString
	.size	puts, .-puts
	.section	.text.__putchar,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	__putchar
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	__putchar, %function
__putchar:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	sub	sp, sp, #12
	movs	r2, #1
	str	r0, [sp, #4]
	add	r1, sp, #4
	movs	r0, #0
	bl	SEGGER_RTT_Write
	ldr	r0, [sp, #4]
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
	.size	__putchar, .-__putchar
	.section	.text.__getchar,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	__getchar
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	__getchar, %function
__getchar:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	SEGGER_RTT_WaitKey
	.size	__getchar, .-__getchar
	.ident	"GCC: (GNU) 9.3.1 20200408 (release)"
