workspace(name = "codewerk")

load("//third_party:third_party.bzl", "third_party")
third_party()

# TODO: Pybind11 - Is this needed?
load("@pybind11_bazel//:python_configure.bzl", "python_configure")
python_configure(name = "local_config_python")

register_execution_platforms(
    "//bazel/platforms:linux-x86_64-gcc_11",
    "//bazel/platforms:linux-x86_64-clang_14",
)

register_toolchains("//bazel/toolchains:toolchain")
