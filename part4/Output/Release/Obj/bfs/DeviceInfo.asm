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
	.file	"DeviceInfo.cc"
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
	.section	.text.sd_ble_gatts_service_add,"ax",%progbits
	.align	1
	.p2align 2,,3
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	sd_ble_gatts_service_add, %function
sd_ble_gatts_service_add:
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.syntax unified
@ 446 "/Users/brian/src/ext/nRF5_SDK_17.0.2_d674dde/components/softdevice/s112/headers/ble_gatts.h" 1
	svc #168
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	.size	sd_ble_gatts_service_add, .-sd_ble_gatts_service_add
	.section	.text.sd_ble_gatts_characteristic_add,"ax",%progbits
	.align	1
	.p2align 2,,3
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	sd_ble_gatts_characteristic_add, %function
sd_ble_gatts_characteristic_add:
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.syntax unified
@ 501 "/Users/brian/src/ext/nRF5_SDK_17.0.2_d674dde/components/softdevice/s112/headers/ble_gatts.h" 1
	svc #170
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	.size	sd_ble_gatts_characteristic_add, .-sd_ble_gatts_characteristic_add
	.section	.text._Z18install_deviceinfov,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	_Z18install_deviceinfov
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	_Z18install_deviceinfov, %function
_Z18install_deviceinfov:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	sub	sp, sp, #20
	ldr	r1, .L12
	add	r2, sp, #6
	movs	r0, #1
	bl	sd_ble_gatts_service_add
	cbnz	r0, .L10
	ldr	r2, .L12+4
	ldr	r1, .L12+8
	ldrh	r0, [sp, #6]
	add	r3, sp, #8
	bl	sd_ble_gatts_characteristic_add
	cbnz	r0, .L10
	ldr	r2, .L12+12
	ldr	r1, .L12+8
	ldrh	r0, [sp, #6]
	add	r3, sp, #8
	bl	sd_ble_gatts_characteristic_add
	cbnz	r0, .L10
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
.L10:
	bl	NVIC_SystemReset
.L13:
	.align	2
.L12:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	.LANCHOR2
	.word	.LANCHOR3
	.size	_Z18install_deviceinfov, .-_Z18install_deviceinfov
	.section	.text.startup._GLOBAL__sub_I_mfgr_name,"ax",%progbits
	.align	1
	.p2align 2,,3
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	_GLOBAL__sub_I_mfgr_name, %function
_GLOBAL__sub_I_mfgr_name:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5}
	ldr	r3, .L32
	ldr	r2, [r3]
	ldrb	r3, [r2]	@ zero_extendqisi2
	cbz	r3, .L15
	mov	r1, r2
	rsb	r4, r2, #1
.L16:
	adds	r3, r4, r1
	ldrb	r0, [r1, #1]!	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L16
.L15:
	ldr	r1, .L32+4
	strh	r3, [r1, #8]	@ movhi
	ldrb	r3, [r2]	@ zero_extendqisi2
	cbz	r3, .L17
	mov	r0, r2
	rsb	r4, r2, #1
.L18:
	adds	r3, r4, r0
	ldrb	r5, [r0, #1]!	@ zero_extendqisi2
	cmp	r5, #0
	bne	.L18
.L17:
	ldr	r0, .L32+8
	strh	r3, [r1, #12]	@ movhi
	ldr	r3, [r0]
	str	r2, [r1, #16]
	ldrb	r2, [r3]	@ zero_extendqisi2
	cbz	r2, .L19
	mov	r1, r3
	rsb	r4, r3, #1
.L20:
	adds	r2, r4, r1
	ldrb	r0, [r1, #1]!	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L20
.L19:
	ldr	r1, .L32+12
	strh	r2, [r1, #8]	@ movhi
	ldrb	r2, [r3]	@ zero_extendqisi2
	cbz	r2, .L21
	mov	r0, r3
	rsb	r4, r3, #1
.L22:
	adds	r2, r4, r0
	ldrb	r5, [r0, #1]!	@ zero_extendqisi2
	cmp	r5, #0
	bne	.L22
.L21:
	pop	{r4, r5}
	strh	r2, [r1, #12]	@ movhi
	str	r3, [r1, #16]
	bx	lr
.L33:
	.align	2
.L32:
	.word	.LANCHOR4
	.word	.LANCHOR1
	.word	.LANCHOR5
	.word	.LANCHOR3
	.size	_GLOBAL__sub_I_mfgr_name, .-_GLOBAL__sub_I_mfgr_name
	.section	.init_array,"aw",%init_array
	.align	2
	.word	_GLOBAL__sub_I_mfgr_name(target1)
	.global	firmware_rev
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Alpha0.1\000"
	.global	mfgr_name
	.align	2
.LC1:
	.ascii	"Dam Connectivity\000"
	.section	.data._ZL22devinfo_mfgr_name_attr,"aw"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL22devinfo_mfgr_name_attr, %object
	.size	_ZL22devinfo_mfgr_name_attr, 20
_ZL22devinfo_mfgr_name_attr:
	.word	_ZL17devinfo_mfgr_name
	.word	_ZL23public_readonly_attr_md
	.space	2
	.short	0
	.space	8
	.section	.data._ZL25devinfo_firmware_rev_attr,"aw"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL25devinfo_firmware_rev_attr, %object
	.size	_ZL25devinfo_firmware_rev_attr, 20
_ZL25devinfo_firmware_rev_attr:
	.word	_ZL20devinfo_firmware_rev
	.word	_ZL23public_readonly_attr_md
	.space	2
	.short	0
	.space	8
	.section	.data.firmware_rev,"aw"
	.align	2
	.set	.LANCHOR5,. + 0
	.type	firmware_rev, %object
	.size	firmware_rev, 4
firmware_rev:
	.word	.LC0
	.section	.data.mfgr_name,"aw"
	.align	2
	.set	.LANCHOR4,. + 0
	.type	mfgr_name, %object
	.size	mfgr_name, 4
mfgr_name:
	.word	.LC1
	.section	.rodata._ZL15devinfo_service,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL15devinfo_service, %object
	.size	_ZL15devinfo_service, 4
_ZL15devinfo_service:
	.short	6154
	.byte	1
	.space	1
	.section	.rodata._ZL17devinfo_mfgr_name,"a"
	.align	2
	.type	_ZL17devinfo_mfgr_name, %object
	.size	_ZL17devinfo_mfgr_name, 4
_ZL17devinfo_mfgr_name:
	.short	10793
	.byte	1
	.space	1
	.section	.rodata._ZL20devinfo_firmware_rev,"a"
	.align	2
	.type	_ZL20devinfo_firmware_rev, %object
	.size	_ZL20devinfo_firmware_rev, 4
_ZL20devinfo_firmware_rev:
	.short	10790
	.byte	1
	.space	1
	.section	.rodata._ZL23public_readonly_attr_md,"a"
	.align	2
	.type	_ZL23public_readonly_attr_md, %object
	.size	_ZL23public_readonly_attr_md, 3
_ZL23public_readonly_attr_md:
	.byte	17
	.space	1
	.byte	4
	.section	.rodata._ZL8readonly,"a"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL8readonly, %object
	.size	_ZL8readonly, 28
_ZL8readonly:
	.byte	2
	.space	27
	.ident	"GCC: (GNU) 9.3.1 20200408 (release)"
