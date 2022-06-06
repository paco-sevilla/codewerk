load("@rules_cc//cc:defs.bzl", "cc_toolchain")
load("//bazel/toolchains:cc_toolchain_config.bzl", "cc_toolchain_config")

cc_toolchain_config(name = "k8_clang_toolchain_config")

cc_toolchain(
    name = "k8_clang_toolchain",
    toolchain_config = ":k8_clang_toolchain_config",
    all_files = ":empty",
    compiler_files = ":empty",
    dwp_files = ":empty",
    linker_files = ":empty",
    objcopy_files = ":empty",
    strip_files = ":empty",
    supports_param_files = True,
)

toolchain(
    name = "toolchain",
    exec_compatible_with = [
        "//bazel/platforms/os:linux",
        "//bazel/platforms/cpu:x86_64",
        "//bazel/platforms/cc_compiler:clang_14",
    ],
    target_compatible_with = [
        "//bazel/platforms/os:linux",
        "//bazel/platforms/cpu:x86_64",
    ],
    toolchain = ":k8_clang_toolchain",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
)

filegroup(name = "empty")
