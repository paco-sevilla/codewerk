workspace(name = "codewerk")

load("//third_party:third_party.bzl", "third_party")
third_party()

# TODO: Pybind11 - Is this needed?
load("@pybind11_bazel//:python_configure.bzl", "python_configure")
python_configure(name = "local_config_python")
