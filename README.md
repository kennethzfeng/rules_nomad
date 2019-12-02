# Bazel Rules for HashiCorp Nomad
This repository contains **experiemential** bazel rules for HashiCorp Nomad.

## Get Started
1. Add the following snippet to your WORKSPACE file.
```
git_repository(
    name = "rules_nomad",
    remote = "https://github.com/kennethzfeng/rules_nomad",
    commit = "<commit-hash>",
)

```
2. Add a nomad_run targeet.

```
load("@rules_nomad//:nomad.bzl", "nomad_run")

nomad_run(
    name = "HelloService_deploy",
    job = "<target to the job file>",
)
```

## Contribute
Pull request is welcome.

## License
MIT
