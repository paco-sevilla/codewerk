load("@rules_cc//cc:defs.bzl", "cc_library", "cc_binary")

cc_library(
    name = "hello",
    hdrs = ["hello.hpp"],
    srcs = ["hello.cpp"],
    visibility = ["//hello/tests:__pkg__"],
)

cc_binary(
    name = "hello_world",
    srcs = ["hello_world.cpp"],
    deps = [":hello"],
)

cc_binary(
    name = "hello_eigen",
    srcs = ["hello_eigen.cpp"],
    deps = ["@eigen"],
)
