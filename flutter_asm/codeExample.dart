// lib: , url: package:ext_lib/src/services/route_service.dart

// class id: 1048641, size: 0x8
class :: {
}

// class id: 2274, size: 0x8, field offset: 0x8
abstract class RouteService extends Object {

  static _ getConfig(/* No info */) async {
    // ** addr: 0x323f58, size: 0x4ac
    // 0x323f58: EnterFrame
    //     0x323f58: stp             fp, lr, [SP, #-0x10]!
    //     0x323f5c: mov             fp, SP
    // 0x323f60: AllocStack(0xf0)
    //     0x323f60: sub             SP, SP, #0xf0
    // 0x323f64: SetupParameters()
    //     0x323f64: stur            NULL, [fp, #-8]
    // 0x323f68: CheckStackOverflow
    //     0x323f68: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x323f6c: cmp             SP, x16
    //     0x323f70: b.ls            #0x3243fc
    // 0x323f74: InitAsync() -> Future<Config?>
    //     0x323f74: add             x0, PP, #9, lsl #12  ; [pp+0x9ae0] TypeArguments: <Config?>
    //     0x323f78: ldr             x0, [x0, #0xae0]
    //     0x323f7c: bl              #0x1e9584  ; InitAsyncStub
    // 0x323f80: r0 = _enable()
    //     0x323f80: bl              #0x37132c  ; [package:ext_lib/src/services/route_service.dart] RouteService::_enable
    // 0x323f84: mov             x1, x0
    // 0x323f88: stur            x1, [fp, #-0xb0]
    // 0x323f8c: r0 = Await()
    //     0x323f8c: bl              #0x1e9350  ; AwaitStub
    // 0x323f90: r16 = true
    //     0x323f90: add             x16, NULL, #0x20  ; true
    // 0x323f94: cmp             w0, w16
    // 0x323f98: b.eq            #0x323fa4
    // 0x323f9c: r0 = Null
    //     0x323f9c: mov             x0, NULL
    // 0x323fa0: r0 = ReturnAsyncNotFuture()
    //     0x323fa0: b               #0x1e909c  ; ReturnAsyncNotFutureStub
    // 0x323fa4: r1 = "CEJkNAfNJO2JdplVMIuz7VJjoJJJ24L1zdz2o25rgl2+jFzROn5HBXe63JZ1DgZ/02A68rcgcXRdSm7qkUE+AiQQ6OUUay3cTeRJmSgKKj8="
    //     0x323fa4: add             x1, PP, #9, lsl #12  ; [pp+0x9ae8] "CEJkNAfNJO2JdplVMIuz7VJjoJJJ24L1zdz2o25rgl2+jFzROn5HBXe63JZ1DgZ/02A68rcgcXRdSm7qkUE+AiQQ6OUUay3cTeRJmSgKKj8="
    //     0x323fa8: ldr             x1, [x1, #0xae8]
    // 0x323fac: r0 = decrypt()
    //     0x323fac: bl              #0x34b824  ; [package:ext_lib/src/services/encryption_service.dart] EncryptionService::decrypt
    // 0x323fb0: mov             x1, x0
    // 0x323fb4: r0 = get()
    //     0x323fb4: bl              #0x324a5c  ; [package:ext_lib/src/services/network_service.dart] NetworkService::get
    // 0x323fb8: mov             x1, x0
    // 0x323fbc: stur            x1, [fp, #-0xb0]
    // 0x323fc0: r0 = Await()
    //     0x323fc0: bl              #0x1e9350  ; AwaitStub
    // 0x323fc4: mov             x3, x0
    // 0x323fc8: stur            x3, [fp, #-0xb8]
    // 0x323fcc: LoadField: r4 = r3->field_b
    //     0x323fcc: ldur            w4, [x3, #0xb]
    // 0x323fd0: DecompressPointer r4
    //     0x323fd0: add             x4, x4, HEAP, lsl #32
    // 0x323fd4: mov             x0, x4
    // 0x323fd8: stur            x4, [fp, #-0xb0]
    // 0x323fdc: r2 = Null
    //     0x323fdc: mov             x2, NULL
    // 0x323fe0: r1 = Null
    //     0x323fe0: mov             x1, NULL
    // 0x323fe4: r4 = 60
    //     0x323fe4: mov             x4, #0x3c
    // 0x323fe8: branchIfSmi(r0, 0x323ff4)
    //     0x323fe8: tbz             w0, #0, #0x323ff4
    // 0x323fec: r4 = LoadClassIdInstr(r0)
    //     0x323fec: ldur            x4, [x0, #-1]
    //     0x323ff0: ubfx            x4, x4, #0xc, #0x14
    // 0x323ff4: sub             x4, x4, #0x5a
    // 0x323ff8: cmp             x4, #2
    // 0x323ffc: b.ls            #0x324030
    // 0x324000: sub             x4, x4, #0x16
    // 0x324004: cmp             x4, #0x37
    // 0x324008: b.ls            #0x324030
    // 0x32400c: sub             x4, x4, #0xb17
    // 0x324010: cmp             x4, #2
    // 0x324014: b.ls            #0x324030
    // 0x324018: cmp             x4, #0x3e
    // 0x32401c: b.eq            #0x324030
    // 0x324020: r8 = List
    //     0x324020: ldr             x8, [PP, #0x5978]  ; [pp+0x5978] Type: List
    // 0x324024: r3 = Null
    //     0x324024: add             x3, PP, #9, lsl #12  ; [pp+0x9af0] Null
    //     0x324028: ldr             x3, [x3, #0xaf0]
    // 0x32402c: r0 = DefaultTypeTest()
    //     0x32402c: bl              #0x448c24  ; DefaultTypeTestStub
    // 0x324030: ldur            x1, [fp, #-0xb0]
    // 0x324034: r0 = LoadClassIdInstr(r1)
    //     0x324034: ldur            x0, [x1, #-1]
    //     0x324038: ubfx            x0, x0, #0xc, #0x14
    // 0x32403c: stp             xzr, x1, [SP]
    // 0x324040: r0 = GDT[cid_x0 + -0x1000]()
    //     0x324040: sub             lr, x0, #1, lsl #12
    //     0x324044: ldr             lr, [x21, lr, lsl #3]
    //     0x324048: blr             lr
    // 0x32404c: r16 = "body"
    //     0x32404c: add             x16, PP, #9, lsl #12  ; [pp+0x9b00] "body"
    //     0x324050: ldr             x16, [x16, #0xb00]
    // 0x324054: stp             x16, x0, [SP]
    // 0x324058: r4 = 0
    //     0x324058: mov             x4, #0
    // 0x32405c: ldr             x0, [SP, #8]
    // 0x324060: r16 = UnlinkedCall_0x1c3b5c
    //     0x324060: add             x16, PP, #9, lsl #12  ; [pp+0x9b08] UnlinkedCall: 0x1c3b5c - SwitchableCallMissStub
    //     0x324064: add             x16, x16, #0xb08
    // 0x324068: ldp             x5, lr, [x16]
    // 0x32406c: blr             lr
    // 0x324070: mov             x3, x0
    // 0x324074: r2 = Null
    //     0x324074: mov             x2, NULL
    // 0x324078: r1 = Null
    //     0x324078: mov             x1, NULL
    // 0x32407c: stur            x3, [fp, #-0xc0]
    // 0x324080: r4 = 60
    //     0x324080: mov             x4, #0x3c
    // 0x324084: branchIfSmi(r0, 0x324090)
    //     0x324084: tbz             w0, #0, #0x324090
    // 0x324088: r4 = LoadClassIdInstr(r0)
    //     0x324088: ldur            x4, [x0, #-1]
    //     0x32408c: ubfx            x4, x4, #0xc, #0x14
    // 0x324090: sub             x4, x4, #0x5e
    // 0x324094: cmp             x4, #1
    // 0x324098: b.ls            #0x3240ac
    // 0x32409c: r8 = String
    //     0x32409c: ldr             x8, [PP, #0x2a8]  ; [pp+0x2a8] Type: String
    // 0x3240a0: r3 = Null
    //     0x3240a0: add             x3, PP, #9, lsl #12  ; [pp+0x9b18] Null
    //     0x3240a4: ldr             x3, [x3, #0xb18]
    // 0x3240a8: r0 = String()
    //     0x3240a8: bl              #0x4660bc  ; IsType_String_Stub
    // 0x3240ac: ldur            x1, [fp, #-0xc0]
    // 0x3240b0: r0 = decrypt()
    //     0x3240b0: bl              #0x34b824  ; [package:ext_lib/src/services/encryption_service.dart] EncryptionService::decrypt
    // 0x3240b4: mov             x1, x0
    // 0x3240b8: stur            x0, [fp, #-0xc8]
    // 0x3240bc: r0 = jsonDecode()
    //     0x3240bc: bl              #0x2aa190  ; [dart:convert] ::jsonDecode
    // 0x3240c0: stur            x0, [fp, #-0xd0]
    // 0x3240c4: r16 = "isOpenCard"
    //     0x3240c4: add             x16, PP, #9, lsl #12  ; [pp+0x9b28] "isOpenCard"
    //     0x3240c8: ldr             x16, [x16, #0xb28]
    // 0x3240cc: stp             x16, x0, [SP]
    // 0x3240d0: r4 = 0
    //     0x3240d0: mov             x4, #0
    // 0x3240d4: ldr             x0, [SP, #8]
    // 0x3240d8: r16 = UnlinkedCall_0x1c3b5c
    //     0x3240d8: add             x16, PP, #9, lsl #12  ; [pp+0x9b30] UnlinkedCall: 0x1c3b5c - SwitchableCallMissStub
    //     0x3240dc: add             x16, x16, #0xb30
    // 0x3240e0: ldp             x5, lr, [x16]
    // 0x3240e4: blr             lr
    // 0x3240e8: mov             x3, x0
    // 0x3240ec: r2 = Null
    //     0x3240ec: mov             x2, NULL
    // 0x3240f0: r1 = Null
    //     0x3240f0: mov             x1, NULL
    // 0x3240f4: stur            x3, [fp, #-0xd8]
    // 0x3240f8: r4 = 60
    //     0x3240f8: mov             x4, #0x3c
    // 0x3240fc: branchIfSmi(r0, 0x324108)
    //     0x3240fc: tbz             w0, #0, #0x324108
    // 0x324100: r4 = LoadClassIdInstr(r0)
    //     0x324100: ldur            x4, [x0, #-1]
    //     0x324104: ubfx            x4, x4, #0xc, #0x14
    // 0x324108: cmp             x4, #0x3f
    // 0x32410c: b.eq            #0x324120
    // 0x324110: r8 = bool
    //     0x324110: ldr             x8, [PP, #0xa30]  ; [pp+0xa30] Type: bool
    // 0x324114: r3 = Null
    //     0x324114: add             x3, PP, #9, lsl #12  ; [pp+0x9b40] Null
    //     0x324118: ldr             x3, [x3, #0xb40]
    // 0x32411c: r0 = bool()
    //     0x32411c: bl              #0x46609c  ; IsType_bool_Stub
    // 0x324120: ldur            x0, [fp, #-0xd8]
    // 0x324124: tbz             w0, #4, #0x3243f4
    // 0x324128: ldur            x0, [fp, #-0xd0]
    // 0x32412c: r16 = "isCheckTZ"
    //     0x32412c: add             x16, PP, #9, lsl #12  ; [pp+0x9b50] "isCheckTZ"
    //     0x324130: ldr             x16, [x16, #0xb50]
    // 0x324134: stp             x16, x0, [SP]
    // 0x324138: r4 = 0
    //     0x324138: mov             x4, #0
    // 0x32413c: ldr             x0, [SP, #8]
    // 0x324140: r16 = UnlinkedCall_0x1c3b5c
    //     0x324140: add             x16, PP, #9, lsl #12  ; [pp+0x9b58] UnlinkedCall: 0x1c3b5c - SwitchableCallMissStub
    //     0x324144: add             x16, x16, #0xb58
    // 0x324148: ldp             x5, lr, [x16]
    // 0x32414c: blr             lr
    // 0x324150: mov             x3, x0
    // 0x324154: r2 = Null
    //     0x324154: mov             x2, NULL
    // 0x324158: r1 = Null
    //     0x324158: mov             x1, NULL
    // 0x32415c: stur            x3, [fp, #-0xb0]
    // 0x324160: r4 = 60
    //     0x324160: mov             x4, #0x3c
    // 0x324164: branchIfSmi(r0, 0x324170)
    //     0x324164: tbz             w0, #0, #0x324170
    // 0x324168: r4 = LoadClassIdInstr(r0)
    //     0x324168: ldur            x4, [x0, #-1]
    //     0x32416c: ubfx            x4, x4, #0xc, #0x14
    // 0x324170: cmp             x4, #0x3f
    // 0x324174: b.eq            #0x324188
    // 0x324178: r8 = bool
    //     0x324178: ldr             x8, [PP, #0xa30]  ; [pp+0xa30] Type: bool
    // 0x32417c: r3 = Null
    //     0x32417c: add             x3, PP, #9, lsl #12  ; [pp+0x9b68] Null
    //     0x324180: ldr             x3, [x3, #0xb68]
    // 0x324184: r0 = bool()
    //     0x324184: bl              #0x46609c  ; IsType_bool_Stub
    // 0x324188: ldur            x16, [fp, #-0xd0]
    // 0x32418c: r30 = "isOpenIp"
    //     0x32418c: add             lr, PP, #9, lsl #12  ; [pp+0x9b78] "isOpenIp"
    //     0x324190: ldr             lr, [lr, #0xb78]
    // 0x324194: stp             lr, x16, [SP]
    // 0x324198: r4 = 0
    //     0x324198: mov             x4, #0
    // 0x32419c: ldr             x0, [SP, #8]
    // 0x3241a0: r16 = UnlinkedCall_0x1c3b5c
    //     0x3241a0: add             x16, PP, #9, lsl #12  ; [pp+0x9b80] UnlinkedCall: 0x1c3b5c - SwitchableCallMissStub
    //     0x3241a4: add             x16, x16, #0xb80
    // 0x3241a8: ldp             x5, lr, [x16]
    // 0x3241ac: blr             lr
    // 0x3241b0: mov             x3, x0
    // 0x3241b4: r2 = Null
    //     0x3241b4: mov             x2, NULL
    // 0x3241b8: r1 = Null
    //     0x3241b8: mov             x1, NULL
    // 0x3241bc: stur            x3, [fp, #-0xb8]
    // 0x3241c0: r4 = 60
    //     0x3241c0: mov             x4, #0x3c
    // 0x3241c4: branchIfSmi(r0, 0x3241d0)
    //     0x3241c4: tbz             w0, #0, #0x3241d0
    // 0x3241c8: r4 = LoadClassIdInstr(r0)
    //     0x3241c8: ldur            x4, [x0, #-1]
    //     0x3241cc: ubfx            x4, x4, #0xc, #0x14
    // 0x3241d0: cmp             x4, #0x3f
    // 0x3241d4: b.eq            #0x3241e8
    // 0x3241d8: r8 = bool
    //     0x3241d8: ldr             x8, [PP, #0xa30]  ; [pp+0xa30] Type: bool
    // 0x3241dc: r3 = Null
    //     0x3241dc: add             x3, PP, #9, lsl #12  ; [pp+0x9b90] Null
    //     0x3241e0: ldr             x3, [x3, #0xb90]
    // 0x3241e4: r0 = bool()
    //     0x3241e4: bl              #0x46609c  ; IsType_bool_Stub
    // 0x3241e8: ldur            x0, [fp, #-0xd0]
    // 0x3241ec: r2 = Null
    //     0x3241ec: mov             x2, NULL
    // 0x3241f0: r1 = Null
    //     0x3241f0: mov             x1, NULL
    // 0x3241f4: r8 = Map<String, dynamic>
    //     0x3241f4: ldr             x8, [PP, #0x5ad0]  ; [pp+0x5ad0] Type: Map<String, dynamic>
    // 0x3241f8: r3 = Null
    //     0x3241f8: add             x3, PP, #9, lsl #12  ; [pp+0x9ba0] Null
    //     0x3241fc: ldr             x3, [x3, #0xba0]
    // 0x324200: r0 = Map<String, dynamic>()
    //     0x324200: bl              #0x2a5f50  ; IsType_Map<String, dynamic>_Stub
    // 0x324204: ldur            x1, [fp, #-0xd0]
    // 0x324208: r2 = "supportTZS"
    //     0x324208: add             x2, PP, #9, lsl #12  ; [pp+0x9bb0] "supportTZS"
    //     0x32420c: ldr             x2, [x2, #0xbb0]
    // 0x324210: r0 = decodeList()
    //     0x324210: bl              #0x3248dc  ; [package:ext_lib/src/utils/decoder.dart] Decoder::decodeList
    // 0x324214: ldur            x1, [fp, #-0xd0]
    // 0x324218: r2 = "ipLink"
    //     0x324218: add             x2, PP, #9, lsl #12  ; [pp+0x9bb8] "ipLink"
    //     0x32421c: ldr             x2, [x2, #0xbb8]
    // 0x324220: stur            x0, [fp, #-0xc0]
    // 0x324224: r0 = _getValueOrData()
    //     0x324224: bl              #0x1c83ac  ; [dart:_compact_hash] __Map&_HashVMBase&MapMixin&_HashBase&_OperatorEqualsAndHashCode&_LinkedHashMapMixin::_getValueOrData
    // 0x324228: ldur            x3, [fp, #-0xd0]
    // 0x32422c: LoadField: r1 = r3->field_f
    //     0x32422c: ldur            w1, [x3, #0xf]
    // 0x324230: DecompressPointer r1
    //     0x324230: add             x1, x1, HEAP, lsl #32
    // 0x324234: cmp             w1, w0
    // 0x324238: b.ne            #0x324244
    // 0x32423c: r4 = Null
    //     0x32423c: mov             x4, NULL
    // 0x324240: b               #0x324248
    // 0x324244: mov             x4, x0
    // 0x324248: mov             x0, x4
    // 0x32424c: stur            x4, [fp, #-0xc8]
    // 0x324250: r2 = Null
    //     0x324250: mov             x2, NULL
    // 0x324254: r1 = Null
    //     0x324254: mov             x1, NULL
    // 0x324258: r4 = 60
    //     0x324258: mov             x4, #0x3c
    // 0x32425c: branchIfSmi(r0, 0x324268)
    //     0x32425c: tbz             w0, #0, #0x324268
    // 0x324260: r4 = LoadClassIdInstr(r0)
    //     0x324260: ldur            x4, [x0, #-1]
    //     0x324264: ubfx            x4, x4, #0xc, #0x14
    // 0x324268: sub             x4, x4, #0x5e
    // 0x32426c: cmp             x4, #1
    // 0x324270: b.ls            #0x324284
    // 0x324274: r8 = String
    //     0x324274: ldr             x8, [PP, #0x2a8]  ; [pp+0x2a8] Type: String
    // 0x324278: r3 = Null
    //     0x324278: add             x3, PP, #9, lsl #12  ; [pp+0x9bc0] Null
    //     0x32427c: ldr             x3, [x3, #0xbc0]
    // 0x324280: r0 = String()
    //     0x324280: bl              #0x4660bc  ; IsType_String_Stub
    // 0x324284: ldur            x1, [fp, #-0xd0]
    // 0x324288: r2 = "ipCountry"
    //     0x324288: add             x2, PP, #9, lsl #12  ; [pp+0x9bd0] "ipCountry"
    //     0x32428c: ldr             x2, [x2, #0xbd0]
    // 0x324290: r0 = _getValueOrData()
    //     0x324290: bl              #0x1c83ac  ; [dart:_compact_hash] __Map&_HashVMBase&MapMixin&_HashBase&_OperatorEqualsAndHashCode&_LinkedHashMapMixin::_getValueOrData
    // 0x324294: ldur            x3, [fp, #-0xd0]
    // 0x324298: LoadField: r1 = r3->field_f
    //     0x324298: ldur            w1, [x3, #0xf]
    // 0x32429c: DecompressPointer r1
    //     0x32429c: add             x1, x1, HEAP, lsl #32
    // 0x3242a0: cmp             w1, w0
    // 0x3242a4: b.ne            #0x3242b0
    // 0x3242a8: r5 = Null
    //     0x3242a8: mov             x5, NULL
    // 0x3242ac: b               #0x3242b4
    // 0x3242b0: mov             x5, x0
    // 0x3242b4: ldur            x4, [fp, #-0xb8]
    // 0x3242b8: mov             x0, x5
    // 0x3242bc: stur            x5, [fp, #-0xd8]
    // 0x3242c0: r2 = Null
    //     0x3242c0: mov             x2, NULL
    // 0x3242c4: r1 = Null
    //     0x3242c4: mov             x1, NULL
    // 0x3242c8: r4 = 60
    //     0x3242c8: mov             x4, #0x3c
    // 0x3242cc: branchIfSmi(r0, 0x3242d8)
    //     0x3242cc: tbz             w0, #0, #0x3242d8
    // 0x3242d0: r4 = LoadClassIdInstr(r0)
    //     0x3242d0: ldur            x4, [x0, #-1]
    //     0x3242d4: ubfx            x4, x4, #0xc, #0x14
    // 0x3242d8: sub             x4, x4, #0x5e
    // 0x3242dc: cmp             x4, #1
    // 0x3242e0: b.ls            #0x3242f4
    // 0x3242e4: r8 = String
    //     0x3242e4: ldr             x8, [PP, #0x2a8]  ; [pp+0x2a8] Type: String
    // 0x3242e8: r3 = Null
    //     0x3242e8: add             x3, PP, #9, lsl #12  ; [pp+0x9bd8] Null
    //     0x3242ec: ldr             x3, [x3, #0xbd8]
    // 0x3242f0: r0 = String()
    //     0x3242f0: bl              #0x4660bc  ; IsType_String_Stub
    // 0x3242f4: ldur            x0, [fp, #-0xb8]
    // 0x3242f8: tbnz            w0, #4, #0x3243b4
    // 0x3242fc: ldur            x0, [fp, #-0xd8]
    // 0x324300: ldur            x1, [fp, #-0xc8]
    // 0x324304: r0 = get()
    //     0x324304: bl              #0x324a5c  ; [package:ext_lib/src/services/network_service.dart] NetworkService::get
    // 0x324308: mov             x1, x0
    // 0x32430c: stur            x1, [fp, #-0xb8]
    // 0x324310: r0 = Await()
    //     0x324310: bl              #0x1e9350  ; AwaitStub
    // 0x324314: stur            x0, [fp, #-0xb8]
    // 0x324318: LoadField: r1 = r0->field_b
    //     0x324318: ldur            w1, [x0, #0xb]
    // 0x32431c: DecompressPointer r1
    //     0x32431c: add             x1, x1, HEAP, lsl #32
    // 0x324320: r16 = "country"
    //     0x324320: add             x16, PP, #9, lsl #12  ; [pp+0x9be8] "country"
    //     0x324324: ldr             x16, [x16, #0xbe8]
    // 0x324328: stp             x16, x1, [SP]
    // 0x32432c: r4 = 0
    //     0x32432c: mov             x4, #0
    // 0x324330: ldr             x0, [SP, #8]
    // 0x324334: r16 = UnlinkedCall_0x1c3b5c
    //     0x324334: add             x16, PP, #9, lsl #12  ; [pp+0x9bf0] UnlinkedCall: 0x1c3b5c - SwitchableCallMissStub
    //     0x324338: add             x16, x16, #0xbf0
    // 0x32433c: ldp             x5, lr, [x16]
    // 0x324340: blr             lr
    // 0x324344: mov             x3, x0
    // 0x324348: r2 = Null
    //     0x324348: mov             x2, NULL
    // 0x32434c: r1 = Null
    //     0x32434c: mov             x1, NULL
    // 0x324350: stur            x3, [fp, #-0xe0]
    // 0x324354: r4 = 60
    //     0x324354: mov             x4, #0x3c
    // 0x324358: branchIfSmi(r0, 0x324364)
    //     0x324358: tbz             w0, #0, #0x324364
    // 0x32435c: r4 = LoadClassIdInstr(r0)
    //     0x32435c: ldur            x4, [x0, #-1]
    //     0x324360: ubfx            x4, x4, #0xc, #0x14
    // 0x324364: sub             x4, x4, #0x5e
    // 0x324368: cmp             x4, #1
    // 0x32436c: b.ls            #0x324380
    // 0x324370: r8 = String
    //     0x324370: ldr             x8, [PP, #0x2a8]  ; [pp+0x2a8] Type: String
    // 0x324374: r3 = Null
    //     0x324374: add             x3, PP, #9, lsl #12  ; [pp+0x9c00] Null
    //     0x324378: ldr             x3, [x3, #0xc00]
    // 0x32437c: r0 = String()
    //     0x32437c: bl              #0x4660bc  ; IsType_String_Stub
    // 0x324380: ldur            x3, [fp, #-0xd8]
    // 0x324384: r0 = LoadClassIdInstr(r3)
    //     0x324384: ldur            x0, [x3, #-1]
    //     0x324388: ubfx            x0, x0, #0xc, #0x14
    // 0x32438c: mov             x1, x3
    // 0x324390: r2 = "&"
    //     0x324390: ldr             x2, [PP, #0x1028]  ; [pp+0x1028] "&"
    // 0x324394: r0 = GDT[cid_x0 + -0xffe]()
    //     0x324394: sub             lr, x0, #0xffe
    //     0x324398: ldr             lr, [x21, lr, lsl #3]
    //     0x32439c: blr             lr
    // 0x3243a0: mov             x1, x0
    // 0x3243a4: ldur            x2, [fp, #-0xe0]
    // 0x3243a8: r0 = contains()
    //     0x3243a8: bl              #0x3a049c  ; [dart:collection] ListBase::contains
    // 0x3243ac: tbnz            w0, #4, #0x3243f4
    // 0x3243b0: b               #0x3243e0
    // 0x3243b4: ldur            x0, [fp, #-0xb0]
    // 0x3243b8: tbnz            w0, #4, #0x3243e0
    // 0x3243bc: r0 = getCurrentTimezone()
    //     0x3243bc: bl              #0x3247e4  ; [package:ext_lib/src/utils/locale_utils.dart] LocaleUtils::getCurrentTimezone
    // 0x3243c0: mov             x1, x0
    // 0x3243c4: stur            x1, [fp, #-0xb0]
    // 0x3243c8: r0 = Await()
    //     0x3243c8: bl              #0x1e9350  ; AwaitStub
    // 0x3243cc: ldur            x1, [fp, #-0xc0]
    // 0x3243d0: mov             x2, x0
    // 0x3243d4: stur            x0, [fp, #-0xb0]
    // 0x3243d8: r0 = contains()
    //     0x3243d8: bl              #0x3a049c  ; [dart:collection] ListBase::contains
    // 0x3243dc: tbnz            w0, #4, #0x3243f4
    // 0x3243e0: ldur            x2, [fp, #-0xd0]
    // 0x3243e4: r1 = Null
    //     0x3243e4: mov             x1, NULL
    // 0x3243e8: r0 = Config.fromJson()
    //     0x3243e8: bl              #0x324404  ; [package:ext_lib/src/models/config.dart] Config::Config.fromJson
    // 0x3243ec: r0 = ReturnAsyncNotFuture()
    //     0x3243ec: b               #0x1e909c  ; ReturnAsyncNotFutureStub
    // 0x3243f0: sub             SP, fp, #0xf0
    // 0x3243f4: r0 = Null
    //     0x3243f4: mov             x0, NULL
    // 0x3243f8: r0 = ReturnAsyncNotFuture()
    //     0x3243f8: b               #0x1e909c  ; ReturnAsyncNotFutureStub
    // 0x3243fc: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3243fc: bl              #0x44ae34  ; StackOverflowSharedWithoutFPURegsStub
    // 0x324400: b               #0x323f74
  }
  static _ _enable(/* No info */) async {
    // ** addr: 0x37132c, size: 0x34
    // 0x37132c: EnterFrame
    //     0x37132c: stp             fp, lr, [SP, #-0x10]!
    //     0x371330: mov             fp, SP
    // 0x371334: AllocStack(0x8)
    //     0x371334: sub             SP, SP, #8
    // 0x371338: SetupParameters()
    //     0x371338: stur            NULL, [fp, #-8]
    // 0x37133c: CheckStackOverflow
    //     0x37133c: ldr             x16, [THR, #0x38]  ; THR::stack_limit
    //     0x371340: cmp             SP, x16
    //     0x371344: b.ls            #0x371358
    // 0x371348: InitAsync() -> Future<bool>
    //     0x371348: ldr             x0, [PP, #0x4bf0]  ; [pp+0x4bf0] TypeArguments: <bool>
    //     0x37134c: bl              #0x1e9584  ; InitAsyncStub
    // 0x371350: r0 = isFeatureEnabled()
    //     0x371350: bl              #0x371360  ; [package:ext_lib/src/utils/constants.dart] Constants::isFeatureEnabled
    // 0x371354: r0 = ReturnAsync()
    //     0x371354: b               #0x223504  ; ReturnAsyncStub
    // 0x371358: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x371358: bl              #0x44ae34  ; StackOverflowSharedWithoutFPURegsStub
    // 0x37135c: b               #0x371348
  }
}
