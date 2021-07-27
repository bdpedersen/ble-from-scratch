	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0	sdk_version 11, 3
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ; -- Begin function _Z4fillRA5_A5_h
lCPI0_0:
	.byte	8                               ; 0x8
	.byte	13                              ; 0xd
	.byte	18                              ; 0x12
	.byte	23                              ; 0x17
	.byte	4                               ; 0x4
	.byte	9                               ; 0x9
	.byte	14                              ; 0xe
	.byte	19                              ; 0x13
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4
lCPI0_1:
	.byte	0                               ; 0x0
	.byte	5                               ; 0x5
	.byte	10                              ; 0xa
	.byte	15                              ; 0xf
	.byte	20                              ; 0x14
	.byte	1                               ; 0x1
	.byte	6                               ; 0x6
	.byte	11                              ; 0xb
	.byte	16                              ; 0x10
	.byte	21                              ; 0x15
	.byte	2                               ; 0x2
	.byte	7                               ; 0x7
	.byte	12                              ; 0xc
	.byte	17                              ; 0x11
	.byte	22                              ; 0x16
	.byte	3                               ; 0x3
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z4fillRA5_A5_h
	.p2align	2
__Z4fillRA5_A5_h:                       ; @_Z4fillRA5_A5_h
	.cfi_startproc
