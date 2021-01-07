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
	.file	"err_handler.cc"
	.text
	.section	.rodata._Z10report_errPKciS0_.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Error in %s:%d: %s\012\000"
	.section	.text._Z10report_errPKciS0_,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	_Z10report_errPKciS0_
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	_Z10report_errPKciS0_, %function
_Z10report_errPKciS0_:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4}
	mov	r4, r1
	mov	r3, r2
	mov	r1, r0
	mov	r2, r4
	ldr	r0, .L4
	ldr	r4, [sp], #4
	b	printf
.L5:
	.align	2
.L4:
	.word	.LC0
	.size	_Z10report_errPKciS0_, .-_Z10report_errPKciS0_
	.section	.rodata._Z9print_errPKcii.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"Unknown error\000"
	.section	.text._Z9print_errPKcii,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	_Z9print_errPKcii
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	_Z9print_errPKcii, %function
_Z9print_errPKcii:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	subs	r3, r2, #1
	cmp	r3, #18
	mov	r2, r1
	itet	ls
	ldrls	r1, .L10
	ldrhi	r3, .L10+4
	ldrls	r3, [r1, r3, lsl #2]
	push	{r4}
	mov	r4, r0
	mov	r1, r4
	ldr	r0, .L10+8
	ldr	r4, [sp], #4
	b	printf
.L11:
	.align	2
.L10:
	.word	.LANCHOR0
	.word	.LC1
	.word	.LC0
	.size	_Z9print_errPKcii, .-_Z9print_errPKcii
	.section	.rodata._Z13fault_handlerjjj.str1.4,"aMS",%progbits,1
	.align	2
.LC2:
	.ascii	"Hardfault assertion at address 0x%08X\012\000"
	.align	2
.LC3:
	.ascii	"Memory access violation at address 0x%08X accessing"
	.ascii	" 0x%08X\012\000"
	.align	2
.LC4:
	.ascii	"Unknown hardfault (ID=%d) at address 0x%08X\012\000"
	.section	.text._Z13fault_handlerjjj,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	_Z13fault_handlerjjj
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	_Z13fault_handlerjjj, %function
_Z13fault_handlerjjj:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #1
	beq	.L13
	push	{r4}
	movw	r4, #4097
	cmp	r0, r4
	beq	.L14
	mov	r2, r1
	ldr	r4, [sp], #4
	mov	r1, r0
	ldr	r0, .L20
	b	printf
.L13:
	ldr	r0, .L20+4
	b	printf
.L14:
	ldr	r0, .L20+8
	ldr	r4, [sp], #4
	b	printf
.L21:
	.align	2
.L20:
	.word	.LC4
	.word	.LC2
	.word	.LC3
	.size	_Z13fault_handlerjjj, .-_Z13fault_handlerjjj
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC5:
	.ascii	"SVC handler missing\000"
	.align	2
.LC6:
	.ascii	"SoftDevice not enabled\000"
	.align	2
.LC7:
	.ascii	"Internal error\000"
	.align	2
.LC8:
	.ascii	"Out of memory\000"
	.align	2
.LC9:
	.ascii	"Not found\000"
	.align	2
.LC10:
	.ascii	"Not supported\000"
	.align	2
.LC11:
	.ascii	"Invalid parameter\000"
	.align	2
.LC12:
	.ascii	"Operation not allowed in this state\000"
	.align	2
.LC13:
	.ascii	"Invalid flags\000"
	.align	2
.LC14:
	.ascii	"Invalid data size\000"
	.align	2
.LC15:
	.ascii	"Timeout\000"
	.align	2
.LC16:
	.ascii	"Null pointer not allowed\000"
	.align	2
.LC17:
	.ascii	"Forbidden operation\000"
	.align	2
.LC18:
	.ascii	"Invalid address\000"
	.align	2
.LC19:
	.ascii	"Busy\000"
	.align	2
.LC20:
	.ascii	"Maximum connection count exceeded\000"
	.align	2
.LC21:
	.ascii	"Not enough resources for this operation\000"
	.section	.rodata.CSWTCH.2,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	CSWTCH.2, %object
	.size	CSWTCH.2, 76
CSWTCH.2:
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC1
	.word	.LC13
	.word	.LC1
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.ident	"GCC: (GNU) 9.3.1 20200408 (release)"
