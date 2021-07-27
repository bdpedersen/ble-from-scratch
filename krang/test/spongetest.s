	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0	sdk_version 11, 3
	.globl	__Z3fmty                        ; -- Begin function _Z3fmty
	.p2align	2
__Z3fmty:                               ; @_Z3fmty
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #144                    ; =144
	stp	x22, x21, [sp, #96]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #112]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #128]            ; 16-byte Folded Spill
	add	x29, sp, #128                   ; =128
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x19, x8
Lloh0:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh1:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh2:
	ldr	x8, [x8]
	stur	x8, [x29, #-40]
	str	x0, [sp]
Lloh3:
	adrp	x1, l_.str@PAGE
Lloh4:
	add	x1, x1, l_.str@PAGEOFF
	add	x0, sp, #8                      ; =8
	bl	_sprintf
	add	x0, sp, #8                      ; =8
	bl	_strlen
	cmn	x0, #16                         ; =16
	b.hs	LBB0_8
; %bb.1:
	mov	x20, x0
	cmp	x0, #23                         ; =23
	b.hs	LBB0_3
; %bb.2:
	strb	w20, [x19, #23]
	cbnz	x20, LBB0_4
	b	LBB0_5
LBB0_3:
	add	x8, x20, #16                    ; =16
	and	x21, x8, #0xfffffffffffffff0
	mov	x0, x21
	bl	__Znwm
	orr	x8, x21, #0x8000000000000000
	stp	x20, x8, [x19, #8]
	str	x0, [x19]
	mov	x19, x0
LBB0_4:
	add	x1, sp, #8                      ; =8
	mov	x0, x19
	mov	x2, x20
	bl	_memcpy
LBB0_5:
	strb	wzr, [x19, x20]
	ldur	x8, [x29, #-40]
Lloh5:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh6:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh7:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB0_7
; %bb.6:
	ldp	x29, x30, [sp, #128]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #112]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #96]             ; 16-byte Folded Reload
	add	sp, sp, #144                    ; =144
	ret
LBB0_7:
	bl	___stack_chk_fail
LBB0_8:
	mov	x0, x19
	bl	__ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv
	.loh AdrpAdd	Lloh3, Lloh4
	.loh AdrpLdrGotLdr	Lloh0, Lloh1, Lloh2
	.loh AdrpLdrGotLdr	Lloh5, Lloh6, Lloh7
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception0
; %bb.0:
	sub	sp, sp, #464                    ; =464
	stp	x28, x27, [sp, #368]            ; 16-byte Folded Spill
	stp	x26, x25, [sp, #384]            ; 16-byte Folded Spill
	stp	x24, x23, [sp, #400]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #416]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #432]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #448]            ; 16-byte Folded Spill
	add	x29, sp, #448                   ; =448
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
Lloh8:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh9:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh10:
	ldr	x8, [x8]
	stur	x8, [x29, #-96]
Lloh11:
	adrp	x19, _refstate@PAGE
Lloh12:
	add	x19, x19, _refstate@PAGEOFF
	ldp	q0, q1, [x19, #160]
	stp	q0, q1, [sp, #224]
	ldr	x8, [x19, #192]
	str	x8, [sp, #256]
	ldp	q0, q1, [x19, #96]
	stp	q0, q1, [sp, #160]
	ldp	q1, q0, [x19, #128]
	stp	q1, q0, [sp, #192]
	ldp	q0, q1, [x19, #32]
	stp	q0, q1, [sp, #96]
	ldp	q1, q0, [x19, #64]
	stp	q1, q0, [sp, #128]
	ldp	q1, q0, [x19]
	stp	q1, q0, [sp, #64]
	mov	x0, x19
	bl	__Z7keccakfPv
	add	x27, sp, #64                    ; =64
	add	x0, sp, #64                     ; =64
	bl	__ZN5krang6SpongeIyE8keccak_fEv
	mov	x28, #0
Lloh13:
	adrp	x20, l_.str@PAGE
Lloh14:
	add	x20, x20, l_.str@PAGEOFF
	add	x21, sp, #16                    ; =16
Lloh15:
	adrp	x22, __ZNSt3__15ctypeIcE2idE@GOTPAGE
Lloh16:
	ldr	x22, [x22, __ZNSt3__15ctypeIcE2idE@GOTPAGEOFF]
Lloh17:
	adrp	x23, l_.str.1@PAGE
Lloh18:
	add	x23, x23, l_.str.1@PAGEOFF
	b	LBB1_2
LBB1_1:                                 ;   in Loop: Header=BB1_2 Depth=1
	add	x28, x28, #8                    ; =8
	cmp	x28, #200                       ; =200
	b.eq	LBB1_25
LBB1_2:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [x19, x28]
	str	x8, [sp]
	sub	x0, x29, #176                   ; =176
	mov	x1, x20
	bl	_sprintf
	sub	x0, x29, #176                   ; =176
	bl	_strlen
	cmn	x0, #16                         ; =16
	b.hs	LBB1_28
; %bb.3:                                ;   in Loop: Header=BB1_2 Depth=1
	mov	x24, x0
	cmp	x0, #23                         ; =23
	b.hs	LBB1_5
; %bb.4:                                ;   in Loop: Header=BB1_2 Depth=1
	add	x25, sp, #40                    ; =40
	strb	w24, [sp, #63]
	cbnz	x24, LBB1_6
	b	LBB1_7
LBB1_5:                                 ;   in Loop: Header=BB1_2 Depth=1
	add	x8, x24, #16                    ; =16
	and	x26, x8, #0xfffffffffffffff0
	mov	x0, x26
	bl	__Znwm
	mov	x25, x0
	orr	x8, x26, #0x8000000000000000
	stp	x24, x8, [sp, #48]
	str	x0, [sp, #40]
LBB1_6:                                 ;   in Loop: Header=BB1_2 Depth=1
	sub	x1, x29, #176                   ; =176
	mov	x0, x25
	mov	x2, x24
	bl	_memcpy
LBB1_7:                                 ;   in Loop: Header=BB1_2 Depth=1
	strb	wzr, [x25, x24]
	ldrb	w8, [sp, #63]
	sxtb	w9, w8
	ldp	x10, x11, [sp, #40]
	cmp	w9, #0                          ; =0
	add	x9, sp, #40                     ; =40
	csel	x1, x10, x9, lt
	csel	x2, x11, x8, lt
Ltmp0:
Lloh19:
	adrp	x0, __ZNSt3__14coutE@GOTPAGE
Lloh20:
	ldr	x0, [x0, __ZNSt3__14coutE@GOTPAGEOFF]
	bl	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp1:
; %bb.8:                                ;   in Loop: Header=BB1_2 Depth=1
Ltmp2:
	mov	x1, x23
	mov	w2, #3
	bl	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp3:
; %bb.9:                                ;   in Loop: Header=BB1_2 Depth=1
	mov	x24, x0
	ldr	x8, [x27, x28]
	str	x8, [sp]
	sub	x0, x29, #176                   ; =176
	mov	x1, x20
	bl	_sprintf
	sub	x0, x29, #176                   ; =176
	bl	_strlen
	cmn	x0, #16                         ; =16
	b.hs	LBB1_29
; %bb.10:                               ;   in Loop: Header=BB1_2 Depth=1
	mov	x25, x0
	cmp	x0, #23                         ; =23
	b.hs	LBB1_12
; %bb.11:                               ;   in Loop: Header=BB1_2 Depth=1
	add	x26, sp, #16                    ; =16
	strb	w25, [sp, #39]
	cbnz	x25, LBB1_14
	b	LBB1_15
LBB1_12:                                ;   in Loop: Header=BB1_2 Depth=1
	add	x8, x25, #16                    ; =16
	and	x27, x8, #0xfffffffffffffff0
Ltmp5:
	mov	x0, x27
	bl	__Znwm
Ltmp6:
; %bb.13:                               ;   in Loop: Header=BB1_2 Depth=1
	mov	x26, x0
	orr	x8, x27, #0x8000000000000000
	stp	x25, x8, [sp, #24]
	str	x0, [sp, #16]
	add	x27, sp, #64                    ; =64
LBB1_14:                                ;   in Loop: Header=BB1_2 Depth=1
	sub	x1, x29, #176                   ; =176
	mov	x0, x26
	mov	x2, x25
	bl	_memcpy
LBB1_15:                                ;   in Loop: Header=BB1_2 Depth=1
	strb	wzr, [x26, x25]
	ldrb	w8, [sp, #39]
	sxtb	w9, w8
	ldp	x10, x11, [sp, #16]
	cmp	w9, #0                          ; =0
	csel	x1, x10, x21, lt
	csel	x2, x11, x8, lt
Ltmp8:
	mov	x0, x24
	bl	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp9:
; %bb.16:                               ;   in Loop: Header=BB1_2 Depth=1
	mov	x24, x0
	ldr	x8, [x0]
	ldur	x8, [x8, #-24]
	add	x0, x0, x8
Ltmp10:
	sub	x8, x29, #176                   ; =176
	bl	__ZNKSt3__18ios_base6getlocEv
Ltmp11:
; %bb.17:                               ;   in Loop: Header=BB1_2 Depth=1
Ltmp12:
	sub	x0, x29, #176                   ; =176
	mov	x1, x22
	bl	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp13:
; %bb.18:                               ;   in Loop: Header=BB1_2 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #56]
Ltmp14:
	mov	w1, #10
	blr	x8
Ltmp15:
; %bb.19:                               ;   in Loop: Header=BB1_2 Depth=1
	mov	x25, x0
	sub	x0, x29, #176                   ; =176
	bl	__ZNSt3__16localeD1Ev
Ltmp17:
	mov	x0, x24
	mov	x1, x25
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
Ltmp18:
; %bb.20:                               ;   in Loop: Header=BB1_2 Depth=1
Ltmp19:
	mov	x0, x24
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
Ltmp20:
; %bb.21:                               ;   in Loop: Header=BB1_2 Depth=1
	ldrsb	w8, [sp, #39]
	tbnz	w8, #31, LBB1_23
; %bb.22:                               ;   in Loop: Header=BB1_2 Depth=1
	ldrsb	w8, [sp, #63]
	tbz	w8, #31, LBB1_1
	b	LBB1_24
LBB1_23:                                ;   in Loop: Header=BB1_2 Depth=1
	ldr	x0, [sp, #16]
	bl	__ZdlPv
	ldrsb	w8, [sp, #63]
	tbz	w8, #31, LBB1_1
LBB1_24:                                ;   in Loop: Header=BB1_2 Depth=1
	ldr	x0, [sp, #40]
	bl	__ZdlPv
	b	LBB1_1
LBB1_25:
	ldur	x8, [x29, #-96]
Lloh21:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh22:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh23:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB1_27
; %bb.26:
	mov	w0, #0
	ldp	x29, x30, [sp, #448]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #432]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #416]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #400]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #384]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #368]            ; 16-byte Folded Reload
	add	sp, sp, #464                    ; =464
	ret
LBB1_27:
	bl	___stack_chk_fail
LBB1_28:
	add	x0, sp, #40                     ; =40
	bl	__ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv
LBB1_29:
Ltmp22:
	add	x0, sp, #16                     ; =16
	bl	__ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv
Ltmp23:
; %bb.30:
	brk	#0x1
LBB1_31:
Ltmp24:
	mov	x19, x0
	b	LBB1_38
LBB1_32:
Ltmp7:
	mov	x19, x0
	b	LBB1_38
LBB1_33:
Ltmp4:
	mov	x19, x0
	b	LBB1_38
LBB1_34:
Ltmp16:
	mov	x19, x0
	sub	x0, x29, #176                   ; =176
	bl	__ZNSt3__16localeD1Ev
	b	LBB1_36
LBB1_35:
Ltmp21:
	mov	x19, x0
LBB1_36:
	ldrsb	w8, [sp, #39]
	tbz	w8, #31, LBB1_38
; %bb.37:
	ldr	x0, [sp, #16]
	bl	__ZdlPv
LBB1_38:
	ldrsb	w8, [sp, #63]
	tbz	w8, #31, LBB1_40
; %bb.39:
	ldr	x0, [sp, #40]
	bl	__ZdlPv
LBB1_40:
	mov	x0, x19
	bl	__Unwind_Resume
	brk	#0x1
	.loh AdrpAdd	Lloh17, Lloh18
	.loh AdrpLdrGot	Lloh15, Lloh16
	.loh AdrpAdd	Lloh13, Lloh14
	.loh AdrpAdd	Lloh11, Lloh12
	.loh AdrpLdrGotLdr	Lloh8, Lloh9, Lloh10
	.loh AdrpLdrGot	Lloh19, Lloh20
	.loh AdrpLdrGotLdr	Lloh21, Lloh22, Lloh23
Lfunc_end0:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table1:
Lexception0:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end0-Lcst_begin0
Lcst_begin0:
	.uleb128 Lfunc_begin0-Lfunc_begin0      ; >> Call Site 1 <<
	.uleb128 Ltmp0-Lfunc_begin0             ;   Call between Lfunc_begin0 and Ltmp0
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp0-Lfunc_begin0             ; >> Call Site 2 <<
	.uleb128 Ltmp3-Ltmp0                    ;   Call between Ltmp0 and Ltmp3
	.uleb128 Ltmp4-Lfunc_begin0             ;     jumps to Ltmp4
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp5-Lfunc_begin0             ; >> Call Site 3 <<
	.uleb128 Ltmp6-Ltmp5                    ;   Call between Ltmp5 and Ltmp6
	.uleb128 Ltmp7-Lfunc_begin0             ;     jumps to Ltmp7
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp6-Lfunc_begin0             ; >> Call Site 4 <<
	.uleb128 Ltmp8-Ltmp6                    ;   Call between Ltmp6 and Ltmp8
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp8-Lfunc_begin0             ; >> Call Site 5 <<
	.uleb128 Ltmp11-Ltmp8                   ;   Call between Ltmp8 and Ltmp11
	.uleb128 Ltmp21-Lfunc_begin0            ;     jumps to Ltmp21
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp12-Lfunc_begin0            ; >> Call Site 6 <<
	.uleb128 Ltmp15-Ltmp12                  ;   Call between Ltmp12 and Ltmp15
	.uleb128 Ltmp16-Lfunc_begin0            ;     jumps to Ltmp16
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp17-Lfunc_begin0            ; >> Call Site 7 <<
	.uleb128 Ltmp20-Ltmp17                  ;   Call between Ltmp17 and Ltmp20
	.uleb128 Ltmp21-Lfunc_begin0            ;     jumps to Ltmp21
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp20-Lfunc_begin0            ; >> Call Site 8 <<
	.uleb128 Ltmp22-Ltmp20                  ;   Call between Ltmp20 and Ltmp22
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp22-Lfunc_begin0            ; >> Call Site 9 <<
	.uleb128 Ltmp23-Ltmp22                  ;   Call between Ltmp22 and Ltmp23
	.uleb128 Ltmp24-Lfunc_begin0            ;     jumps to Ltmp24
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp23-Lfunc_begin0            ; >> Call Site 10 <<
	.uleb128 Lfunc_end0-Ltmp23              ;   Call between Ltmp23 and Lfunc_end0
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end0:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN5krang6SpongeIyE8keccak_fEv ; -- Begin function _ZN5krang6SpongeIyE8keccak_fEv
	.weak_def_can_be_hidden	__ZN5krang6SpongeIyE8keccak_fEv
	.p2align	2
__ZN5krang6SpongeIyE8keccak_fEv:        ; @_ZN5krang6SpongeIyE8keccak_fEv
	.cfi_startproc
; %bb.0:
	stp	x24, x23, [sp, #-64]!           ; 16-byte Folded Spill
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48                    ; =48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	mov	x19, x0
	mov	w1, #1
	bl	__ZN5krang6SpongeIyE8keccak_pEy
	mov	x0, x19
	mov	w1, #32898
	bl	__ZN5krang6SpongeIyE8keccak_pEy
	mov	w8, #136
	mov	x21, #32770
	movk	x21, #32768, lsl #48
	orr	x1, x21, x8
	mov	x0, x19
	bl	__ZN5krang6SpongeIyE8keccak_pEy
	mov	x20, #-9223372034707292160
	movk	x20, #32897
	sub	x1, x20, #129                   ; =129
	mov	x0, x19
	bl	__ZN5krang6SpongeIyE8keccak_pEy
	mov	x0, x19
	mov	w1, #32907
	bl	__ZN5krang6SpongeIyE8keccak_pEy
	mov	w22, #-2147483647
	mov	x0, x19
	mov	w1, #-2147483647
	bl	__ZN5krang6SpongeIyE8keccak_pEy
	mov	x0, x19
	mov	x1, #-9223372034707292160
	movk	x1, #32897
	bl	__ZN5krang6SpongeIyE8keccak_pEy
	add	x1, x21, #7                     ; =7
	mov	x0, x19
	bl	__ZN5krang6SpongeIyE8keccak_pEy
	mov	x0, x19
	mov	w1, #138
	bl	__ZN5krang6SpongeIyE8keccak_pEy
	mov	x0, x19
	mov	w1, #136
	bl	__ZN5krang6SpongeIyE8keccak_pEy
	mov	w23, #32777
	movk	w23, #32768, lsl #16
	mov	x0, x19
	mov	w1, #32777
	movk	w1, #32768, lsl #16
	bl	__ZN5krang6SpongeIyE8keccak_pEy
	add	x1, x22, #9                     ; =9
	mov	x0, x19
	bl	__ZN5krang6SpongeIyE8keccak_pEy
	mov	w8, #130
	orr	x1, x23, x8
	mov	x0, x19
	bl	__ZN5krang6SpongeIyE8keccak_pEy
	mov	w8, #11
	mov	x9, #128
	movk	x9, #32768, lsl #48
	orr	x1, x9, x8
	mov	x0, x19
	bl	__ZN5krang6SpongeIyE8keccak_pEy
	add	x1, x21, #135                   ; =135
	mov	x0, x19
	bl	__ZN5krang6SpongeIyE8keccak_pEy
	orr	x1, x21, #0x1
	mov	x0, x19
	bl	__ZN5krang6SpongeIyE8keccak_pEy
	mov	x0, x19
	mov	x1, #32770
	movk	x1, #32768, lsl #48
	bl	__ZN5krang6SpongeIyE8keccak_pEy
	mov	x0, x19
	mov	x1, #128
	movk	x1, #32768, lsl #48
	bl	__ZN5krang6SpongeIyE8keccak_pEy
	mov	x0, x19
	mov	w1, #32778
	bl	__ZN5krang6SpongeIyE8keccak_pEy
	mov	x0, x19
	mov	x1, #-9223372034707292160
	movk	x1, #10
	bl	__ZN5krang6SpongeIyE8keccak_pEy
	mov	x0, x19
	mov	x1, #-9223372034707292160
	movk	x1, #32897
	bl	__ZN5krang6SpongeIyE8keccak_pEy
	add	x1, x21, #126                   ; =126
	mov	x0, x19
	bl	__ZN5krang6SpongeIyE8keccak_pEy
	mov	x0, x19
	mov	w1, #-2147483647
	bl	__ZN5krang6SpongeIyE8keccak_pEy
	sub	x1, x20, #121                   ; =121
	mov	x0, x19
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	b	__ZN5krang6SpongeIyE8keccak_pEy
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN5krang6SpongeIyE8keccak_pEy ; -- Begin function _ZN5krang6SpongeIyE8keccak_pEy
	.weak_def_can_be_hidden	__ZN5krang6SpongeIyE8keccak_pEy
	.p2align	2
__ZN5krang6SpongeIyE8keccak_pEy:        ; @_ZN5krang6SpongeIyE8keccak_pEy
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #352                    ; =352
	stp	x28, x27, [sp, #256]            ; 16-byte Folded Spill
	stp	x26, x25, [sp, #272]            ; 16-byte Folded Spill
	stp	x24, x23, [sp, #288]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #304]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #320]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #336]            ; 16-byte Folded Spill
	add	x29, sp, #336                   ; =336
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
	str	x1, [sp, #32]                   ; 8-byte Folded Spill
	mov	x19, x0
Lloh24:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh25:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh26:
	ldr	x8, [x8]
	stur	x8, [x29, #-96]
	ldp	x10, x11, [x0, #64]
	ldp	x8, x20, [x0, #32]
	str	x8, [sp, #24]                   ; 8-byte Folded Spill
	stp	x10, x20, [sp, #8]              ; 16-byte Folded Spill
	eor	x12, x11, x8
	ldp	x13, x14, [x0, #112]
	eor	x12, x12, x13
	ldp	x16, x15, [x0, #144]
	eor	x12, x12, x15
	ldr	x17, [x0, #192]
	eor	x12, x12, x17
	ldr	x0, [x0, #24]
	ldr	x1, [x19, #16]
	eor	x2, x10, x0
	ldp	x4, x3, [x19, #96]
	eor	x2, x2, x3
	eor	x2, x2, x16
	ldp	x6, x5, [x19, #176]
	eor	x2, x2, x5
	ldp	x7, x10, [x19]
	eor	x21, x20, x7
	ldp	x22, x9, [x19, #80]
	eor	x21, x21, x22
	eor	x21, x21, x14
	ldp	x23, x8, [x19, #160]
	eor	x21, x21, x23
	eor	x24, x2, x21, ror #63
	ldp	x26, x25, [x19, #48]
	eor	x27, x25, x1
	eor	x27, x27, x4
	ldp	x30, x28, [x19, #128]
	eor	x27, x27, x28
	eor	x27, x27, x6
	eor	x21, x21, x27, ror #63
	eor	x27, x27, x12, ror #63
	eor	x20, x26, x10
	eor	x20, x20, x9
	eor	x20, x20, x30
	eor	x20, x20, x8
	eor	x2, x20, x2, ror #63
	eor	x12, x12, x20, ror #63
	eor	x17, x24, x17
	eor	x15, x24, x15
	eor	x13, x24, x13
	eor	x20, x24, x11
	ldr	x11, [sp, #24]                  ; 8-byte Folded Reload
	eor	x24, x24, x11
	eor	x5, x27, x5
	eor	x16, x27, x16
	eor	x3, x27, x3
	ldr	x11, [sp, #8]                   ; 8-byte Folded Reload
	eor	x11, x27, x11
	eor	x0, x27, x0
	eor	x6, x2, x6
	eor	x27, x2, x28
	eor	x4, x2, x4
	eor	x25, x2, x25
	eor	x1, x2, x1
	eor	x8, x21, x8
	eor	x2, x21, x30
	eor	x9, x21, x9
	eor	x26, x21, x26
	eor	x10, x21, x10
	eor	x21, x23, x12
	eor	x14, x14, x12
	eor	x22, x12, x22
	ldr	x23, [sp, #16]                  ; 8-byte Folded Reload
	eor	x23, x12, x23
	eor	x12, x12, x7
	stp	x5, x17, [x19, #184]
	stp	x8, x6, [x19, #168]
	ror	x17, x17, #50
	stp	x15, x21, [x19, #152]
	ror	x6, x6, #3
	stp	x27, x16, [x19, #136]
	stp	x14, x2, [x19, #120]
	stp	x3, x13, [x19, #104]
	stp	x9, x4, [x19, #88]
	stp	x20, x22, [x19, #72]
	stp	x25, x11, [x19, #56]
	stp	x23, x26, [x19, #40]
	stp	x0, x24, [x19, #24]
	stp	x10, x1, [x19, #8]
	str	x12, [x19]
	stp	x17, x6, [sp, #200]
	ror	x17, x5, #8
	ror	x5, x21, #46
	stp	x5, x17, [sp, #216]
	ror	x15, x15, #56
	ror	x17, x2, #19
	stp	x17, x15, [sp, #168]
	ror	x15, x27, #49
	ror	x14, x14, #23
	stp	x15, x14, [sp, #184]
	ror	x14, x16, #43
	ror	x13, x13, #25
	stp	x13, x14, [sp, #152]
	ror	x13, x3, #39
	ror	x9, x9, #54
	stp	x13, x9, [sp, #136]
	ror	x9, x4, #21
	ror	x13, x22, #61
	stp	x9, x13, [sp, #120]
	ror	x9, x20, #44
	ror	x13, x25, #58
	stp	x9, x13, [sp, #88]
	ror	x9, x23, #28
	ror	x13, x24, #37
	str	x9, [sp, #104]
	ror	x9, x0, #36
	ror	x10, x10, #63
	stp	x10, x13, [sp, #56]
	stp	x12, x9, [sp, #40]
	ror	x13, x26, #20
	ror	x9, x11, #9
	str	x9, [sp, #112]
	ror	x10, x1, #2
	stp	x10, x13, [sp, #72]
	bic	x9, x9, x10
	ror	x8, x8, #62
	str	x8, [sp, #232]
	eor	x8, x8, x9
	str	x8, [x19, #192]
	add	x1, sp, #40                     ; =40
	mov	x0, x19
	bl	__ZN7_Loop2DILi3ELi4ELi4EE3runIZN5krang6SpongeIyE8keccak_pEyEUljjE1_EEvT_
	ldr	x8, [x19]
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	eor	x8, x8, x9
	str	x8, [x19]
	ldur	x8, [x29, #-96]
Lloh27:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh28:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh29:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB3_2
; %bb.1:
	ldp	x29, x30, [sp, #336]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #320]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #304]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #288]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #272]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #256]            ; 16-byte Folded Reload
	add	sp, sp, #352                    ; =352
	ret
LBB3_2:
	bl	___stack_chk_fail
	.loh AdrpLdrGotLdr	Lloh27, Lloh28, Lloh29
	.loh AdrpLdrGotLdr	Lloh24, Lloh25, Lloh26
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7_Loop2DILi3ELi4ELi4EE3runIZN5krang6SpongeIyE8keccak_pEyEUljjE1_EEvT_ ; -- Begin function _ZN7_Loop2DILi3ELi4ELi4EE3runIZN5krang6SpongeIyE8keccak_pEyEUljjE1_EEvT_
	.weak_def_can_be_hidden	__ZN7_Loop2DILi3ELi4ELi4EE3runIZN5krang6SpongeIyE8keccak_pEyEUljjE1_EEvT_
	.p2align	2
__ZN7_Loop2DILi3ELi4ELi4EE3runIZN5krang6SpongeIyE8keccak_pEyEUljjE1_EEvT_: ; @_ZN7_Loop2DILi3ELi4ELi4EE3runIZN5krang6SpongeIyE8keccak_pEyEUljjE1_EEvT_
	.cfi_startproc
; %bb.0:
	ldr	x8, [x1, #152]
	ldr	x9, [x1, #192]
	ldr	x10, [x1, #32]
	bic	x9, x10, x9
	eor	x8, x9, x8
	str	x8, [x0, #184]
	ldr	x8, [x1, #112]
	ldr	x9, [x1, #152]
	ldr	x10, [x1, #192]
	bic	x9, x10, x9
	eor	x8, x9, x8
	str	x8, [x0, #176]
	ldr	x8, [x1, #72]
	ldr	x9, [x1, #112]
	ldr	x10, [x1, #152]
	bic	x9, x10, x9
	eor	x8, x9, x8
	str	x8, [x0, #168]
	ldr	x8, [x1, #32]
	ldr	x9, [x1, #72]
	ldr	x10, [x1, #112]
	bic	x9, x10, x9
	eor	x8, x9, x8
	str	x8, [x0, #160]
	ldr	x8, [x1, #184]
	ldr	x9, [x1, #24]
	ldr	x10, [x1, #64]
	bic	x9, x10, x9
	eor	x8, x9, x8
	str	x8, [x0, #152]
	ldr	x8, [x1, #144]
	ldr	x9, [x1, #184]
	ldr	x10, [x1, #24]
	bic	x9, x10, x9
	eor	x8, x9, x8
	str	x8, [x0, #144]
	ldr	x8, [x1, #104]
	ldr	x9, [x1, #144]
	ldr	x10, [x1, #184]
	bic	x9, x10, x9
	eor	x8, x9, x8
	str	x8, [x0, #136]
	ldr	x8, [x1, #64]
	ldr	x9, [x1, #104]
	ldr	x10, [x1, #144]
	bic	x9, x10, x9
	eor	x8, x9, x8
	str	x8, [x0, #128]
	ldr	x8, [x1, #24]
	ldr	x9, [x1, #64]
	ldr	x10, [x1, #104]
	bic	x9, x10, x9
	eor	x8, x9, x8
	str	x8, [x0, #120]
	ldr	x8, [x1, #176]
	ldr	x9, [x1, #16]
	ldr	x10, [x1, #56]
	bic	x9, x10, x9
	eor	x8, x9, x8
	str	x8, [x0, #112]
	ldr	x8, [x1, #136]
	ldr	x9, [x1, #176]
	ldr	x10, [x1, #16]
	bic	x9, x10, x9
	eor	x8, x9, x8
	str	x8, [x0, #104]
	ldr	x8, [x1, #96]
	ldr	x9, [x1, #136]
	ldr	x10, [x1, #176]
	bic	x9, x10, x9
	eor	x8, x9, x8
	str	x8, [x0, #96]
	ldr	x8, [x1, #56]
	ldr	x9, [x1, #96]
	ldr	x10, [x1, #136]
	bic	x9, x10, x9
	eor	x8, x9, x8
	str	x8, [x0, #88]
	ldr	x8, [x1, #16]
	ldr	x9, [x1, #56]
	ldr	x10, [x1, #96]
	bic	x9, x10, x9
	eor	x8, x9, x8
	str	x8, [x0, #80]
	ldr	x8, [x1, #168]
	ldr	x9, [x1, #8]
	ldr	x10, [x1, #48]
	bic	x9, x10, x9
	eor	x8, x9, x8
	str	x8, [x0, #72]
	ldr	x8, [x1, #128]
	ldr	x9, [x1, #168]
	ldr	x10, [x1, #8]
	bic	x9, x10, x9
	eor	x8, x9, x8
	str	x8, [x0, #64]
	ldr	x8, [x1, #88]
	ldr	x9, [x1, #128]
	ldr	x10, [x1, #168]
	bic	x9, x10, x9
	eor	x8, x9, x8
	str	x8, [x0, #56]
	ldr	x8, [x1, #48]
	ldr	x9, [x1, #88]
	ldr	x10, [x1, #128]
	bic	x9, x10, x9
	eor	x8, x9, x8
	str	x8, [x0, #48]
	ldr	x8, [x1, #8]
	ldr	x9, [x1, #48]
	ldr	x10, [x1, #88]
	bic	x9, x10, x9
	eor	x8, x9, x8
	str	x8, [x0, #40]
	ldr	x8, [x1, #160]
	ldr	x9, [x1]
	ldr	x10, [x1, #40]
	bic	x9, x10, x9
	eor	x8, x9, x8
	str	x8, [x0, #32]
	ldr	x8, [x1, #120]
	ldr	x9, [x1, #160]
	ldr	x10, [x1]
	bic	x9, x10, x9
	eor	x8, x9, x8
	str	x8, [x0, #24]
	ldr	x8, [x1, #80]
	ldr	x9, [x1, #120]
	ldr	x10, [x1, #160]
	bic	x9, x10, x9
	eor	x8, x9, x8
	str	x8, [x0, #16]
	ldr	x8, [x1, #40]
	ldr	x9, [x1, #80]
	ldr	x10, [x1, #120]
	bic	x9, x10, x9
	eor	x8, x9, x8
	str	x8, [x0, #8]
	ldr	x8, [x1]
	ldr	x9, [x1, #40]
	ldr	x10, [x1, #80]
	bic	x9, x10, x9
	eor	x8, x9, x8
	str	x8, [x0]
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	___clang_call_terminate ; -- Begin function __clang_call_terminate
	.globl	___clang_call_terminate
	.weak_def_can_be_hidden	___clang_call_terminate
	.p2align	2
___clang_call_terminate:                ; @__clang_call_terminate
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	bl	___cxa_begin_catch
	bl	__ZSt9terminatev
                                        ; -- End function
	.globl	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m ; -- Begin function _ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.weak_def_can_be_hidden	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.p2align	2
__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m: ; @_ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Lfunc_begin1:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception1
; %bb.0:
	sub	sp, sp, #112                    ; =112
	stp	x26, x25, [sp, #32]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #48]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96                    ; =96
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
	mov	x21, x2
	mov	x20, x1
	mov	x19, x0
Ltmp25:
	add	x0, sp, #8                      ; =8
	mov	x1, x19
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_
Ltmp26:
; %bb.1:
	ldrb	w8, [sp, #8]
	cbz	w8, LBB6_10
; %bb.2:
	ldr	x8, [x19]
	ldur	x8, [x8, #-24]
	add	x22, x19, x8
	ldr	x23, [x22, #40]
	ldr	w25, [x22, #8]
	ldr	w24, [x22, #144]
	cmn	w24, #1                         ; =1
	b.ne	LBB6_7
; %bb.3:
Ltmp28:
	add	x8, sp, #24                     ; =24
	mov	x0, x22
	bl	__ZNKSt3__18ios_base6getlocEv
Ltmp29:
; %bb.4:
Ltmp30:
Lloh30:
	adrp	x1, __ZNSt3__15ctypeIcE2idE@GOTPAGE
Lloh31:
	ldr	x1, [x1, __ZNSt3__15ctypeIcE2idE@GOTPAGEOFF]
	add	x0, sp, #24                     ; =24
	bl	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp31:
; %bb.5:
	ldr	x8, [x0]
	ldr	x8, [x8, #56]
Ltmp32:
	mov	w1, #32
	blr	x8
Ltmp33:
; %bb.6:
	mov	x24, x0
	add	x0, sp, #24                     ; =24
	bl	__ZNSt3__16localeD1Ev
	str	w24, [x22, #144]
LBB6_7:
	add	x3, x20, x21
	mov	w8, #176
	and	w8, w25, w8
	cmp	w8, #32                         ; =32
	csel	x2, x3, x20, eq
Ltmp35:
	sxtb	w5, w24
	mov	x0, x23
	mov	x1, x20
	mov	x4, x22
	bl	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Ltmp36:
; %bb.8:
	cbnz	x0, LBB6_10
; %bb.9:
	ldr	x8, [x19]
	ldur	x8, [x8, #-24]
	add	x0, x19, x8
	ldr	w8, [x0, #32]
	mov	w9, #5
	orr	w1, w8, w9
Ltmp38:
	bl	__ZNSt3__18ios_base5clearEj
Ltmp39:
LBB6_10:
	add	x0, sp, #8                      ; =8
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
LBB6_11:
	mov	x0, x19
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #112                    ; =112
	ret
LBB6_12:
Ltmp40:
	b	LBB6_15
LBB6_13:
Ltmp34:
	mov	x20, x0
	add	x0, sp, #24                     ; =24
	bl	__ZNSt3__16localeD1Ev
	b	LBB6_16
LBB6_14:
Ltmp37:
LBB6_15:
	mov	x20, x0
LBB6_16:
	add	x0, sp, #8                      ; =8
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
	b	LBB6_18
LBB6_17:
Ltmp27:
	mov	x20, x0
LBB6_18:
	mov	x0, x20
	bl	___cxa_begin_catch
	ldr	x8, [x19]
	ldur	x8, [x8, #-24]
	add	x0, x19, x8
Ltmp41:
	bl	__ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv
Ltmp42:
; %bb.19:
	bl	___cxa_end_catch
	b	LBB6_11
LBB6_20:
Ltmp43:
	mov	x19, x0
Ltmp44:
	bl	___cxa_end_catch
Ltmp45:
; %bb.21:
	mov	x0, x19
	bl	__Unwind_Resume
	brk	#0x1
LBB6_22:
Ltmp46:
	bl	___clang_call_terminate
	.loh AdrpLdrGot	Lloh30, Lloh31
Lfunc_end1:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table6:
Lexception1:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase0-Lttbaseref0
Lttbaseref0:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end1-Lcst_begin1
Lcst_begin1:
	.uleb128 Ltmp25-Lfunc_begin1            ; >> Call Site 1 <<
	.uleb128 Ltmp26-Ltmp25                  ;   Call between Ltmp25 and Ltmp26
	.uleb128 Ltmp27-Lfunc_begin1            ;     jumps to Ltmp27
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp28-Lfunc_begin1            ; >> Call Site 2 <<
	.uleb128 Ltmp29-Ltmp28                  ;   Call between Ltmp28 and Ltmp29
	.uleb128 Ltmp37-Lfunc_begin1            ;     jumps to Ltmp37
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp30-Lfunc_begin1            ; >> Call Site 3 <<
	.uleb128 Ltmp33-Ltmp30                  ;   Call between Ltmp30 and Ltmp33
	.uleb128 Ltmp34-Lfunc_begin1            ;     jumps to Ltmp34
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp35-Lfunc_begin1            ; >> Call Site 4 <<
	.uleb128 Ltmp36-Ltmp35                  ;   Call between Ltmp35 and Ltmp36
	.uleb128 Ltmp37-Lfunc_begin1            ;     jumps to Ltmp37
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp38-Lfunc_begin1            ; >> Call Site 5 <<
	.uleb128 Ltmp39-Ltmp38                  ;   Call between Ltmp38 and Ltmp39
	.uleb128 Ltmp40-Lfunc_begin1            ;     jumps to Ltmp40
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp39-Lfunc_begin1            ; >> Call Site 6 <<
	.uleb128 Ltmp41-Ltmp39                  ;   Call between Ltmp39 and Ltmp41
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp41-Lfunc_begin1            ; >> Call Site 7 <<
	.uleb128 Ltmp42-Ltmp41                  ;   Call between Ltmp41 and Ltmp42
	.uleb128 Ltmp43-Lfunc_begin1            ;     jumps to Ltmp43
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp42-Lfunc_begin1            ; >> Call Site 8 <<
	.uleb128 Ltmp44-Ltmp42                  ;   Call between Ltmp42 and Ltmp44
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp44-Lfunc_begin1            ; >> Call Site 9 <<
	.uleb128 Ltmp45-Ltmp44                  ;   Call between Ltmp44 and Ltmp45
	.uleb128 Ltmp46-Lfunc_begin1            ;     jumps to Ltmp46
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp45-Lfunc_begin1            ; >> Call Site 10 <<
	.uleb128 Lfunc_end1-Ltmp45              ;   Call between Ltmp45 and Lfunc_end1
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end1:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase0:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_ ; -- Begin function _ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.globl	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.weak_def_can_be_hidden	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.p2align	2
__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_: ; @_ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Lfunc_begin2:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception2
; %bb.0:
	sub	sp, sp, #112                    ; =112
	stp	x26, x25, [sp, #32]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #48]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96                    ; =96
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
	mov	x19, x0
	cbz	x0, LBB7_15
; %bb.1:
	mov	x24, x5
	mov	x20, x4
	mov	x22, x3
	mov	x21, x2
	sub	x8, x3, x1
	ldr	x9, [x4, #24]
	subs	x8, x9, x8
	csel	x23, x8, xzr, gt
	sub	x25, x2, x1
	cmp	x25, #1                         ; =1
	b.lt	LBB7_3
; %bb.2:
	ldr	x8, [x19]
	ldr	x8, [x8, #96]
	mov	x0, x19
	mov	x2, x25
	blr	x8
	cmp	x0, x25
	b.ne	LBB7_14
LBB7_3:
	cmp	x23, #1                         ; =1
	b.lt	LBB7_11
; %bb.4:
	cmp	x23, #23                        ; =23
	b.hs	LBB7_6
; %bb.5:
	add	x26, sp, #8                     ; =8
	strb	w23, [sp, #31]
	add	x25, sp, #8                     ; =8
	b	LBB7_7
LBB7_6:
	add	x8, x23, #16                    ; =16
	and	x26, x8, #0xfffffffffffffff0
	mov	x0, x26
	bl	__Znwm
	mov	x25, x0
	orr	x8, x26, #0x8000000000000000
	stp	x23, x8, [sp, #16]
	str	x0, [sp, #8]
	add	x26, sp, #8                     ; =8
LBB7_7:
	mov	x0, x25
	mov	x1, x24
	mov	x2, x23
	bl	_memset
	strb	wzr, [x25, x23]
	ldrsb	w8, [x26, #23]
	ldr	x9, [sp, #8]
	cmp	w8, #0                          ; =0
	add	x8, sp, #8                      ; =8
	csel	x1, x9, x8, lt
	ldr	x8, [x19]
	ldr	x8, [x8, #96]
Ltmp47:
	mov	x0, x19
	mov	x2, x23
	blr	x8
Ltmp48:
; %bb.8:
	mov	x24, x0
	ldrsb	w8, [x26, #23]
	tbnz	w8, #31, LBB7_10
; %bb.9:
	cmp	x24, x23
	b.ne	LBB7_14
	b	LBB7_11
LBB7_10:
	ldr	x0, [sp, #8]
	bl	__ZdlPv
	cmp	x24, x23
	b.ne	LBB7_14
LBB7_11:
	sub	x22, x22, x21
	cmp	x22, #1                         ; =1
	b.lt	LBB7_13
; %bb.12:
	ldr	x8, [x19]
	ldr	x8, [x8, #96]
	mov	x0, x19
	mov	x1, x21
	mov	x2, x22
	blr	x8
	cmp	x0, x22
	b.ne	LBB7_14
LBB7_13:
	str	xzr, [x20, #24]
	b	LBB7_15
LBB7_14:
	mov	x19, #0
LBB7_15:
	mov	x0, x19
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #112                    ; =112
	ret
LBB7_16:
Ltmp49:
	mov	x19, x0
	ldrsb	w8, [x26, #23]
	tbz	w8, #31, LBB7_18
; %bb.17:
	ldr	x0, [sp, #8]
	bl	__ZdlPv
LBB7_18:
	mov	x0, x19
	bl	__Unwind_Resume
	brk	#0x1
Lfunc_end2:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table7:
Lexception2:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end2-Lcst_begin2
Lcst_begin2:
	.uleb128 Lfunc_begin2-Lfunc_begin2      ; >> Call Site 1 <<
	.uleb128 Ltmp47-Lfunc_begin2            ;   Call between Lfunc_begin2 and Ltmp47
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp47-Lfunc_begin2            ; >> Call Site 2 <<
	.uleb128 Ltmp48-Ltmp47                  ;   Call between Ltmp47 and Ltmp48
	.uleb128 Ltmp49-Lfunc_begin2            ;     jumps to Ltmp49
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp48-Lfunc_begin2            ; >> Call Site 3 <<
	.uleb128 Lfunc_end2-Ltmp48              ;   Call between Ltmp48 and Lfunc_end2
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end2:
	.p2align	2
                                        ; -- End function
	.section	__DATA,__data
	.globl	_refstate                       ; @refstate
	.p2align	3
_refstate:
	.quad	-6066930122672164290            ; 0xabcdef328902323e
	.quad	-8678343944705978882            ; 0x8790542981234dfe
	.quad	8647360101996659491             ; 0x7801983274658323
	.quad	-7489318766128377207            ; 0x9810984327405289
	.quad	-8565559084008765613            ; 0x8921056537098753
	.quad	-7672118840855857854            ; 0x9587289018347542
	.quad	3787674110113904178             ; 0x3490858902487632
	.quad	-8626267803293297533            ; 0x8849572307505483
	.quad	-8749200833356663469            ; 0x8694983283397553
	.quad	8374219217583874100             ; 0x7437340287562034
	.quad	-7911556505854047931            ; 0x9234814670238945
	.quad	-6680659510998567280            ; 0xa349879205987690
	.quad	325149180632273735              ; 0x483297502989347
	.quad	1313221994932732741             ; 0x1239807257320345
	.quad	3635628862853109573             ; 0x3274593039845745
	.quad	8248488223121557395             ; 0x7278845629274793
	.quad	3785619647508026633             ; 0x3489390328749509
	.quad	3785092418731713364             ; 0x3487598024872354
	.quad	6091528855481829411             ; 0x5489753842094823
	.quad	1502388239                      ; 0x598ca00f
	.quad	7567834643173619094             ; 0x6906598309423596
	.quad	2969922272258913316             ; 0x2937489240837424
	.quad	4863933245932319813             ; 0x4380298457023445
	.quad	3771767540946240069             ; 0x3458029845730245
	.quad	1299649142386197362             ; 0x1209480258920372

	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"0x%llx"

l_.str.1:                               ; @.str.1
	.asciz	" : "

.subsections_via_symbols
