	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0	sdk_version 11, 3
	.globl	__ZN5krang5Krang4seedEPhi       ; -- Begin function _ZN5krang5Krang4seedEPhi
	.p2align	2
__ZN5krang5Krang4seedEPhi:              ; @_ZN5krang5Krang4seedEPhi
	.cfi_startproc
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32                    ; =32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x20, x1
	mov	x19, x0
	cmp	w2, #8                          ; =8
	b.lt	LBB0_3
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	mov	x21, x2
	ldrb	w8, [x20]
	ldrb	w9, [x19]
	eor	w8, w9, w8
	strb	w8, [x19]
	mov	x0, x19
	bl	__ZN5krang6SpongeIhE8keccak_fEv
	ldrb	w8, [x20, #1]
	ldrb	w9, [x19, #1]
	eor	w8, w9, w8
	strb	w8, [x19, #1]
	mov	x0, x19
	bl	__ZN5krang6SpongeIhE8keccak_fEv
	ldrb	w8, [x20, #2]
	ldrb	w9, [x19, #2]
	eor	w8, w9, w8
	strb	w8, [x19, #2]
	mov	x0, x19
	bl	__ZN5krang6SpongeIhE8keccak_fEv
	ldrb	w8, [x20, #3]
	ldrb	w9, [x19, #3]
	eor	w8, w9, w8
	strb	w8, [x19, #3]
	mov	x0, x19
	bl	__ZN5krang6SpongeIhE8keccak_fEv
	ldrb	w8, [x20, #4]
	ldrb	w9, [x19, #4]
	eor	w8, w9, w8
	strb	w8, [x19, #4]
	mov	x0, x19
	bl	__ZN5krang6SpongeIhE8keccak_fEv
	ldrb	w8, [x20, #5]
	ldrb	w9, [x19, #5]
	eor	w8, w9, w8
	strb	w8, [x19, #5]
	mov	x0, x19
	bl	__ZN5krang6SpongeIhE8keccak_fEv
	ldrb	w8, [x20, #6]
	ldrb	w9, [x19, #6]
	eor	w8, w9, w8
	strb	w8, [x19, #6]
	mov	x0, x19
	bl	__ZN5krang6SpongeIhE8keccak_fEv
	add	x22, x20, #8                    ; =8
	ldrb	w8, [x20, #7]
	ldrb	w9, [x19, #7]
	eor	w8, w9, w8
	strb	w8, [x19, #7]
	mov	x0, x19
	bl	__ZN5krang6SpongeIhE8keccak_fEv
	sub	w2, w21, #8                     ; =8
	mov	x20, x22
	cmp	w21, #15                        ; =15
	b.gt	LBB0_1
; %bb.2:
	mov	x20, x22
LBB0_3:
	cmp	w2, #1                          ; =1
	b.lt	LBB0_6
; %bb.4:
	mov	w21, w2
	mov	x22, x19
LBB0_5:                                 ; =>This Inner Loop Header: Depth=1
	ldrb	w8, [x20], #1
	ldrb	w9, [x22]
	eor	w8, w9, w8
	strb	w8, [x22], #1
	mov	x0, x19
	bl	__ZN5krang6SpongeIhE8keccak_fEv
	subs	x21, x21, #1                    ; =1
	b.ne	LBB0_5
LBB0_6:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN5krang6SpongeIhE8keccak_fEv ; -- Begin function _ZN5krang6SpongeIhE8keccak_fEv
	.weak_def_can_be_hidden	__ZN5krang6SpongeIhE8keccak_fEv
	.p2align	2
__ZN5krang6SpongeIhE8keccak_fEv:        ; @_ZN5krang6SpongeIhE8keccak_fEv
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16                    ; =16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	w1, #1
	bl	__ZN5krang6SpongeIhE8keccak_pEh
	mov	x0, x19
	mov	w1, #130
	bl	__ZN5krang6SpongeIhE8keccak_pEh
	mov	x0, x19
	mov	w1, #138
	bl	__ZN5krang6SpongeIhE8keccak_pEh
	mov	x0, x19
	mov	w1, #0
	bl	__ZN5krang6SpongeIhE8keccak_pEh
	mov	x0, x19
	mov	w1, #139
	bl	__ZN5krang6SpongeIhE8keccak_pEh
	mov	x0, x19
	mov	w1, #1
	bl	__ZN5krang6SpongeIhE8keccak_pEh
	mov	x0, x19
	mov	w1, #129
	bl	__ZN5krang6SpongeIhE8keccak_pEh
	mov	x0, x19
	mov	w1, #9
	bl	__ZN5krang6SpongeIhE8keccak_pEh
	mov	x0, x19
	mov	w1, #138
	bl	__ZN5krang6SpongeIhE8keccak_pEh
	mov	x0, x19
	mov	w1, #136
	bl	__ZN5krang6SpongeIhE8keccak_pEh
	mov	x0, x19
	mov	w1, #9
	bl	__ZN5krang6SpongeIhE8keccak_pEh
	mov	x0, x19
	mov	w1, #10
	bl	__ZN5krang6SpongeIhE8keccak_pEh
	mov	x0, x19
	mov	w1, #139
	bl	__ZN5krang6SpongeIhE8keccak_pEh
	mov	x0, x19
	mov	w1, #139
	bl	__ZN5krang6SpongeIhE8keccak_pEh
	mov	x0, x19
	mov	w1, #137
	bl	__ZN5krang6SpongeIhE8keccak_pEh
	mov	x0, x19
	mov	w1, #3
	bl	__ZN5krang6SpongeIhE8keccak_pEh
	mov	x0, x19
	mov	w1, #2
	bl	__ZN5krang6SpongeIhE8keccak_pEh
	mov	x0, x19
	mov	w1, #128
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	b	__ZN5krang6SpongeIhE8keccak_pEh
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN5krang5Krang5fetchEPhi      ; -- Begin function _ZN5krang5Krang5fetchEPhi
	.p2align	2
__ZN5krang5Krang5fetchEPhi:             ; @_ZN5krang5Krang5fetchEPhi
	.cfi_startproc
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32                    ; =32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x20, x1
	mov	x19, x0
	cmp	w2, #8                          ; =8
	b.lt	LBB2_3
LBB2_1:                                 ; =>This Inner Loop Header: Depth=1
	mov	x22, x2
	ldrb	w8, [x19]
	strb	w8, [x20]
	mov	x0, x19
	bl	__ZN5krang6SpongeIhE8keccak_fEv
	ldrb	w8, [x19, #1]
	strb	w8, [x20, #1]
	mov	x0, x19
	bl	__ZN5krang6SpongeIhE8keccak_fEv
	ldrb	w8, [x19, #2]
	strb	w8, [x20, #2]
	mov	x0, x19
	bl	__ZN5krang6SpongeIhE8keccak_fEv
	ldrb	w8, [x19, #3]
	strb	w8, [x20, #3]
	mov	x0, x19
	bl	__ZN5krang6SpongeIhE8keccak_fEv
	ldrb	w8, [x19, #4]
	strb	w8, [x20, #4]
	mov	x0, x19
	bl	__ZN5krang6SpongeIhE8keccak_fEv
	ldrb	w8, [x19, #5]
	strb	w8, [x20, #5]
	mov	x0, x19
	bl	__ZN5krang6SpongeIhE8keccak_fEv
	ldrb	w8, [x19, #6]
	strb	w8, [x20, #6]
	mov	x0, x19
	bl	__ZN5krang6SpongeIhE8keccak_fEv
	ldrb	w8, [x19, #7]
	add	x21, x20, #8                    ; =8
	strb	w8, [x20, #7]
	mov	x0, x19
	bl	__ZN5krang6SpongeIhE8keccak_fEv
	sub	w2, w22, #8                     ; =8
	mov	x20, x21
	cmp	w22, #15                        ; =15
	b.gt	LBB2_1
; %bb.2:
	mov	x20, x21
LBB2_3:
	cmp	w2, #1                          ; =1
	b.lt	LBB2_6
; %bb.4:
	mov	w21, w2
	mov	x22, x19
LBB2_5:                                 ; =>This Inner Loop Header: Depth=1
	ldrb	w8, [x22], #1
	strb	w8, [x20], #1
	mov	x0, x19
	bl	__ZN5krang6SpongeIhE8keccak_fEv
	subs	x21, x21, #1                    ; =1
	b.ne	LBB2_5
LBB2_6:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN5krang6SpongeIhE8keccak_pEh ; -- Begin function _ZN5krang6SpongeIhE8keccak_pEh
	.weak_def_can_be_hidden	__ZN5krang6SpongeIhE8keccak_pEh
	.p2align	2
__ZN5krang6SpongeIhE8keccak_pEh:        ; @_ZN5krang6SpongeIhE8keccak_pEh
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #160                    ; =160
	stp	x28, x27, [sp, #64]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #80]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #96]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #112]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #128]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #144]            ; 16-byte Folded Spill
	add	x29, sp, #144                   ; =144
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
	str	w1, [sp, #24]                   ; 4-byte Folded Spill
	mov	x19, x0
Lloh0:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh1:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh2:
	ldr	x8, [x8]
	str	x8, [sp, #56]
	ldrb	w8, [x0, #4]
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	ldrb	w20, [x0, #9]
	eor	w9, w20, w8
	ldrb	w4, [x0, #14]
	eor	w9, w9, w4
	ldrb	w16, [x0, #19]
	eor	w9, w9, w16
	ldrb	w22, [x0, #24]
	eor	w23, w9, w22
	ldrb	w8, [x0, #3]
	ldrb	w9, [x0, #8]
	stp	w9, w8, [sp, #12]               ; 8-byte Folded Spill
	eor	w13, w9, w8
	ldrb	w8, [x0, #13]
	str	w8, [sp, #8]                    ; 4-byte Folded Spill
	eor	w13, w13, w8
	ldrb	w14, [x0, #18]
	eor	w13, w13, w14
	ldrb	w17, [x0, #23]
	eor	w24, w13, w17
	ldrb	w8, [x0, #2]
	str	w8, [sp, #4]                    ; 4-byte Folded Spill
	ldrb	w15, [x0, #7]
	eor	w1, w15, w8
	ldrb	w0, [x0, #12]
	eor	w2, w1, w0
	ldrb	w1, [x19, #17]
	eor	w2, w2, w1
	ldrb	w3, [x19, #22]
	eor	w25, w2, w3
	ldrb	w2, [x19]
	ldrb	w5, [x19, #5]
	eor	w7, w5, w2
	ldrb	w6, [x19, #10]
	eor	w21, w7, w6
	ldrb	w7, [x19, #15]
	eor	w26, w21, w7
	ldrb	w21, [x19, #20]
	eor	w26, w26, w21
	ubfx	w27, w26, #7, #1
	bfi	w27, w26, #1, #31
	eor	w27, w27, w24
	ubfx	w28, w23, #7, #1
	bfi	w28, w23, #1, #31
	eor	w28, w25, w28
	ubfx	w30, w24, #7, #1
	bfi	w30, w24, #1, #31
	ubfx	w24, w25, #7, #1
	bfi	w24, w25, #1, #31
	ldrb	w25, [x19, #1]
	eor	w24, w26, w24
	ldrb	w26, [x19, #6]
	eor	w8, w26, w25
	ldrb	w11, [x19, #11]
	eor	w8, w8, w11
	ldrb	w10, [x19, #16]
	eor	w8, w8, w10
	ldrb	w9, [x19, #21]
	eor	w8, w8, w9
	eor	w30, w8, w30
	ubfx	w12, w8, #7, #1
	bfi	w12, w8, #1, #31
	eor	w12, w12, w23
	eor	w8, w27, w22
	eor	w16, w27, w16
	eor	w22, w27, w4
	eor	w4, w27, w20
	ldr	w20, [sp, #20]                  ; 4-byte Folded Reload
	eor	w23, w27, w20
	eor	w27, w28, w17
	eor	w20, w28, w14
	ldr	w13, [sp, #8]                   ; 4-byte Folded Reload
	eor	w14, w28, w13
	ldr	w13, [sp, #12]                  ; 4-byte Folded Reload
	eor	w17, w28, w13
	ldr	w13, [sp, #16]                  ; 4-byte Folded Reload
	eor	w28, w28, w13
	eor	w3, w30, w3
	eor	w1, w30, w1
	eor	w0, w30, w0
	eor	w15, w30, w15
	ldr	w13, [sp, #4]                   ; 4-byte Folded Reload
	eor	w30, w30, w13
	eor	w9, w24, w9
	eor	w10, w24, w10
	eor	w11, w24, w11
	eor	w26, w24, w26
	eor	w24, w24, w25
	strb	w8, [x19, #24]
	strb	w3, [x19, #22]
	strb	w9, [x19, #21]
	eor	w21, w21, w12
	strb	w21, [x19, #20]
	strb	w20, [x19, #18]
	strb	w1, [x19, #17]
	strb	w10, [x19, #16]
	eor	w7, w7, w12
	eor	w6, w6, w12
	eor	w5, w12, w5
	eor	w12, w12, w2
	ubfx	w2, w8, #2, #6
	strb	w7, [x19, #15]
	strb	w22, [x19, #14]
	bfi	w2, w8, #6, #26
	ubfx	w8, w3, #3, #5
	bfi	w8, w3, #5, #27
	ubfx	w13, w9, #6, #2
	bfi	w13, w9, #2, #30
	ubfx	w9, w21, #6, #2
	bfi	w9, w21, #2, #30
	ubfx	w3, w20, #3, #5
	bfi	w3, w20, #5, #27
	ubfx	w20, w1, #1, #7
	bfi	w20, w1, #7, #25
	ubfx	w1, w10, #3, #5
	bfi	w1, w10, #5, #27
	ubfx	w10, w7, #7, #1
	bfi	w10, w7, #1, #31
	ubfx	w7, w22, #1, #7
	bfi	w7, w22, #7, #25
	strb	w27, [x19, #23]
	strb	w16, [x19, #19]
	strb	w14, [x19, #13]
	strb	w0, [x19, #12]
	strb	w11, [x19, #11]
	strb	w6, [x19, #10]
	strb	w4, [x19, #9]
	strb	w17, [x19, #8]
	strb	w15, [x19, #7]
	strb	w26, [x19, #6]
	strb	w5, [x19, #5]
	strb	w23, [x19, #4]
	strb	w28, [x19, #3]
	strb	w30, [x19, #2]
	strb	w24, [x19, #1]
	strb	w12, [x19]
	strb	w2, [sp, #51]
	ubfx	w2, w14, #7, #1
	bfi	w2, w14, #1, #31
	strb	w27, [sp, #54]
	strb	w8, [sp, #52]
	ubfx	w8, w0, #5, #3
	bfi	w8, w0, #3, #29
	strb	w9, [sp, #53]
	strb	w16, [sp, #48]
	ubfx	w9, w11, #6, #2
	bfi	w9, w11, #2, #30
	strb	w3, [sp, #46]
	strb	w20, [sp, #49]
	ubfx	w11, w6, #5, #3
	bfi	w11, w6, #3, #29
	strb	w1, [sp, #47]
	strb	w10, [sp, #50]
	ubfx	w10, w4, #4, #4
	bfi	w10, w4, #4, #28
	strb	w7, [sp, #45]
	strb	w2, [sp, #43]
	ubfx	w14, w17, #1, #7
	bfi	w14, w17, #7, #25
	strb	w8, [sp, #41]
	strb	w9, [sp, #44]
	ubfx	w8, w15, #2, #6
	bfi	w8, w15, #6, #26
	strb	w11, [sp, #42]
	strb	w10, [sp, #37]
	ubfx	w9, w26, #4, #4
	bfi	w9, w26, #4, #28
	strb	w8, [sp, #38]
	strb	w9, [sp, #36]
	ubfx	w8, w5, #4, #4
	bfi	w8, w5, #4, #28
	strb	w8, [sp, #39]
	ubfx	w8, w23, #5, #3
	bfi	w8, w23, #3, #29
	strb	w8, [sp, #34]
	ubfx	w8, w28, #4, #4
	bfi	w8, w28, #4, #28
	strb	w8, [sp, #32]
	ubfx	w8, w30, #2, #6
	bfi	w8, w30, #6, #26
	ubfx	w9, w24, #7, #1
	bfi	w9, w24, #1, #31
	strb	w9, [sp, #33]
	strb	w12, [sp, #31]
	strb	w14, [sp, #40]
	strb	w8, [sp, #35]
	bic	w8, w14, w8
	strb	w13, [sp, #55]
	eor	w8, w13, w8
	strb	w8, [x19, #24]
	add	x1, sp, #31                     ; =31
	mov	x0, x19
	bl	__ZN7_Loop2DILi3ELi4ELi4EE3runIZN5krang6SpongeIhE8keccak_pEhEUljjE1_EEvT_
	ldrb	w8, [x19]
	ldr	w9, [sp, #24]                   ; 4-byte Folded Reload
	eor	w8, w8, w9
	strb	w8, [x19]
	ldr	x8, [sp, #56]
Lloh3:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh4:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh5:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB3_2
; %bb.1:
	ldp	x29, x30, [sp, #144]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #80]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #160                    ; =160
	ret
LBB3_2:
	bl	___stack_chk_fail
	.loh AdrpLdrGotLdr	Lloh3, Lloh4, Lloh5
	.loh AdrpLdrGotLdr	Lloh0, Lloh1, Lloh2
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7_Loop2DILi3ELi4ELi4EE3runIZN5krang6SpongeIhE8keccak_pEhEUljjE1_EEvT_ ; -- Begin function _ZN7_Loop2DILi3ELi4ELi4EE3runIZN5krang6SpongeIhE8keccak_pEhEUljjE1_EEvT_
	.weak_def_can_be_hidden	__ZN7_Loop2DILi3ELi4ELi4EE3runIZN5krang6SpongeIhE8keccak_pEhEUljjE1_EEvT_
	.p2align	2
__ZN7_Loop2DILi3ELi4ELi4EE3runIZN5krang6SpongeIhE8keccak_pEhEUljjE1_EEvT_: ; @_ZN7_Loop2DILi3ELi4ELi4EE3runIZN5krang6SpongeIhE8keccak_pEhEUljjE1_EEvT_
	.cfi_startproc
; %bb.0:
	ldrb	w8, [x1, #19]
	ldrb	w9, [x1, #24]
	ldrb	w10, [x1, #4]
	bic	w9, w10, w9
	eor	w8, w9, w8
	strb	w8, [x0, #23]
	ldrb	w8, [x1, #14]
	ldrb	w9, [x1, #19]
	ldrb	w10, [x1, #24]
	bic	w9, w10, w9
	eor	w8, w9, w8
	strb	w8, [x0, #22]
	ldrb	w8, [x1, #9]
	ldrb	w9, [x1, #14]
	ldrb	w10, [x1, #19]
	bic	w9, w10, w9
	eor	w8, w9, w8
	strb	w8, [x0, #21]
	ldrb	w8, [x1, #4]
	ldrb	w9, [x1, #9]
	ldrb	w10, [x1, #14]
	bic	w9, w10, w9
	eor	w8, w9, w8
	strb	w8, [x0, #20]
	ldrb	w8, [x1, #23]
	ldrb	w9, [x1, #3]
	ldrb	w10, [x1, #8]
	bic	w9, w10, w9
	eor	w8, w9, w8
	strb	w8, [x0, #19]
	ldrb	w8, [x1, #18]
	ldrb	w9, [x1, #23]
	ldrb	w10, [x1, #3]
	bic	w9, w10, w9
	eor	w8, w9, w8
	strb	w8, [x0, #18]
	ldrb	w8, [x1, #13]
	ldrb	w9, [x1, #18]
	ldrb	w10, [x1, #23]
	bic	w9, w10, w9
	eor	w8, w9, w8
	strb	w8, [x0, #17]
	ldrb	w8, [x1, #8]
	ldrb	w9, [x1, #13]
	ldrb	w10, [x1, #18]
	bic	w9, w10, w9
	eor	w8, w9, w8
	strb	w8, [x0, #16]
	ldrb	w8, [x1, #3]
	ldrb	w9, [x1, #8]
	ldrb	w10, [x1, #13]
	bic	w9, w10, w9
	eor	w8, w9, w8
	strb	w8, [x0, #15]
	ldrb	w8, [x1, #22]
	ldrb	w9, [x1, #2]
	ldrb	w10, [x1, #7]
	bic	w9, w10, w9
	eor	w8, w9, w8
	strb	w8, [x0, #14]
	ldrb	w8, [x1, #17]
	ldrb	w9, [x1, #22]
	ldrb	w10, [x1, #2]
	bic	w9, w10, w9
	eor	w8, w9, w8
	strb	w8, [x0, #13]
	ldrb	w8, [x1, #12]
	ldrb	w9, [x1, #17]
	ldrb	w10, [x1, #22]
	bic	w9, w10, w9
	eor	w8, w9, w8
	strb	w8, [x0, #12]
	ldrb	w8, [x1, #7]
	ldrb	w9, [x1, #12]
	ldrb	w10, [x1, #17]
	bic	w9, w10, w9
	eor	w8, w9, w8
	strb	w8, [x0, #11]
	ldrb	w8, [x1, #2]
	ldrb	w9, [x1, #7]
	ldrb	w10, [x1, #12]
	bic	w9, w10, w9
	eor	w8, w9, w8
	strb	w8, [x0, #10]
	ldrb	w8, [x1, #21]
	ldrb	w9, [x1, #1]
	ldrb	w10, [x1, #6]
	bic	w9, w10, w9
	eor	w8, w9, w8
	strb	w8, [x0, #9]
	ldrb	w8, [x1, #16]
	ldrb	w9, [x1, #21]
	ldrb	w10, [x1, #1]
	bic	w9, w10, w9
	eor	w8, w9, w8
	strb	w8, [x0, #8]
	ldrb	w8, [x1, #11]
	ldrb	w9, [x1, #16]
	ldrb	w10, [x1, #21]
	bic	w9, w10, w9
	eor	w8, w9, w8
	strb	w8, [x0, #7]
	ldrb	w8, [x1, #6]
	ldrb	w9, [x1, #11]
	ldrb	w10, [x1, #16]
	bic	w9, w10, w9
	eor	w8, w9, w8
	strb	w8, [x0, #6]
	ldrb	w8, [x1, #1]
	ldrb	w9, [x1, #6]
	ldrb	w10, [x1, #11]
	bic	w9, w10, w9
	eor	w8, w9, w8
	strb	w8, [x0, #5]
	ldrb	w8, [x1, #20]
	ldrb	w9, [x1]
	ldrb	w10, [x1, #5]
	bic	w9, w10, w9
	eor	w8, w9, w8
	strb	w8, [x0, #4]
	ldrb	w8, [x1, #15]
	ldrb	w9, [x1, #20]
	ldrb	w10, [x1]
	bic	w9, w10, w9
	eor	w8, w9, w8
	strb	w8, [x0, #3]
	ldrb	w8, [x1, #10]
	ldrb	w9, [x1, #15]
	ldrb	w10, [x1, #20]
	bic	w9, w10, w9
	eor	w8, w9, w8
	strb	w8, [x0, #2]
	ldrb	w8, [x1, #5]
	ldrb	w9, [x1, #10]
	ldrb	w10, [x1, #15]
	bic	w9, w10, w9
	eor	w8, w9, w8
	strb	w8, [x0, #1]
	ldrb	w8, [x1]
	ldrb	w9, [x1, #5]
	ldrb	w10, [x1, #10]
	bic	w9, w10, w9
	eor	w8, w9, w8
	strb	w8, [x0]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
