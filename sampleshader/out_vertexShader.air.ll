; ModuleID = 'out_vertexShader.air'
source_filename = "vertexShader"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-f80:128:128-n8:16:32"
target triple = "air64-apple-ios11.3.0"

%struct.RasterizerData = type { <4 x float>, <4 x float> }
%struct.AAPLVertex = type { <2 x float>, <4 x float> }

; Function Attrs: nounwind readonly
define %struct.RasterizerData @vertexShader(i32, %struct.AAPLVertex addrspace(2)* nocapture readonly, <2 x i32> addrspace(2)* nocapture readonly) local_unnamed_addr #0 {
  %4 = zext i32 %0 to i64
  %5 = getelementptr inbounds %struct.AAPLVertex, %struct.AAPLVertex addrspace(2)* %1, i64 %4, i32 0
  %6 = load <2 x float>, <2 x float> addrspace(2)* %5, align 16
  %7 = load <2 x i32>, <2 x i32> addrspace(2)* %2, align 8, !tbaa !16
  %8 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %7)
  %9 = fmul fast <2 x float> %6, <float 2.000000e+00, float 2.000000e+00>
  %10 = fdiv fast <2 x float> %9, %8
  %11 = shufflevector <2 x float> %10, <2 x float> undef, <4 x i32> <i32 0, i32 1, i32 undef, i32 undef>
  %12 = shufflevector <4 x float> <float undef, float undef, float 0.000000e+00, float 1.000000e+00>, <4 x float> %11, <4 x i32> <i32 4, i32 5, i32 2, i32 3>
  %13 = getelementptr inbounds %struct.AAPLVertex, %struct.AAPLVertex addrspace(2)* %1, i64 %4, i32 1
  %14 = load <4 x float>, <4 x float> addrspace(2)* %13, align 16, !tbaa !19
  %15 = insertvalue %struct.RasterizerData undef, <4 x float> %12, 0
  %16 = insertvalue %struct.RasterizerData %15, <4 x float> %14, 1
  ret %struct.RasterizerData %16
}

; Function Attrs: nounwind readnone
declare <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32>) local_unnamed_addr #1

attributes #0 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="true" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="true" "no-jump-tables"="false" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="-fp16" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.ident = !{!0}
!air.version = !{!1}
!air.language_version = !{!2}
!air.compile_options = !{!3, !4, !5, !6}
!air.vertex = !{!7}

!0 = !{!"Apple LLVM version 802.4 (metalfe-802.4.7)"}
!1 = !{i32 2, i32 0, i32 0}
!2 = !{!"Metal", i32 2, i32 0, i32 0}
!3 = !{!"air.compile.denorms_disable"}
!4 = !{!"air.compile.fast_math_enable"}
!5 = !{!"air.compile.framebuffer_fetch_enable"}
!6 = !{!"air.compile.native_double_disable"}
!7 = !{%struct.RasterizerData (i32, %struct.AAPLVertex addrspace(2)*, <2 x i32> addrspace(2)*)* @vertexShader, !8, !11}
!8 = !{!9, !10}
!9 = !{!"air.position", !"air.arg_type_name", !"float4", !"air.arg_name", !"clipSpacePosition"}
!10 = !{!"air.vertex_output", !"generated(5colorDv4_f)", !"air.arg_type_name", !"float4", !"air.arg_name", !"color"}
!11 = !{!12, !13, !15}
!12 = !{i32 0, !"air.vertex_id", !"air.arg_type_name", !"uint", !"air.arg_name", !"vertexID"}
!13 = !{i32 1, !"air.buffer", !"air.location_index", i32 0, i32 1, !"air.read", !"air.struct_type_info", !14, !"air.arg_type_size", i32 32, !"air.arg_type_align_size", i32 16, !"air.arg_type_name", !"AAPLVertex", !"air.arg_name", !"vertices"}
!14 = !{i32 0, i32 8, i32 0, !"float2", !"position", i32 16, i32 16, i32 0, !"float4", !"color"}
!15 = !{i32 2, !"air.buffer", !"air.location_index", i32 1, i32 1, !"air.read", !"air.arg_type_size", i32 8, !"air.arg_type_align_size", i32 8, !"air.arg_type_name", !"uint2", !"air.arg_name", !"viewportSizePointer"}
!16 = !{!17, !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = !{!20, !17, i64 16}
!20 = !{!"_ZTS10AAPLVertex", !17, i64 0, !17, i64 16}
