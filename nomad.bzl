load("//:internal/repository.bzl", _nomad_repository = "nomad_repository")
load("//:internal/run.bzl", _nomad_run = "nomad_run")

nomad_repository = _nomad_repository

nomad_run = _nomad_run
