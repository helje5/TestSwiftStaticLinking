# TestSwiftStaticLinking

What Swift symbols are included if the a static library is being linked.

Setup:

- a static library with three files:
  - one file with 2 Swift classes, one of which is used by the tool (UsedClassSameFile, UnusedClassSameFile)
  - one file w/ 1 Swift class, which is used by the tool (UsedClass)
  - another file w/ 1 Swift class, which is not used by the tool (UnusedClass)
- a Swift tool linking the static library

Debug build, no changes to Xcode 11 settings:
- the unused class from the big file is included
- the unused class from the separate file is not included

```
helge@Zini18 TestSwiftStaticLinking (master)*$ nm -g /tmp/DerivedData/TestStaticSwiftLinking-fxqefwwwfxbqakeukmguosbdeciv/Build/Products/Debug/TestStaticSwiftLinking 
0000000100001510 T _$s11MyStaticLib17UsedClassSameFileC4doItyyF
0000000100001e48 S _$s11MyStaticLib17UsedClassSameFileC4doItyyFTq
0000000100001530 T _$s11MyStaticLib17UsedClassSameFileCACycfC
0000000100001e50 S _$s11MyStaticLib17UsedClassSameFileCACycfCTq
00000001000015d0 T _$s11MyStaticLib17UsedClassSameFileCACycfc
0000000100001580 T _$s11MyStaticLib17UsedClassSameFileCMa
00000001000022d0 D _$s11MyStaticLib17UsedClassSameFileCMm
0000000100001e14 S _$s11MyStaticLib17UsedClassSameFileCMn
0000000100002308 D _$s11MyStaticLib17UsedClassSameFileCN
0000000100001610 T _$s11MyStaticLib17UsedClassSameFileCfD
00000001000015f0 T _$s11MyStaticLib17UsedClassSameFileCfd
0000000100001650 T _$s11MyStaticLib19UnusedClassSameFileC7doItTooyyF
0000000100001ea8 S _$s11MyStaticLib19UnusedClassSameFileC7doItTooyyFTq
0000000100001670 T _$s11MyStaticLib19UnusedClassSameFileCACycfC
0000000100001eb0 S _$s11MyStaticLib19UnusedClassSameFileCACycfCTq
0000000100001710 T _$s11MyStaticLib19UnusedClassSameFileCACycfc
00000001000016c0 T _$s11MyStaticLib19UnusedClassSameFileCMa
0000000100002368 D _$s11MyStaticLib19UnusedClassSameFileCMm
0000000100001e74 S _$s11MyStaticLib19UnusedClassSameFileCMn
00000001000023a0 D _$s11MyStaticLib19UnusedClassSameFileCN
0000000100001750 T _$s11MyStaticLib19UnusedClassSameFileCfD
0000000100001730 T _$s11MyStaticLib19UnusedClassSameFileCfd
0000000100001790 T _$s11MyStaticLib9UsedClassC4doItyyF
0000000100001f08 S _$s11MyStaticLib9UsedClassC4doItyyFTq
00000001000017b0 T _$s11MyStaticLib9UsedClassCACycfC
0000000100001f10 S _$s11MyStaticLib9UsedClassCACycfCTq
0000000100001850 T _$s11MyStaticLib9UsedClassCACycfc
0000000100001800 T _$s11MyStaticLib9UsedClassCMa
0000000100002400 D _$s11MyStaticLib9UsedClassCMm
0000000100001ed4 S _$s11MyStaticLib9UsedClassCMn
0000000100002438 D _$s11MyStaticLib9UsedClassCN
0000000100001890 T _$s11MyStaticLib9UsedClassCfD
0000000100001870 T _$s11MyStaticLib9UsedClassCfd
                 U _$sBoWV
                 U _$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC
                 U _$sSSN
                 U _$ss27_allocateUninitializedArrayySayxG_BptBwlF
                 U _$ss5print_9separator10terminatoryypd_S2StF
                 U _$sypN
                 U _OBJC_CLASS_$__TtCs12_SwiftObject
                 U _OBJC_METACLASS_$__TtCs12_SwiftObject
                 U __dyld_register_func_for_add_image
0000000100000000 T __mh_execute_header
                 U __objc_empty_cache
                 U _dispatch_once_f
                 U _getsectiondata
0000000100001260 T _main
                 U _objc_getClass
                 U _objc_setHook_getClass
                 U _pthread_getspecific
                 U _pthread_setspecific
                 U _swift_allocObject
                 U _swift_bridgeObjectRelease
                 U _swift_deallocClassInstance
                 U _swift_getFunctionReplacement
                 U _swift_getInitializedObjCClass
                 U _swift_getMetatypeMetadata
                 U _swift_getObjCClassMetadata
                 U _swift_getOrigOfReplaceable
                 U dyld_stub_binder
```

Release build:
```
helge@Zini18 TestSwiftStaticLinking (master)*$ nm -g /tmp/DerivedData/TestStaticSwiftLinking-fxqefwwwfxbqakeukmguosbdeciv/Build/Products/Release/TestStaticSwiftLinking 
0000000100001800 T _$s11MyStaticLib17UsedClassSameFileCMa
00000001000022d0 D _$s11MyStaticLib17UsedClassSameFileCMm
0000000100001d64 S _$s11MyStaticLib17UsedClassSameFileCMn
0000000100002310 D _$s11MyStaticLib17UsedClassSameFileCN
00000001000017e0 T _$s11MyStaticLib17UsedClassSameFileCfD
00000001000017d0 T _$s11MyStaticLib17UsedClassSameFileCfd
0000000100001820 T _$s11MyStaticLib19UnusedClassSameFileCMa
0000000100002370 D _$s11MyStaticLib19UnusedClassSameFileCMm
0000000100001dc4 S _$s11MyStaticLib19UnusedClassSameFileCMn
00000001000023b0 D _$s11MyStaticLib19UnusedClassSameFileCN
0000000100001880 T _$s11MyStaticLib19UnusedClassSameFileCfD
0000000100001870 T _$s11MyStaticLib19UnusedClassSameFileCfd
00000001000018c0 T _$s11MyStaticLib9UsedClassCMa
0000000100002410 D _$s11MyStaticLib9UsedClassCMm
0000000100001e24 S _$s11MyStaticLib9UsedClassCMn
0000000100002450 D _$s11MyStaticLib9UsedClassCN
00000001000018a0 T _$s11MyStaticLib9UsedClassCfD
0000000100001890 T _$s11MyStaticLib9UsedClassCfd
                 U _$sBoWV
                 U _$sSSN
                 U _$ss23_ContiguousArrayStorageCMa
                 U _$ss5print_9separator10terminatoryypd_S2StF
                 U _$sypN
                 U _OBJC_CLASS_$__TtCs12_SwiftObject
                 U _OBJC_METACLASS_$__TtCs12_SwiftObject
                 U __dyld_register_func_for_add_image
0000000100000000 T __mh_execute_header
                 U __objc_empty_cache
                 U _dispatch_once_f
                 U _getsectiondata
0000000100001630 T _main
                 U _objc_getClass
                 U _objc_setHook_getClass
                 U _pthread_getspecific
                 U _pthread_setspecific
                 U _swift_allocObject
                 U _swift_deallocClassInstance
                 U _swift_deletedMethodError
                 U _swift_getFunctionReplacement
                 U _swift_getInitializedObjCClass
                 U _swift_getMetatypeMetadata
                 U _swift_getObjCClassMetadata
                 U _swift_getOrigOfReplaceable
                 U _swift_release
                 U dyld_stub_binder
```
