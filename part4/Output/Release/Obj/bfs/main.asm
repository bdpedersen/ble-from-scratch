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
	.file	"main.cc"
	.text
	.section	.text.NVIC_SystemReset,"ax",%progbits
	.align	1
	.p2align 2,,3
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	NVIC_SystemReset, %function
NVIC_SystemReset:
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.syntax unified
@ 433 "/Users/brian/src/ble-from-scratch/part4/CMSIS_4/CMSIS/Include/cmsis_gcc.h" 1
	dsb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r1, .L4
	ldr	r3, .L4+4
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
.L2:
	.syntax unified
@ 379 "/Users/brian/src/ble-from-scratch/part4/CMSIS_4/CMSIS/Include/cmsis_gcc.h" 1
	nop
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L2
.L5:
	.align	2
.L4:
	.word	-536810240
	.word	100270084
	.size	NVIC_SystemReset, .-NVIC_SystemReset
	.section	.text.sd_app_evt_wait,"ax",%progbits
	.align	1
	.p2align 2,,3
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	sd_app_evt_wait, %function
sd_app_evt_wait:
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.syntax unified
@ 702 "/Users/brian/src/ext/nRF5_SDK_17.0.2_d674dde/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #65
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	.size	sd_app_evt_wait, .-sd_app_evt_wait
	.section	.text.sd_softdevice_enable,"ax",%progbits
	.align	1
	.p2align 2,,3
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	sd_softdevice_enable, %function
sd_softdevice_enable:
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.syntax unified
@ 326 "/Users/brian/src/ext/nRF5_SDK_17.0.2_d674dde/components/softdevice/s112/headers/nrf_sdm.h" 1
	svc #16
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	.size	sd_softdevice_enable, .-sd_softdevice_enable
	.section	.text.startup.main,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	sub	sp, sp, #12
	ldr	r3, .L14
	ldr	r1, .L14+4
	str	r3, [sp, #4]
	add	r0, sp, #4
	bl	sd_softdevice_enable
	cbnz	r0, .L10
	bl	_Z9ble_startv
	b	.L11
.L13:
	bl	_Z17ble_handle_eventsv
.L11:
	bl	sd_app_evt_wait
	cmp	r0, #0
	beq	.L13
.L10:
	bl	NVIC_SystemReset
.L15:
	.align	2
.L14:
	.word	117440513
	.word	_Z13fault_handlerjjj
	.size	main, .-main
	.ident	"GCC: (GNU) 9.3.1 20200408 (release)"
