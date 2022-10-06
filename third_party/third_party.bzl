"""Define all Third Party archives and repos."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def third_party():
    http_archive(
        name = "catch2",
        sha256 = "b9b592bd743c09f13ee4bf35fc30eeee2748963184f6bea836b146e6cc2a585a",
        strip_prefix = "Catch2-2.13.8",
        urls = ["https://github.com/catchorg/Catch2/archive/v2.13.8.tar.gz"],
    )

    http_archive(
        name = "bazel_compdb",
        patches = ["//third_party/bazel_compdb:bazel_compdb.patch"],
        sha256 = "d51f8168954d4aa0ca984f53a1a6be298d827ff39303d10522dffb2a5c1942dc",
        strip_prefix = "bazel-compilation-database-0.5.0",
        urls = ["https://github.com/grailbio/bazel-compilation-database/archive/refs/tags/0.5.0.tar.gz"],
    )

    http_archive(
        name = "eigen",
        build_file = "//third_party/eigen:eigen.BUILD",
        sha256 = "7985975b787340124786f092b3a07d594b2e9cd53bbfe5f3d9b1daee7d55f56f",
        strip_prefix = "eigen-3.3.9",
        urls = ["https://gitlab.com/libeigen/eigen/-/archive/3.3.9/eigen-3.3.9.tar.gz"],
    )

    http_archive(
        name = "pybind11_bazel",
        sha256 = "fec6281e4109115c5157ca720b8fe20c8f655f773172290b03f57353c11869c2",
        strip_prefix = "pybind11_bazel-72cbbf1fbc830e487e3012862b7b720001b70672",  # TODO: use release instead of commit
        urls = ["https://github.com/pybind/pybind11_bazel/archive/72cbbf1fbc830e487e3012862b7b720001b70672.zip"],
    )
    http_archive(
        name = "pybind11",
        sha256 = "c6160321dc98e6e1184cc791fbeadd2907bb4a0ce0e447f2ea4ff8ab56550913",
        build_file = "@pybind11_bazel//:pybind11.BUILD",
        strip_prefix = "pybind11-2.9.1",
        urls = ["https://github.com/pybind/pybind11/archive/refs/tags/v2.9.1.tar.gz"],
    )

    http_archive(
        name = "gcc_10",
        sha256 = "ab59d4687abcb6e3199646f5d391c931bd67965ff01812ead70c8c6ba1a4156d",
        build_file = "//third_party/gcc_10:gcc_10.BUILD",
        urls = ["https://codewerk.jfrog.io/artifactory/default-generic-local/third_party/gcc_10.tar.gz"],
    ) 

    http_archive(
        name = "gcc_4",
        sha256 = "1577d61dca561f3f68aa94b82567142d6cb3e6e91b15d23f0dc50f0181f10d1d",
        build_file = "//third_party/gcc_4:gcc_4.BUILD",
        urls = ["https://codewerk.jfrog.io/artifactory/default-generic-local/third_party/gcc_4.tar.gz"],
    ) 
