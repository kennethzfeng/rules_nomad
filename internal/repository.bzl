NOMAD_BUILD_FILE = """
sh_binary(
    name = "nomad_bin",
    srcs = ["nomad"],
)
"""

def _nomad_repository_impl(repo_ctx):
    url = "https://releases.hashicorp.com/nomad/{version}/nomad_{version}_{os}_amd64.zip".format(
        version = repo_ctx.attr.version,
        os = repo_ctx.os.name.lower(),
    )

    repo_ctx.download_and_extract(
        url,
    )

    repo_ctx.file("OS", repo_ctx.os.name)
    repo_ctx.file("BUILD.bazel", NOMAD_BUILD_FILE)


nomad_repository = repository_rule(
    _nomad_repository_impl,
    attrs = {
        "version": attr.string(
            default = "0.10.3",
            doc = "The nomad version to use",
        ),
    }
)
