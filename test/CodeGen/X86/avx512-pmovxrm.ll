; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -disable-peephole -mtriple=i686-apple-darwin -mattr=+avx512f,avx512bw | FileCheck %s --check-prefix=X32
; RUN: llc < %s -disable-peephole -mtriple=x86_64-apple-darwin -mattr=+avx512f,avx512bw | FileCheck %s --check-prefix=X64

define <32 x i16> @test_llvm_x86_avx512_pmovsxbw(<32 x i8>* %a) {
; X32-LABEL: test_llvm_x86_avx512_pmovsxbw:
; X32:       ## BB#0:
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    vpmovsxbw (%eax), %zmm0
; X32-NEXT:    retl
;
; X64-LABEL: test_llvm_x86_avx512_pmovsxbw:
; X64:       ## BB#0:
; X64-NEXT:    vpmovsxbw (%rdi), %zmm0
; X64-NEXT:    retq
  %1 = load <32 x i8>, <32 x i8>* %a, align 1
  %2 = sext <32 x i8> %1 to <32 x i16>
  ret <32 x i16> %2
}

define <16 x i32> @test_llvm_x86_avx512_pmovsxbd(<16 x i8>* %a) {
; X32-LABEL: test_llvm_x86_avx512_pmovsxbd:
; X32:       ## BB#0:
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    vpmovsxbd (%eax), %zmm0
; X32-NEXT:    retl
;
; X64-LABEL: test_llvm_x86_avx512_pmovsxbd:
; X64:       ## BB#0:
; X64-NEXT:    vpmovsxbd (%rdi), %zmm0
; X64-NEXT:    retq
  %1 = load <16 x i8>, <16 x i8>* %a, align 1
  %2 = sext <16 x i8> %1 to <16 x i32>
  ret <16 x i32> %2
}

define <8 x i64> @test_llvm_x86_avx512_pmovsxbq(<16 x i8>* %a) {
; X32-LABEL: test_llvm_x86_avx512_pmovsxbq:
; X32:       ## BB#0:
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    vpmovsxbq (%eax), %zmm0
; X32-NEXT:    retl
;
; X64-LABEL: test_llvm_x86_avx512_pmovsxbq:
; X64:       ## BB#0:
; X64-NEXT:    vpmovsxbq (%rdi), %zmm0
; X64-NEXT:    retq
  %1 = load <16 x i8>, <16 x i8>* %a, align 1
  %2 = shufflevector <16 x i8> %1, <16 x i8> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %3 = sext <8 x i8> %2 to <8 x i64>
  ret <8 x i64> %3
}

define <16 x i32> @test_llvm_x86_avx512_pmovsxwd(<16 x i16>* %a) {
; X32-LABEL: test_llvm_x86_avx512_pmovsxwd:
; X32:       ## BB#0:
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    vpmovsxwd (%eax), %zmm0
; X32-NEXT:    retl
;
; X64-LABEL: test_llvm_x86_avx512_pmovsxwd:
; X64:       ## BB#0:
; X64-NEXT:    vpmovsxwd (%rdi), %zmm0
; X64-NEXT:    retq
  %1 = load <16 x i16>, <16 x i16>* %a, align 1
  %2 = sext <16 x i16> %1 to <16 x i32>
  ret <16 x i32> %2
}

define <8 x i64> @test_llvm_x86_avx512_pmovsxwq(<8 x i16>* %a) {
; X32-LABEL: test_llvm_x86_avx512_pmovsxwq:
; X32:       ## BB#0:
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    vpmovsxwq (%eax), %zmm0
; X32-NEXT:    retl
;
; X64-LABEL: test_llvm_x86_avx512_pmovsxwq:
; X64:       ## BB#0:
; X64-NEXT:    vpmovsxwq (%rdi), %zmm0
; X64-NEXT:    retq
  %1 = load <8 x i16>, <8 x i16>* %a, align 1
  %2 = sext <8 x i16> %1 to <8 x i64>
  ret <8 x i64> %2
}

define <8 x i64> @test_llvm_x86_avx512_pmovsxdq(<8 x i32>* %a) {
; X32-LABEL: test_llvm_x86_avx512_pmovsxdq:
; X32:       ## BB#0:
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    vpmovsxdq (%eax), %zmm0
; X32-NEXT:    retl
;
; X64-LABEL: test_llvm_x86_avx512_pmovsxdq:
; X64:       ## BB#0:
; X64-NEXT:    vpmovsxdq (%rdi), %zmm0
; X64-NEXT:    retq
  %1 = load <8 x i32>, <8 x i32>* %a, align 1
  %2 = sext <8 x i32> %1 to <8 x i64>
  ret <8 x i64> %2
}

