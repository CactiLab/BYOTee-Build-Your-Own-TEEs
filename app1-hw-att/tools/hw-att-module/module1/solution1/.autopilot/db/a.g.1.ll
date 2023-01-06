; ModuleID = '/home/safayat/BYOTee/BYOTee-Build-Your-Own-TEEs/app1-hw-att/tools/hw-att-module/module1/solution1/.autopilot/db/a.g.1.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.blake2s_state.0 = type { [8 x i32], [2 x i32], [2 x i32], [64 x i8], i64, i8 }

@blake2s_sigma = internal unnamed_addr constant [10 x [8 x i8]] [[8 x i8] c"\01#Eg\89\AB\CD\EF", [8 x i8] c"\EAH\9F\D6\1C\02\B7S", [8 x i8] c"\B8\C0R\FD\AE6q\94", [8 x i8] c"y1\DC\BE&Z@\F8", [8 x i8] c"\90W$\AF\E1\BCh=", [8 x i8] c",j\0B\83Mu\FE\19", [8 x i8] c"\C5\1F\EDJ\07c\92\8B", [8 x i8] c"\DB~\C19P\F4\86*", [8 x i8] c"o\E9\B3\08\C2\D7\14\A5", [8 x i8] c"\A2\84v\15\FB\9E<\D0"], align 16 ; [#uses=1 type=[10 x [8 x i8]]*]
@blake2s_IV = internal unnamed_addr constant [8 x i32] [i32 1779033703, i32 -1150833019, i32 1013904242, i32 -1521486534, i32 1359893119, i32 -1694144372, i32 528734635, i32 1541459225], align 16 ; [#uses=1 type=[8 x i32]*]
@blake2s.str = internal unnamed_addr constant [8 x i8] c"blake2s\00" ; [#uses=1 type=[8 x i8]*]

; [#uses=4]
define internal fastcc i32 @rotr32(i32 %w, i32 %c) nounwind uwtable inlinehint {
  call void @llvm.dbg.value(metadata !{i32 %w}, i64 0, metadata !137), !dbg !138 ; [debug line = 98:46] [debug variable = w]
  call void @llvm.dbg.value(metadata !{i32 %c}, i64 0, metadata !139), !dbg !140 ; [debug line = 98:64] [debug variable = c]
  %tmp = lshr i32 %w, %c, !dbg !141               ; [#uses=1 type=i32] [debug line = 100:5]
  %tmp.1 = sub i32 32, %c, !dbg !141              ; [#uses=1 type=i32] [debug line = 100:5]
  %tmp.2 = shl i32 %w, %tmp.1, !dbg !141          ; [#uses=1 type=i32] [debug line = 100:5]
  %tmp.3 = or i32 %tmp.2, %tmp, !dbg !141         ; [#uses=1 type=i32] [debug line = 100:5]
  ret i32 %tmp.3, !dbg !141                       ; [debug line = 100:5]
}

; [#uses=1]
define internal fastcc void @memcpy_hls(i8* %dest, i8* %src) nounwind uwtable {
  call void @llvm.dbg.value(metadata !{i8* %dest}, i64 0, metadata !143), !dbg !144 ; [debug line = 11:19] [debug variable = dest]
  call void @llvm.dbg.value(metadata !{i8* %src}, i64 0, metadata !145), !dbg !146 ; [debug line = 11:37] [debug variable = src]
  call void @llvm.dbg.value(metadata !{i8* %dest}, i64 0, metadata !147), !dbg !151 ; [debug line = 13:17] [debug variable = d]
  call void @llvm.dbg.value(metadata !{i8* %src}, i64 0, metadata !152), !dbg !155 ; [debug line = 14:22] [debug variable = s]
  br label %1, !dbg !156                          ; [debug line = 15:3]

; <label>:1                                       ; preds = %2, %0
  %.0 = phi i64 [ 32, %0 ], [ %len.assign, %2 ]   ; [#uses=2 type=i64]
  %d.0.rec = phi i64 [ 0, %0 ], [ %.rec, %2 ]     ; [#uses=3 type=i64]
  %src.addr = getelementptr i8* %src, i64 %d.0.rec ; [#uses=1 type=i8*]
  %dest.addr = getelementptr i8* %dest, i64 %d.0.rec ; [#uses=1 type=i8*]
  %len.assign = add i64 %.0, -1, !dbg !156        ; [#uses=1 type=i64] [debug line = 15:3]
  call void @llvm.dbg.value(metadata !{i64 %len.assign}, i64 0, metadata !157), !dbg !156 ; [debug line = 15:3] [debug variable = len]
  %tmp = icmp eq i64 %.0, 0, !dbg !156            ; [#uses=1 type=i1] [debug line = 15:3]
  br i1 %tmp, label %3, label %2, !dbg !156       ; [debug line = 15:3]

; <label>:2                                       ; preds = %1
  %.rec = add i64 %d.0.rec, 1, !dbg !158          ; [#uses=1 type=i64] [debug line = 16:5]
  %src.load = load i8* %src.addr, align 1, !dbg !158 ; [#uses=1 type=i8] [debug line = 16:5]
  store i8 %src.load, i8* %dest.addr, align 1, !dbg !158 ; [debug line = 16:5]
  br label %1, !dbg !158                          ; [debug line = 16:5]

; <label>:3                                       ; preds = %1
  ret void
}

; [#uses=1]
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

; [#uses=1]
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

; [#uses=37]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=2]
declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

; [#uses=1]
define internal fastcc void @blake2s_set_lastnode(%struct.blake2s_state.0* %S) nounwind uwtable {
  call void @llvm.dbg.value(metadata !{%struct.blake2s_state.0* %S}, i64 0, metadata !159), !dbg !160 ; [debug line = 110:49] [debug variable = S]
  %S.addr = getelementptr inbounds %struct.blake2s_state.0* %S, i64 0, i32 2, i64 1, !dbg !161 ; [#uses=1 type=i32*] [debug line = 112:5]
  store i32 -1, i32* %S.addr, align 4, !dbg !161  ; [debug line = 112:5]
  ret void, !dbg !163                             ; [debug line = 113:1]
}

; [#uses=1]
define internal fastcc void @blake2s_set_lastblock(%struct.blake2s_state.0* %S) nounwind uwtable {
  call void @llvm.dbg.value(metadata !{%struct.blake2s_state.0* %S}, i64 0, metadata !164), !dbg !165 ; [debug line = 120:50] [debug variable = S]
  %S.addr = getelementptr inbounds %struct.blake2s_state.0* %S, i64 0, i32 5, !dbg !166 ; [#uses=1 type=i8*] [debug line = 122:5]
  %S.load = load i8* %S.addr, align 1, !dbg !166  ; [#uses=2 type=i8] [debug line = 122:5]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i8 %S.load) nounwind
  %tmp = icmp eq i8 %S.load, 0, !dbg !166         ; [#uses=1 type=i1] [debug line = 122:5]
  br i1 %tmp, label %._crit_edge, label %1, !dbg !166 ; [debug line = 122:5]

; <label>:1                                       ; preds = %0
  call fastcc void @blake2s_set_lastnode(%struct.blake2s_state.0* %S), !dbg !168 ; [debug line = 123:9]
  br label %._crit_edge, !dbg !168                ; [debug line = 123:9]

._crit_edge:                                      ; preds = %1, %0
  %S.addr.1 = getelementptr inbounds %struct.blake2s_state.0* %S, i64 0, i32 2, i64 0, !dbg !169 ; [#uses=1 type=i32*] [debug line = 125:5]
  store i32 -1, i32* %S.addr.1, align 4, !dbg !169 ; [debug line = 125:5]
  ret void, !dbg !170                             ; [debug line = 126:1]
}

; [#uses=2]
define internal fastcc void @blake2s_set_IV(i32* %buf) nounwind uwtable {
  call void @llvm.dbg.value(metadata !{i32* %buf}, i64 0, metadata !171), !dbg !172 ; [debug line = 137:38] [debug variable = buf]
  br label %1, !dbg !173                          ; [debug line = 139:22]

; <label>:1                                       ; preds = %2, %0
  %i = phi i64 [ 0, %0 ], [ %i.1, %2 ]            ; [#uses=4 type=i64]
  %tmp = icmp eq i64 %i, 8, !dbg !173             ; [#uses=1 type=i1] [debug line = 139:22]
  br i1 %tmp, label %3, label %2, !dbg !173       ; [debug line = 139:22]

; <label>:2                                       ; preds = %1
  %blake2s_IV.addr = getelementptr inbounds [8 x i32]* @blake2s_IV, i64 0, i64 %i, !dbg !176 ; [#uses=1 type=i32*] [debug line = 141:9]
  %blake2s_IV.load = load i32* %blake2s_IV.addr, align 4, !dbg !176 ; [#uses=2 type=i32] [debug line = 141:9]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blake2s_IV.load) nounwind
  %buf.addr = getelementptr inbounds i32* %buf, i64 %i, !dbg !176 ; [#uses=1 type=i32*] [debug line = 141:9]
  store i32 %blake2s_IV.load, i32* %buf.addr, align 4, !dbg !176 ; [debug line = 141:9]
  %i.1 = add i64 %i, 1, !dbg !178                 ; [#uses=1 type=i64] [debug line = 139:31]
  call void @llvm.dbg.value(metadata !{i64 %i.1}, i64 0, metadata !179), !dbg !178 ; [debug line = 139:31] [debug variable = i]
  br label %1, !dbg !178                          ; [debug line = 139:31]

; <label>:3                                       ; preds = %1
  ret void, !dbg !180                             ; [debug line = 143:1]
}

; [#uses=1]
define internal fastcc void @blake2s_round(i64 %r, i32* %m, i32* %v) nounwind uwtable {
  call void @llvm.dbg.value(metadata !{i64 %r}, i64 0, metadata !181), !dbg !182 ; [debug line = 158:34] [debug variable = r]
  call void @llvm.dbg.value(metadata !{i32* %m}, i64 0, metadata !183), !dbg !184 ; [debug line = 158:52] [debug variable = m]
  call void @llvm.dbg.value(metadata !{i32* %v}, i64 0, metadata !185), !dbg !186 ; [debug line = 158:68] [debug variable = v]
  call void (...)* @_ssdm_SpecArrayDimSize(i32* %v, i32 16) nounwind, !dbg !187 ; [debug line = 159:2]
  call void (...)* @_ssdm_SpecArrayDimSize(i32* %m, i32 16) nounwind, !dbg !189 ; [debug line = 159:31]
  br label %1, !dbg !190                          ; [debug line = 160:22]

; <label>:1                                       ; preds = %2, %0
  %i = phi i64 [ 0, %0 ], [ %i.2, %2 ]            ; [#uses=8 type=i64]
  %tmp = icmp eq i64 %i, 8, !dbg !190             ; [#uses=1 type=i1] [debug line = 160:22]
  br i1 %tmp, label %3, label %2, !dbg !190       ; [debug line = 160:22]

; <label>:2                                       ; preds = %1
  %bit4 = lshr i64 %i, 2, !dbg !192               ; [#uses=1 type=i64] [debug line = 162:28]
  call void @llvm.dbg.value(metadata !{i64 %bit4}, i64 0, metadata !194), !dbg !192 ; [debug line = 162:28] [debug variable = bit4]
  %tmp.5 = and i64 %i, 3, !dbg !195               ; [#uses=1 type=i64] [debug line = 174:42]
  %a = getelementptr inbounds i32* %v, i64 %tmp.5, !dbg !195 ; [#uses=4 type=i32*] [debug line = 174:42]
  call void @llvm.dbg.value(metadata !{i32* %a}, i64 0, metadata !196), !dbg !195 ; [debug line = 174:42] [debug variable = a]
  %tmp.6 = add i64 %bit4, %i, !dbg !197           ; [#uses=2 type=i64] [debug line = 175:49]
  %tmp.7 = and i64 %tmp.6, 3, !dbg !197           ; [#uses=1 type=i64] [debug line = 175:49]
  %tmp.8 = or i64 %tmp.7, 4, !dbg !197            ; [#uses=1 type=i64] [debug line = 175:49]
  %b = getelementptr inbounds i32* %v, i64 %tmp.8, !dbg !197 ; [#uses=5 type=i32*] [debug line = 175:49]
  call void @llvm.dbg.value(metadata !{i32* %b}, i64 0, metadata !198), !dbg !197 ; [debug line = 175:49] [debug variable = b]
  %tmp.9 = lshr i64 %i, 1, !dbg !199              ; [#uses=1 type=i64] [debug line = 176:49]
  %tmp.10 = and i64 %tmp.9, 2, !dbg !199          ; [#uses=2 type=i64] [debug line = 176:49]
  %tmp.11 = add i64 %tmp.10, %i, !dbg !199        ; [#uses=1 type=i64] [debug line = 176:49]
  %tmp.12 = and i64 %tmp.11, 3, !dbg !199         ; [#uses=1 type=i64] [debug line = 176:49]
  %tmp.13 = or i64 %tmp.12, 8, !dbg !199          ; [#uses=1 type=i64] [debug line = 176:49]
  %c = getelementptr inbounds i32* %v, i64 %tmp.13, !dbg !199 ; [#uses=4 type=i32*] [debug line = 176:49]
  call void @llvm.dbg.value(metadata !{i32* %c}, i64 0, metadata !200), !dbg !199 ; [debug line = 176:49] [debug variable = c]
  %tmp.14 = add i64 %tmp.6, %tmp.10, !dbg !201    ; [#uses=1 type=i64] [debug line = 177:57]
  %tmp.15 = and i64 %tmp.14, 3, !dbg !201         ; [#uses=1 type=i64] [debug line = 177:57]
  %tmp.16 = or i64 %tmp.15, 12, !dbg !201         ; [#uses=1 type=i64] [debug line = 177:57]
  %d = getelementptr inbounds i32* %v, i64 %tmp.16, !dbg !201 ; [#uses=4 type=i32*] [debug line = 177:57]
  call void @llvm.dbg.value(metadata !{i32* %d}, i64 0, metadata !202), !dbg !201 ; [debug line = 177:57] [debug variable = d]
  %blake2s_sigma.addr = getelementptr inbounds [10 x [8 x i8]]* @blake2s_sigma, i64 0, i64 %r, i64 %i, !dbg !203 ; [#uses=1 type=i8*] [debug line = 179:50]
  %sigma = load i8* %blake2s_sigma.addr, align 1, !dbg !203 ; [#uses=2 type=i8] [debug line = 179:50]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i8 %sigma) nounwind
  call void @llvm.dbg.value(metadata !{i8 %sigma}, i64 0, metadata !204), !dbg !203 ; [debug line = 179:50] [debug variable = sigma]
  %tmp.17 = zext i8 %sigma to i32, !dbg !205      ; [#uses=2 type=i32] [debug line = 180:36]
  %tmp.18 = lshr i32 %tmp.17, 4, !dbg !205        ; [#uses=1 type=i32] [debug line = 180:36]
  %tmp.19 = zext i32 %tmp.18 to i64, !dbg !205    ; [#uses=1 type=i64] [debug line = 180:36]
  %m.addr = getelementptr inbounds i32* %m, i64 %tmp.19, !dbg !205 ; [#uses=1 type=i32*] [debug line = 180:36]
  %m1 = load i32* %m.addr, align 4, !dbg !205     ; [#uses=2 type=i32] [debug line = 180:36]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %m1) nounwind
  call void @llvm.dbg.value(metadata !{i32 %m1}, i64 0, metadata !206), !dbg !205 ; [debug line = 180:36] [debug variable = m1]
  %tmp.20 = and i32 %tmp.17, 15, !dbg !207        ; [#uses=1 type=i32] [debug line = 181:37]
  %tmp.21 = zext i32 %tmp.20 to i64, !dbg !207    ; [#uses=1 type=i64] [debug line = 181:37]
  %m.addr.1 = getelementptr inbounds i32* %m, i64 %tmp.21, !dbg !207 ; [#uses=1 type=i32*] [debug line = 181:37]
  %m2 = load i32* %m.addr.1, align 4, !dbg !207   ; [#uses=2 type=i32] [debug line = 181:37]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %m2) nounwind
  call void @llvm.dbg.value(metadata !{i32 %m2}, i64 0, metadata !208), !dbg !207 ; [debug line = 181:37] [debug variable = m2]
  %a.load = load i32* %a, align 4, !dbg !209      ; [#uses=2 type=i32] [debug line = 183:9]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %a.load) nounwind
  %b.load = load i32* %b, align 4, !dbg !209      ; [#uses=2 type=i32] [debug line = 183:9]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %b.load) nounwind
  %tmp.22 = add i32 %a.load, %m1, !dbg !209       ; [#uses=1 type=i32] [debug line = 183:9]
  %tmp.23 = add i32 %tmp.22, %b.load, !dbg !209   ; [#uses=3 type=i32] [debug line = 183:9]
  store i32 %tmp.23, i32* %a, align 4, !dbg !209  ; [debug line = 183:9]
  %d.load = load i32* %d, align 4, !dbg !210      ; [#uses=2 type=i32] [debug line = 184:14]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %d.load) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %tmp.23) nounwind
  %tmp.24 = xor i32 %d.load, %tmp.23, !dbg !210   ; [#uses=1 type=i32] [debug line = 184:14]
  %tmp.25 = call fastcc i32 @rotr32(i32 %tmp.24, i32 16), !dbg !210 ; [#uses=3 type=i32] [debug line = 184:14]
  store i32 %tmp.25, i32* %d, align 4, !dbg !210  ; [debug line = 184:14]
  %c.load = load i32* %c, align 4, !dbg !211      ; [#uses=2 type=i32] [debug line = 185:9]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %c.load) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %tmp.25) nounwind
  %tmp.26 = add i32 %c.load, %tmp.25, !dbg !211   ; [#uses=3 type=i32] [debug line = 185:9]
  store i32 %tmp.26, i32* %c, align 4, !dbg !211  ; [debug line = 185:9]
  %b.load.1 = load i32* %b, align 4, !dbg !212    ; [#uses=2 type=i32] [debug line = 186:14]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %b.load.1) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %tmp.26) nounwind
  %tmp.27 = xor i32 %b.load.1, %tmp.26, !dbg !212 ; [#uses=1 type=i32] [debug line = 186:14]
  %tmp.28 = call fastcc i32 @rotr32(i32 %tmp.27, i32 12), !dbg !212 ; [#uses=3 type=i32] [debug line = 186:14]
  store i32 %tmp.28, i32* %b, align 4, !dbg !212  ; [debug line = 186:14]
  %a.load.1 = load i32* %a, align 4, !dbg !213    ; [#uses=2 type=i32] [debug line = 187:9]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %a.load.1) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %tmp.28) nounwind
  %tmp.29 = add i32 %tmp.28, %m2, !dbg !213       ; [#uses=1 type=i32] [debug line = 187:9]
  %tmp.30 = add i32 %tmp.29, %a.load.1, !dbg !213 ; [#uses=3 type=i32] [debug line = 187:9]
  store i32 %tmp.30, i32* %a, align 4, !dbg !213  ; [debug line = 187:9]
  %d.load.1 = load i32* %d, align 4, !dbg !214    ; [#uses=2 type=i32] [debug line = 188:14]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %d.load.1) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %tmp.30) nounwind
  %tmp.31 = xor i32 %d.load.1, %tmp.30, !dbg !214 ; [#uses=1 type=i32] [debug line = 188:14]
  %tmp.32 = call fastcc i32 @rotr32(i32 %tmp.31, i32 8), !dbg !214 ; [#uses=3 type=i32] [debug line = 188:14]
  store i32 %tmp.32, i32* %d, align 4, !dbg !214  ; [debug line = 188:14]
  %c.load.1 = load i32* %c, align 4, !dbg !215    ; [#uses=2 type=i32] [debug line = 189:9]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %c.load.1) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %tmp.32) nounwind
  %tmp.33 = add i32 %c.load.1, %tmp.32, !dbg !215 ; [#uses=3 type=i32] [debug line = 189:9]
  store i32 %tmp.33, i32* %c, align 4, !dbg !215  ; [debug line = 189:9]
  %b.load.2 = load i32* %b, align 4, !dbg !216    ; [#uses=2 type=i32] [debug line = 190:14]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %b.load.2) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %tmp.33) nounwind
  %tmp.34 = xor i32 %b.load.2, %tmp.33, !dbg !216 ; [#uses=1 type=i32] [debug line = 190:14]
  %tmp.35 = call fastcc i32 @rotr32(i32 %tmp.34, i32 7), !dbg !216 ; [#uses=1 type=i32] [debug line = 190:14]
  store i32 %tmp.35, i32* %b, align 4, !dbg !216  ; [debug line = 190:14]
  %i.2 = add i64 %i, 1, !dbg !217                 ; [#uses=1 type=i64] [debug line = 160:31]
  call void @llvm.dbg.value(metadata !{i64 %i.2}, i64 0, metadata !218), !dbg !217 ; [debug line = 160:31] [debug variable = i]
  br label %1, !dbg !217                          ; [debug line = 160:31]

; <label>:3                                       ; preds = %1
  ret void, !dbg !219                             ; [debug line = 192:1]
}

; [#uses=1]
define internal fastcc void @blake2s_init(%struct.blake2s_state.0* %S) nounwind uwtable {
  call void @llvm.dbg.value(metadata !{%struct.blake2s_state.0* %S}, i64 0, metadata !220), !dbg !221 ; [debug line = 146:40] [debug variable = S]
  %S.addr = getelementptr %struct.blake2s_state.0* %S, i32 0, i32 0, !dbg !222 ; [#uses=1 type=[8 x i32]*] [debug line = 148:5]
  %tmp = bitcast [8 x i32]* %S.addr to i8*, !dbg !222 ; [#uses=1 type=i8*] [debug line = 148:5]
  call void @llvm.memset.p0i8.i64(i8* %tmp, i8 0, i64 128, i32 8, i1 false), !dbg !222 ; [debug line = 148:5]
  %S.addr.2 = getelementptr inbounds %struct.blake2s_state.0* %S, i64 0, i32 0, i64 0, !dbg !224 ; [#uses=3 type=i32*] [debug line = 150:5]
  call fastcc void @blake2s_set_IV(i32* %S.addr.2), !dbg !224 ; [debug line = 150:5]
  %S.load = load i32* %S.addr.2, align 4, !dbg !225 ; [#uses=2 type=i32] [debug line = 153:5]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %S.load) nounwind
  %tmp.37 = xor i32 %S.load, 16842784, !dbg !225  ; [#uses=1 type=i32] [debug line = 153:5]
  store i32 %tmp.37, i32* %S.addr.2, align 4, !dbg !225 ; [debug line = 153:5]
  ret void
}

; [#uses=1]
define internal fastcc void @blake2s_increment_counter(%struct.blake2s_state.0* %S) nounwind uwtable {
  call void @llvm.dbg.value(metadata !{%struct.blake2s_state.0* %S}, i64 0, metadata !226), !dbg !227 ; [debug line = 128:54] [debug variable = S]
  %S.addr = getelementptr inbounds %struct.blake2s_state.0* %S, i64 0, i32 1, i64 0, !dbg !228 ; [#uses=2 type=i32*] [debug line = 130:5]
  %S.load = load i32* %S.addr, align 4, !dbg !228 ; [#uses=2 type=i32] [debug line = 130:5]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %S.load) nounwind
  %tmp = add i32 %S.load, 64, !dbg !228           ; [#uses=1 type=i32] [debug line = 130:5]
  store i32 %tmp, i32* %S.addr, align 4, !dbg !228 ; [debug line = 130:5]
  ret void, !dbg !230                             ; [debug line = 135:1]
}

; [#uses=1]
define internal fastcc void @blake2s_final(%struct.blake2s_state.0* %S, i8* %out) nounwind uwtable {
  call void @llvm.dbg.value(metadata !{%struct.blake2s_state.0* %S}, i64 0, metadata !231), !dbg !232 ; [debug line = 259:41] [debug variable = S]
  call void @llvm.dbg.value(metadata !{i8* %out}, i64 0, metadata !233), !dbg !234 ; [debug line = 259:50] [debug variable = out]
  %S.addr = getelementptr %struct.blake2s_state.0* %S, i32 0, i32 0, !dbg !235 ; [#uses=1 type=[8 x i32]*] [debug line = 272:5]
  %tmp = bitcast [8 x i32]* %S.addr to i8*, !dbg !235 ; [#uses=1 type=i8*] [debug line = 272:5]
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %out, i8* %tmp, i64 32, i32 1, i1 false), !dbg !235 ; [debug line = 272:5]
  ret void
}

; [#uses=2]
define internal fastcc void @blake2s_compress(%struct.blake2s_state.0* %S, i8* %in) nounwind uwtable {
  %v = alloca [16 x i32], align 16                ; [#uses=9 type=[16 x i32]*]
  call void @llvm.dbg.value(metadata !{%struct.blake2s_state.0* %S}, i64 0, metadata !237), !dbg !238 ; [debug line = 194:45] [debug variable = S]
  call void @llvm.dbg.value(metadata !{i8* %in}, i64 0, metadata !239), !dbg !240 ; [debug line = 194:62] [debug variable = in]
  call void (...)* @_ssdm_SpecArrayDimSize(i8* %in, i32 64) nounwind, !dbg !241 ; [debug line = 195:2]
  %m = bitcast i8* %in to i32*, !dbg !243         ; [#uses=1 type=i32*] [debug line = 198:28]
  call void @llvm.dbg.value(metadata !{i32* %m}, i64 0, metadata !244), !dbg !243 ; [debug line = 198:28] [debug variable = m]
  call void @llvm.dbg.declare(metadata !{[16 x i32]* %v}, metadata !245), !dbg !249 ; [debug line = 204:14] [debug variable = v]
  %tmp = bitcast [16 x i32]* %v to i8*, !dbg !250 ; [#uses=1 type=i8*] [debug line = 205:5]
  %S.addr = getelementptr %struct.blake2s_state.0* %S, i32 0, i32 0, !dbg !250 ; [#uses=1 type=[8 x i32]*] [debug line = 205:5]
  %tmp.38 = bitcast [8 x i32]* %S.addr to i8*, !dbg !250 ; [#uses=1 type=i8*] [debug line = 205:5]
  call fastcc void @memcpy_hls(i8* %tmp, i8* %tmp.38), !dbg !250 ; [debug line = 205:5]
  %v.addr = getelementptr inbounds [16 x i32]* %v, i64 0, i64 8, !dbg !251 ; [#uses=1 type=i32*] [debug line = 207:5]
  call fastcc void @blake2s_set_IV(i32* %v.addr), !dbg !251 ; [debug line = 207:5]
  %S.addr.3 = getelementptr inbounds %struct.blake2s_state.0* %S, i64 0, i32 1, i64 0, !dbg !252 ; [#uses=1 type=i32*] [debug line = 208:5]
  %S.load = load i32* %S.addr.3, align 4, !dbg !252 ; [#uses=2 type=i32] [debug line = 208:5]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %S.load) nounwind
  %v.addr.1 = getelementptr inbounds [16 x i32]* %v, i64 0, i64 12, !dbg !252 ; [#uses=2 type=i32*] [debug line = 208:5]
  %v.load = load i32* %v.addr.1, align 16, !dbg !252 ; [#uses=2 type=i32] [debug line = 208:5]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %v.load) nounwind
  %tmp.39 = xor i32 %v.load, %S.load, !dbg !252   ; [#uses=1 type=i32] [debug line = 208:5]
  store i32 %tmp.39, i32* %v.addr.1, align 16, !dbg !252 ; [debug line = 208:5]
  %S.addr.4 = getelementptr inbounds %struct.blake2s_state.0* %S, i64 0, i32 1, i64 1, !dbg !253 ; [#uses=1 type=i32*] [debug line = 209:5]
  %S.load.1 = load i32* %S.addr.4, align 4, !dbg !253 ; [#uses=2 type=i32] [debug line = 209:5]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %S.load.1) nounwind
  %v.addr.2 = getelementptr inbounds [16 x i32]* %v, i64 0, i64 13, !dbg !253 ; [#uses=2 type=i32*] [debug line = 209:5]
  %v.load.1 = load i32* %v.addr.2, align 4, !dbg !253 ; [#uses=2 type=i32] [debug line = 209:5]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %v.load.1) nounwind
  %tmp.40 = xor i32 %v.load.1, %S.load.1, !dbg !253 ; [#uses=1 type=i32] [debug line = 209:5]
  store i32 %tmp.40, i32* %v.addr.2, align 4, !dbg !253 ; [debug line = 209:5]
  %S.addr.5 = getelementptr inbounds %struct.blake2s_state.0* %S, i64 0, i32 2, i64 0, !dbg !254 ; [#uses=1 type=i32*] [debug line = 210:5]
  %S.load.2 = load i32* %S.addr.5, align 4, !dbg !254 ; [#uses=2 type=i32] [debug line = 210:5]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %S.load.2) nounwind
  %v.addr.3 = getelementptr inbounds [16 x i32]* %v, i64 0, i64 14, !dbg !254 ; [#uses=2 type=i32*] [debug line = 210:5]
  %v.load.2 = load i32* %v.addr.3, align 8, !dbg !254 ; [#uses=2 type=i32] [debug line = 210:5]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %v.load.2) nounwind
  %tmp.41 = xor i32 %v.load.2, %S.load.2, !dbg !254 ; [#uses=1 type=i32] [debug line = 210:5]
  store i32 %tmp.41, i32* %v.addr.3, align 8, !dbg !254 ; [debug line = 210:5]
  %S.addr.6 = getelementptr inbounds %struct.blake2s_state.0* %S, i64 0, i32 2, i64 1, !dbg !255 ; [#uses=1 type=i32*] [debug line = 211:5]
  %S.load.3 = load i32* %S.addr.6, align 4, !dbg !255 ; [#uses=2 type=i32] [debug line = 211:5]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %S.load.3) nounwind
  %v.addr.4 = getelementptr inbounds [16 x i32]* %v, i64 0, i64 15, !dbg !255 ; [#uses=2 type=i32*] [debug line = 211:5]
  %v.load.3 = load i32* %v.addr.4, align 4, !dbg !255 ; [#uses=2 type=i32] [debug line = 211:5]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %v.load.3) nounwind
  %tmp.42 = xor i32 %v.load.3, %S.load.3, !dbg !255 ; [#uses=1 type=i32] [debug line = 211:5]
  store i32 %tmp.42, i32* %v.addr.4, align 4, !dbg !255 ; [debug line = 211:5]
  %v.addr.5 = getelementptr inbounds [16 x i32]* %v, i64 0, i64 0, !dbg !256 ; [#uses=1 type=i32*] [debug line = 215:9]
  br label %1, !dbg !259                          ; [debug line = 213:22]

; <label>:1                                       ; preds = %2, %0
  %r = phi i64 [ 0, %0 ], [ %r.1, %2 ]            ; [#uses=3 type=i64]
  %tmp.43 = icmp eq i64 %r, 10, !dbg !259         ; [#uses=1 type=i1] [debug line = 213:22]
  br i1 %tmp.43, label %.preheader.preheader, label %2, !dbg !259 ; [debug line = 213:22]

.preheader.preheader:                             ; preds = %1
  br label %.preheader, !dbg !260                 ; [debug line = 218:22]

; <label>:2                                       ; preds = %1
  call fastcc void @blake2s_round(i64 %r, i32* %m, i32* %v.addr.5), !dbg !256 ; [debug line = 215:9]
  %r.1 = add i64 %r, 1, !dbg !262                 ; [#uses=1 type=i64] [debug line = 213:32]
  call void @llvm.dbg.value(metadata !{i64 %r.1}, i64 0, metadata !263), !dbg !262 ; [debug line = 213:32] [debug variable = r]
  br label %1, !dbg !262                          ; [debug line = 213:32]

.preheader:                                       ; preds = %3, %.preheader.preheader
  %i = phi i64 [ %i.3, %3 ], [ 0, %.preheader.preheader ] ; [#uses=5 type=i64]
  %tmp.45 = icmp eq i64 %i, 8, !dbg !260          ; [#uses=1 type=i1] [debug line = 218:22]
  br i1 %tmp.45, label %4, label %3, !dbg !260    ; [debug line = 218:22]

; <label>:3                                       ; preds = %.preheader
  %S.addr.7 = getelementptr inbounds %struct.blake2s_state.0* %S, i64 0, i32 0, i64 %i, !dbg !264 ; [#uses=2 type=i32*] [debug line = 220:9]
  %S.load.4 = load i32* %S.addr.7, align 4, !dbg !264 ; [#uses=2 type=i32] [debug line = 220:9]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %S.load.4) nounwind
  %v.addr.6 = getelementptr inbounds [16 x i32]* %v, i64 0, i64 %i, !dbg !264 ; [#uses=1 type=i32*] [debug line = 220:9]
  %v.load.4 = load i32* %v.addr.6, align 4, !dbg !264 ; [#uses=2 type=i32] [debug line = 220:9]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %v.load.4) nounwind
  %tmp.46 = add i64 %i, 8, !dbg !264              ; [#uses=1 type=i64] [debug line = 220:9]
  %v.addr.7 = getelementptr inbounds [16 x i32]* %v, i64 0, i64 %tmp.46, !dbg !264 ; [#uses=1 type=i32*] [debug line = 220:9]
  %v.load.5 = load i32* %v.addr.7, align 4, !dbg !264 ; [#uses=2 type=i32] [debug line = 220:9]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %v.load.5) nounwind
  %tmp.47 = xor i32 %v.load.4, %S.load.4, !dbg !264 ; [#uses=1 type=i32] [debug line = 220:9]
  %tmp.48 = xor i32 %tmp.47, %v.load.5, !dbg !264 ; [#uses=1 type=i32] [debug line = 220:9]
  store i32 %tmp.48, i32* %S.addr.7, align 4, !dbg !264 ; [debug line = 220:9]
  %i.3 = add i64 %i, 1, !dbg !266                 ; [#uses=1 type=i64] [debug line = 218:31]
  call void @llvm.dbg.value(metadata !{i64 %i.3}, i64 0, metadata !267), !dbg !266 ; [debug line = 218:31] [debug variable = i]
  br label %.preheader, !dbg !266                 ; [debug line = 218:31]

; <label>:4                                       ; preds = %.preheader
  ret void, !dbg !268                             ; [debug line = 222:1]
}

; [#uses=0]
define i32 @blake2s(i8* %out, i8* %in, i64 %inlen) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap(i32 0) nounwind, !map !269
  call void (...)* @_ssdm_op_SpecTopModule([8 x i8]* @blake2s.str) nounwind
  %S = alloca [1 x %struct.blake2s_state.0], align 16 ; [#uses=1 type=[1 x %struct.blake2s_state.0]*]
  call void @llvm.dbg.value(metadata !{i8* %out}, i64 0, metadata !275), !dbg !276 ; [debug line = 276:19] [debug variable = out]
  call void @llvm.dbg.value(metadata !{i8* %in}, i64 0, metadata !277), !dbg !278 ; [debug line = 276:36] [debug variable = in]
  call void @llvm.dbg.value(metadata !{i64 %inlen}, i64 0, metadata !279), !dbg !280 ; [debug line = 276:47] [debug variable = inlen]
  call void @llvm.dbg.declare(metadata !{[1 x %struct.blake2s_state.0]* %S}, metadata !281), !dbg !286 ; [debug line = 278:19] [debug variable = S]
  %S.addr = getelementptr inbounds [1 x %struct.blake2s_state.0]* %S, i64 0, i64 0, !dbg !287 ; [#uses=6 type=%struct.blake2s_state.0*] [debug line = 288:20]
  call fastcc void @blake2s_init(%struct.blake2s_state.0* %S.addr), !dbg !287 ; [debug line = 288:20]
  call void @llvm.dbg.value(metadata !{i8* %in}, i64 0, metadata !288), !dbg !290 ; [debug line = 307:34] [debug variable = inbuf]
  %.sum = add i64 %inlen, -64, !dbg !291          ; [#uses=2 type=i64] [debug line = 308:52]
  %inend = getelementptr inbounds i8* %in, i64 %.sum, !dbg !291 ; [#uses=1 type=i8*] [debug line = 308:52]
  call void @llvm.dbg.value(metadata !{i8* %inend}, i64 0, metadata !292), !dbg !291 ; [debug line = 308:52] [debug variable = inend]
  br label %1, !dbg !293                          ; [debug line = 309:9]

; <label>:1                                       ; preds = %.critedge, %0
  %inbuf.0.rec = phi i64 [ 0, %0 ], [ %.rec, %.critedge ] ; [#uses=3 type=i64]
  %in.addr = getelementptr i8* %in, i64 %inbuf.0.rec ; [#uses=1 type=i8*]
  call fastcc void @blake2s_increment_counter(%struct.blake2s_state.0* %S.addr), !dbg !295 ; [debug line = 311:13]
  %tmp = icmp eq i64 %inbuf.0.rec, %.sum, !dbg !297 ; [#uses=1 type=i1] [debug line = 313:13]
  br i1 %tmp, label %._crit_edge, label %.critedge, !dbg !297 ; [debug line = 313:13]

._crit_edge:                                      ; preds = %1
  call fastcc void @blake2s_set_lastblock(%struct.blake2s_state.0* %S.addr), !dbg !298 ; [debug line = 315:17]
  call fastcc void @blake2s_compress(%struct.blake2s_state.0* %S.addr, i8* %inend), !dbg !300 ; [debug line = 318:13]
  call fastcc void @blake2s_final(%struct.blake2s_state.0* %S.addr, i8* %out), !dbg !301 ; [debug line = 328:21]
  ret i32 0, !dbg !302                            ; [debug line = 334:5]

.critedge:                                        ; preds = %1
  call fastcc void @blake2s_compress(%struct.blake2s_state.0* %S.addr, i8* %in.addr), !dbg !300 ; [debug line = 318:13]
  %.rec = add i64 %inbuf.0.rec, 64, !dbg !303     ; [#uses=1 type=i64] [debug line = 324:13]
  br label %1, !dbg !304                          ; [debug line = 325:9]
}

; [#uses=1]
declare void @_ssdm_op_SpecTopModule(...)

; [#uses=1]
declare void @_ssdm_op_SpecBitsMap(...)

; [#uses=34]
declare void @_ssdm_SpecKeepArrayLoad(...)

; [#uses=3]
declare void @_ssdm_SpecArrayDimSize(...) nounwind

!llvm.dbg.cu = !{!0}
!opencl.kernels = !{!91, !98, !100, !103, !109, !113, !117, !122, !128, !131, !132, !136}
!hls.encrypted.func = !{}

!0 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/safayat/BYOTee/BYOTee-Build-Your-Own-TEEs/app1-hw-att/tools/hw-att-module/module1/solution1/.autopilot/db/blake2s.pragma.2.c", metadata !"/home/safayat/BYOTee/BYOTee-Build-Your-Own-TEEs/app1-hw-att/tools/hw-att-module", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !81} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !16, metadata !20, metadata !29, metadata !54, metadata !57, metadata !63, metadata !67, metadata !70, metadata !73, metadata !74, metadata !78}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"memcpy_hls", metadata !"memcpy_hls", metadata !"", metadata !6, i32 11, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !14, i32 12} ; [ DW_TAG_subprogram ]
!6 = metadata !{i32 786473, metadata !"blake2s.c", metadata !"/home/safayat/BYOTee/BYOTee-Build-Your-Own-TEEs/app1-hw-att/tools/hw-att-module", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{metadata !9, metadata !9, metadata !10, metadata !12}
!9 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!10 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ]
!11 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ]
!12 = metadata !{i32 786454, null, metadata !"size_t", metadata !6, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_typedef ]
!13 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!14 = metadata !{metadata !15}
!15 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!16 = metadata !{i32 786478, i32 0, metadata !6, metadata !"blake2s", metadata !"blake2s", metadata !"", metadata !6, i32 276, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i8*, i8*, i64)* @blake2s, null, null, metadata !14, i32 277} ; [ DW_TAG_subprogram ]
!17 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!18 = metadata !{metadata !19, metadata !9, metadata !10, metadata !12}
!19 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!20 = metadata !{i32 786478, i32 0, metadata !6, metadata !"blake2s_blocks", metadata !"blake2s_blocks", metadata !"", metadata !6, i32 337, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !14, i32 338} ; [ DW_TAG_subprogram ]
!21 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !22, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!22 = metadata !{metadata !19, metadata !9, metadata !23, metadata !12}
!23 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !24} ; [ DW_TAG_pointer_type ]
!24 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !25} ; [ DW_TAG_const_type ]
!25 = metadata !{i32 786454, null, metadata !"uint8_t", metadata !26, i32 24, i64 0, i64 0, i64 0, i32 0, metadata !27} ; [ DW_TAG_typedef ]
!26 = metadata !{i32 786473, metadata !"./blake2s.h", metadata !"/home/safayat/BYOTee/BYOTee-Build-Your-Own-TEEs/app1-hw-att/tools/hw-att-module", null} ; [ DW_TAG_file_type ]
!27 = metadata !{i32 786454, null, metadata !"__uint8_t", metadata !26, i32 38, i64 0, i64 0, i64 0, i32 0, metadata !28} ; [ DW_TAG_typedef ]
!28 = metadata !{i32 786468, null, metadata !"unsigned char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!29 = metadata !{i32 786478, i32 0, metadata !6, metadata !"blake2s_final", metadata !"blake2s_final", metadata !"", metadata !6, i32 259, metadata !30, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !14, i32 260} ; [ DW_TAG_subprogram ]
!30 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !31, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!31 = metadata !{metadata !19, metadata !32, metadata !9}
!32 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !33} ; [ DW_TAG_pointer_type ]
!33 = metadata !{i32 786454, null, metadata !"blake2s_state", metadata !6, i32 30, i64 0, i64 0, i64 0, i32 0, metadata !34} ; [ DW_TAG_typedef ]
!34 = metadata !{i32 786451, null, metadata !"", metadata !26, i32 22, i64 1024, i64 64, i32 0, i32 0, null, metadata !35, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!35 = metadata !{metadata !36, metadata !43, metadata !47, metadata !48, metadata !52, metadata !53}
!36 = metadata !{i32 786445, metadata !34, metadata !"h", metadata !26, i32 24, i64 256, i64 32, i64 0, i32 0, metadata !37} ; [ DW_TAG_member ]
!37 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 256, i64 32, i32 0, i32 0, metadata !38, metadata !41, i32 0, i32 0} ; [ DW_TAG_array_type ]
!38 = metadata !{i32 786454, null, metadata !"uint32_t", metadata !26, i32 26, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_typedef ]
!39 = metadata !{i32 786454, null, metadata !"__uint32_t", metadata !26, i32 42, i64 0, i64 0, i64 0, i32 0, metadata !40} ; [ DW_TAG_typedef ]
!40 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!41 = metadata !{metadata !42}
!42 = metadata !{i32 786465, i64 0, i64 7}        ; [ DW_TAG_subrange_type ]
!43 = metadata !{i32 786445, metadata !34, metadata !"t", metadata !26, i32 25, i64 64, i64 32, i64 256, i32 0, metadata !44} ; [ DW_TAG_member ]
!44 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 64, i64 32, i32 0, i32 0, metadata !38, metadata !45, i32 0, i32 0} ; [ DW_TAG_array_type ]
!45 = metadata !{metadata !46}
!46 = metadata !{i32 786465, i64 0, i64 1}        ; [ DW_TAG_subrange_type ]
!47 = metadata !{i32 786445, metadata !34, metadata !"f", metadata !26, i32 26, i64 64, i64 32, i64 320, i32 0, metadata !44} ; [ DW_TAG_member ]
!48 = metadata !{i32 786445, metadata !34, metadata !"buf", metadata !26, i32 27, i64 512, i64 8, i64 384, i32 0, metadata !49} ; [ DW_TAG_member ]
!49 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 512, i64 8, i32 0, i32 0, metadata !25, metadata !50, i32 0, i32 0} ; [ DW_TAG_array_type ]
!50 = metadata !{metadata !51}
!51 = metadata !{i32 786465, i64 0, i64 63}       ; [ DW_TAG_subrange_type ]
!52 = metadata !{i32 786445, metadata !34, metadata !"buflen", metadata !26, i32 28, i64 64, i64 64, i64 896, i32 0, metadata !12} ; [ DW_TAG_member ]
!53 = metadata !{i32 786445, metadata !34, metadata !"last_node", metadata !26, i32 29, i64 8, i64 8, i64 960, i32 0, metadata !25} ; [ DW_TAG_member ]
!54 = metadata !{i32 786478, i32 0, metadata !6, metadata !"blake2s_compress", metadata !"blake2s_compress", metadata !"", metadata !6, i32 194, metadata !55, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.blake2s_state.0*, i8*)* @blake2s_compress, null, null, metadata !14, i32 195} ; [ DW_TAG_subprogram ]
!55 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !56, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!56 = metadata !{null, metadata !32, metadata !23}
!57 = metadata !{i32 786478, i32 0, metadata !6, metadata !"blake2s_round", metadata !"blake2s_round", metadata !"", metadata !6, i32 158, metadata !58, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i64, i32*, i32*)* @blake2s_round, null, null, metadata !14, i32 159} ; [ DW_TAG_subprogram ]
!58 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !59, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!59 = metadata !{null, metadata !12, metadata !60, metadata !62}
!60 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !61} ; [ DW_TAG_pointer_type ]
!61 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !38} ; [ DW_TAG_const_type ]
!62 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !38} ; [ DW_TAG_pointer_type ]
!63 = metadata !{i32 786478, i32 0, metadata !6, metadata !"rotr32", metadata !"rotr32", metadata !"", metadata !6, i32 98, metadata !64, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32)* @rotr32, null, null, metadata !14, i32 99} ; [ DW_TAG_subprogram ]
!64 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !65, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!65 = metadata !{metadata !38, metadata !61, metadata !66}
!66 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !40} ; [ DW_TAG_const_type ]
!67 = metadata !{i32 786478, i32 0, metadata !6, metadata !"blake2s_set_IV", metadata !"blake2s_set_IV", metadata !"", metadata !6, i32 137, metadata !68, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*)* @blake2s_set_IV, null, null, metadata !14, i32 138} ; [ DW_TAG_subprogram ]
!68 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !69, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!69 = metadata !{null, metadata !62}
!70 = metadata !{i32 786478, i32 0, metadata !6, metadata !"blake2s_set_lastblock", metadata !"blake2s_set_lastblock", metadata !"", metadata !6, i32 120, metadata !71, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.blake2s_state.0*)* @blake2s_set_lastblock, null, null, metadata !14, i32 121} ; [ DW_TAG_subprogram ]
!71 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !72, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!72 = metadata !{null, metadata !32}
!73 = metadata !{i32 786478, i32 0, metadata !6, metadata !"blake2s_set_lastnode", metadata !"blake2s_set_lastnode", metadata !"", metadata !6, i32 110, metadata !71, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.blake2s_state.0*)* @blake2s_set_lastnode, null, null, metadata !14, i32 111} ; [ DW_TAG_subprogram ]
!74 = metadata !{i32 786478, i32 0, metadata !6, metadata !"blake2s_increment_counter", metadata !"blake2s_increment_counter", metadata !"", metadata !6, i32 128, metadata !75, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !14, i32 129} ; [ DW_TAG_subprogram ]
!75 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !76, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!76 = metadata !{null, metadata !32, metadata !77}
!77 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_const_type ]
!78 = metadata !{i32 786478, i32 0, metadata !6, metadata !"blake2s_init", metadata !"blake2s_init", metadata !"", metadata !6, i32 146, metadata !79, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !14, i32 147} ; [ DW_TAG_subprogram ]
!79 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !80, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!80 = metadata !{metadata !19, metadata !32}
!81 = metadata !{metadata !82}
!82 = metadata !{metadata !83, metadata !85, metadata !89}
!83 = metadata !{i32 786484, i32 0, null, metadata !"sys_nerr", metadata !"sys_nerr", metadata !"", metadata !84, i32 26, metadata !19, i32 0, i32 1, null} ; [ DW_TAG_variable ]
!84 = metadata !{i32 786473, metadata !"/usr/include/x86_64-linux-gnu/bits/sys_errlist.h", metadata !"/home/safayat/BYOTee/BYOTee-Build-Your-Own-TEEs/app1-hw-att/tools/hw-att-module", null} ; [ DW_TAG_file_type ]
!85 = metadata !{i32 786484, i32 0, null, metadata !"blake2s_sigma", metadata !"blake2s_sigma", metadata !"", metadata !6, i32 26, metadata !86, i32 1, i32 1, [10 x [8 x i8]]* @blake2s_sigma} ; [ DW_TAG_variable ]
!86 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 640, i64 8, i32 0, i32 0, metadata !24, metadata !87, i32 0, i32 0} ; [ DW_TAG_array_type ]
!87 = metadata !{metadata !88, metadata !42}
!88 = metadata !{i32 786465, i64 0, i64 9}        ; [ DW_TAG_subrange_type ]
!89 = metadata !{i32 786484, i32 0, null, metadata !"blake2s_IV", metadata !"blake2s_IV", metadata !"", metadata !6, i32 20, metadata !90, i32 1, i32 1, [8 x i32]* @blake2s_IV} ; [ DW_TAG_variable ]
!90 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 256, i64 32, i32 0, i32 0, metadata !61, metadata !41, i32 0, i32 0} ; [ DW_TAG_array_type ]
!91 = metadata !{null, metadata !92, metadata !93, metadata !94, metadata !95, metadata !96, metadata !97}
!92 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1, i32 0}
!93 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!94 = metadata !{metadata !"kernel_arg_type", metadata !"void*", metadata !"void*", metadata !"size_t"}
!95 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"const", metadata !""}
!96 = metadata !{metadata !"kernel_arg_name", metadata !"dest", metadata !"src", metadata !"len"}
!97 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!98 = metadata !{i32 (i8*, i8*, i64)* @blake2s, metadata !92, metadata !93, metadata !94, metadata !95, metadata !99, metadata !97}
!99 = metadata !{metadata !"kernel_arg_name", metadata !"out", metadata !"in", metadata !"inlen"}
!100 = metadata !{null, metadata !92, metadata !93, metadata !101, metadata !95, metadata !102, metadata !97}
!101 = metadata !{metadata !"kernel_arg_type", metadata !"void*", metadata !"uint8_t*", metadata !"size_t"}
!102 = metadata !{metadata !"kernel_arg_name", metadata !"out", metadata !"in", metadata !"inblocks"}
!103 = metadata !{null, metadata !104, metadata !105, metadata !106, metadata !107, metadata !108, metadata !97}
!104 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1}
!105 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!106 = metadata !{metadata !"kernel_arg_type", metadata !"blake2s_state*", metadata !"void*"}
!107 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!108 = metadata !{metadata !"kernel_arg_name", metadata !"S", metadata !"out"}
!109 = metadata !{void (%struct.blake2s_state.0*, i8*)* @blake2s_compress, metadata !104, metadata !105, metadata !110, metadata !111, metadata !112, metadata !97}
!110 = metadata !{metadata !"kernel_arg_type", metadata !"blake2s_state*", metadata !"uint8_t*"}
!111 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"const"}
!112 = metadata !{metadata !"kernel_arg_name", metadata !"S", metadata !"in"}
!113 = metadata !{void (i64, i32*, i32*)* @blake2s_round, metadata !114, metadata !93, metadata !115, metadata !95, metadata !116, metadata !97}
!114 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 1, i32 1}
!115 = metadata !{metadata !"kernel_arg_type", metadata !"size_t", metadata !"uint32_t*", metadata !"uint32_t*"}
!116 = metadata !{metadata !"kernel_arg_name", metadata !"r", metadata !"m", metadata !"v"}
!117 = metadata !{i32 (i32, i32)* @rotr32, metadata !118, metadata !105, metadata !119, metadata !120, metadata !121, metadata !97}
!118 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0}
!119 = metadata !{metadata !"kernel_arg_type", metadata !"uint32_t", metadata !"uint"}
!120 = metadata !{metadata !"kernel_arg_type_qual", metadata !"const", metadata !"const"}
!121 = metadata !{metadata !"kernel_arg_name", metadata !"w", metadata !"c"}
!122 = metadata !{void (i32*)* @blake2s_set_IV, metadata !123, metadata !124, metadata !125, metadata !126, metadata !127, metadata !97}
!123 = metadata !{metadata !"kernel_arg_addr_space", i32 1}
!124 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none"}
!125 = metadata !{metadata !"kernel_arg_type", metadata !"uint32_t*"}
!126 = metadata !{metadata !"kernel_arg_type_qual", metadata !""}
!127 = metadata !{metadata !"kernel_arg_name", metadata !"buf"}
!128 = metadata !{void (%struct.blake2s_state.0*)* @blake2s_set_lastblock, metadata !123, metadata !124, metadata !129, metadata !126, metadata !130, metadata !97}
!129 = metadata !{metadata !"kernel_arg_type", metadata !"blake2s_state*"}
!130 = metadata !{metadata !"kernel_arg_name", metadata !"S"}
!131 = metadata !{void (%struct.blake2s_state.0*)* @blake2s_set_lastnode, metadata !123, metadata !124, metadata !129, metadata !126, metadata !130, metadata !97}
!132 = metadata !{null, metadata !133, metadata !105, metadata !134, metadata !111, metadata !135, metadata !97}
!133 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0}
!134 = metadata !{metadata !"kernel_arg_type", metadata !"blake2s_state*", metadata !"size_t"}
!135 = metadata !{metadata !"kernel_arg_name", metadata !"S", metadata !"inc"}
!136 = metadata !{null, metadata !123, metadata !124, metadata !129, metadata !126, metadata !130, metadata !97}
!137 = metadata !{i32 786689, metadata !63, metadata !"w", metadata !6, i32 16777314, metadata !61, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!138 = metadata !{i32 98, i32 46, metadata !63, null}
!139 = metadata !{i32 786689, metadata !63, metadata !"c", metadata !6, i32 33554530, metadata !66, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!140 = metadata !{i32 98, i32 64, metadata !63, null}
!141 = metadata !{i32 100, i32 5, metadata !142, null}
!142 = metadata !{i32 786443, metadata !63, i32 99, i32 1, metadata !6, i32 17} ; [ DW_TAG_lexical_block ]
!143 = metadata !{i32 786689, metadata !5, metadata !"dest", metadata !6, i32 16777227, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!144 = metadata !{i32 11, i32 19, metadata !5, null}
!145 = metadata !{i32 786689, metadata !5, metadata !"src", metadata !6, i32 33554443, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!146 = metadata !{i32 11, i32 37, metadata !5, null}
!147 = metadata !{i32 786688, metadata !148, metadata !"d", metadata !6, i32 13, metadata !149, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!148 = metadata !{i32 786443, metadata !5, i32 12, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!149 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !150} ; [ DW_TAG_pointer_type ]
!150 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!151 = metadata !{i32 13, i32 17, metadata !148, null}
!152 = metadata !{i32 786688, metadata !148, metadata !"s", metadata !6, i32 14, metadata !153, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!153 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !154} ; [ DW_TAG_pointer_type ]
!154 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !150} ; [ DW_TAG_const_type ]
!155 = metadata !{i32 14, i32 22, metadata !148, null}
!156 = metadata !{i32 15, i32 3, metadata !148, null}
!157 = metadata !{i32 786689, metadata !5, metadata !"len", metadata !6, i32 50331659, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!158 = metadata !{i32 16, i32 5, metadata !148, null}
!159 = metadata !{i32 786689, metadata !73, metadata !"S", metadata !6, i32 16777326, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!160 = metadata !{i32 110, i32 49, metadata !73, null}
!161 = metadata !{i32 112, i32 5, metadata !162, null}
!162 = metadata !{i32 786443, metadata !73, i32 111, i32 1, metadata !6, i32 22} ; [ DW_TAG_lexical_block ]
!163 = metadata !{i32 113, i32 1, metadata !162, null}
!164 = metadata !{i32 786689, metadata !70, metadata !"S", metadata !6, i32 16777336, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!165 = metadata !{i32 120, i32 50, metadata !70, null}
!166 = metadata !{i32 122, i32 5, metadata !167, null}
!167 = metadata !{i32 786443, metadata !70, i32 121, i32 1, metadata !6, i32 21} ; [ DW_TAG_lexical_block ]
!168 = metadata !{i32 123, i32 9, metadata !167, null}
!169 = metadata !{i32 125, i32 5, metadata !167, null}
!170 = metadata !{i32 126, i32 1, metadata !167, null}
!171 = metadata !{i32 786689, metadata !67, metadata !"buf", metadata !6, i32 16777353, metadata !62, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!172 = metadata !{i32 137, i32 38, metadata !67, null}
!173 = metadata !{i32 139, i32 22, metadata !174, null}
!174 = metadata !{i32 786443, metadata !175, i32 139, i32 5, metadata !6, i32 19} ; [ DW_TAG_lexical_block ]
!175 = metadata !{i32 786443, metadata !67, i32 138, i32 1, metadata !6, i32 18} ; [ DW_TAG_lexical_block ]
!176 = metadata !{i32 141, i32 9, metadata !177, null}
!177 = metadata !{i32 786443, metadata !174, i32 140, i32 5, metadata !6, i32 20} ; [ DW_TAG_lexical_block ]
!178 = metadata !{i32 139, i32 31, metadata !174, null}
!179 = metadata !{i32 786688, metadata !174, metadata !"i", metadata !6, i32 139, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!180 = metadata !{i32 143, i32 1, metadata !175, null}
!181 = metadata !{i32 786689, metadata !57, metadata !"r", metadata !6, i32 16777374, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!182 = metadata !{i32 158, i32 34, metadata !57, null}
!183 = metadata !{i32 786689, metadata !57, metadata !"m", metadata !6, i32 33554590, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!184 = metadata !{i32 158, i32 52, metadata !57, null}
!185 = metadata !{i32 786689, metadata !57, metadata !"v", metadata !6, i32 50331806, metadata !62, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!186 = metadata !{i32 158, i32 68, metadata !57, null}
!187 = metadata !{i32 159, i32 2, metadata !188, null}
!188 = metadata !{i32 786443, metadata !57, i32 159, i32 1, metadata !6, i32 14} ; [ DW_TAG_lexical_block ]
!189 = metadata !{i32 159, i32 31, metadata !188, null}
!190 = metadata !{i32 160, i32 22, metadata !191, null}
!191 = metadata !{i32 786443, metadata !188, i32 160, i32 5, metadata !6, i32 15} ; [ DW_TAG_lexical_block ]
!192 = metadata !{i32 162, i32 28, metadata !193, null}
!193 = metadata !{i32 786443, metadata !191, i32 161, i32 5, metadata !6, i32 16} ; [ DW_TAG_lexical_block ]
!194 = metadata !{i32 786688, metadata !193, metadata !"bit4", metadata !6, i32 162, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!195 = metadata !{i32 174, i32 42, metadata !193, null}
!196 = metadata !{i32 786688, metadata !193, metadata !"a", metadata !6, i32 174, metadata !62, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!197 = metadata !{i32 175, i32 49, metadata !193, null}
!198 = metadata !{i32 786688, metadata !193, metadata !"b", metadata !6, i32 175, metadata !62, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!199 = metadata !{i32 176, i32 49, metadata !193, null}
!200 = metadata !{i32 786688, metadata !193, metadata !"c", metadata !6, i32 176, metadata !62, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!201 = metadata !{i32 177, i32 57, metadata !193, null}
!202 = metadata !{i32 786688, metadata !193, metadata !"d", metadata !6, i32 177, metadata !62, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!203 = metadata !{i32 179, i32 50, metadata !193, null}
!204 = metadata !{i32 786688, metadata !193, metadata !"sigma", metadata !6, i32 179, metadata !24, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!205 = metadata !{i32 180, i32 36, metadata !193, null}
!206 = metadata !{i32 786688, metadata !193, metadata !"m1", metadata !6, i32 180, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!207 = metadata !{i32 181, i32 37, metadata !193, null}
!208 = metadata !{i32 786688, metadata !193, metadata !"m2", metadata !6, i32 181, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!209 = metadata !{i32 183, i32 9, metadata !193, null}
!210 = metadata !{i32 184, i32 14, metadata !193, null}
!211 = metadata !{i32 185, i32 9, metadata !193, null}
!212 = metadata !{i32 186, i32 14, metadata !193, null}
!213 = metadata !{i32 187, i32 9, metadata !193, null}
!214 = metadata !{i32 188, i32 14, metadata !193, null}
!215 = metadata !{i32 189, i32 9, metadata !193, null}
!216 = metadata !{i32 190, i32 14, metadata !193, null}
!217 = metadata !{i32 160, i32 31, metadata !191, null}
!218 = metadata !{i32 786688, metadata !191, metadata !"i", metadata !6, i32 160, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!219 = metadata !{i32 192, i32 1, metadata !188, null}
!220 = metadata !{i32 786689, metadata !78, metadata !"S", metadata !6, i32 16777362, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!221 = metadata !{i32 146, i32 40, metadata !78, null}
!222 = metadata !{i32 148, i32 5, metadata !223, null}
!223 = metadata !{i32 786443, metadata !78, i32 147, i32 1, metadata !6, i32 24} ; [ DW_TAG_lexical_block ]
!224 = metadata !{i32 150, i32 5, metadata !223, null}
!225 = metadata !{i32 153, i32 5, metadata !223, null}
!226 = metadata !{i32 786689, metadata !74, metadata !"S", metadata !6, i32 16777344, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!227 = metadata !{i32 128, i32 54, metadata !74, null}
!228 = metadata !{i32 130, i32 5, metadata !229, null}
!229 = metadata !{i32 786443, metadata !74, i32 129, i32 1, metadata !6, i32 23} ; [ DW_TAG_lexical_block ]
!230 = metadata !{i32 135, i32 1, metadata !229, null}
!231 = metadata !{i32 786689, metadata !29, metadata !"S", metadata !6, i32 16777475, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!232 = metadata !{i32 259, i32 41, metadata !29, null}
!233 = metadata !{i32 786689, metadata !29, metadata !"out", metadata !6, i32 33554691, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!234 = metadata !{i32 259, i32 50, metadata !29, null}
!235 = metadata !{i32 272, i32 5, metadata !236, null}
!236 = metadata !{i32 786443, metadata !29, i32 260, i32 1, metadata !6, i32 8} ; [ DW_TAG_lexical_block ]
!237 = metadata !{i32 786689, metadata !54, metadata !"S", metadata !6, i32 16777410, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!238 = metadata !{i32 194, i32 45, metadata !54, null}
!239 = metadata !{i32 786689, metadata !54, metadata !"in", metadata !6, i32 33554626, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!240 = metadata !{i32 194, i32 62, metadata !54, null}
!241 = metadata !{i32 195, i32 2, metadata !242, null}
!242 = metadata !{i32 786443, metadata !54, i32 195, i32 1, metadata !6, i32 9} ; [ DW_TAG_lexical_block ]
!243 = metadata !{i32 198, i32 28, metadata !242, null}
!244 = metadata !{i32 786688, metadata !242, metadata !"m", metadata !6, i32 198, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!245 = metadata !{i32 786688, metadata !242, metadata !"v", metadata !6, i32 204, metadata !246, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!246 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 512, i64 32, i32 0, i32 0, metadata !38, metadata !247, i32 0, i32 0} ; [ DW_TAG_array_type ]
!247 = metadata !{metadata !248}
!248 = metadata !{i32 786465, i64 0, i64 15}      ; [ DW_TAG_subrange_type ]
!249 = metadata !{i32 204, i32 14, metadata !242, null}
!250 = metadata !{i32 205, i32 5, metadata !242, null}
!251 = metadata !{i32 207, i32 5, metadata !242, null}
!252 = metadata !{i32 208, i32 5, metadata !242, null}
!253 = metadata !{i32 209, i32 5, metadata !242, null}
!254 = metadata !{i32 210, i32 5, metadata !242, null}
!255 = metadata !{i32 211, i32 5, metadata !242, null}
!256 = metadata !{i32 215, i32 9, metadata !257, null}
!257 = metadata !{i32 786443, metadata !258, i32 214, i32 5, metadata !6, i32 11} ; [ DW_TAG_lexical_block ]
!258 = metadata !{i32 786443, metadata !242, i32 213, i32 5, metadata !6, i32 10} ; [ DW_TAG_lexical_block ]
!259 = metadata !{i32 213, i32 22, metadata !258, null}
!260 = metadata !{i32 218, i32 22, metadata !261, null}
!261 = metadata !{i32 786443, metadata !242, i32 218, i32 5, metadata !6, i32 12} ; [ DW_TAG_lexical_block ]
!262 = metadata !{i32 213, i32 32, metadata !258, null}
!263 = metadata !{i32 786688, metadata !258, metadata !"r", metadata !6, i32 213, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!264 = metadata !{i32 220, i32 9, metadata !265, null}
!265 = metadata !{i32 786443, metadata !261, i32 219, i32 5, metadata !6, i32 13} ; [ DW_TAG_lexical_block ]
!266 = metadata !{i32 218, i32 31, metadata !261, null}
!267 = metadata !{i32 786688, metadata !261, metadata !"i", metadata !6, i32 218, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!268 = metadata !{i32 222, i32 1, metadata !242, null}
!269 = metadata !{metadata !270}
!270 = metadata !{i32 0, i32 31, metadata !271}
!271 = metadata !{metadata !272}
!272 = metadata !{metadata !"return", metadata !273, metadata !"int", i32 0, i32 31}
!273 = metadata !{metadata !274}
!274 = metadata !{i32 0, i32 1, i32 0}
!275 = metadata !{i32 786689, metadata !16, metadata !"out", metadata !6, i32 16777492, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!276 = metadata !{i32 276, i32 19, metadata !16, null}
!277 = metadata !{i32 786689, metadata !16, metadata !"in", metadata !6, i32 33554708, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!278 = metadata !{i32 276, i32 36, metadata !16, null}
!279 = metadata !{i32 786689, metadata !16, metadata !"inlen", metadata !6, i32 50331924, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!280 = metadata !{i32 276, i32 47, metadata !16, null}
!281 = metadata !{i32 786688, metadata !282, metadata !"S", metadata !6, i32 278, metadata !283, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!282 = metadata !{i32 786443, metadata !16, i32 277, i32 1, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!283 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 1024, i64 64, i32 0, i32 0, metadata !33, metadata !284, i32 0, i32 0} ; [ DW_TAG_array_type ]
!284 = metadata !{metadata !285}
!285 = metadata !{i32 786465, i64 0, i64 0}       ; [ DW_TAG_subrange_type ]
!286 = metadata !{i32 278, i32 19, metadata !282, null}
!287 = metadata !{i32 288, i32 20, metadata !282, null}
!288 = metadata !{i32 786688, metadata !289, metadata !"inbuf", metadata !6, i32 307, metadata !23, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!289 = metadata !{i32 786443, metadata !282, i32 301, i32 5, metadata !6, i32 2} ; [ DW_TAG_lexical_block ]
!290 = metadata !{i32 307, i32 34, metadata !289, null}
!291 = metadata !{i32 308, i32 52, metadata !289, null}
!292 = metadata !{i32 786688, metadata !289, metadata !"inend", metadata !6, i32 308, metadata !23, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!293 = metadata !{i32 309, i32 9, metadata !294, null}
!294 = metadata !{i32 786443, metadata !289, i32 309, i32 9, metadata !6, i32 3} ; [ DW_TAG_lexical_block ]
!295 = metadata !{i32 311, i32 13, metadata !296, null}
!296 = metadata !{i32 786443, metadata !294, i32 310, i32 9, metadata !6, i32 4} ; [ DW_TAG_lexical_block ]
!297 = metadata !{i32 313, i32 13, metadata !296, null}
!298 = metadata !{i32 315, i32 17, metadata !299, null}
!299 = metadata !{i32 786443, metadata !296, i32 314, i32 13, metadata !6, i32 5} ; [ DW_TAG_lexical_block ]
!300 = metadata !{i32 318, i32 13, metadata !296, null}
!301 = metadata !{i32 328, i32 21, metadata !282, null}
!302 = metadata !{i32 334, i32 5, metadata !282, null}
!303 = metadata !{i32 324, i32 13, metadata !296, null}
!304 = metadata !{i32 325, i32 9, metadata !296, null}
