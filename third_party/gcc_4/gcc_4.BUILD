load("@rules_cc//cc:defs.bzl", "cc_toolchain")
load("@codewerk//bazel/toolchains:cc_toolchain_config.bzl", "cc_toolchain_config")

filegroup(
    name = "all_files",
    srcs = glob(["**/*"]),
)

cc_toolchain_config(
    name = "toolchain_config",
    cpu = "x86_64",
    compiler = "gcc-4",
    toolchain_identifier = "local",
    host_system_name = "local",
    target_system_name = "local",
    target_libc = "local",
    abi_version = "local",
    abi_libc_version = "local",
    builtin_sysroot = "external/gcc_4",
    cxx_builtin_include_directories = [
        "%sysroot%/usr/include/c++/4.9/",
        "%sysroot%/usr/include/",
    ],
    tool_paths = {
        "ar": "usr/bin/ar",
        "ld": "usr/bin/ld",
        "llvm-cov": "None",
        "cpp": "usr/bin/cpp",
        "gcc": "usr/bin/gcc-4.9",
        "dwp": "usr/bin/dwp",
        "gcov": "usr/bin/gcov",
        "nm": "usr/bin/nm",
        "objcopy": "usr/bin/objcopy",
        "objdump": "usr/bin/objdump",
        "strip": "usr/bin/strip",
    },
    compile_flags = ["-U_FORTIFY_SOURCE",
    "-fstack-protector",
    "-Wall",
    "-Wunused-but-set-parameter",
    "-Wno-free-nonheap-object",
    "-fno-omit-frame-pointer"],
    opt_compile_flags = ["-g0",
    "-O2",
    "-D_FORTIFY_SOURCE=1",
    "-DNDEBUG",
    "-ffunction-sections",
    "-fdata-sections"],
    dbg_compile_flags = ["-g"],
    cxx_flags = ["-std=c++14"],
    link_flags = [
        # "-fuse-ld=gold",
        # "-Wl,-no-as-needed",
        # "-Wl,-z,relro,-z,now",
        # "-Bexternal/gcc_4/usr/bin",
        # "-pass-exit-codes"
        "-Wl,-n",
        "-rpath='$ORIGIN'",
    ],
    link_libs = [
        "-lstdc++",
        "-lm",
        "-lexternal/gcc_4/usr/lib/x86_64-linux-gnu",
    ],
    opt_link_flags = [
        # "-Wl,--gc-sections",
    ],
    unfiltered_compile_flags = [
        "-fno-canonical-system-headers",
        "-Wno-builtin-macro-redefined",
        "-D__DATE__=\"redacted\"",
        "-D__TIMESTAMP__=\"redacted\"",
        "-D__TIME__=\"redacted\""],
    coverage_compile_flags = ["--coverage"],
    coverage_link_flags = ["--coverage"],
    supports_start_end_lib = True,
)

cc_toolchain(
    name = "k8_clang_toolchain",
    toolchain_config = ":toolchain_config",
    all_files = ":all_files",
    compiler_files = ":all_files",
    dwp_files = ":all_files",
    linker_files = ":all_files",
    objcopy_files = ":all_files",
    strip_files = ":all_files",
    supports_param_files = True,
)

toolchain(
    name = "toolchain",
    exec_compatible_with = [
        "@codewerk//bazel/platforms/os:linux",
        "@codewerk//bazel/platforms/cpu:x86_64",
        "@codewerk//bazel/platforms/cc_compiler:gcc_4",
    ],
    target_compatible_with = [
        "@codewerk//bazel/platforms/os:linux",
        "@codewerk//bazel/platforms/cpu:x86_64",
    ],
    toolchain = ":k8_clang_toolchain",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
)
