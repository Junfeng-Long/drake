load("//tools/workspace:github.bzl", "github_archive")
load(
    "//third_party:com_github_bazelbuild_rules_python/internal_config_repo.bzl",  # noqa
    "internal_config_repo",
)

# Note that we do NOT install a LICENSE file as part of the Drake install
# because this repository is required only when building and testing with
# Bazel.

def rules_python_repository(
        name,
        mirrors = None):
    github_archive(
        name = name,
        repository = "bazelbuild/rules_python",  # License: Apache-2.0,
        upgrade_advice = """
        The commit (version) and sha256 here should be identical to the
        rules_python commit listed in
        drake/tools/install/bazel/test/drake_bazel_installed_test.py.
        """,
        commit = "0.31.0",
        sha256 = "c68bdc4fbec25de5b5493b8819cfc877c4ea299c0dcb15c244c5a00208cde311",  # noqa
        patches = [
            ":patches/internal_config_repo.patch",
        ],
        mirrors = mirrors,
    )
    internal_config_repo(name = name + "_internal")
