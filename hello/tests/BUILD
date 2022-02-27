load("@rules_cc//cc:defs.bzl", "cc_test")

cc_test(
    name = "test_hello",
    srcs = ["test_hello.cpp"],
    deps = [
        "//hello",
        "@catch2",
    ],
)

py_test(
    name = "test_pybind",
    srcs = ["test_pybind.py"],
    data = ["//hello:hello_pybind.so"],  # TODO: this should be a dependecy to a target (not data, not .so)
)
