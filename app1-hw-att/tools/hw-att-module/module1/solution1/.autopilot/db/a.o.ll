; ModuleID = '/home/safayat/BYOTee/BYOTee-Build-Your-Own-TEEs/app1-hw-att/tools/hw-att-module/module1/solution1/.autopilot/db/a.o.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.blake2s_state = type { [8 x i32], [2 x i32], [2 x i32], [64 x i8], i64, i8 }

@blake2s_sigma = internal constant [10 x [8 x i8]] [[8 x i8] c"\01#Eg\89\AB\CD\EF", [8 x i8] c"\EAH\9F\D6\1C\02\B7S", [8 x i8] c"\B8\C0R\FD\AE6q\94", [8 x i8] c"y1\DC\BE&Z@\F8", [8 x i8] c"\90W$\AF\E1\BCh=", [8 x i8] c",j\0B\83Mu\FE\19", [8 x i8] c"\C5\1F\EDJ\07c\92\8B", [8 x i8] c"\DB~\C19P\F4\86*", [8 x i8] c"o\E9\B3\08\C2\D7\14\A5", [8 x i8] c"\A2\84v\15\FB\9E<\D0"], align 16 ; [#uses=1 type=[10 x [8 x i8]]*]
@blake2s_IV = internal constant [8 x i32] [i32 1779033703, i32 -1150833019, i32 1013904242, i32 -1521486534, i32 1359893119, i32 -1694144372, i32 528734635, i32 1541459225], align 16 ; [#uses=1 type=[8 x i32]*]

; [#uses=1]
define internal i8* @memcpy_hls(i8* %dest, i8* %src, i64 %len) nounwind uwtable {
  %1 = alloca i8*, align 8                        ; [#uses=3 type=i8**]
  %2 = alloca i8*, align 8                        ; [#uses=2 type=i8**]
  %3 = alloca i64, align 8                        ; [#uses=3 type=i64*]
  %d = alloca i8*, align 8                        ; [#uses=3 type=i8**]
  %s = alloca i8*, align 8                        ; [#uses=3 type=i8**]
  store i8* %dest, i8** %1, align 8
  call void @llvm.dbg.declare(metadata !{i8** %1}, metadata !137), !dbg !138 ; [debug line = 11:19] [debug variable = dest]
  store i8* %src, i8** %2, align 8
  call void @llvm.dbg.declare(metadata !{i8** %2}, metadata !139), !dbg !140 ; [debug line = 11:37] [debug variable = src]
  store i64 %len, i64* %3, align 8
  call void @llvm.dbg.declare(metadata !{i64* %3}, metadata !141), !dbg !142 ; [debug line = 11:49] [debug variable = len]
  call void @llvm.dbg.declare(metadata !{i8** %d}, metadata !143), !dbg !147 ; [debug line = 13:9] [debug variable = d]
  %4 = load i8** %1, align 8, !dbg !148           ; [#uses=1 type=i8*] [debug line = 13:17]
  store i8* %4, i8** %d, align 8, !dbg !148       ; [debug line = 13:17]
  call void @llvm.dbg.declare(metadata !{i8** %s}, metadata !149), !dbg !152 ; [debug line = 14:15] [debug variable = s]
  %5 = load i8** %2, align 8, !dbg !153           ; [#uses=1 type=i8*] [debug line = 14:22]
  store i8* %5, i8** %s, align 8, !dbg !153       ; [debug line = 14:22]
  br label %6, !dbg !154                          ; [debug line = 15:3]

; <label>:6                                       ; preds = %10, %0
  %7 = load i64* %3, align 8, !dbg !154           ; [#uses=2 type=i64] [debug line = 15:3]
  %8 = add i64 %7, -1, !dbg !154                  ; [#uses=1 type=i64] [debug line = 15:3]
  store i64 %8, i64* %3, align 8, !dbg !154       ; [debug line = 15:3]
  %9 = icmp ne i64 %7, 0, !dbg !154               ; [#uses=1 type=i1] [debug line = 15:3]
  br i1 %9, label %10, label %16, !dbg !154       ; [debug line = 15:3]

; <label>:10                                      ; preds = %6
  %11 = load i8** %s, align 8, !dbg !155          ; [#uses=2 type=i8*] [debug line = 16:5]
  %12 = getelementptr inbounds i8* %11, i32 1, !dbg !155 ; [#uses=1 type=i8*] [debug line = 16:5]
  store i8* %12, i8** %s, align 8, !dbg !155      ; [debug line = 16:5]
  %13 = load i8* %11, align 1, !dbg !155          ; [#uses=1 type=i8] [debug line = 16:5]
  %14 = load i8** %d, align 8, !dbg !155          ; [#uses=2 type=i8*] [debug line = 16:5]
  %15 = getelementptr inbounds i8* %14, i32 1, !dbg !155 ; [#uses=1 type=i8*] [debug line = 16:5]
  store i8* %15, i8** %d, align 8, !dbg !155      ; [debug line = 16:5]
  store i8 %13, i8* %14, align 1, !dbg !155       ; [debug line = 16:5]
  br label %6, !dbg !155                          ; [debug line = 16:5]

; <label>:16                                      ; preds = %6
  %17 = load i8** %1, align 8, !dbg !156          ; [#uses=1 type=i8*] [debug line = 17:3]
  ret i8* %17, !dbg !156                          ; [debug line = 17:3]
}

; [#uses=45]
declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

; [#uses=1]
define i32 @blake2s(i8* %out, i8* %in, i64 %inlen) nounwind uwtable {
  %1 = alloca i8*, align 8                        ; [#uses=2 type=i8**]
  %2 = alloca i8*, align 8                        ; [#uses=2 type=i8**]
  %3 = alloca i64, align 8                        ; [#uses=2 type=i64*]
  %S = alloca [1 x %struct.blake2s_state], align 16 ; [#uses=5 type=[1 x %struct.blake2s_state]*]
  %err_init = alloca i32, align 4                 ; [#uses=1 type=i32*]
  %inbuf = alloca i8*, align 8                    ; [#uses=7 type=i8**]
  %inend = alloca i8*, align 8                    ; [#uses=3 type=i8**]
  %err_final = alloca i32, align 4                ; [#uses=1 type=i32*]
  store i8* %out, i8** %1, align 8
  call void @llvm.dbg.declare(metadata !{i8** %1}, metadata !157), !dbg !158 ; [debug line = 276:19] [debug variable = out]
  store i8* %in, i8** %2, align 8
  call void @llvm.dbg.declare(metadata !{i8** %2}, metadata !159), !dbg !160 ; [debug line = 276:36] [debug variable = in]
  store i64 %inlen, i64* %3, align 8
  call void @llvm.dbg.declare(metadata !{i64* %3}, metadata !161), !dbg !162 ; [debug line = 276:47] [debug variable = inlen]
  call void @llvm.dbg.declare(metadata !{[1 x %struct.blake2s_state]* %S}, metadata !163), !dbg !168 ; [debug line = 278:19] [debug variable = S]
  call void @llvm.dbg.declare(metadata !{i32* %err_init}, metadata !169), !dbg !170 ; [debug line = 288:9] [debug variable = err_init]
  %4 = getelementptr inbounds [1 x %struct.blake2s_state]* %S, i32 0, i32 0, !dbg !171 ; [#uses=1 type=%struct.blake2s_state*] [debug line = 288:20]
  %5 = call i32 @blake2s_init(%struct.blake2s_state* %4), !dbg !171 ; [#uses=1 type=i32] [debug line = 288:20]
  store i32 %5, i32* %err_init, align 4, !dbg !171 ; [debug line = 288:20]
  call void @llvm.dbg.declare(metadata !{i8** %inbuf}, metadata !172), !dbg !174 ; [debug line = 307:24] [debug variable = inbuf]
  %6 = load i8** %2, align 8, !dbg !175           ; [#uses=1 type=i8*] [debug line = 307:34]
  store i8* %6, i8** %inbuf, align 8, !dbg !175   ; [debug line = 307:34]
  call void @llvm.dbg.declare(metadata !{i8** %inend}, metadata !176), !dbg !177 ; [debug line = 308:24] [debug variable = inend]
  %7 = load i8** %inbuf, align 8, !dbg !178       ; [#uses=1 type=i8*] [debug line = 308:52]
  %8 = load i64* %3, align 8, !dbg !178           ; [#uses=1 type=i64] [debug line = 308:52]
  %9 = getelementptr inbounds i8* %7, i64 %8, !dbg !178 ; [#uses=1 type=i8*] [debug line = 308:52]
  %10 = getelementptr inbounds i8* %9, i64 -64, !dbg !178 ; [#uses=1 type=i8*] [debug line = 308:52]
  store i8* %10, i8** %inend, align 8, !dbg !178  ; [debug line = 308:52]
  br label %11, !dbg !179                         ; [debug line = 309:9]

; <label>:11                                      ; preds = %25, %0
  %12 = getelementptr inbounds [1 x %struct.blake2s_state]* %S, i32 0, i32 0, !dbg !181 ; [#uses=1 type=%struct.blake2s_state*] [debug line = 311:13]
  call void @blake2s_increment_counter(%struct.blake2s_state* %12, i64 64), !dbg !181 ; [debug line = 311:13]
  %13 = load i8** %inbuf, align 8, !dbg !183      ; [#uses=1 type=i8*] [debug line = 313:13]
  %14 = load i8** %inend, align 8, !dbg !183      ; [#uses=1 type=i8*] [debug line = 313:13]
  %15 = icmp eq i8* %13, %14, !dbg !183           ; [#uses=1 type=i1] [debug line = 313:13]
  br i1 %15, label %16, label %18, !dbg !183      ; [debug line = 313:13]

; <label>:16                                      ; preds = %11
  %17 = getelementptr inbounds [1 x %struct.blake2s_state]* %S, i32 0, i32 0, !dbg !184 ; [#uses=1 type=%struct.blake2s_state*] [debug line = 315:17]
  call void @blake2s_set_lastblock(%struct.blake2s_state* %17), !dbg !184 ; [debug line = 315:17]
  br label %18, !dbg !186                         ; [debug line = 316:13]

; <label>:18                                      ; preds = %16, %11
  %19 = getelementptr inbounds [1 x %struct.blake2s_state]* %S, i32 0, i32 0, !dbg !187 ; [#uses=1 type=%struct.blake2s_state*] [debug line = 318:13]
  %20 = load i8** %inbuf, align 8, !dbg !187      ; [#uses=1 type=i8*] [debug line = 318:13]
  call void @blake2s_compress(%struct.blake2s_state* %19, i8* %20), !dbg !187 ; [debug line = 318:13]
  %21 = load i8** %inbuf, align 8, !dbg !188      ; [#uses=1 type=i8*] [debug line = 320:13]
  %22 = load i8** %inend, align 8, !dbg !188      ; [#uses=1 type=i8*] [debug line = 320:13]
  %23 = icmp eq i8* %21, %22, !dbg !188           ; [#uses=1 type=i1] [debug line = 320:13]
  br i1 %23, label %24, label %25, !dbg !188      ; [debug line = 320:13]

; <label>:24                                      ; preds = %18
  br label %28, !dbg !189                         ; [debug line = 322:17]

; <label>:25                                      ; preds = %18
  %26 = load i8** %inbuf, align 8, !dbg !191      ; [#uses=1 type=i8*] [debug line = 324:13]
  %27 = getelementptr inbounds i8* %26, i64 64, !dbg !191 ; [#uses=1 type=i8*] [debug line = 324:13]
  store i8* %27, i8** %inbuf, align 8, !dbg !191  ; [debug line = 324:13]
  br label %11, !dbg !192                         ; [debug line = 325:9]

; <label>:28                                      ; preds = %24
  call void @llvm.dbg.declare(metadata !{i32* %err_final}, metadata !193), !dbg !194 ; [debug line = 328:9] [debug variable = err_final]
  %29 = getelementptr inbounds [1 x %struct.blake2s_state]* %S, i32 0, i32 0, !dbg !195 ; [#uses=1 type=%struct.blake2s_state*] [debug line = 328:21]
  %30 = load i8** %1, align 8, !dbg !195          ; [#uses=1 type=i8*] [debug line = 328:21]
  %31 = call i32 @blake2s_final(%struct.blake2s_state* %29, i8* %30), !dbg !195 ; [#uses=1 type=i32] [debug line = 328:21]
  store i32 %31, i32* %err_final, align 4, !dbg !195 ; [debug line = 328:21]
  ret i32 0, !dbg !196                            ; [debug line = 334:5]
}

; [#uses=1]
define internal i32 @blake2s_init(%struct.blake2s_state* %S) nounwind uwtable {
  %1 = alloca %struct.blake2s_state*, align 8     ; [#uses=4 type=%struct.blake2s_state**]
  store %struct.blake2s_state* %S, %struct.blake2s_state** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.blake2s_state** %1}, metadata !197), !dbg !198 ; [debug line = 146:40] [debug variable = S]
  %2 = load %struct.blake2s_state** %1, align 8, !dbg !199 ; [#uses=1 type=%struct.blake2s_state*] [debug line = 148:5]
  %3 = bitcast %struct.blake2s_state* %2 to i8*, !dbg !199 ; [#uses=1 type=i8*] [debug line = 148:5]
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 128, i32 8, i1 false), !dbg !199 ; [debug line = 148:5]
  %4 = load %struct.blake2s_state** %1, align 8, !dbg !201 ; [#uses=1 type=%struct.blake2s_state*] [debug line = 150:5]
  %5 = getelementptr inbounds %struct.blake2s_state* %4, i32 0, i32 0, !dbg !201 ; [#uses=1 type=[8 x i32]*] [debug line = 150:5]
  %6 = getelementptr inbounds [8 x i32]* %5, i32 0, i32 0, !dbg !201 ; [#uses=1 type=i32*] [debug line = 150:5]
  call void @blake2s_set_IV(i32* %6), !dbg !201   ; [debug line = 150:5]
  %7 = load %struct.blake2s_state** %1, align 8, !dbg !202 ; [#uses=1 type=%struct.blake2s_state*] [debug line = 153:5]
  %8 = getelementptr inbounds %struct.blake2s_state* %7, i32 0, i32 0, !dbg !202 ; [#uses=1 type=[8 x i32]*] [debug line = 153:5]
  %9 = getelementptr inbounds [8 x i32]* %8, i32 0, i64 0, !dbg !202 ; [#uses=2 type=i32*] [debug line = 153:5]
  %10 = load i32* %9, align 4, !dbg !202          ; [#uses=1 type=i32] [debug line = 153:5]
  %11 = zext i32 %10 to i64, !dbg !202            ; [#uses=1 type=i64] [debug line = 153:5]
  %12 = xor i64 %11, 16842784, !dbg !202          ; [#uses=1 type=i64] [debug line = 153:5]
  %13 = trunc i64 %12 to i32, !dbg !202           ; [#uses=1 type=i32] [debug line = 153:5]
  store i32 %13, i32* %9, align 4, !dbg !202      ; [debug line = 153:5]
  ret i32 0, !dbg !203                            ; [debug line = 155:5]
}

; [#uses=1]
define internal void @blake2s_increment_counter(%struct.blake2s_state* %S, i64 %inc) nounwind uwtable {
  %1 = alloca %struct.blake2s_state*, align 8     ; [#uses=2 type=%struct.blake2s_state**]
  %2 = alloca i64, align 8                        ; [#uses=2 type=i64*]
  store %struct.blake2s_state* %S, %struct.blake2s_state** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.blake2s_state** %1}, metadata !204), !dbg !205 ; [debug line = 128:54] [debug variable = S]
  store i64 %inc, i64* %2, align 8
  call void @llvm.dbg.declare(metadata !{i64* %2}, metadata !206), !dbg !207 ; [debug line = 128:70] [debug variable = inc]
  %3 = load i64* %2, align 8, !dbg !208           ; [#uses=1 type=i64] [debug line = 130:5]
  %4 = load %struct.blake2s_state** %1, align 8, !dbg !208 ; [#uses=1 type=%struct.blake2s_state*] [debug line = 130:5]
  %5 = getelementptr inbounds %struct.blake2s_state* %4, i32 0, i32 1, !dbg !208 ; [#uses=1 type=[2 x i32]*] [debug line = 130:5]
  %6 = getelementptr inbounds [2 x i32]* %5, i32 0, i64 0, !dbg !208 ; [#uses=2 type=i32*] [debug line = 130:5]
  %7 = load i32* %6, align 4, !dbg !208           ; [#uses=1 type=i32] [debug line = 130:5]
  %8 = zext i32 %7 to i64, !dbg !208              ; [#uses=1 type=i64] [debug line = 130:5]
  %9 = add i64 %8, %3, !dbg !208                  ; [#uses=1 type=i64] [debug line = 130:5]
  %10 = trunc i64 %9 to i32, !dbg !208            ; [#uses=1 type=i32] [debug line = 130:5]
  store i32 %10, i32* %6, align 4, !dbg !208      ; [debug line = 130:5]
  ret void, !dbg !210                             ; [debug line = 135:1]
}

; [#uses=1]
define internal void @blake2s_set_lastblock(%struct.blake2s_state* %S) nounwind uwtable {
  %1 = alloca %struct.blake2s_state*, align 8     ; [#uses=4 type=%struct.blake2s_state**]
  store %struct.blake2s_state* %S, %struct.blake2s_state** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.blake2s_state** %1}, metadata !211), !dbg !212 ; [debug line = 120:50] [debug variable = S]
  %2 = load %struct.blake2s_state** %1, align 8, !dbg !213 ; [#uses=1 type=%struct.blake2s_state*] [debug line = 122:5]
  %3 = getelementptr inbounds %struct.blake2s_state* %2, i32 0, i32 5, !dbg !213 ; [#uses=1 type=i8*] [debug line = 122:5]
  %4 = load i8* %3, align 1, !dbg !213            ; [#uses=1 type=i8] [debug line = 122:5]
  %5 = icmp ne i8 %4, 0, !dbg !213                ; [#uses=1 type=i1] [debug line = 122:5]
  br i1 %5, label %6, label %8, !dbg !213         ; [debug line = 122:5]

; <label>:6                                       ; preds = %0
  %7 = load %struct.blake2s_state** %1, align 8, !dbg !215 ; [#uses=1 type=%struct.blake2s_state*] [debug line = 123:9]
  call void @blake2s_set_lastnode(%struct.blake2s_state* %7), !dbg !215 ; [debug line = 123:9]
  br label %8, !dbg !215                          ; [debug line = 123:9]

; <label>:8                                       ; preds = %6, %0
  %9 = load %struct.blake2s_state** %1, align 8, !dbg !216 ; [#uses=1 type=%struct.blake2s_state*] [debug line = 125:5]
  %10 = getelementptr inbounds %struct.blake2s_state* %9, i32 0, i32 2, !dbg !216 ; [#uses=1 type=[2 x i32]*] [debug line = 125:5]
  %11 = getelementptr inbounds [2 x i32]* %10, i32 0, i64 0, !dbg !216 ; [#uses=1 type=i32*] [debug line = 125:5]
  store i32 -1, i32* %11, align 4, !dbg !216      ; [debug line = 125:5]
  ret void, !dbg !217                             ; [debug line = 126:1]
}

; [#uses=1]
define internal void @blake2s_compress(%struct.blake2s_state* %S, i8* %in) nounwind uwtable {
  %1 = alloca %struct.blake2s_state*, align 8     ; [#uses=8 type=%struct.blake2s_state**]
  %2 = alloca i8*, align 8                        ; [#uses=3 type=i8**]
  %m = alloca i32*, align 8                       ; [#uses=2 type=i32**]
  %v = alloca [16 x i32], align 16                ; [#uses=9 type=[16 x i32]*]
  %r = alloca i64, align 8                        ; [#uses=5 type=i64*]
  %i = alloca i64, align 8                        ; [#uses=8 type=i64*]
  store %struct.blake2s_state* %S, %struct.blake2s_state** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.blake2s_state** %1}, metadata !218), !dbg !219 ; [debug line = 194:45] [debug variable = S]
  store i8* %in, i8** %2, align 8
  call void @llvm.dbg.declare(metadata !{i8** %2}, metadata !220), !dbg !221 ; [debug line = 194:62] [debug variable = in]
  %3 = load i8** %2, align 8, !dbg !222           ; [#uses=1 type=i8*] [debug line = 195:2]
  call void (...)* @_ssdm_SpecArrayDimSize(i8* %3, i32 64) nounwind, !dbg !222 ; [debug line = 195:2]
  call void @llvm.dbg.declare(metadata !{i32** %m}, metadata !224), !dbg !225 ; [debug line = 198:22] [debug variable = m]
  %4 = load i8** %2, align 8, !dbg !226           ; [#uses=1 type=i8*] [debug line = 198:28]
  %5 = bitcast i8* %4 to i32*, !dbg !226          ; [#uses=1 type=i32*] [debug line = 198:28]
  store i32* %5, i32** %m, align 8, !dbg !226     ; [debug line = 198:28]
  call void @llvm.dbg.declare(metadata !{[16 x i32]* %v}, metadata !227), !dbg !231 ; [debug line = 204:14] [debug variable = v]
  %6 = getelementptr inbounds [16 x i32]* %v, i32 0, i32 0, !dbg !232 ; [#uses=1 type=i32*] [debug line = 205:5]
  %7 = bitcast i32* %6 to i8*, !dbg !232          ; [#uses=1 type=i8*] [debug line = 205:5]
  %8 = load %struct.blake2s_state** %1, align 8, !dbg !232 ; [#uses=1 type=%struct.blake2s_state*] [debug line = 205:5]
  %9 = getelementptr inbounds %struct.blake2s_state* %8, i32 0, i32 0, !dbg !232 ; [#uses=1 type=[8 x i32]*] [debug line = 205:5]
  %10 = getelementptr inbounds [8 x i32]* %9, i32 0, i32 0, !dbg !232 ; [#uses=1 type=i32*] [debug line = 205:5]
  %11 = bitcast i32* %10 to i8*, !dbg !232        ; [#uses=1 type=i8*] [debug line = 205:5]
  %12 = call i8* @memcpy_hls(i8* %7, i8* %11, i64 32), !dbg !232 ; [#uses=0 type=i8*] [debug line = 205:5]
  %13 = getelementptr inbounds [16 x i32]* %v, i32 0, i64 8, !dbg !233 ; [#uses=1 type=i32*] [debug line = 207:5]
  call void @blake2s_set_IV(i32* %13), !dbg !233  ; [debug line = 207:5]
  %14 = load %struct.blake2s_state** %1, align 8, !dbg !234 ; [#uses=1 type=%struct.blake2s_state*] [debug line = 208:5]
  %15 = getelementptr inbounds %struct.blake2s_state* %14, i32 0, i32 1, !dbg !234 ; [#uses=1 type=[2 x i32]*] [debug line = 208:5]
  %16 = getelementptr inbounds [2 x i32]* %15, i32 0, i64 0, !dbg !234 ; [#uses=1 type=i32*] [debug line = 208:5]
  %17 = load i32* %16, align 4, !dbg !234         ; [#uses=1 type=i32] [debug line = 208:5]
  %18 = getelementptr inbounds [16 x i32]* %v, i32 0, i64 12, !dbg !234 ; [#uses=2 type=i32*] [debug line = 208:5]
  %19 = load i32* %18, align 4, !dbg !234         ; [#uses=1 type=i32] [debug line = 208:5]
  %20 = xor i32 %19, %17, !dbg !234               ; [#uses=1 type=i32] [debug line = 208:5]
  store i32 %20, i32* %18, align 4, !dbg !234     ; [debug line = 208:5]
  %21 = load %struct.blake2s_state** %1, align 8, !dbg !235 ; [#uses=1 type=%struct.blake2s_state*] [debug line = 209:5]
  %22 = getelementptr inbounds %struct.blake2s_state* %21, i32 0, i32 1, !dbg !235 ; [#uses=1 type=[2 x i32]*] [debug line = 209:5]
  %23 = getelementptr inbounds [2 x i32]* %22, i32 0, i64 1, !dbg !235 ; [#uses=1 type=i32*] [debug line = 209:5]
  %24 = load i32* %23, align 4, !dbg !235         ; [#uses=1 type=i32] [debug line = 209:5]
  %25 = getelementptr inbounds [16 x i32]* %v, i32 0, i64 13, !dbg !235 ; [#uses=2 type=i32*] [debug line = 209:5]
  %26 = load i32* %25, align 4, !dbg !235         ; [#uses=1 type=i32] [debug line = 209:5]
  %27 = xor i32 %26, %24, !dbg !235               ; [#uses=1 type=i32] [debug line = 209:5]
  store i32 %27, i32* %25, align 4, !dbg !235     ; [debug line = 209:5]
  %28 = load %struct.blake2s_state** %1, align 8, !dbg !236 ; [#uses=1 type=%struct.blake2s_state*] [debug line = 210:5]
  %29 = getelementptr inbounds %struct.blake2s_state* %28, i32 0, i32 2, !dbg !236 ; [#uses=1 type=[2 x i32]*] [debug line = 210:5]
  %30 = getelementptr inbounds [2 x i32]* %29, i32 0, i64 0, !dbg !236 ; [#uses=1 type=i32*] [debug line = 210:5]
  %31 = load i32* %30, align 4, !dbg !236         ; [#uses=1 type=i32] [debug line = 210:5]
  %32 = getelementptr inbounds [16 x i32]* %v, i32 0, i64 14, !dbg !236 ; [#uses=2 type=i32*] [debug line = 210:5]
  %33 = load i32* %32, align 4, !dbg !236         ; [#uses=1 type=i32] [debug line = 210:5]
  %34 = xor i32 %33, %31, !dbg !236               ; [#uses=1 type=i32] [debug line = 210:5]
  store i32 %34, i32* %32, align 4, !dbg !236     ; [debug line = 210:5]
  %35 = load %struct.blake2s_state** %1, align 8, !dbg !237 ; [#uses=1 type=%struct.blake2s_state*] [debug line = 211:5]
  %36 = getelementptr inbounds %struct.blake2s_state* %35, i32 0, i32 2, !dbg !237 ; [#uses=1 type=[2 x i32]*] [debug line = 211:5]
  %37 = getelementptr inbounds [2 x i32]* %36, i32 0, i64 1, !dbg !237 ; [#uses=1 type=i32*] [debug line = 211:5]
  %38 = load i32* %37, align 4, !dbg !237         ; [#uses=1 type=i32] [debug line = 211:5]
  %39 = getelementptr inbounds [16 x i32]* %v, i32 0, i64 15, !dbg !237 ; [#uses=2 type=i32*] [debug line = 211:5]
  %40 = load i32* %39, align 4, !dbg !237         ; [#uses=1 type=i32] [debug line = 211:5]
  %41 = xor i32 %40, %38, !dbg !237               ; [#uses=1 type=i32] [debug line = 211:5]
  store i32 %41, i32* %39, align 4, !dbg !237     ; [debug line = 211:5]
  call void @llvm.dbg.declare(metadata !{i64* %r}, metadata !238), !dbg !240 ; [debug line = 213:17] [debug variable = r]
  store i64 0, i64* %r, align 8, !dbg !241        ; [debug line = 213:22]
  br label %42, !dbg !241                         ; [debug line = 213:22]

; <label>:42                                      ; preds = %49, %0
  %43 = load i64* %r, align 8, !dbg !241          ; [#uses=1 type=i64] [debug line = 213:22]
  %44 = icmp ult i64 %43, 10, !dbg !241           ; [#uses=1 type=i1] [debug line = 213:22]
  br i1 %44, label %45, label %52, !dbg !241      ; [debug line = 213:22]

; <label>:45                                      ; preds = %42
  %46 = load i64* %r, align 8, !dbg !242          ; [#uses=1 type=i64] [debug line = 215:9]
  %47 = load i32** %m, align 8, !dbg !242         ; [#uses=1 type=i32*] [debug line = 215:9]
  %48 = getelementptr inbounds [16 x i32]* %v, i32 0, i32 0, !dbg !242 ; [#uses=1 type=i32*] [debug line = 215:9]
  call void @blake2s_round(i64 %46, i32* %47, i32* %48), !dbg !242 ; [debug line = 215:9]
  br label %49, !dbg !244                         ; [debug line = 216:5]

; <label>:49                                      ; preds = %45
  %50 = load i64* %r, align 8, !dbg !245          ; [#uses=1 type=i64] [debug line = 213:32]
  %51 = add i64 %50, 1, !dbg !245                 ; [#uses=1 type=i64] [debug line = 213:32]
  store i64 %51, i64* %r, align 8, !dbg !245      ; [debug line = 213:32]
  br label %42, !dbg !245                         ; [debug line = 213:32]

; <label>:52                                      ; preds = %42
  call void @llvm.dbg.declare(metadata !{i64* %i}, metadata !246), !dbg !248 ; [debug line = 218:17] [debug variable = i]
  store i64 0, i64* %i, align 8, !dbg !249        ; [debug line = 218:22]
  br label %53, !dbg !249                         ; [debug line = 218:22]

; <label>:53                                      ; preds = %75, %52
  %54 = load i64* %i, align 8, !dbg !249          ; [#uses=1 type=i64] [debug line = 218:22]
  %55 = icmp ult i64 %54, 8, !dbg !249            ; [#uses=1 type=i1] [debug line = 218:22]
  br i1 %55, label %56, label %78, !dbg !249      ; [debug line = 218:22]

; <label>:56                                      ; preds = %53
  %57 = load i64* %i, align 8, !dbg !250          ; [#uses=1 type=i64] [debug line = 220:9]
  %58 = load %struct.blake2s_state** %1, align 8, !dbg !250 ; [#uses=1 type=%struct.blake2s_state*] [debug line = 220:9]
  %59 = getelementptr inbounds %struct.blake2s_state* %58, i32 0, i32 0, !dbg !250 ; [#uses=1 type=[8 x i32]*] [debug line = 220:9]
  %60 = getelementptr inbounds [8 x i32]* %59, i32 0, i64 %57, !dbg !250 ; [#uses=1 type=i32*] [debug line = 220:9]
  %61 = load i32* %60, align 4, !dbg !250         ; [#uses=1 type=i32] [debug line = 220:9]
  %62 = load i64* %i, align 8, !dbg !250          ; [#uses=1 type=i64] [debug line = 220:9]
  %63 = getelementptr inbounds [16 x i32]* %v, i32 0, i64 %62, !dbg !250 ; [#uses=1 type=i32*] [debug line = 220:9]
  %64 = load i32* %63, align 4, !dbg !250         ; [#uses=1 type=i32] [debug line = 220:9]
  %65 = xor i32 %61, %64, !dbg !250               ; [#uses=1 type=i32] [debug line = 220:9]
  %66 = load i64* %i, align 8, !dbg !250          ; [#uses=1 type=i64] [debug line = 220:9]
  %67 = add i64 %66, 8, !dbg !250                 ; [#uses=1 type=i64] [debug line = 220:9]
  %68 = getelementptr inbounds [16 x i32]* %v, i32 0, i64 %67, !dbg !250 ; [#uses=1 type=i32*] [debug line = 220:9]
  %69 = load i32* %68, align 4, !dbg !250         ; [#uses=1 type=i32] [debug line = 220:9]
  %70 = xor i32 %65, %69, !dbg !250               ; [#uses=1 type=i32] [debug line = 220:9]
  %71 = load i64* %i, align 8, !dbg !250          ; [#uses=1 type=i64] [debug line = 220:9]
  %72 = load %struct.blake2s_state** %1, align 8, !dbg !250 ; [#uses=1 type=%struct.blake2s_state*] [debug line = 220:9]
  %73 = getelementptr inbounds %struct.blake2s_state* %72, i32 0, i32 0, !dbg !250 ; [#uses=1 type=[8 x i32]*] [debug line = 220:9]
  %74 = getelementptr inbounds [8 x i32]* %73, i32 0, i64 %71, !dbg !250 ; [#uses=1 type=i32*] [debug line = 220:9]
  store i32 %70, i32* %74, align 4, !dbg !250     ; [debug line = 220:9]
  br label %75, !dbg !252                         ; [debug line = 221:5]

; <label>:75                                      ; preds = %56
  %76 = load i64* %i, align 8, !dbg !253          ; [#uses=1 type=i64] [debug line = 218:31]
  %77 = add i64 %76, 1, !dbg !253                 ; [#uses=1 type=i64] [debug line = 218:31]
  store i64 %77, i64* %i, align 8, !dbg !253      ; [debug line = 218:31]
  br label %53, !dbg !253                         ; [debug line = 218:31]

; <label>:78                                      ; preds = %53
  ret void, !dbg !254                             ; [debug line = 222:1]
}

; [#uses=1]
define internal i32 @blake2s_final(%struct.blake2s_state* %S, i8* %out) nounwind uwtable {
  %1 = alloca %struct.blake2s_state*, align 8     ; [#uses=2 type=%struct.blake2s_state**]
  %2 = alloca i8*, align 8                        ; [#uses=2 type=i8**]
  store %struct.blake2s_state* %S, %struct.blake2s_state** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.blake2s_state** %1}, metadata !255), !dbg !256 ; [debug line = 259:41] [debug variable = S]
  store i8* %out, i8** %2, align 8
  call void @llvm.dbg.declare(metadata !{i8** %2}, metadata !257), !dbg !258 ; [debug line = 259:50] [debug variable = out]
  %3 = load i8** %2, align 8, !dbg !259           ; [#uses=1 type=i8*] [debug line = 272:5]
  %4 = load %struct.blake2s_state** %1, align 8, !dbg !259 ; [#uses=1 type=%struct.blake2s_state*] [debug line = 272:5]
  %5 = getelementptr inbounds %struct.blake2s_state* %4, i32 0, i32 0, !dbg !259 ; [#uses=1 type=[8 x i32]*] [debug line = 272:5]
  %6 = getelementptr inbounds [8 x i32]* %5, i32 0, i32 0, !dbg !259 ; [#uses=1 type=i32*] [debug line = 272:5]
  %7 = bitcast i32* %6 to i8*, !dbg !259          ; [#uses=1 type=i8*] [debug line = 272:5]
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* %7, i64 32, i32 1, i1 false), !dbg !259 ; [debug line = 272:5]
  ret i32 0, !dbg !261                            ; [debug line = 273:5]
}

; [#uses=0]
define i32 @blake2s_blocks(i8* %out, i8* %in, i64 %inblocks) nounwind uwtable {
  %1 = alloca i8*, align 8                        ; [#uses=2 type=i8**]
  %2 = alloca i8*, align 8                        ; [#uses=3 type=i8**]
  %3 = alloca i64, align 8                        ; [#uses=2 type=i64*]
  store i8* %out, i8** %1, align 8
  call void @llvm.dbg.declare(metadata !{i8** %1}, metadata !262), !dbg !263 ; [debug line = 337:26] [debug variable = out]
  store i8* %in, i8** %2, align 8
  call void @llvm.dbg.declare(metadata !{i8** %2}, metadata !264), !dbg !265 ; [debug line = 337:45] [debug variable = in]
  store i64 %inblocks, i64* %3, align 8
  call void @llvm.dbg.declare(metadata !{i64* %3}, metadata !266), !dbg !267 ; [debug line = 337:62] [debug variable = inblocks]
  %4 = load i8** %2, align 8, !dbg !268           ; [#uses=1 type=i8*] [debug line = 338:2]
  call void (...)* @_ssdm_SpecArrayDimSize(i8* %4, i32 64) nounwind, !dbg !268 ; [debug line = 338:2]
  %5 = load i8** %1, align 8, !dbg !270           ; [#uses=1 type=i8*] [debug line = 339:12]
  %6 = load i8** %2, align 8, !dbg !270           ; [#uses=1 type=i8*] [debug line = 339:12]
  %7 = load i64* %3, align 8, !dbg !270           ; [#uses=1 type=i64] [debug line = 339:12]
  %8 = mul i64 %7, 64, !dbg !270                  ; [#uses=1 type=i64] [debug line = 339:12]
  %9 = call i32 @blake2s(i8* %5, i8* %6, i64 %8), !dbg !270 ; [#uses=1 type=i32] [debug line = 339:12]
  ret i32 %9, !dbg !270                           ; [debug line = 339:12]
}

; [#uses=4]
declare void @_ssdm_SpecArrayDimSize(...) nounwind

; [#uses=1]
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

; [#uses=2]
define internal void @blake2s_set_IV(i32* %buf) nounwind uwtable {
  %1 = alloca i32*, align 8                       ; [#uses=2 type=i32**]
  %i = alloca i64, align 8                        ; [#uses=6 type=i64*]
  store i32* %buf, i32** %1, align 8
  call void @llvm.dbg.declare(metadata !{i32** %1}, metadata !271), !dbg !272 ; [debug line = 137:38] [debug variable = buf]
  call void @llvm.dbg.declare(metadata !{i64* %i}, metadata !273), !dbg !276 ; [debug line = 139:17] [debug variable = i]
  store i64 0, i64* %i, align 8, !dbg !277        ; [debug line = 139:22]
  br label %2, !dbg !277                          ; [debug line = 139:22]

; <label>:2                                       ; preds = %12, %0
  %3 = load i64* %i, align 8, !dbg !277           ; [#uses=1 type=i64] [debug line = 139:22]
  %4 = icmp ult i64 %3, 8, !dbg !277              ; [#uses=1 type=i1] [debug line = 139:22]
  br i1 %4, label %5, label %15, !dbg !277        ; [debug line = 139:22]

; <label>:5                                       ; preds = %2
  %6 = load i64* %i, align 8, !dbg !278           ; [#uses=1 type=i64] [debug line = 141:9]
  %7 = getelementptr inbounds [8 x i32]* @blake2s_IV, i32 0, i64 %6, !dbg !278 ; [#uses=1 type=i32*] [debug line = 141:9]
  %8 = load i32* %7, align 4, !dbg !278           ; [#uses=1 type=i32] [debug line = 141:9]
  %9 = load i64* %i, align 8, !dbg !278           ; [#uses=1 type=i64] [debug line = 141:9]
  %10 = load i32** %1, align 8, !dbg !278         ; [#uses=1 type=i32*] [debug line = 141:9]
  %11 = getelementptr inbounds i32* %10, i64 %9, !dbg !278 ; [#uses=1 type=i32*] [debug line = 141:9]
  store i32 %8, i32* %11, align 4, !dbg !278      ; [debug line = 141:9]
  br label %12, !dbg !280                         ; [debug line = 142:5]

; <label>:12                                      ; preds = %5
  %13 = load i64* %i, align 8, !dbg !281          ; [#uses=1 type=i64] [debug line = 139:31]
  %14 = add i64 %13, 1, !dbg !281                 ; [#uses=1 type=i64] [debug line = 139:31]
  store i64 %14, i64* %i, align 8, !dbg !281      ; [debug line = 139:31]
  br label %2, !dbg !281                          ; [debug line = 139:31]

; <label>:15                                      ; preds = %2
  ret void, !dbg !282                             ; [debug line = 143:1]
}

; [#uses=1]
define internal void @blake2s_round(i64 %r, i32* %m, i32* %v) nounwind uwtable {
  %1 = alloca i64, align 8                        ; [#uses=2 type=i64*]
  %2 = alloca i32*, align 8                       ; [#uses=4 type=i32**]
  %3 = alloca i32*, align 8                       ; [#uses=6 type=i32**]
  %i = alloca i64, align 8                        ; [#uses=10 type=i64*]
  %bit4 = alloca i64, align 8                     ; [#uses=6 type=i64*]
  %a = alloca i32*, align 8                       ; [#uses=7 type=i32**]
  %b = alloca i32*, align 8                       ; [#uses=7 type=i32**]
  %c = alloca i32*, align 8                       ; [#uses=7 type=i32**]
  %d = alloca i32*, align 8                       ; [#uses=7 type=i32**]
  %sigma = alloca i8, align 1                     ; [#uses=3 type=i8*]
  %m1 = alloca i32, align 4                       ; [#uses=2 type=i32*]
  %m2 = alloca i32, align 4                       ; [#uses=2 type=i32*]
  store i64 %r, i64* %1, align 8
  call void @llvm.dbg.declare(metadata !{i64* %1}, metadata !283), !dbg !284 ; [debug line = 158:34] [debug variable = r]
  store i32* %m, i32** %2, align 8
  call void @llvm.dbg.declare(metadata !{i32** %2}, metadata !285), !dbg !286 ; [debug line = 158:52] [debug variable = m]
  store i32* %v, i32** %3, align 8
  call void @llvm.dbg.declare(metadata !{i32** %3}, metadata !287), !dbg !288 ; [debug line = 158:68] [debug variable = v]
  %4 = load i32** %3, align 8, !dbg !289          ; [#uses=1 type=i32*] [debug line = 159:2]
  call void (...)* @_ssdm_SpecArrayDimSize(i32* %4, i32 16) nounwind, !dbg !289 ; [debug line = 159:2]
  %5 = load i32** %2, align 8, !dbg !291          ; [#uses=1 type=i32*] [debug line = 159:31]
  call void (...)* @_ssdm_SpecArrayDimSize(i32* %5, i32 16) nounwind, !dbg !291 ; [debug line = 159:31]
  call void @llvm.dbg.declare(metadata !{i64* %i}, metadata !292), !dbg !294 ; [debug line = 160:17] [debug variable = i]
  store i64 0, i64* %i, align 8, !dbg !295        ; [debug line = 160:22]
  br label %6, !dbg !295                          ; [debug line = 160:22]

; <label>:6                                       ; preds = %121, %0
  %7 = load i64* %i, align 8, !dbg !295           ; [#uses=1 type=i64] [debug line = 160:22]
  %8 = icmp ult i64 %7, 8, !dbg !295              ; [#uses=1 type=i1] [debug line = 160:22]
  br i1 %8, label %9, label %124, !dbg !295       ; [debug line = 160:22]

; <label>:9                                       ; preds = %6
  call void @llvm.dbg.declare(metadata !{i64* %bit4}, metadata !296), !dbg !298 ; [debug line = 162:16] [debug variable = bit4]
  %10 = load i64* %i, align 8, !dbg !299          ; [#uses=1 type=i64] [debug line = 162:28]
  %11 = udiv i64 %10, 4, !dbg !299                ; [#uses=1 type=i64] [debug line = 162:28]
  store i64 %11, i64* %bit4, align 8, !dbg !299   ; [debug line = 162:28]
  call void @llvm.dbg.declare(metadata !{i32** %a}, metadata !300), !dbg !301 ; [debug line = 174:12] [debug variable = a]
  %12 = load i64* %i, align 8, !dbg !302          ; [#uses=1 type=i64] [debug line = 174:42]
  %13 = load i64* %bit4, align 8, !dbg !302       ; [#uses=1 type=i64] [debug line = 174:42]
  %14 = mul i64 %13, 0, !dbg !302                 ; [#uses=1 type=i64] [debug line = 174:42]
  %15 = add i64 %12, %14, !dbg !302               ; [#uses=1 type=i64] [debug line = 174:42]
  %16 = urem i64 %15, 4, !dbg !302                ; [#uses=1 type=i64] [debug line = 174:42]
  %17 = add i64 %16, 0, !dbg !302                 ; [#uses=1 type=i64] [debug line = 174:42]
  %18 = load i32** %3, align 8, !dbg !302         ; [#uses=1 type=i32*] [debug line = 174:42]
  %19 = getelementptr inbounds i32* %18, i64 %17, !dbg !302 ; [#uses=1 type=i32*] [debug line = 174:42]
  store i32* %19, i32** %a, align 8, !dbg !302    ; [debug line = 174:42]
  call void @llvm.dbg.declare(metadata !{i32** %b}, metadata !303), !dbg !304 ; [debug line = 175:19] [debug variable = b]
  %20 = load i64* %i, align 8, !dbg !305          ; [#uses=1 type=i64] [debug line = 175:49]
  %21 = load i64* %bit4, align 8, !dbg !305       ; [#uses=1 type=i64] [debug line = 175:49]
  %22 = mul i64 %21, 1, !dbg !305                 ; [#uses=1 type=i64] [debug line = 175:49]
  %23 = add i64 %20, %22, !dbg !305               ; [#uses=1 type=i64] [debug line = 175:49]
  %24 = urem i64 %23, 4, !dbg !305                ; [#uses=1 type=i64] [debug line = 175:49]
  %25 = add i64 %24, 4, !dbg !305                 ; [#uses=1 type=i64] [debug line = 175:49]
  %26 = load i32** %3, align 8, !dbg !305         ; [#uses=1 type=i32*] [debug line = 175:49]
  %27 = getelementptr inbounds i32* %26, i64 %25, !dbg !305 ; [#uses=1 type=i32*] [debug line = 175:49]
  store i32* %27, i32** %b, align 8, !dbg !305    ; [debug line = 175:49]
  call void @llvm.dbg.declare(metadata !{i32** %c}, metadata !306), !dbg !307 ; [debug line = 176:19] [debug variable = c]
  %28 = load i64* %i, align 8, !dbg !308          ; [#uses=1 type=i64] [debug line = 176:49]
  %29 = load i64* %bit4, align 8, !dbg !308       ; [#uses=1 type=i64] [debug line = 176:49]
  %30 = mul i64 %29, 2, !dbg !308                 ; [#uses=1 type=i64] [debug line = 176:49]
  %31 = add i64 %28, %30, !dbg !308               ; [#uses=1 type=i64] [debug line = 176:49]
  %32 = urem i64 %31, 4, !dbg !308                ; [#uses=1 type=i64] [debug line = 176:49]
  %33 = add i64 %32, 8, !dbg !308                 ; [#uses=1 type=i64] [debug line = 176:49]
  %34 = load i32** %3, align 8, !dbg !308         ; [#uses=1 type=i32*] [debug line = 176:49]
  %35 = getelementptr inbounds i32* %34, i64 %33, !dbg !308 ; [#uses=1 type=i32*] [debug line = 176:49]
  store i32* %35, i32** %c, align 8, !dbg !308    ; [debug line = 176:49]
  call void @llvm.dbg.declare(metadata !{i32** %d}, metadata !309), !dbg !310 ; [debug line = 177:19] [debug variable = d]
  %36 = load i64* %i, align 8, !dbg !311          ; [#uses=1 type=i64] [debug line = 177:57]
  %37 = load i64* %bit4, align 8, !dbg !311       ; [#uses=1 type=i64] [debug line = 177:57]
  %38 = mul i64 %37, 2, !dbg !311                 ; [#uses=1 type=i64] [debug line = 177:57]
  %39 = add i64 %36, %38, !dbg !311               ; [#uses=1 type=i64] [debug line = 177:57]
  %40 = load i64* %bit4, align 8, !dbg !311       ; [#uses=1 type=i64] [debug line = 177:57]
  %41 = add i64 %39, %40, !dbg !311               ; [#uses=1 type=i64] [debug line = 177:57]
  %42 = urem i64 %41, 4, !dbg !311                ; [#uses=1 type=i64] [debug line = 177:57]
  %43 = add i64 %42, 12, !dbg !311                ; [#uses=1 type=i64] [debug line = 177:57]
  %44 = load i32** %3, align 8, !dbg !311         ; [#uses=1 type=i32*] [debug line = 177:57]
  %45 = getelementptr inbounds i32* %44, i64 %43, !dbg !311 ; [#uses=1 type=i32*] [debug line = 177:57]
  store i32* %45, i32** %d, align 8, !dbg !311    ; [debug line = 177:57]
  call void @llvm.dbg.declare(metadata !{i8* %sigma}, metadata !312), !dbg !313 ; [debug line = 179:23] [debug variable = sigma]
  %46 = load i64* %i, align 8, !dbg !314          ; [#uses=1 type=i64] [debug line = 179:50]
  %47 = load i64* %1, align 8, !dbg !314          ; [#uses=1 type=i64] [debug line = 179:50]
  %48 = getelementptr inbounds [10 x [8 x i8]]* @blake2s_sigma, i32 0, i64 %47, !dbg !314 ; [#uses=1 type=[8 x i8]*] [debug line = 179:50]
  %49 = getelementptr inbounds [8 x i8]* %48, i32 0, i64 %46, !dbg !314 ; [#uses=1 type=i8*] [debug line = 179:50]
  %50 = load i8* %49, align 1, !dbg !314          ; [#uses=1 type=i8] [debug line = 179:50]
  store i8 %50, i8* %sigma, align 1, !dbg !314    ; [debug line = 179:50]
  call void @llvm.dbg.declare(metadata !{i32* %m1}, metadata !315), !dbg !316 ; [debug line = 180:18] [debug variable = m1]
  %51 = load i8* %sigma, align 1, !dbg !317       ; [#uses=1 type=i8] [debug line = 180:36]
  %52 = zext i8 %51 to i32, !dbg !317             ; [#uses=1 type=i32] [debug line = 180:36]
  %53 = ashr i32 %52, 4, !dbg !317                ; [#uses=1 type=i32] [debug line = 180:36]
  %54 = sext i32 %53 to i64, !dbg !317            ; [#uses=1 type=i64] [debug line = 180:36]
  %55 = load i32** %2, align 8, !dbg !317         ; [#uses=1 type=i32*] [debug line = 180:36]
  %56 = getelementptr inbounds i32* %55, i64 %54, !dbg !317 ; [#uses=1 type=i32*] [debug line = 180:36]
  %57 = load i32* %56, align 4, !dbg !317         ; [#uses=1 type=i32] [debug line = 180:36]
  store i32 %57, i32* %m1, align 4, !dbg !317     ; [debug line = 180:36]
  call void @llvm.dbg.declare(metadata !{i32* %m2}, metadata !318), !dbg !319 ; [debug line = 181:18] [debug variable = m2]
  %58 = load i8* %sigma, align 1, !dbg !320       ; [#uses=1 type=i8] [debug line = 181:37]
  %59 = zext i8 %58 to i32, !dbg !320             ; [#uses=1 type=i32] [debug line = 181:37]
  %60 = and i32 %59, 15, !dbg !320                ; [#uses=1 type=i32] [debug line = 181:37]
  %61 = sext i32 %60 to i64, !dbg !320            ; [#uses=1 type=i64] [debug line = 181:37]
  %62 = load i32** %2, align 8, !dbg !320         ; [#uses=1 type=i32*] [debug line = 181:37]
  %63 = getelementptr inbounds i32* %62, i64 %61, !dbg !320 ; [#uses=1 type=i32*] [debug line = 181:37]
  %64 = load i32* %63, align 4, !dbg !320         ; [#uses=1 type=i32] [debug line = 181:37]
  store i32 %64, i32* %m2, align 4, !dbg !320     ; [debug line = 181:37]
  %65 = load i32** %a, align 8, !dbg !321         ; [#uses=1 type=i32*] [debug line = 183:9]
  %66 = load i32* %65, align 4, !dbg !321         ; [#uses=1 type=i32] [debug line = 183:9]
  %67 = load i32** %b, align 8, !dbg !321         ; [#uses=1 type=i32*] [debug line = 183:9]
  %68 = load i32* %67, align 4, !dbg !321         ; [#uses=1 type=i32] [debug line = 183:9]
  %69 = add i32 %66, %68, !dbg !321               ; [#uses=1 type=i32] [debug line = 183:9]
  %70 = load i32* %m1, align 4, !dbg !321         ; [#uses=1 type=i32] [debug line = 183:9]
  %71 = add i32 %69, %70, !dbg !321               ; [#uses=1 type=i32] [debug line = 183:9]
  %72 = load i32** %a, align 8, !dbg !321         ; [#uses=1 type=i32*] [debug line = 183:9]
  store i32 %71, i32* %72, align 4, !dbg !321     ; [debug line = 183:9]
  %73 = load i32** %d, align 8, !dbg !322         ; [#uses=1 type=i32*] [debug line = 184:14]
  %74 = load i32* %73, align 4, !dbg !322         ; [#uses=1 type=i32] [debug line = 184:14]
  %75 = load i32** %a, align 8, !dbg !322         ; [#uses=1 type=i32*] [debug line = 184:14]
  %76 = load i32* %75, align 4, !dbg !322         ; [#uses=1 type=i32] [debug line = 184:14]
  %77 = xor i32 %74, %76, !dbg !322               ; [#uses=1 type=i32] [debug line = 184:14]
  %78 = call i32 @rotr32(i32 %77, i32 16), !dbg !322 ; [#uses=1 type=i32] [debug line = 184:14]
  %79 = load i32** %d, align 8, !dbg !322         ; [#uses=1 type=i32*] [debug line = 184:14]
  store i32 %78, i32* %79, align 4, !dbg !322     ; [debug line = 184:14]
  %80 = load i32** %c, align 8, !dbg !323         ; [#uses=1 type=i32*] [debug line = 185:9]
  %81 = load i32* %80, align 4, !dbg !323         ; [#uses=1 type=i32] [debug line = 185:9]
  %82 = load i32** %d, align 8, !dbg !323         ; [#uses=1 type=i32*] [debug line = 185:9]
  %83 = load i32* %82, align 4, !dbg !323         ; [#uses=1 type=i32] [debug line = 185:9]
  %84 = add i32 %81, %83, !dbg !323               ; [#uses=1 type=i32] [debug line = 185:9]
  %85 = load i32** %c, align 8, !dbg !323         ; [#uses=1 type=i32*] [debug line = 185:9]
  store i32 %84, i32* %85, align 4, !dbg !323     ; [debug line = 185:9]
  %86 = load i32** %b, align 8, !dbg !324         ; [#uses=1 type=i32*] [debug line = 186:14]
  %87 = load i32* %86, align 4, !dbg !324         ; [#uses=1 type=i32] [debug line = 186:14]
  %88 = load i32** %c, align 8, !dbg !324         ; [#uses=1 type=i32*] [debug line = 186:14]
  %89 = load i32* %88, align 4, !dbg !324         ; [#uses=1 type=i32] [debug line = 186:14]
  %90 = xor i32 %87, %89, !dbg !324               ; [#uses=1 type=i32] [debug line = 186:14]
  %91 = call i32 @rotr32(i32 %90, i32 12), !dbg !324 ; [#uses=1 type=i32] [debug line = 186:14]
  %92 = load i32** %b, align 8, !dbg !324         ; [#uses=1 type=i32*] [debug line = 186:14]
  store i32 %91, i32* %92, align 4, !dbg !324     ; [debug line = 186:14]
  %93 = load i32** %a, align 8, !dbg !325         ; [#uses=1 type=i32*] [debug line = 187:9]
  %94 = load i32* %93, align 4, !dbg !325         ; [#uses=1 type=i32] [debug line = 187:9]
  %95 = load i32** %b, align 8, !dbg !325         ; [#uses=1 type=i32*] [debug line = 187:9]
  %96 = load i32* %95, align 4, !dbg !325         ; [#uses=1 type=i32] [debug line = 187:9]
  %97 = add i32 %94, %96, !dbg !325               ; [#uses=1 type=i32] [debug line = 187:9]
  %98 = load i32* %m2, align 4, !dbg !325         ; [#uses=1 type=i32] [debug line = 187:9]
  %99 = add i32 %97, %98, !dbg !325               ; [#uses=1 type=i32] [debug line = 187:9]
  %100 = load i32** %a, align 8, !dbg !325        ; [#uses=1 type=i32*] [debug line = 187:9]
  store i32 %99, i32* %100, align 4, !dbg !325    ; [debug line = 187:9]
  %101 = load i32** %d, align 8, !dbg !326        ; [#uses=1 type=i32*] [debug line = 188:14]
  %102 = load i32* %101, align 4, !dbg !326       ; [#uses=1 type=i32] [debug line = 188:14]
  %103 = load i32** %a, align 8, !dbg !326        ; [#uses=1 type=i32*] [debug line = 188:14]
  %104 = load i32* %103, align 4, !dbg !326       ; [#uses=1 type=i32] [debug line = 188:14]
  %105 = xor i32 %102, %104, !dbg !326            ; [#uses=1 type=i32] [debug line = 188:14]
  %106 = call i32 @rotr32(i32 %105, i32 8), !dbg !326 ; [#uses=1 type=i32] [debug line = 188:14]
  %107 = load i32** %d, align 8, !dbg !326        ; [#uses=1 type=i32*] [debug line = 188:14]
  store i32 %106, i32* %107, align 4, !dbg !326   ; [debug line = 188:14]
  %108 = load i32** %c, align 8, !dbg !327        ; [#uses=1 type=i32*] [debug line = 189:9]
  %109 = load i32* %108, align 4, !dbg !327       ; [#uses=1 type=i32] [debug line = 189:9]
  %110 = load i32** %d, align 8, !dbg !327        ; [#uses=1 type=i32*] [debug line = 189:9]
  %111 = load i32* %110, align 4, !dbg !327       ; [#uses=1 type=i32] [debug line = 189:9]
  %112 = add i32 %109, %111, !dbg !327            ; [#uses=1 type=i32] [debug line = 189:9]
  %113 = load i32** %c, align 8, !dbg !327        ; [#uses=1 type=i32*] [debug line = 189:9]
  store i32 %112, i32* %113, align 4, !dbg !327   ; [debug line = 189:9]
  %114 = load i32** %b, align 8, !dbg !328        ; [#uses=1 type=i32*] [debug line = 190:14]
  %115 = load i32* %114, align 4, !dbg !328       ; [#uses=1 type=i32] [debug line = 190:14]
  %116 = load i32** %c, align 8, !dbg !328        ; [#uses=1 type=i32*] [debug line = 190:14]
  %117 = load i32* %116, align 4, !dbg !328       ; [#uses=1 type=i32] [debug line = 190:14]
  %118 = xor i32 %115, %117, !dbg !328            ; [#uses=1 type=i32] [debug line = 190:14]
  %119 = call i32 @rotr32(i32 %118, i32 7), !dbg !328 ; [#uses=1 type=i32] [debug line = 190:14]
  %120 = load i32** %b, align 8, !dbg !328        ; [#uses=1 type=i32*] [debug line = 190:14]
  store i32 %119, i32* %120, align 4, !dbg !328   ; [debug line = 190:14]
  br label %121, !dbg !329                        ; [debug line = 191:5]

; <label>:121                                     ; preds = %9
  %122 = load i64* %i, align 8, !dbg !330         ; [#uses=1 type=i64] [debug line = 160:31]
  %123 = add i64 %122, 1, !dbg !330               ; [#uses=1 type=i64] [debug line = 160:31]
  store i64 %123, i64* %i, align 8, !dbg !330     ; [debug line = 160:31]
  br label %6, !dbg !330                          ; [debug line = 160:31]

; <label>:124                                     ; preds = %6
  ret void, !dbg !331                             ; [debug line = 192:1]
}

; [#uses=4]
define internal i32 @rotr32(i32 %w, i32 %c) nounwind uwtable inlinehint {
  %1 = alloca i32, align 4                        ; [#uses=3 type=i32*]
  %2 = alloca i32, align 4                        ; [#uses=3 type=i32*]
  store i32 %w, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !332), !dbg !333 ; [debug line = 98:46] [debug variable = w]
  store i32 %c, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !334), !dbg !335 ; [debug line = 98:64] [debug variable = c]
  %3 = load i32* %1, align 4, !dbg !336           ; [#uses=1 type=i32] [debug line = 100:5]
  %4 = load i32* %2, align 4, !dbg !336           ; [#uses=1 type=i32] [debug line = 100:5]
  %5 = lshr i32 %3, %4, !dbg !336                 ; [#uses=1 type=i32] [debug line = 100:5]
  %6 = load i32* %1, align 4, !dbg !336           ; [#uses=1 type=i32] [debug line = 100:5]
  %7 = load i32* %2, align 4, !dbg !336           ; [#uses=1 type=i32] [debug line = 100:5]
  %8 = sub i32 32, %7, !dbg !336                  ; [#uses=1 type=i32] [debug line = 100:5]
  %9 = shl i32 %6, %8, !dbg !336                  ; [#uses=1 type=i32] [debug line = 100:5]
  %10 = or i32 %5, %9, !dbg !336                  ; [#uses=1 type=i32] [debug line = 100:5]
  ret i32 %10, !dbg !336                          ; [debug line = 100:5]
}

; [#uses=1]
define internal void @blake2s_set_lastnode(%struct.blake2s_state* %S) nounwind uwtable {
  %1 = alloca %struct.blake2s_state*, align 8     ; [#uses=2 type=%struct.blake2s_state**]
  store %struct.blake2s_state* %S, %struct.blake2s_state** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.blake2s_state** %1}, metadata !338), !dbg !339 ; [debug line = 110:49] [debug variable = S]
  %2 = load %struct.blake2s_state** %1, align 8, !dbg !340 ; [#uses=1 type=%struct.blake2s_state*] [debug line = 112:5]
  %3 = getelementptr inbounds %struct.blake2s_state* %2, i32 0, i32 2, !dbg !340 ; [#uses=1 type=[2 x i32]*] [debug line = 112:5]
  %4 = getelementptr inbounds [2 x i32]* %3, i32 0, i64 1, !dbg !340 ; [#uses=1 type=i32*] [debug line = 112:5]
  store i32 -1, i32* %4, align 4, !dbg !340       ; [debug line = 112:5]
  ret void, !dbg !342                             ; [debug line = 113:1]
}

; [#uses=1]
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

!llvm.dbg.cu = !{!0}
!opencl.kernels = !{!91, !98, !100, !103, !109, !113, !117, !122, !128, !131, !132, !136}
!hls.encrypted.func = !{}

!0 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/safayat/BYOTee/BYOTee-Build-Your-Own-TEEs/app1-hw-att/tools/hw-att-module/module1/solution1/.autopilot/db/blake2s.pragma.2.c", metadata !"/home/safayat/BYOTee/BYOTee-Build-Your-Own-TEEs/app1-hw-att/tools/hw-att-module", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !81} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !16, metadata !20, metadata !29, metadata !54, metadata !57, metadata !63, metadata !67, metadata !70, metadata !73, metadata !74, metadata !78}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"memcpy_hls", metadata !"memcpy_hls", metadata !"", metadata !6, i32 11, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i8*, i8*, i64)* @memcpy_hls, null, null, metadata !14, i32 12} ; [ DW_TAG_subprogram ]
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
!20 = metadata !{i32 786478, i32 0, metadata !6, metadata !"blake2s_blocks", metadata !"blake2s_blocks", metadata !"", metadata !6, i32 337, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i8*, i8*, i64)* @blake2s_blocks, null, null, metadata !14, i32 338} ; [ DW_TAG_subprogram ]
!21 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !22, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!22 = metadata !{metadata !19, metadata !9, metadata !23, metadata !12}
!23 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !24} ; [ DW_TAG_pointer_type ]
!24 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !25} ; [ DW_TAG_const_type ]
!25 = metadata !{i32 786454, null, metadata !"uint8_t", metadata !26, i32 24, i64 0, i64 0, i64 0, i32 0, metadata !27} ; [ DW_TAG_typedef ]
!26 = metadata !{i32 786473, metadata !"./blake2s.h", metadata !"/home/safayat/BYOTee/BYOTee-Build-Your-Own-TEEs/app1-hw-att/tools/hw-att-module", null} ; [ DW_TAG_file_type ]
!27 = metadata !{i32 786454, null, metadata !"__uint8_t", metadata !26, i32 38, i64 0, i64 0, i64 0, i32 0, metadata !28} ; [ DW_TAG_typedef ]
!28 = metadata !{i32 786468, null, metadata !"unsigned char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!29 = metadata !{i32 786478, i32 0, metadata !6, metadata !"blake2s_final", metadata !"blake2s_final", metadata !"", metadata !6, i32 259, metadata !30, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (%struct.blake2s_state*, i8*)* @blake2s_final, null, null, metadata !14, i32 260} ; [ DW_TAG_subprogram ]
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
!54 = metadata !{i32 786478, i32 0, metadata !6, metadata !"blake2s_compress", metadata !"blake2s_compress", metadata !"", metadata !6, i32 194, metadata !55, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.blake2s_state*, i8*)* @blake2s_compress, null, null, metadata !14, i32 195} ; [ DW_TAG_subprogram ]
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
!70 = metadata !{i32 786478, i32 0, metadata !6, metadata !"blake2s_set_lastblock", metadata !"blake2s_set_lastblock", metadata !"", metadata !6, i32 120, metadata !71, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.blake2s_state*)* @blake2s_set_lastblock, null, null, metadata !14, i32 121} ; [ DW_TAG_subprogram ]
!71 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !72, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!72 = metadata !{null, metadata !32}
!73 = metadata !{i32 786478, i32 0, metadata !6, metadata !"blake2s_set_lastnode", metadata !"blake2s_set_lastnode", metadata !"", metadata !6, i32 110, metadata !71, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.blake2s_state*)* @blake2s_set_lastnode, null, null, metadata !14, i32 111} ; [ DW_TAG_subprogram ]
!74 = metadata !{i32 786478, i32 0, metadata !6, metadata !"blake2s_increment_counter", metadata !"blake2s_increment_counter", metadata !"", metadata !6, i32 128, metadata !75, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.blake2s_state*, i64)* @blake2s_increment_counter, null, null, metadata !14, i32 129} ; [ DW_TAG_subprogram ]
!75 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !76, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!76 = metadata !{null, metadata !32, metadata !77}
!77 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_const_type ]
!78 = metadata !{i32 786478, i32 0, metadata !6, metadata !"blake2s_init", metadata !"blake2s_init", metadata !"", metadata !6, i32 146, metadata !79, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (%struct.blake2s_state*)* @blake2s_init, null, null, metadata !14, i32 147} ; [ DW_TAG_subprogram ]
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
!91 = metadata !{i8* (i8*, i8*, i64)* @memcpy_hls, metadata !92, metadata !93, metadata !94, metadata !95, metadata !96, metadata !97}
!92 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1, i32 0}
!93 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!94 = metadata !{metadata !"kernel_arg_type", metadata !"void*", metadata !"void*", metadata !"size_t"}
!95 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"const", metadata !""}
!96 = metadata !{metadata !"kernel_arg_name", metadata !"dest", metadata !"src", metadata !"len"}
!97 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!98 = metadata !{i32 (i8*, i8*, i64)* @blake2s, metadata !92, metadata !93, metadata !94, metadata !95, metadata !99, metadata !97}
!99 = metadata !{metadata !"kernel_arg_name", metadata !"out", metadata !"in", metadata !"inlen"}
!100 = metadata !{i32 (i8*, i8*, i64)* @blake2s_blocks, metadata !92, metadata !93, metadata !101, metadata !95, metadata !102, metadata !97}
!101 = metadata !{metadata !"kernel_arg_type", metadata !"void*", metadata !"uint8_t*", metadata !"size_t"}
!102 = metadata !{metadata !"kernel_arg_name", metadata !"out", metadata !"in", metadata !"inblocks"}
!103 = metadata !{i32 (%struct.blake2s_state*, i8*)* @blake2s_final, metadata !104, metadata !105, metadata !106, metadata !107, metadata !108, metadata !97}
!104 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1}
!105 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!106 = metadata !{metadata !"kernel_arg_type", metadata !"blake2s_state*", metadata !"void*"}
!107 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!108 = metadata !{metadata !"kernel_arg_name", metadata !"S", metadata !"out"}
!109 = metadata !{void (%struct.blake2s_state*, i8*)* @blake2s_compress, metadata !104, metadata !105, metadata !110, metadata !111, metadata !112, metadata !97}
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
!128 = metadata !{void (%struct.blake2s_state*)* @blake2s_set_lastblock, metadata !123, metadata !124, metadata !129, metadata !126, metadata !130, metadata !97}
!129 = metadata !{metadata !"kernel_arg_type", metadata !"blake2s_state*"}
!130 = metadata !{metadata !"kernel_arg_name", metadata !"S"}
!131 = metadata !{void (%struct.blake2s_state*)* @blake2s_set_lastnode, metadata !123, metadata !124, metadata !129, metadata !126, metadata !130, metadata !97}
!132 = metadata !{void (%struct.blake2s_state*, i64)* @blake2s_increment_counter, metadata !133, metadata !105, metadata !134, metadata !111, metadata !135, metadata !97}
!133 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0}
!134 = metadata !{metadata !"kernel_arg_type", metadata !"blake2s_state*", metadata !"size_t"}
!135 = metadata !{metadata !"kernel_arg_name", metadata !"S", metadata !"inc"}
!136 = metadata !{i32 (%struct.blake2s_state*)* @blake2s_init, metadata !123, metadata !124, metadata !129, metadata !126, metadata !130, metadata !97}
!137 = metadata !{i32 786689, metadata !5, metadata !"dest", metadata !6, i32 16777227, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!138 = metadata !{i32 11, i32 19, metadata !5, null}
!139 = metadata !{i32 786689, metadata !5, metadata !"src", metadata !6, i32 33554443, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!140 = metadata !{i32 11, i32 37, metadata !5, null}
!141 = metadata !{i32 786689, metadata !5, metadata !"len", metadata !6, i32 50331659, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!142 = metadata !{i32 11, i32 49, metadata !5, null}
!143 = metadata !{i32 786688, metadata !144, metadata !"d", metadata !6, i32 13, metadata !145, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!144 = metadata !{i32 786443, metadata !5, i32 12, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!145 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !146} ; [ DW_TAG_pointer_type ]
!146 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!147 = metadata !{i32 13, i32 9, metadata !144, null}
!148 = metadata !{i32 13, i32 17, metadata !144, null}
!149 = metadata !{i32 786688, metadata !144, metadata !"s", metadata !6, i32 14, metadata !150, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!150 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !151} ; [ DW_TAG_pointer_type ]
!151 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !146} ; [ DW_TAG_const_type ]
!152 = metadata !{i32 14, i32 15, metadata !144, null}
!153 = metadata !{i32 14, i32 22, metadata !144, null}
!154 = metadata !{i32 15, i32 3, metadata !144, null}
!155 = metadata !{i32 16, i32 5, metadata !144, null}
!156 = metadata !{i32 17, i32 3, metadata !144, null}
!157 = metadata !{i32 786689, metadata !16, metadata !"out", metadata !6, i32 16777492, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!158 = metadata !{i32 276, i32 19, metadata !16, null}
!159 = metadata !{i32 786689, metadata !16, metadata !"in", metadata !6, i32 33554708, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!160 = metadata !{i32 276, i32 36, metadata !16, null}
!161 = metadata !{i32 786689, metadata !16, metadata !"inlen", metadata !6, i32 50331924, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!162 = metadata !{i32 276, i32 47, metadata !16, null}
!163 = metadata !{i32 786688, metadata !164, metadata !"S", metadata !6, i32 278, metadata !165, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!164 = metadata !{i32 786443, metadata !16, i32 277, i32 1, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!165 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 1024, i64 64, i32 0, i32 0, metadata !33, metadata !166, i32 0, i32 0} ; [ DW_TAG_array_type ]
!166 = metadata !{metadata !167}
!167 = metadata !{i32 786465, i64 0, i64 0}       ; [ DW_TAG_subrange_type ]
!168 = metadata !{i32 278, i32 19, metadata !164, null}
!169 = metadata !{i32 786688, metadata !164, metadata !"err_init", metadata !6, i32 288, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!170 = metadata !{i32 288, i32 9, metadata !164, null}
!171 = metadata !{i32 288, i32 20, metadata !164, null}
!172 = metadata !{i32 786688, metadata !173, metadata !"inbuf", metadata !6, i32 307, metadata !23, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!173 = metadata !{i32 786443, metadata !164, i32 301, i32 5, metadata !6, i32 2} ; [ DW_TAG_lexical_block ]
!174 = metadata !{i32 307, i32 24, metadata !173, null}
!175 = metadata !{i32 307, i32 34, metadata !173, null}
!176 = metadata !{i32 786688, metadata !173, metadata !"inend", metadata !6, i32 308, metadata !23, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!177 = metadata !{i32 308, i32 24, metadata !173, null}
!178 = metadata !{i32 308, i32 52, metadata !173, null}
!179 = metadata !{i32 309, i32 9, metadata !180, null}
!180 = metadata !{i32 786443, metadata !173, i32 309, i32 9, metadata !6, i32 3} ; [ DW_TAG_lexical_block ]
!181 = metadata !{i32 311, i32 13, metadata !182, null}
!182 = metadata !{i32 786443, metadata !180, i32 310, i32 9, metadata !6, i32 4} ; [ DW_TAG_lexical_block ]
!183 = metadata !{i32 313, i32 13, metadata !182, null}
!184 = metadata !{i32 315, i32 17, metadata !185, null}
!185 = metadata !{i32 786443, metadata !182, i32 314, i32 13, metadata !6, i32 5} ; [ DW_TAG_lexical_block ]
!186 = metadata !{i32 316, i32 13, metadata !185, null}
!187 = metadata !{i32 318, i32 13, metadata !182, null}
!188 = metadata !{i32 320, i32 13, metadata !182, null}
!189 = metadata !{i32 322, i32 17, metadata !190, null}
!190 = metadata !{i32 786443, metadata !182, i32 321, i32 13, metadata !6, i32 6} ; [ DW_TAG_lexical_block ]
!191 = metadata !{i32 324, i32 13, metadata !182, null}
!192 = metadata !{i32 325, i32 9, metadata !182, null}
!193 = metadata !{i32 786688, metadata !164, metadata !"err_final", metadata !6, i32 328, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!194 = metadata !{i32 328, i32 9, metadata !164, null}
!195 = metadata !{i32 328, i32 21, metadata !164, null}
!196 = metadata !{i32 334, i32 5, metadata !164, null}
!197 = metadata !{i32 786689, metadata !78, metadata !"S", metadata !6, i32 16777362, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!198 = metadata !{i32 146, i32 40, metadata !78, null}
!199 = metadata !{i32 148, i32 5, metadata !200, null}
!200 = metadata !{i32 786443, metadata !78, i32 147, i32 1, metadata !6, i32 24} ; [ DW_TAG_lexical_block ]
!201 = metadata !{i32 150, i32 5, metadata !200, null}
!202 = metadata !{i32 153, i32 5, metadata !200, null}
!203 = metadata !{i32 155, i32 5, metadata !200, null}
!204 = metadata !{i32 786689, metadata !74, metadata !"S", metadata !6, i32 16777344, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!205 = metadata !{i32 128, i32 54, metadata !74, null}
!206 = metadata !{i32 786689, metadata !74, metadata !"inc", metadata !6, i32 33554560, metadata !77, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!207 = metadata !{i32 128, i32 70, metadata !74, null}
!208 = metadata !{i32 130, i32 5, metadata !209, null}
!209 = metadata !{i32 786443, metadata !74, i32 129, i32 1, metadata !6, i32 23} ; [ DW_TAG_lexical_block ]
!210 = metadata !{i32 135, i32 1, metadata !209, null}
!211 = metadata !{i32 786689, metadata !70, metadata !"S", metadata !6, i32 16777336, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!212 = metadata !{i32 120, i32 50, metadata !70, null}
!213 = metadata !{i32 122, i32 5, metadata !214, null}
!214 = metadata !{i32 786443, metadata !70, i32 121, i32 1, metadata !6, i32 21} ; [ DW_TAG_lexical_block ]
!215 = metadata !{i32 123, i32 9, metadata !214, null}
!216 = metadata !{i32 125, i32 5, metadata !214, null}
!217 = metadata !{i32 126, i32 1, metadata !214, null}
!218 = metadata !{i32 786689, metadata !54, metadata !"S", metadata !6, i32 16777410, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!219 = metadata !{i32 194, i32 45, metadata !54, null}
!220 = metadata !{i32 786689, metadata !54, metadata !"in", metadata !6, i32 33554626, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!221 = metadata !{i32 194, i32 62, metadata !54, null}
!222 = metadata !{i32 195, i32 2, metadata !223, null}
!223 = metadata !{i32 786443, metadata !54, i32 195, i32 1, metadata !6, i32 9} ; [ DW_TAG_lexical_block ]
!224 = metadata !{i32 786688, metadata !223, metadata !"m", metadata !6, i32 198, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!225 = metadata !{i32 198, i32 22, metadata !223, null}
!226 = metadata !{i32 198, i32 28, metadata !223, null}
!227 = metadata !{i32 786688, metadata !223, metadata !"v", metadata !6, i32 204, metadata !228, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!228 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 512, i64 32, i32 0, i32 0, metadata !38, metadata !229, i32 0, i32 0} ; [ DW_TAG_array_type ]
!229 = metadata !{metadata !230}
!230 = metadata !{i32 786465, i64 0, i64 15}      ; [ DW_TAG_subrange_type ]
!231 = metadata !{i32 204, i32 14, metadata !223, null}
!232 = metadata !{i32 205, i32 5, metadata !223, null}
!233 = metadata !{i32 207, i32 5, metadata !223, null}
!234 = metadata !{i32 208, i32 5, metadata !223, null}
!235 = metadata !{i32 209, i32 5, metadata !223, null}
!236 = metadata !{i32 210, i32 5, metadata !223, null}
!237 = metadata !{i32 211, i32 5, metadata !223, null}
!238 = metadata !{i32 786688, metadata !239, metadata !"r", metadata !6, i32 213, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!239 = metadata !{i32 786443, metadata !223, i32 213, i32 5, metadata !6, i32 10} ; [ DW_TAG_lexical_block ]
!240 = metadata !{i32 213, i32 17, metadata !239, null}
!241 = metadata !{i32 213, i32 22, metadata !239, null}
!242 = metadata !{i32 215, i32 9, metadata !243, null}
!243 = metadata !{i32 786443, metadata !239, i32 214, i32 5, metadata !6, i32 11} ; [ DW_TAG_lexical_block ]
!244 = metadata !{i32 216, i32 5, metadata !243, null}
!245 = metadata !{i32 213, i32 32, metadata !239, null}
!246 = metadata !{i32 786688, metadata !247, metadata !"i", metadata !6, i32 218, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!247 = metadata !{i32 786443, metadata !223, i32 218, i32 5, metadata !6, i32 12} ; [ DW_TAG_lexical_block ]
!248 = metadata !{i32 218, i32 17, metadata !247, null}
!249 = metadata !{i32 218, i32 22, metadata !247, null}
!250 = metadata !{i32 220, i32 9, metadata !251, null}
!251 = metadata !{i32 786443, metadata !247, i32 219, i32 5, metadata !6, i32 13} ; [ DW_TAG_lexical_block ]
!252 = metadata !{i32 221, i32 5, metadata !251, null}
!253 = metadata !{i32 218, i32 31, metadata !247, null}
!254 = metadata !{i32 222, i32 1, metadata !223, null}
!255 = metadata !{i32 786689, metadata !29, metadata !"S", metadata !6, i32 16777475, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!256 = metadata !{i32 259, i32 41, metadata !29, null}
!257 = metadata !{i32 786689, metadata !29, metadata !"out", metadata !6, i32 33554691, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!258 = metadata !{i32 259, i32 50, metadata !29, null}
!259 = metadata !{i32 272, i32 5, metadata !260, null}
!260 = metadata !{i32 786443, metadata !29, i32 260, i32 1, metadata !6, i32 8} ; [ DW_TAG_lexical_block ]
!261 = metadata !{i32 273, i32 5, metadata !260, null}
!262 = metadata !{i32 786689, metadata !20, metadata !"out", metadata !6, i32 16777553, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!263 = metadata !{i32 337, i32 26, metadata !20, null}
!264 = metadata !{i32 786689, metadata !20, metadata !"in", metadata !6, i32 33554769, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!265 = metadata !{i32 337, i32 45, metadata !20, null}
!266 = metadata !{i32 786689, metadata !20, metadata !"inblocks", metadata !6, i32 50331985, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!267 = metadata !{i32 337, i32 62, metadata !20, null}
!268 = metadata !{i32 338, i32 2, metadata !269, null}
!269 = metadata !{i32 786443, metadata !20, i32 338, i32 1, metadata !6, i32 7} ; [ DW_TAG_lexical_block ]
!270 = metadata !{i32 339, i32 12, metadata !269, null}
!271 = metadata !{i32 786689, metadata !67, metadata !"buf", metadata !6, i32 16777353, metadata !62, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!272 = metadata !{i32 137, i32 38, metadata !67, null}
!273 = metadata !{i32 786688, metadata !274, metadata !"i", metadata !6, i32 139, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!274 = metadata !{i32 786443, metadata !275, i32 139, i32 5, metadata !6, i32 19} ; [ DW_TAG_lexical_block ]
!275 = metadata !{i32 786443, metadata !67, i32 138, i32 1, metadata !6, i32 18} ; [ DW_TAG_lexical_block ]
!276 = metadata !{i32 139, i32 17, metadata !274, null}
!277 = metadata !{i32 139, i32 22, metadata !274, null}
!278 = metadata !{i32 141, i32 9, metadata !279, null}
!279 = metadata !{i32 786443, metadata !274, i32 140, i32 5, metadata !6, i32 20} ; [ DW_TAG_lexical_block ]
!280 = metadata !{i32 142, i32 5, metadata !279, null}
!281 = metadata !{i32 139, i32 31, metadata !274, null}
!282 = metadata !{i32 143, i32 1, metadata !275, null}
!283 = metadata !{i32 786689, metadata !57, metadata !"r", metadata !6, i32 16777374, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!284 = metadata !{i32 158, i32 34, metadata !57, null}
!285 = metadata !{i32 786689, metadata !57, metadata !"m", metadata !6, i32 33554590, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!286 = metadata !{i32 158, i32 52, metadata !57, null}
!287 = metadata !{i32 786689, metadata !57, metadata !"v", metadata !6, i32 50331806, metadata !62, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!288 = metadata !{i32 158, i32 68, metadata !57, null}
!289 = metadata !{i32 159, i32 2, metadata !290, null}
!290 = metadata !{i32 786443, metadata !57, i32 159, i32 1, metadata !6, i32 14} ; [ DW_TAG_lexical_block ]
!291 = metadata !{i32 159, i32 31, metadata !290, null}
!292 = metadata !{i32 786688, metadata !293, metadata !"i", metadata !6, i32 160, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!293 = metadata !{i32 786443, metadata !290, i32 160, i32 5, metadata !6, i32 15} ; [ DW_TAG_lexical_block ]
!294 = metadata !{i32 160, i32 17, metadata !293, null}
!295 = metadata !{i32 160, i32 22, metadata !293, null}
!296 = metadata !{i32 786688, metadata !297, metadata !"bit4", metadata !6, i32 162, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!297 = metadata !{i32 786443, metadata !293, i32 161, i32 5, metadata !6, i32 16} ; [ DW_TAG_lexical_block ]
!298 = metadata !{i32 162, i32 16, metadata !297, null}
!299 = metadata !{i32 162, i32 28, metadata !297, null}
!300 = metadata !{i32 786688, metadata !297, metadata !"a", metadata !6, i32 174, metadata !62, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!301 = metadata !{i32 174, i32 12, metadata !297, null}
!302 = metadata !{i32 174, i32 42, metadata !297, null}
!303 = metadata !{i32 786688, metadata !297, metadata !"b", metadata !6, i32 175, metadata !62, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!304 = metadata !{i32 175, i32 19, metadata !297, null}
!305 = metadata !{i32 175, i32 49, metadata !297, null}
!306 = metadata !{i32 786688, metadata !297, metadata !"c", metadata !6, i32 176, metadata !62, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!307 = metadata !{i32 176, i32 19, metadata !297, null}
!308 = metadata !{i32 176, i32 49, metadata !297, null}
!309 = metadata !{i32 786688, metadata !297, metadata !"d", metadata !6, i32 177, metadata !62, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!310 = metadata !{i32 177, i32 19, metadata !297, null}
!311 = metadata !{i32 177, i32 57, metadata !297, null}
!312 = metadata !{i32 786688, metadata !297, metadata !"sigma", metadata !6, i32 179, metadata !24, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!313 = metadata !{i32 179, i32 23, metadata !297, null}
!314 = metadata !{i32 179, i32 50, metadata !297, null}
!315 = metadata !{i32 786688, metadata !297, metadata !"m1", metadata !6, i32 180, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!316 = metadata !{i32 180, i32 18, metadata !297, null}
!317 = metadata !{i32 180, i32 36, metadata !297, null}
!318 = metadata !{i32 786688, metadata !297, metadata !"m2", metadata !6, i32 181, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!319 = metadata !{i32 181, i32 18, metadata !297, null}
!320 = metadata !{i32 181, i32 37, metadata !297, null}
!321 = metadata !{i32 183, i32 9, metadata !297, null}
!322 = metadata !{i32 184, i32 14, metadata !297, null}
!323 = metadata !{i32 185, i32 9, metadata !297, null}
!324 = metadata !{i32 186, i32 14, metadata !297, null}
!325 = metadata !{i32 187, i32 9, metadata !297, null}
!326 = metadata !{i32 188, i32 14, metadata !297, null}
!327 = metadata !{i32 189, i32 9, metadata !297, null}
!328 = metadata !{i32 190, i32 14, metadata !297, null}
!329 = metadata !{i32 191, i32 5, metadata !297, null}
!330 = metadata !{i32 160, i32 31, metadata !293, null}
!331 = metadata !{i32 192, i32 1, metadata !290, null}
!332 = metadata !{i32 786689, metadata !63, metadata !"w", metadata !6, i32 16777314, metadata !61, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!333 = metadata !{i32 98, i32 46, metadata !63, null}
!334 = metadata !{i32 786689, metadata !63, metadata !"c", metadata !6, i32 33554530, metadata !66, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!335 = metadata !{i32 98, i32 64, metadata !63, null}
!336 = metadata !{i32 100, i32 5, metadata !337, null}
!337 = metadata !{i32 786443, metadata !63, i32 99, i32 1, metadata !6, i32 17} ; [ DW_TAG_lexical_block ]
!338 = metadata !{i32 786689, metadata !73, metadata !"S", metadata !6, i32 16777326, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!339 = metadata !{i32 110, i32 49, metadata !73, null}
!340 = metadata !{i32 112, i32 5, metadata !341, null}
!341 = metadata !{i32 786443, metadata !73, i32 111, i32 1, metadata !6, i32 22} ; [ DW_TAG_lexical_block ]
!342 = metadata !{i32 113, i32 1, metadata !341, null}