; %bb.0:
	mov	w8, #24
	strb	w8, [x0, #24]
Lloh0:
	adrp	x8, lCPI0_0@PAGE
Lloh1:
	ldr	d0, [x8, lCPI0_0@PAGEOFF]
	str	d0, [x0, #16]
Lloh2:
	adrp	x8, lCPI0_1@PAGE
Lloh3:
	ldr	q0, [x8, lCPI0_1@PAGEOFF]
	str	q0, [x0]
	ret
	.loh AdrpLdr	Lloh2, Lloh3
	.loh AdrpAdrp	Lloh0, Lloh2
	.loh AdrpLdr	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ; -- Begin function main
lCPI1_0:
	.byte	8                               ; 0x8
	.byte	13                              ; 0xd
	.byte	18                              ; 0x12
	.byte	23                              ; 0x17
	.byte	4                               ; 0x4
	.byte	9                               ; 0x9
	.byte	14                              ; 0xe
	.byte	19                              ; 0x13
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4
lCPI1_1:
	.byte	0                               ; 0x0
	.byte	5                               ; 0x5
	.byte	10                              ; 0xa
	.byte	15                              ; 0xf
	.byte	20                              ; 0x14
	.byte	1                               ; 0x1
	.byte	6                               ; 0x6
	.byte	11                              ; 0xb
	.byte	16                              ; 0x10
	.byte	21                              ; 0x15
	.byte	2                               ; 0x2
	.byte	7                               ; 0x7
	.byte	12                              ; 0xc
	.byte	17                              ; 0x11
	.byte	22                              ; 0x16
	.byte	3                               ; 0x3
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:                                  ; @main
Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception0
; %bb.0:
	sub	sp, sp, #128                    ; =128
	stp	x24, x23, [sp, #64]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #80]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #96]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #112]            ; 16-byte Folded Spill
	add	x29, sp, #112                   ; =112
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	mov	w8, #0
Lloh4:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh5:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh6:
	ldr	x9, [x9]
	str	x9, [sp, #56]
	mov	w9, #24
	strb	w9, [sp, #40]
Lloh7:
	adrp	x9, lCPI1_0@PAGE
Lloh8:
	ldr	d0, [x9, lCPI1_0@PAGEOFF]
	str	d0, [sp, #32]
Lloh9:
	adrp	x9, lCPI1_1@PAGE
Lloh10:
	ldr	q0, [x9, lCPI1_1@PAGEOFF]
	str	q0, [sp, #16]
	mov	w23, #5
Lloh11:
	adrp	x19, __ZNSt3__14coutE@GOTPAGE
Lloh12:
	ldr	x19, [x19, __ZNSt3__14coutE@GOTPAGEOFF]
Lloh13:
	adrp	x20, __ZNSt3__15ctypeIcE2idE@GOTPAGE
Lloh14:
	ldr	x20, [x20, __ZNSt3__15ctypeIcE2idE@GOTPAGEOFF]
	add	x24, sp, #16                    ; =16
LBB1_1:                                 ; =>This Inner Loop Header: Depth=1
	and	w1, w8, #0xff
	mov	x0, x19
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi
	mov	x21, x0
	ldr	x8, [x0]
	ldur	x8, [x8, #-24]
	add	x0, x0, x8
	add	x8, sp, #8                      ; =8
	bl	__ZNKSt3__18ios_base6getlocEv
Ltmp0:
	add	x0, sp, #8                      ; =8
	mov	x1, x20
	bl	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp1:
; %bb.2:                                ;   in Loop: Header=BB1_1 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #56]
Ltmp2:
	mov	w1, #10
	blr	x8
Ltmp3:
; %bb.3:                                ;   in Loop: Header=BB1_1 Depth=1
	mov	x22, x0
	add	x0, sp, #8                      ; =8
	bl	__ZNSt3__16localeD1Ev
	mov	x0, x21
	mov	x1, x22
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
	mov	x0, x21
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
	add	x8, x24, x23
	ldurb	w1, [x8, #-4]
	mov	x0, x19
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi
	mov	x21, x0
	ldr	x8, [x0]
	ldur	x8, [x8, #-24]
	add	x0, x0, x8
	add	x8, sp, #8                      ; =8
	bl	__ZNKSt3__18ios_base6getlocEv
Ltmp4:
	add	x0, sp, #8                      ; =8
	mov	x1, x20
	bl	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp5:
; %bb.4:                                ;   in Loop: Header=BB1_1 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #56]
Ltmp6:
	mov	w1, #10
	blr	x8
Ltmp7:
; %bb.5:                                ;   in Loop: Header=BB1_1 Depth=1
	mov	x22, x0
	add	x0, sp, #8                      ; =8
	bl	__ZNSt3__16localeD1Ev
	mov	x0, x21
	mov	x1, x22
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
	mov	x0, x21
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
	add	x8, x24, x23
	ldurb	w1, [x8, #-3]
	mov	x0, x19
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi
	mov	x21, x0
	ldr	x8, [x0]
	ldur	x8, [x8, #-24]
	add	x0, x0, x8
	add	x8, sp, #8                      ; =8
	bl	__ZNKSt3__18ios_base6getlocEv
Ltmp8:
	add	x0, sp, #8                      ; =8
	mov	x1, x20
	bl	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp9:
; %bb.6:                                ;   in Loop: Header=BB1_1 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #56]
Ltmp10:
	mov	w1, #10
	blr	x8
Ltmp11:
; %bb.7:                                ;   in Loop: Header=BB1_1 Depth=1
	mov	x22, x0
	add	x0, sp, #8                      ; =8
	bl	__ZNSt3__16localeD1Ev
	mov	x0, x21
	mov	x1, x22
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
	mov	x0, x21
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
	add	x8, x24, x23
	ldurb	w1, [x8, #-2]
	mov	x0, x19
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi
	mov	x21, x0
	ldr	x8, [x0]
	ldur	x8, [x8, #-24]
	add	x0, x0, x8
	add	x8, sp, #8                      ; =8
	bl	__ZNKSt3__18ios_base6getlocEv
Ltmp12:
	add	x0, sp, #8                      ; =8
	mov	x1, x20
	bl	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp13:
; %bb.8:                                ;   in Loop: Header=BB1_1 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #56]
Ltmp14:
	mov	w1, #10
	blr	x8
Ltmp15:
; %bb.9:                                ;   in Loop: Header=BB1_1 Depth=1
	mov	x22, x0
	add	x0, sp, #8                      ; =8
	bl	__ZNSt3__16localeD1Ev
	mov	x0, x21
	mov	x1, x22
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
	mov	x0, x21
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
	add	x8, x24, x23
	ldurb	w1, [x8, #-1]
	mov	x0, x19
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi
	mov	x21, x0
	ldr	x8, [x0]
	ldur	x8, [x8, #-24]
	add	x0, x0, x8
	add	x8, sp, #8                      ; =8
	bl	__ZNKSt3__18ios_base6getlocEv
Ltmp16:
	add	x0, sp, #8                      ; =8
	mov	x1, x20
	bl	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp17:
; %bb.10:                               ;   in Loop: Header=BB1_1 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #56]
Ltmp18:
	mov	w1, #10
	blr	x8
Ltmp19:
; %bb.11:                               ;   in Loop: Header=BB1_1 Depth=1
	mov	x22, x0
	add	x0, sp, #8                      ; =8
	bl	__ZNSt3__16localeD1Ev
	mov	x0, x21
	mov	x1, x22
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
	mov	x0, x21
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
	cmp	x23, #25                        ; =25
	b.eq	LBB1_13
; %bb.12:                               ;   in Loop: Header=BB1_1 Depth=1
	ldrb	w8, [x24, x23]
	add	x23, x23, #5                    ; =5
	b	LBB1_1
LBB1_13:
	ldr	x8, [sp, #56]
Lloh15:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh16:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh17:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB1_15
; %bb.14:
	mov	w0, #0
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #96]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #128                    ; =128
	ret
LBB1_15:
	bl	___stack_chk_fail
LBB1_16:
Ltmp20:
	mov	x19, x0
	add	x0, sp, #8                      ; =8
	bl	__ZNSt3__16localeD1Ev
	mov	x0, x19
	bl	__Unwind_Resume
	brk	#0x1
	.loh AdrpLdrGot	Lloh13, Lloh14
	.loh AdrpLdrGot	Lloh11, Lloh12
	.loh AdrpLdr	Lloh9, Lloh10
	.loh AdrpAdrp	Lloh7, Lloh9
	.loh AdrpLdr	Lloh7, Lloh8
	.loh AdrpLdrGotLdr	Lloh4, Lloh5, Lloh6
	.loh AdrpLdrGotLdr	Lloh15, Lloh16, Lloh17
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
	.uleb128 Ltmp20-Lfunc_begin0            ;     jumps to Ltmp20
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp3-Lfunc_begin0             ; >> Call Site 3 <<
	.uleb128 Ltmp4-Ltmp3                    ;   Call between Ltmp3 and Ltmp4
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp4-Lfunc_begin0             ; >> Call Site 4 <<
	.uleb128 Ltmp7-Ltmp4                    ;   Call between Ltmp4 and Ltmp7
	.uleb128 Ltmp20-Lfunc_begin0            ;     jumps to Ltmp20
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp7-Lfunc_begin0             ; >> Call Site 5 <<
	.uleb128 Ltmp8-Ltmp7                    ;   Call between Ltmp7 and Ltmp8
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp8-Lfunc_begin0             ; >> Call Site 6 <<
	.uleb128 Ltmp11-Ltmp8                   ;   Call between Ltmp8 and Ltmp11
	.uleb128 Ltmp20-Lfunc_begin0            ;     jumps to Ltmp20
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp11-Lfunc_begin0            ; >> Call Site 7 <<
	.uleb128 Ltmp12-Ltmp11                  ;   Call between Ltmp11 and Ltmp12
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp12-Lfunc_begin0            ; >> Call Site 8 <<
	.uleb128 Ltmp15-Ltmp12                  ;   Call between Ltmp12 and Ltmp15
	.uleb128 Ltmp20-Lfunc_begin0            ;     jumps to Ltmp20
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp15-Lfunc_begin0            ; >> Call Site 9 <<
	.uleb128 Ltmp16-Ltmp15                  ;   Call between Ltmp15 and Ltmp16
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp16-Lfunc_begin0            ; >> Call Site 10 <<
	.uleb128 Ltmp19-Ltmp16                  ;   Call between Ltmp16 and Ltmp19
	.uleb128 Ltmp20-Lfunc_begin0            ;     jumps to Ltmp20
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp19-Lfunc_begin0            ; >> Call Site 11 <<
	.uleb128 Lfunc_end0-Ltmp19              ;   Call between Ltmp19 and Lfunc_end0
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end0:
	.p2align	2
                                        ; -- End function
.subsections_via_symbols
