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