define <32 x i16> @test_llvm_x86_avx512_pmovzxbw(<32 x i8>* %a) {
; X32-LABEL: test_llvm_x86_avx512_pmovzxbw:
; X32:       ## BB#0:
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    vpmovzxbw {{.*#+}} zmm0 = mem[0],zero,mem[1],zero,mem[2],zero,mem[3],zero,mem[4],zero,mem[5],zero,mem[6],zero,mem[7],zero,mem[8],zero,mem[9],zero,mem[10],zero,mem[11],zero,mem[12],zero,mem[13],zero,mem[14],zero,mem[15],zero,mem[16],zero,mem[17],zero,mem[18],zero,mem[19],zero,mem[20],zero,mem[21],zero,mem[22],zero,mem[23],zero,mem[24],zero,mem[25],zero,mem[26],zero,mem[27],zero,mem[28],zero,mem[29],zero,mem[30],zero,mem[31],zero
; X32-NEXT:    retl
;
; X64-LABEL: test_llvm_x86_avx512_pmovzxbw:
; X64:       ## BB#0:
; X64-NEXT:    vpmovzxbw {{.*#+}} zmm0 = mem[0],zero,mem[1],zero,mem[2],zero,mem[3],zero,mem[4],zero,mem[5],zero,mem[6],zero,mem[7],zero,mem[8],zero,mem[9],zero,mem[10],zero,mem[11],zero,mem[12],zero,mem[13],zero,mem[14],zero,mem[15],zero,mem[16],zero,mem[17],zero,mem[18],zero,mem[19],zero,mem[20],zero,mem[21],zero,mem[22],zero,mem[23],zero,mem[24],zero,mem[25],zero,mem[26],zero,mem[27],zero,mem[28],zero,mem[29],zero,mem[30],zero,mem[31],zero
; X64-NEXT:    retq
  %1 = load <32 x i8>, <32 x i8>* %a, align 1
  %2 = zext <32 x i8> %1 to <32 x i16>
  ret <32 x i16> %2
}

define <16 x i32> @test_llvm_x86_avx512_pmovzxbd(<16 x i8>* %a) {
; X32-LABEL: test_llvm_x86_avx512_pmovzxbd:
; X32:       ## BB#0:
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    vpmovzxbd {{.*#+}} zmm0 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero,mem[4],zero,zero,zero,mem[5],zero,zero,zero,mem[6],zero,zero,zero,mem[7],zero,zero,zero,mem[8],zero,zero,zero,mem[9],zero,zero,zero,mem[10],zero,zero,zero,mem[11],zero,zero,zero,mem[12],zero,zero,zero,mem[13],zero,zero,zero,mem[14],zero,zero,zero,mem[15],zero,zero,zero
; X32-NEXT:    retl
;
; X64-LABEL: test_llvm_x86_avx512_pmovzxbd:
; X64:       ## BB#0:
; X64-NEXT:    vpmovzxbd {{.*#+}} zmm0 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero,mem[4],zero,zero,zero,mem[5],zero,zero,zero,mem[6],zero,zero,zero,mem[7],zero,zero,zero,mem[8],zero,zero,zero,mem[9],zero,zero,zero,mem[10],zero,zero,zero,mem[11],zero,zero,zero,mem[12],zero,zero,zero,mem[13],zero,zero,zero,mem[14],zero,zero,zero,mem[15],zero,zero,zero
; X64-NEXT:    retq
  %1 = load <16 x i8>, <16 x i8>* %a, align 1
  %2 = zext <16 x i8> %1 to <16 x i32>
  ret <16 x i32> %2
}

define <8 x i64> @test_llvm_x86_avx512_pmovzxbq(<16 x i8>* %a) {
; X32-LABEL: test_llvm_x86_avx512_pmovzxbq:
; X32:       ## BB#0:
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    vmovdqu (%eax), %xmm0
; X32-NEXT:    vpmovzxbq {{.*#+}} zmm0 = xmm0[0],zero,zero,zero,zero,zero,zero,zero,xmm0[1],zero,zero,zero,zero,zero,zero,zero,xmm0[2],zero,zero,zero,zero,zero,zero,zero,xmm0[3],zero,zero,zero,zero,zero,zero,zero,xmm0[4],zero,zero,zero,zero,zero,zero,zero,xmm0[5],zero,zero,zero,zero,zero,zero,zero,xmm0[6],zero,zero,zero,zero,zero,zero,zero,xmm0[7],zero,zero,zero,zero,zero,zero,zero
; X32-NEXT:    retl
;
; X64-LABEL: test_llvm_x86_avx512_pmovzxbq:
; X64:       ## BB#0:
; X64-NEXT:    vmovdqu (%rdi), %xmm0
; X64-NEXT:    vpmovzxbq {{.*#+}} zmm0 = xmm0[0],zero,zero,zero,zero,zero,zero,zero,xmm0[1],zero,zero,zero,zero,zero,zero,zero,xmm0[2],zero,zero,zero,zero,zero,zero,zero,xmm0[3],zero,zero,zero,zero,zero,zero,zero,xmm0[4],zero,zero,zero,zero,zero,zero,zero,xmm0[5],zero,zero,zero,zero,zero,zero,zero,xmm0[6],zero,zero,zero,zero,zero,zero,zero,xmm0[7],zero,zero,zero,zero,zero,zero,zero
; X64-NEXT:    retq
  %1 = load <16 x i8>, <16 x i8>* %a, align 1
  %2 = shufflevector <16 x i8> %1, <16 x i8> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %3 = zext <8 x i8> %2 to <8 x i64>
  ret <8 x i64> %3
}

define <16 x i32> @test_llvm_x86_avx512_pmovzxwd(<16 x i16>* %a) {
; X32-LABEL: test_llvm_x86_avx512_pmovzxwd:
; X32:       ## BB#0:
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    vpmovzxwd {{.*#+}} zmm0 = mem[0],zero,mem[1],zero,mem[2],zero,mem[3],zero,mem[4],zero,mem[5],zero,mem[6],zero,mem[7],zero,mem[8],zero,mem[9],zero,mem[10],zero,mem[11],zero,mem[12],zero,mem[13],zero,mem[14],zero,mem[15],zero
; X32-NEXT:    retl
;
; X64-LABEL: test_llvm_x86_avx512_pmovzxwd:
; X64:       ## BB#0:
; X64-NEXT:    vpmovzxwd {{.*#+}} zmm0 = mem[0],zero,mem[1],zero,mem[2],zero,mem[3],zero,mem[4],zero,mem[5],zero,mem[6],zero,mem[7],zero,mem[8],zero,mem[9],zero,mem[10],zero,mem[11],zero,mem[12],zero,mem[13],zero,mem[14],zero,mem[15],zero
; X64-NEXT:    retq
  %1 = load <16 x i16>, <16 x i16>* %a, align 1
  %2 = zext <16 x i16> %1 to <16 x i32>
  ret <16 x i32> %2
}

define <8 x i64> @test_llvm_x86_avx512_pmovzxwq(<8 x i16>* %a) {
; X32-LABEL: test_llvm_x86_avx512_pmovzxwq:
; X32:       ## BB#0:
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    vpmovzxwq {{.*#+}} zmm0 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero,mem[4],zero,zero,zero,mem[5],zero,zero,zero,mem[6],zero,zero,zero,mem[7],zero,zero,zero
; X32-NEXT:    retl
;
; X64-LABEL: test_llvm_x86_avx512_pmovzxwq:
; X64:       ## BB#0:
; X64-NEXT:    vpmovzxwq {{.*#+}} zmm0 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero,mem[4],zero,zero,zero,mem[5],zero,zero,zero,mem[6],zero,zero,zero,mem[7],zero,zero,zero
; X64-NEXT:    retq
  %1 = load <8 x i16>, <8 x i16>* %a, align 1
  %2 = zext <8 x i16> %1 to <8 x i64>
  ret <8 x i64> %2
}

define <8 x i64> @test_llvm_x86_avx512_pmovzxdq(<8 x i32>* %a) {
; X32-LABEL: test_llvm_x86_avx512_pmovzxdq:
; X32:       ## BB#0:
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    vpmovzxdq {{.*#+}} zmm0 = mem[0],zero,mem[1],zero,mem[2],zero,mem[3],zero,mem[4],zero,mem[5],zero,mem[6],zero,mem[7],zero
; X32-NEXT:    retl
;
; X64-LABEL: test_llvm_x86_avx512_pmovzxdq:
; X64:       ## BB#0:
; X64-NEXT:    vpmovzxdq {{.*#+}} zmm0 = mem[0],zero,mem[1],zero,mem[2],zero,mem[3],zero,mem[4],zero,mem[5],zero,mem[6],zero,mem[7],zero
; X64-NEXT:    retq
  %1 = load <8 x i32>, <8 x i32>* %a, align 1
  %2 = zext <8 x i32> %1 to <8 x i64>
  ret <8 x i64> %2
}
