; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
;RUN: llc < %s -mtriple=x86_64-unknown-unknown -mcpu=knl | FileCheck %s --check-prefix=CHECK --check-prefix=KNL
;RUN: llc < %s -mtriple=x86_64-unknown-unknown -mcpu=skx | FileCheck %s --check-prefix=CHECK --check-prefix=SKX

define i32 @hadd_16(<16 x i32> %x225) {
; KNL-LABEL: hadd_16:
; KNL:       # BB#0:
; KNL-NEXT:    vpshufd {{.*#+}} xmm1 = xmm0[2,3,0,1]
; KNL-NEXT:    vpaddd %zmm1, %zmm0, %zmm0
; KNL-NEXT:    vpshufd {{.*#+}} xmm1 = xmm0[1,1,2,3]
; KNL-NEXT:    vpaddd %zmm1, %zmm0, %zmm0
; KNL-NEXT:    vmovd %xmm0, %eax
; KNL-NEXT:    retq
;
; SKX-LABEL: hadd_16:
; SKX:       # BB#0:
; SKX-NEXT:    vpshufd {{.*#+}} xmm1 = xmm0[2,3,0,1]
; SKX-NEXT:    vpaddd %zmm1, %zmm0, %zmm0
; SKX-NEXT:    vpshufd {{.*#+}} xmm1 = xmm0[1,1,2,3]
; SKX-NEXT:    vpaddd %zmm1, %zmm0, %zmm0
; SKX-NEXT:    vmovd %xmm0, %eax
; SKX-NEXT:    vzeroupper
; SKX-NEXT:    retq
  %x226 = shufflevector <16 x i32> %x225, <16 x i32> undef, <16 x i32> <i32 2, i32 3, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %x227 = add <16 x i32> %x225, %x226
  %x228 = shufflevector <16 x i32> %x227, <16 x i32> undef, <16 x i32> <i32 1, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %x229 = add <16 x i32> %x227, %x228
  %x230 = extractelement <16 x i32> %x229, i32 0
  ret i32 %x230
}

define i32 @hsub_16(<16 x i32> %x225) {
; KNL-LABEL: hsub_16:
; KNL:       # BB#0:
; KNL-NEXT:    vpshufd {{.*#+}} xmm1 = xmm0[2,3,0,1]
; KNL-NEXT:    vpaddd %zmm1, %zmm0, %zmm0
; KNL-NEXT:    vpshufd {{.*#+}} xmm1 = xmm0[1,1,2,3]
; KNL-NEXT:    vpsubd %zmm1, %zmm0, %zmm0
; KNL-NEXT:    vmovd %xmm0, %eax
; KNL-NEXT:    retq
;
; SKX-LABEL: hsub_16:
; SKX:       # BB#0:
; SKX-NEXT:    vpshufd {{.*#+}} xmm1 = xmm0[2,3,0,1]
; SKX-NEXT:    vpaddd %zmm1, %zmm0, %zmm0
; SKX-NEXT:    vpshufd {{.*#+}} xmm1 = xmm0[1,1,2,3]
; SKX-NEXT:    vpsubd %zmm1, %zmm0, %zmm0
; SKX-NEXT:    vmovd %xmm0, %eax
; SKX-NEXT:    vzeroupper
; SKX-NEXT:    retq
  %x226 = shufflevector <16 x i32> %x225, <16 x i32> undef, <16 x i32> <i32 2, i32 3, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %x227 = add <16 x i32> %x225, %x226
  %x228 = shufflevector <16 x i32> %x227, <16 x i32> undef, <16 x i32> <i32 1, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %x229 = sub <16 x i32> %x227, %x228
  %x230 = extractelement <16 x i32> %x229, i32 0
  ret i32 %x230
}

define float @fhadd_16(<16 x float> %x225) {
; KNL-LABEL: fhadd_16:
; KNL:       # BB#0:
; KNL-NEXT:    vpermilpd {{.*#+}} xmm1 = xmm0[1,0]
; KNL-NEXT:    vaddps %zmm1, %zmm0, %zmm0
; KNL-NEXT:    vmovshdup {{.*#+}} xmm1 = xmm0[1,1,3,3]
; KNL-NEXT:    vaddps %zmm1, %zmm0, %zmm0
; KNL-NEXT:    # kill: %XMM0<def> %XMM0<kill> %ZMM0<kill>
; KNL-NEXT:    retq
;
; SKX-LABEL: fhadd_16:
; SKX:       # BB#0:
; SKX-NEXT:    vpermilpd {{.*#+}} xmm1 = xmm0[1,0]
; SKX-NEXT:    vaddps %zmm1, %zmm0, %zmm0
; SKX-NEXT:    vmovshdup {{.*#+}} xmm1 = xmm0[1,1,3,3]
; SKX-NEXT:    vaddps %zmm1, %zmm0, %zmm0
; SKX-NEXT:    # kill: %XMM0<def> %XMM0<kill> %ZMM0<kill>
; SKX-NEXT:    vzeroupper
; SKX-NEXT:    retq
  %x226 = shufflevector <16 x float> %x225, <16 x float> undef, <16 x i32> <i32 2, i32 3, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %x227 = fadd <16 x float> %x225, %x226
  %x228 = shufflevector <16 x float> %x227, <16 x float> undef, <16 x i32> <i32 1, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %x229 = fadd <16 x float> %x227, %x228
  %x230 = extractelement <16 x float> %x229, i32 0
  ret float %x230
}

define float @fhsub_16(<16 x float> %x225) {
; KNL-LABEL: fhsub_16:
; KNL:       # BB#0:
; KNL-NEXT:    vpermilpd {{.*#+}} xmm1 = xmm0[1,0]
; KNL-NEXT:    vaddps %zmm1, %zmm0, %zmm0
; KNL-NEXT:    vmovshdup {{.*#+}} xmm1 = xmm0[1,1,3,3]
; KNL-NEXT:    vsubps %zmm1, %zmm0, %zmm0
; KNL-NEXT:    # kill: %XMM0<def> %XMM0<kill> %ZMM0<kill>
; KNL-NEXT:    retq
;
; SKX-LABEL: fhsub_16:
; SKX:       # BB#0:
; SKX-NEXT:    vpermilpd {{.*#+}} xmm1 = xmm0[1,0]
; SKX-NEXT:    vaddps %zmm1, %zmm0, %zmm0
; SKX-NEXT:    vmovshdup {{.*#+}} xmm1 = xmm0[1,1,3,3]
; SKX-NEXT:    vsubps %zmm1, %zmm0, %zmm0
; SKX-NEXT:    # kill: %XMM0<def> %XMM0<kill> %ZMM0<kill>
; SKX-NEXT:    vzeroupper
; SKX-NEXT:    retq
  %x226 = shufflevector <16 x float> %x225, <16 x float> undef, <16 x i32> <i32 2, i32 3, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %x227 = fadd <16 x float> %x225, %x226
  %x228 = shufflevector <16 x float> %x227, <16 x float> undef, <16 x i32> <i32 1, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %x229 = fsub <16 x float> %x227, %x228
  %x230 = extractelement <16 x float> %x229, i32 0
  ret float %x230
}

