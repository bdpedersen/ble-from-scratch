	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0	sdk_version 11, 3
	.globl	__Z7keccakfPv                   ; -- Begin function _Z7keccakfPv
	.p2align	2
__Z7keccakfPv:                          ; @_Z7keccakfPv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #160                    ; =160
	stp	x28, x27, [sp, #64]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #80]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #96]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #112]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #128]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #144]            ; 16-byte Folded Spill
	.cfi_def_cfa_offset 160
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	ldp	x10, x11, [x0]
	ldp	x16, x5, [x0, #80]
	ldp	x22, x24, [x0, #160]
	ldp	x8, x7, [x0, #48]
	str	x8, [sp, #56]                   ; 8-byte Folded Spill
	ldp	x20, x26, [x0, #128]
	ldp	x17, x12, [x0, #16]
	ldp	x3, x8, [x0, #96]
	stp	xzr, x8, [sp, #40]              ; 16-byte Folded Spill
	ldp	x28, x21, [x0, #176]
	ldp	x13, x6, [x0, #32]
	ldp	x14, x1, [x0, #64]
	ldp	x15, x25, [x0, #112]
	ldp	x23, x19, [x0, #144]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x27, [x0, #192]
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	ldp	x2, x8, [sp, #48]               ; 16-byte Folded Reload
	eor	x30, x8, x11
	eor	x30, x30, x5
	eor	x30, x30, x20
	eor	x30, x30, x24
	mov	x4, x15
	eor	x15, x7, x17
	eor	x15, x15, x3
	eor	x15, x15, x26
	eor	x15, x15, x28
	eor	x9, x14, x12
	eor	x9, x9, x2
	eor	x9, x9, x23
	eor	x9, x9, x21
	eor	x0, x30, x9, ror #63
	eor	x8, x0, x17
	stp	x10, x8, [sp, #24]              ; 16-byte Folded Spill
	eor	x7, x0, x7
	eor	x8, x0, x3
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	eor	x26, x0, x26
	eor	x0, x0, x28
	eor	x28, x6, x10
	eor	x28, x28, x16
	eor	x28, x28, x25
	eor	x28, x28, x22
	mov	x8, x1
	eor	x10, x1, x13
	eor	x10, x10, x4
	eor	x10, x10, x19
	eor	x10, x10, x27
	eor	x30, x10, x30, ror #63
	eor	x10, x15, x10, ror #63
	eor	x15, x28, x15, ror #63
	eor	x9, x9, x28, ror #63
	eor	x6, x30, x6
	eor	x3, x30, x16
	eor	x25, x30, x25
	eor	x28, x15, x11
	eor	x5, x15, x5
	eor	x20, x15, x20
	eor	x24, x15, x24
	eor	x11, x10, x12
	eor	x1, x10, x14
	eor	x23, x10, x23
	eor	x16, x9, x13
	eor	x12, x27, x9
	ror	x28, x28, #63
	ror	x3, x3, #61
	ror	x13, x7, #58
	ror	x14, x5, #54
	ror	x26, x26, #49
	ror	x5, x23, #43
	ror	x23, x11, #36
	ror	x11, x6, #28
	ror	x6, x20, #19
	ror	x27, x1, #9
	ror	x17, x24, #62
	ror	x1, x12, #50
	ror	x24, x16, #37
	ror	x12, x25, #23
	eor	x16, x10, x21
	ror	x21, x16, #8
	eor	x16, x19, x9
	ror	x19, x16, #56
	eor	x10, x10, x2
	ror	x10, x10, #39
	ldr	x16, [sp, #16]                  ; 8-byte Folded Reload
	ror	x16, x16, #21
	eor	x7, x8, x9
	eor	x9, x4, x9
	ldr	x8, [sp, #32]                   ; 8-byte Folded Reload
	ror	x2, x8, #2
	eor	x4, x30, x22
	ror	x20, x4, #46
	ror	x9, x9, #25
	ror	x0, x0, #3
	ror	x22, x7, #44
	ldr	x8, [sp, #56]                   ; 8-byte Folded Reload
	eor	x15, x15, x8
	ror	x15, x15, #20
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	eor	x7, x30, x8
	bic	x25, x5, x16
	bic	x4, x7, x1
	eor	x30, x5, x4
	bic	x4, x1, x5
	eor	x8, x4, x16
	str	x8, [sp, #32]                   ; 8-byte Folded Spill
	bic	x16, x16, x15
	eor	x16, x7, x16
	eor	x8, x25, x15
	bic	x15, x15, x7
	eor	x4, x15, x1
	bic	x15, x6, x3
	bic	x1, x23, x0
	eor	x25, x1, x6
	bic	x5, x0, x6
	eor	x7, x3, x5
	bic	x3, x3, x22
	eor	x6, x23, x3
	eor	x15, x15, x22
	str	x15, [sp, #56]                  ; 8-byte Folded Spill
	bic	x15, x22, x23
	eor	x1, x15, x0
	bic	x15, x19, x10
	bic	x0, x28, x20
	eor	x0, x0, x19
	str	x0, [sp, #48]                   ; 8-byte Folded Spill
	bic	x0, x20, x19
	eor	x3, x10, x0
	bic	x10, x10, x13
	eor	x0, x10, x28
	eor	x5, x15, x13
	bic	x10, x13, x28
	eor	x15, x20, x10
	bic	x10, x26, x14
	bic	x13, x24, x21
	eor	x23, x13, x26
	bic	x13, x21, x26
	eor	x26, x13, x14
	bic	x13, x14, x11
	mov	x14, x25
	eor	x25, x13, x24
	mov	x13, x4
	eor	x20, x11, x10
	bic	x10, x11, x24
	eor	x19, x21, x10
	bic	x10, x12, x9
	bic	x11, x2, x17
	eor	x21, x12, x11
	bic	x11, x17, x12
	mov	x12, x30
	eor	x28, x11, x9
	mov	x11, x8
	bic	x9, x9, x27
	eor	x22, x9, x2
	eor	x24, x27, x10
	bic	x9, x27, x2
	eor	x27, x9, x17
	ldp	x17, x8, [sp, #32]              ; 16-byte Folded Reload
Lloh0:
	adrp	x9, __ZL2RC@PAGE
Lloh1:
	add	x9, x9, __ZL2RC@PAGEOFF
	ldr	x9, [x9, x8]
	eor	x10, x9, x16
	mov	x16, x0
	add	x8, x8, #8                      ; =8
	str	x8, [sp, #40]                   ; 8-byte Folded Spill
	cmp	x8, #192                        ; =192
	b.ne	LBB0_1
; %bb.2:
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	stp	x10, x11, [x8]
	stp	x16, x5, [x8, #80]
	stp	x22, x24, [x8, #160]
	ldr	x9, [sp, #56]                   ; 8-byte Folded Reload
	stp	x9, x7, [x8, #48]
	stp	x20, x26, [x8, #128]
	stp	x17, x12, [x8, #16]
	ldr	x9, [sp, #48]                   ; 8-byte Folded Reload
	stp	x3, x9, [x8, #96]
	stp	x28, x21, [x8, #176]
	stp	x13, x6, [x8, #32]
	stp	x14, x1, [x8, #64]
	stp	x15, x25, [x8, #112]
	stp	x23, x19, [x8, #144]
	str	x27, [x8, #192]
	ldp	x29, x30, [sp, #144]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #80]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #160                    ; =160
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.globl	__Z8shake128PhmPKhm             ; -- Begin function _Z8shake128PhmPKhm
	.p2align	2
__Z8shake128PhmPKhm:                    ; @_Z8shake128PhmPKhm
	.cfi_startproc
; %bb.0:
	mov	w4, #168
	mov	w5, #31
	b	__ZL4hashPhmPKhmmh
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZL4hashPhmPKhmmh
__ZL4hashPhmPKhmmh:                     ; @_ZL4hashPhmPKhmmh
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #336                    ; =336
	stp	x28, x27, [sp, #240]            ; 16-byte Folded Spill
	stp	x26, x25, [sp, #256]            ; 16-byte Folded Spill
	stp	x24, x23, [sp, #272]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #288]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #304]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #320]            ; 16-byte Folded Spill
	add	x29, sp, #320                   ; =320
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
Lloh2:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh3:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh4:
	ldr	x8, [x8]
	stur	x8, [x29, #-96]
	cbz	x0, LBB2_3
; %bb.1:
	mov	x21, x4
	mov	x22, x3
	mov	x24, x2
	mov	x20, x1
	mov	x19, x0
	cbnz	x2, LBB2_4
; %bb.2:
	cbz	x22, LBB2_4
LBB2_3:
	mov	w0, #-1
	b	LBB2_26
LBB2_4:
	str	w5, [sp, #12]                   ; 4-byte Folded Spill
	str	xzr, [sp, #208]
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [sp, #176]
	stp	q0, q0, [sp, #144]
	stp	q0, q0, [sp, #112]
	stp	q0, q0, [sp, #80]
	stp	q0, q0, [sp, #48]
	stp	q0, q0, [sp, #16]
	cmp	x22, x21
	b.hs	LBB2_28
; %bb.5:
	mov	x25, x24
LBB2_6:
	add	x8, sp, #16                     ; =16
	ldrb	w9, [x8, x22]
	ldr	w10, [sp, #12]                  ; 4-byte Folded Reload
	eor	w9, w9, w10
	strb	w9, [x8, x22]
	add	x8, x21, x8
	ldurb	w9, [x8, #-1]
	eor	w9, w9, #0x80
	sturb	w9, [x8, #-1]
	cbz	x22, LBB2_13
; %bb.7:
	cmp	x22, #32                        ; =32
	b.lo	LBB2_10
; %bb.8:
	add	x10, sp, #16                    ; =16
	add	x8, x25, x22
	cmp	x10, x8
	b.hs	LBB2_37
; %bb.9:
	add	x8, x10, x22
	cmp	x25, x8
	b.hs	LBB2_37
LBB2_10:
	mov	x8, #0
LBB2_11:
	add	x9, sp, #16                     ; =16
	add	x9, x9, x8
	sub	x10, x22, x8
	add	x8, x25, x8
LBB2_12:                                ; =>This Inner Loop Header: Depth=1
	ldrb	w11, [x8], #1
	ldrb	w12, [x9]
	eor	w11, w12, w11
	strb	w11, [x9], #1
	subs	x10, x10, #1                    ; =1
	b.ne	LBB2_12
LBB2_13:
	add	x0, sp, #16                     ; =16
	bl	__Z7keccakfPv
	b	LBB2_15
LBB2_14:                                ;   in Loop: Header=BB2_15 Depth=1
	add	x0, sp, #16                     ; =16
	bl	__Z7keccakfPv
	add	x19, x19, x21
	sub	x20, x20, x21
LBB2_15:                                ; =>This Inner Loop Header: Depth=1
	cmp	x20, x21
	b.lo	LBB2_18
; %bb.16:                               ;   in Loop: Header=BB2_15 Depth=1
	cbz	x21, LBB2_14
; %bb.17:                               ;   in Loop: Header=BB2_15 Depth=1
	add	x1, sp, #16                     ; =16
	mov	x0, x19
	mov	x2, x21
	bl	_memcpy
	b	LBB2_14
LBB2_18:
	cbz	x20, LBB2_25
; %bb.19:
	cmp	x20, #32                        ; =32
	b.lo	LBB2_22
; %bb.20:
	add	x9, sp, #16                     ; =16
	add	x8, x9, x20
	cmp	x19, x8
	b.hs	LBB2_40
; %bb.21:
	add	x8, x19, x20
	cmp	x9, x8
	b.hs	LBB2_40
LBB2_22:
	mov	x8, #0
LBB2_23:
	add	x9, sp, #16                     ; =16
	add	x9, x9, x8
	sub	x10, x20, x8
	add	x8, x19, x8
LBB2_24:                                ; =>This Inner Loop Header: Depth=1
	ldrb	w11, [x9], #1
	strb	w11, [x8], #1
	subs	x10, x10, #1                    ; =1
	b.ne	LBB2_24
LBB2_25:
	add	x0, sp, #16                     ; =16
	mov	w1, #200
	mov	w2, #0
	mov	w3, #200
	bl	_memset_s
	mov	w0, #0
LBB2_26:
	ldur	x8, [x29, #-96]
Lloh5:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh6:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh7:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB2_43
; %bb.27:
	ldp	x29, x30, [sp, #320]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #304]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #288]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #272]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #256]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #240]            ; 16-byte Folded Reload
	add	sp, sp, #336                    ; =336
	ret
LBB2_28:
	mov	x26, #0
	add	x27, sp, #16                    ; =16
	add	x28, x27, x21
	and	x23, x21, #0xffffffffffffffe0
	mov	x25, x24
	b	LBB2_30
LBB2_29:                                ;   in Loop: Header=BB2_30 Depth=1
	add	x0, sp, #16                     ; =16
	bl	__Z7keccakfPv
	add	x25, x25, x21
	sub	x22, x22, x21
	add	x26, x26, #1                    ; =1
	cmp	x22, x21
	b.lo	LBB2_6
LBB2_30:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_34 Depth 2
                                        ;     Child Loop BB2_36 Depth 2
	cbz	x21, LBB2_29
; %bb.31:                               ;   in Loop: Header=BB2_30 Depth=1
	cmp	x21, #32                        ; =32
	b.hs	LBB2_33
; %bb.32:                               ;   in Loop: Header=BB2_30 Depth=1
	mov	x8, #0
	b	LBB2_36
LBB2_33:                                ;   in Loop: Header=BB2_30 Depth=1
	mul	x8, x26, x21
	add	x9, x24, x8
	add	x8, x8, x21
	add	x8, x24, x8
	cmp	x27, x8
	mov	x8, #0
	ccmp	x9, x28, #2, lo
	b.lo	LBB2_36
LBB2_34:                                ;   Parent Loop BB2_30 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x9, x25, x8
	ldp	q0, q1, [x9]
	add	x9, x27, x8
	ldp	q2, q3, [x9]
	eor.16b	v0, v2, v0
	eor.16b	v1, v3, v1
	stp	q0, q1, [x9]
	add	x8, x8, #32                     ; =32
	cmp	x23, x8
	b.ne	LBB2_34
; %bb.35:                               ;   in Loop: Header=BB2_30 Depth=1
	mov	x8, x23
	cmp	x23, x21
	b.eq	LBB2_29
LBB2_36:                                ;   Parent Loop BB2_30 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldrb	w9, [x25, x8]
	ldrb	w10, [x27, x8]
	eor	w9, w10, w9
	strb	w9, [x27, x8]
	add	x8, x8, #1                      ; =1
	cmp	x21, x8
	b.ne	LBB2_36
	b	LBB2_29
LBB2_37:
	and	x8, x22, #0xffffffffffffffe0
	add	x9, x25, #16                    ; =16
	add	x10, x10, #16                   ; =16
	mov	x11, x8
LBB2_38:                                ; =>This Inner Loop Header: Depth=1
	ldp	q0, q1, [x9, #-16]
	ldp	q2, q3, [x10, #-16]
	eor.16b	v0, v2, v0
	eor.16b	v1, v3, v1
	stp	q0, q1, [x10, #-16]
	add	x9, x9, #32                     ; =32
	add	x10, x10, #32                   ; =32
	subs	x11, x11, #32                   ; =32
	b.ne	LBB2_38
; %bb.39:
	cmp	x22, x8
	b.eq	LBB2_13
	b	LBB2_11
LBB2_40:
	and	x8, x20, #0xffffffffffffffe0
	add	x9, x9, #16                     ; =16
	add	x10, x19, #16                   ; =16
	mov	x11, x8
LBB2_41:                                ; =>This Inner Loop Header: Depth=1
	ldp	q0, q1, [x9, #-16]
	stp	q0, q1, [x10, #-16]
	add	x9, x9, #32                     ; =32
	add	x10, x10, #32                   ; =32
	subs	x11, x11, #32                   ; =32
	b.ne	LBB2_41
; %bb.42:
	cmp	x20, x8
	b.eq	LBB2_25
	b	LBB2_23
LBB2_43:
	bl	___stack_chk_fail
	.loh AdrpLdrGotLdr	Lloh2, Lloh3, Lloh4
	.loh AdrpLdrGotLdr	Lloh5, Lloh6, Lloh7
	.cfi_endproc
                                        ; -- End function
	.globl	__Z8shake256PhmPKhm             ; -- Begin function _Z8shake256PhmPKhm
	.p2align	2
__Z8shake256PhmPKhm:                    ; @_Z8shake256PhmPKhm
	.cfi_startproc
; %bb.0:
	mov	w4, #136
	mov	w5, #31
	b	__ZL4hashPhmPKhmmh
	.cfi_endproc
                                        ; -- End function
	.globl	__Z8sha3_224PhmPKhm             ; -- Begin function _Z8sha3_224PhmPKhm
	.p2align	2
__Z8sha3_224PhmPKhm:                    ; @_Z8sha3_224PhmPKhm
	.cfi_startproc
; %bb.0:
	cmp	x1, #28                         ; =28
	b.ls	LBB4_2
; %bb.1:
	mov	w0, #-1
	ret
LBB4_2:
	mov	w4, #144
	mov	w5, #6
	b	__ZL4hashPhmPKhmmh
	.cfi_endproc
                                        ; -- End function
	.globl	__Z8sha3_256PhmPKhm             ; -- Begin function _Z8sha3_256PhmPKhm
	.p2align	2
__Z8sha3_256PhmPKhm:                    ; @_Z8sha3_256PhmPKhm
	.cfi_startproc
; %bb.0:
	cmp	x1, #32                         ; =32
	b.ls	LBB5_2
; %bb.1:
	mov	w0, #-1
	ret
LBB5_2:
	mov	w4, #136
	mov	w5, #6
	b	__ZL4hashPhmPKhmmh
	.cfi_endproc
                                        ; -- End function
	.globl	__Z8sha3_384PhmPKhm             ; -- Begin function _Z8sha3_384PhmPKhm
	.p2align	2
__Z8sha3_384PhmPKhm:                    ; @_Z8sha3_384PhmPKhm
	.cfi_startproc
; %bb.0:
	cmp	x1, #48                         ; =48
	b.ls	LBB6_2
; %bb.1:
	mov	w0, #-1
	ret
LBB6_2:
	mov	w4, #104
	mov	w5, #6
	b	__ZL4hashPhmPKhmmh
	.cfi_endproc
                                        ; -- End function
	.globl	__Z8sha3_512PhmPKhm             ; -- Begin function _Z8sha3_512PhmPKhm
	.p2align	2
__Z8sha3_512PhmPKhm:                    ; @_Z8sha3_512PhmPKhm
	.cfi_startproc
; %bb.0:
	cmp	x1, #64                         ; =64
	b.ls	LBB7_2
; %bb.1:
	mov	w0, #-1
	ret
LBB7_2:
	mov	w4, #72
	mov	w5, #6
	b	__ZL4hashPhmPKhmmh
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__const
	.p2align	3                               ; @_ZL2RC
__ZL2RC:
	.quad	1                               ; 0x1
	.quad	32898                           ; 0x8082
	.quad	-9223372036854742902            ; 0x800000000000808a
	.quad	-9223372034707259392            ; 0x8000000080008000
	.quad	32907                           ; 0x808b
	.quad	2147483649                      ; 0x80000001
	.quad	-9223372034707259263            ; 0x8000000080008081
	.quad	-9223372036854743031            ; 0x8000000000008009
	.quad	138                             ; 0x8a
	.quad	136                             ; 0x88
	.quad	2147516425                      ; 0x80008009
	.quad	2147483658                      ; 0x8000000a
	.quad	2147516555                      ; 0x8000808b
	.quad	-9223372036854775669            ; 0x800000000000008b
	.quad	-9223372036854742903            ; 0x8000000000008089
	.quad	-9223372036854743037            ; 0x8000000000008003
	.quad	-9223372036854743038            ; 0x8000000000008002
	.quad	-9223372036854775680            ; 0x8000000000000080
	.quad	32778                           ; 0x800a
	.quad	-9223372034707292150            ; 0x800000008000000a
	.quad	-9223372034707259263            ; 0x8000000080008081
	.quad	-9223372036854742912            ; 0x8000000000008080
	.quad	2147483649                      ; 0x80000001
	.quad	-9223372034707259384            ; 0x8000000080008008

.subsections_via_symbols
