; ModuleID = 'out_fragmentShader.air'
source_filename = "fragmentShader"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-f80:128:128-n8:16:32"
target triple = "air64-apple-ios11.3.0"

; Function Attrs: norecurse nounwind readnone
define <4 x float> @fragmentShader(<4 x float>, <4 x float>) local_unnamed_addr #0 {
  ret <4 x float> %1
}

attributes #0 = { norecurse nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="true" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="true" "no-jump-tables"="false" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="-fp16" "unsafe-fp-math"="true" "use-soft-float"="false" }

!llvm.ident = !{!0}
!air.version = !{!1}
!air.language_version = !{!2}
!air.compile_options = !{!3, !4, !5, !6}
!air.fragment = !{!7}

!0 = !{!"Apple LLVM version 802.4 (metalfe-802.4.7)"}
!1 = !{i32 2, i32 0, i32 0}
!2 = !{!"Metal", i32 2, i32 0, i32 0}
!3 = !{!"air.compile.denorms_disable"}
!4 = !{!"air.compile.fast_math_enable"}
!5 = !{!"air.compile.framebuffer_fetch_enable"}
!6 = !{!"air.compile.native_double_disable"}
!7 = !{<4 x float> (<4 x float>, <4 x float>)* @fragmentShader, !8, !10}
!8 = !{!9}
!9 = !{!"air.render_target", i32 0, i32 0, !"air.arg_type_name", !"float4"}
!10 = !{!11, !12}
!11 = !{i32 0, !"air.position", !"air.center", !"air.no_perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"clipSpacePosition"}
!12 = !{i32 1, !"air.fragment_input", !"generated(5colorDv4_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"color"}
