workspace(name = "codewerk")

load("//third_party:third_party.bzl", "third_party")
third_party()

# TODO: Pybind11 - Is this needed?
load("@pybind11_bazel//:python_configure.bzl", "python_configure")
python_configure(name = "local_config_python")

# TODO: Sphinx - Is this needed?
load("@rules_sphinx//sphinx:direct_repositories.bzl", "rules_sphinx_direct_deps")
rules_sphinx_direct_deps()
load("@rules_sphinx//sphinx:indirect_repositories.bzl", "rules_sphinx_indirect_deps")
rules_sphinx_indirect_deps()
