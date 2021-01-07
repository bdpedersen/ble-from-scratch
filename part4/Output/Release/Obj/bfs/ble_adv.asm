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
	.file	"ble_adv.cc"
	.text
	.section	.text.sd_ble_gap_adv_set_configure,"ax",%progbits
	.align	1
	.p2align 2,,3
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	sd_ble_gap_adv_set_configure, %function
sd_ble_gap_adv_set_configure:
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.syntax unified
@ 1512 "/Users/brian/src/ext/nRF5_SDK_17.0.2_d674dde/components/softdevice/s112/headers/ble_gap.h" 1
	svc #114
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	.size	sd_ble_gap_adv_set_configure, .-sd_ble_gap_adv_set_configure
	.section	.text.sd_ble_gap_adv_start,"ax",%progbits
	.align	1
	.p2align 2,,3
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	sd_ble_gap_adv_start, %function
sd_ble_gap_adv_start:
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.syntax unified
@ 1561 "/Users/brian/src/ext/nRF5_SDK_17.0.2_d674dde/components/softdevice/s112/headers/ble_gap.h" 1
	svc #115
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	.size	sd_ble_gap_adv_start, .-sd_ble_gap_adv_start
	.section	.text._Z17ble_adv_configurej,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	_Z17ble_adv_configurej
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	_Z17ble_adv_configurej, %function
_Z17ble_adv_configurej:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	ldr	r3, .L11
	ldr	r1, .L11+4
	ldrb	r0, [r3, #31]	@ zero_extendqisi2
	ldr	r4, .L11+8
	ldr	r2, .L11+12
	ldrb	r5, [r4, #31]	@ zero_extendqisi2
	str	r4, [r1]
	cmp	r0, #0
	it	eq
	moveq	r3, #0
	movs	r4, #32
	strh	r0, [r1, #12]	@ movhi
	str	r3, [r1, #8]
	str	r4, [r2, #8]
	movs	r3, #0
	movs	r4, #1
	ldr	r0, .L11+16
	str	r3, [r2]
	str	r3, [r2, #20]
	strd	r3, r3, [r2, #12]
	strh	r5, [r1, #4]	@ movhi
	str	r3, [r2, #4]
	strb	r4, [r2]
	strb	r4, [r2, #21]
	bl	sd_ble_gap_adv_set_configure
	cbnz	r0, .L10
	pop	{r3, r4, r5, pc}
.L10:
	.syntax unified
@ 433 "/Users/brian/src/ble-from-scratch/part4/CMSIS_4/CMSIS/Include/cmsis_gcc.h" 1
	dsb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r1, .L11+20
	ldr	r3, .L11+24
	ldr	r2, [r1, #12]
	and	r2, r2, #1792
	orrs	r3, r3, r2
	str	r3, [r1, #12]
	.syntax unified
@ 433 "/Users/brian/src/ble-from-scratch/part4/CMSIS_4/CMSIS/Include/cmsis_gcc.h" 1
	dsb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
.L7:
	.syntax unified
@ 379 "/Users/brian/src/ble-from-scratch/part4/CMSIS_4/CMSIS/Include/cmsis_gcc.h" 1
	nop
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L7
.L12:
	.align	2
.L11:
	.word	scan_resp
	.word	.LANCHOR1
	.word	adv
	.word	.LANCHOR0
	.word	.LANCHOR2
	.word	-536810240
	.word	100270084
	.size	_Z17ble_adv_configurej, .-_Z17ble_adv_configurej
	.section	.text._Z13ble_adv_startv,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	_Z13ble_adv_startv
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	_Z13ble_adv_startv, %function
_Z13ble_adv_startv:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L14
	movs	r1, #1
	ldrb	r0, [r3]	@ zero_extendqisi2
	b	sd_ble_gap_adv_start
.L15:
	.align	2
.L14:
	.word	.LANCHOR2
	.size	_Z13ble_adv_startv, .-_Z13ble_adv_startv
	.global	adv_params
	.global	adv_data
	.global	adv_handle
	.section	.bss.adv_data,"aw",%nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	adv_data, %object
	.size	adv_data, 16
adv_data:
	.space	16
	.section	.bss.adv_params,"aw",%nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	adv_params, %object
	.size	adv_params, 24
adv_params:
	.space	24
	.section	.data.adv_handle,"aw"
	.set	.LANCHOR2,. + 0
	.type	adv_handle, %object
	.size	adv_handle, 1
adv_handle:
	.byte	-1
	.ident	"GCC: (GNU) 9.3.1 20200408 (release)"
