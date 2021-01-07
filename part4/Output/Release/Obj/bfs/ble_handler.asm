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
	.file	"ble_handler.cc"
	.text
	.section	.text.sd_ble_gap_phy_update,"ax",%progbits
	.align	1
	.p2align 2,,3
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	sd_ble_gap_phy_update, %function
sd_ble_gap_phy_update:
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.syntax unified
@ 2112 "/Users/brian/src/ext/nRF5_SDK_17.0.2_d674dde/components/softdevice/s112/headers/ble_gap.h" 1
	svc #143
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	.size	sd_ble_gap_phy_update, .-sd_ble_gap_phy_update
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
	ldr	r1, .L5
	ldr	r3, .L5+4
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
.L4:
	.syntax unified
@ 379 "/Users/brian/src/ble-from-scratch/part4/CMSIS_4/CMSIS/Include/cmsis_gcc.h" 1
	nop
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L4
.L6:
	.align	2
.L5:
	.word	-536810240
	.word	100270084
	.size	NVIC_SystemReset, .-NVIC_SystemReset
	.section	.text.sd_ble_gatts_exchange_mtu_reply,"ax",%progbits
	.align	1
	.p2align 2,,3
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	sd_ble_gatts_exchange_mtu_reply, %function
sd_ble_gatts_exchange_mtu_reply:
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.syntax unified
@ 835 "/Users/brian/src/ext/nRF5_SDK_17.0.2_d674dde/components/softdevice/s112/headers/ble_gatts.h" 1
	svc #181
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	.size	sd_ble_gatts_exchange_mtu_reply, .-sd_ble_gatts_exchange_mtu_reply
	.section	.text.sd_ble_enable,"ax",%progbits
	.align	1
	.p2align 2,,3
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	sd_ble_enable, %function
sd_ble_enable:
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.syntax unified
@ 425 "/Users/brian/src/ext/nRF5_SDK_17.0.2_d674dde/components/softdevice/s112/headers/ble.h" 1
	svc #96
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	.size	sd_ble_enable, .-sd_ble_enable
	.section	.text.sd_ble_cfg_set,"ax",%progbits
	.align	1
	.p2align 2,,3
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	sd_ble_cfg_set, %function
sd_ble_cfg_set:
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.syntax unified
@ 461 "/Users/brian/src/ext/nRF5_SDK_17.0.2_d674dde/components/softdevice/s112/headers/ble.h" 1
	svc #105
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	.size	sd_ble_cfg_set, .-sd_ble_cfg_set
	.section	.text.sd_ble_evt_get,"ax",%progbits
	.align	1
	.p2align 2,,3
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	sd_ble_evt_get, %function
sd_ble_evt_get:
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.syntax unified
@ 499 "/Users/brian/src/ext/nRF5_SDK_17.0.2_d674dde/components/softdevice/s112/headers/ble.h" 1
	svc #97
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	.size	sd_ble_evt_get, .-sd_ble_evt_get
	.section	.rodata._Z9ble_startv.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"SoftDevice reported %d bytes free\012\000"
	.section	.text._Z9ble_startv,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	_Z9ble_startv
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	_Z9ble_startv, %function
_Z9ble_startv:
	@ args = 0, pretend = 0, frame = 136
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	sub	sp, sp, #140
	movs	r3, #0
	ldr	r4, .L15
	str	r3, [sp, #20]
	strd	r3, r3, [sp, #8]
	movs	r2, #1
	str	r3, [sp, #32]
	str	r3, [sp, #44]
	strd	r3, r3, [sp, #24]
	strd	r3, r3, [sp, #36]
	str	r3, [sp, #16]
	str	r3, [sp, #52]
	movs	r3, #100
	movs	r1, #4
	ldr	r0, [r4]
	strb	r2, [sp, #8]
	strb	r2, [sp, #10]
	strb	r2, [sp, #20]
	strh	r3, [sp, #22]	@ movhi
	movw	r2, #257
	movs	r3, #2
	strh	r1, [sp, #12]	@ movhi
	strh	r2, [sp, #32]	@ movhi
	strb	r3, [sp, #45]
	str	r0, [sp, #48]
	bl	strlen
	mov	r3, r0
	ldr	r0, [r4]
	strh	r3, [sp, #52]	@ movhi
	bl	strlen
	ldr	r3, .L15+4
	strh	r0, [sp, #54]	@ movhi
	ldr	r4, [r3]
	add	r1, sp, #8
	mov	r2, r4
	movs	r0, #32
	bl	sd_ble_cfg_set
	cbnz	r0, .L13
	add	r1, sp, #20
	mov	r2, r4
	movs	r0, #34
	bl	sd_ble_cfg_set
	cbnz	r0, .L13
	add	r1, sp, #32
	mov	r2, r4
	movs	r0, #64
	bl	sd_ble_cfg_set
	cbnz	r0, .L13
	add	r1, sp, #44
	mov	r2, r4
	movs	r0, #65
	bl	sd_ble_cfg_set
	cbnz	r0, .L13
	add	r0, sp, #4
	str	r4, [sp, #4]
	bl	sd_ble_enable
	ldr	r2, [sp, #4]
	ldr	r1, .L15+8
	mov	r5, r0
	subs	r2, r4, r2
	add	r0, sp, #56
	bl	sprintf
	cbnz	r5, .L13
	movs	r0, #200
	bl	_Z17ble_adv_configurej
	bl	_Z13ble_adv_startv
	add	sp, sp, #140
	@ sp needed
	pop	{r4, r5, pc}
.L13:
	bl	NVIC_SystemReset
.L16:
	.align	2
.L15:
	.word	devicename
	.word	.LANCHOR0
	.word	.LC1
	.size	_Z9ble_startv, .-_Z9ble_startv
	.section	.rodata._Z17ble_handle_eventsv.str1.4,"aMS",%progbits,1
	.align	2
.LC2:
	.ascii	"Phy set to tx=%d, rx=%d\000"
	.align	2
.LC3:
	.ascii	"MTU set to %d\000"
	.align	2
.LC4:
	.ascii	"Event 0x%x received with length %d\012\000"
	.section	.text._Z17ble_handle_eventsv,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	_Z17ble_handle_eventsv
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	_Z17ble_handle_eventsv, %function
_Z17ble_handle_eventsv:
	@ args = 0, pretend = 0, frame = 88
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r6, .L35
	ldr	r5, .L35+4
	ldr	r4, .L35+8
	sub	sp, sp, #92
	add	r7, sp, #0
.L29:
	adds	r1, r7, #4
	movs	r0, #0
	bl	sd_ble_evt_get
	cmp	r0, #5
	beq	.L17
.L34:
	ldrh	r2, [r7, #4]
	ands	r3, r2, #3
	it	ne
	movne	r3, #1
	add	r3, r3, r2, lsr #2
	lsls	r3, r3, #2
	uxth	r3, r3
	asrs	r2, r3, #2
	adds	r2, r2, #7
	mov	r1, sp
	lsrs	r2, r2, #3
	sub	r2, r1, r2, lsl #3
	mov	sp, r2
	mov	r8, sp
	mov	r0, r8
	adds	r1, r7, #6
	strh	r3, [r7, #6]	@ movhi
	bl	sd_ble_evt_get
	cmp	r0, #0
	bne	.L33
	ldrh	r2, [r8]
	cmp	r2, #34
	bhi	.L20
	cmp	r2, #15
	bls	.L21
	sub	r3, r2, #16
	cmp	r3, #18
	bhi	.L21
	adr	r1, .L23
	ldr	pc, [r1, r3, lsl #2]
	.p2align 2
.L23:
	.word	.L29+1
	.word	.L25+1
	.word	.L21+1
	.word	.L21+1
	.word	.L21+1
	.word	.L21+1
	.word	.L21+1
	.word	.L21+1
	.word	.L21+1
	.word	.L21+1
	.word	.L21+1
	.word	.L21+1
	.word	.L21+1
	.word	.L21+1
	.word	.L21+1
	.word	.L21+1
	.word	.L21+1
	.word	.L24+1
	.word	.L22+1
	.p2align 1
.L22:
	ldrb	r3, [r8, #10]	@ zero_extendqisi2
	ldrb	r2, [r8, #9]	@ zero_extendqisi2
	mov	r1, r4
	add	r0, r7, #8
	bl	sprintf
	adds	r1, r7, #4
	movs	r0, #0
	bl	sd_ble_evt_get
	cmp	r0, #5
	bne	.L34
.L17:
	adds	r7, r7, #92
	mov	sp, r7
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L24:
	movw	r3, #257
	ldrh	r0, [r8, #4]
	strh	r3, [r7, #8]	@ movhi
	add	r1, r7, #8
	bl	sd_ble_gap_phy_update
	b	.L29
.L25:
	movs	r0, #32
	bl	_Z17ble_adv_configurej
	bl	_Z13ble_adv_startv
	b	.L29
.L21:
	ldrh	r3, [r7, #4]
	mov	r1, r6
	add	r0, r7, #8
	bl	sprintf
	b	.L29
.L20:
	cmp	r2, #85
	bne	.L21
	ldrh	r9, [r8, #6]
	cmp	r9, #100
	it	cs
	movcs	r9, #100
.L28:
	ldrh	r0, [r8, #4]
	mov	r1, r9
	bl	sd_ble_gatts_exchange_mtu_reply
	cmp	r0, #17
	beq	.L28
	mov	r2, r9
	mov	r1, r5
	add	r0, r7, #8
	bl	sprintf
	b	.L29
.L33:
	bl	NVIC_SystemReset
.L36:
	.align	2
.L35:
	.word	.LC4
	.word	.LC3
	.word	.LC2
	.size	_Z17ble_handle_eventsv, .-_Z17ble_handle_eventsv
	.section	.rodata._ZL12app_ram_base,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL12app_ram_base, %object
	.size	_ZL12app_ram_base, 4
_ZL12app_ram_base:
	.word	__app_ram_start__
	.ident	"GCC: (GNU) 9.3.1 20200408 (release)"
