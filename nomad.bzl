# Rule nomad_run generates a runner script to execute nomad run with the given
# job file.
#
# NOTE(kfeng): This rule currently assumes that the nomad executable is
# installed on the host machine, and is in one of the directories listed in
# the PATH environment variable.  In the future, this project may fetch
# the nomad executable directly instead of relying on the executable on
# the host machine.
def _impl(ctx):
    script = ctx.actions.declare_file(ctx.label.name + ".deploy")

    command = "nomad run " + ctx.file.job.short_path
    ctx.actions.write(
        output = script,
        content = command,
        is_executable = True,
    )

    runfiles = ctx.runfiles(files = [ctx.file.job])

    return [
        DefaultInfo(executable=script, runfiles=runfiles)
    ]

nomad_run = rule(
    implementation = _impl,
    attrs = {
        "job": attr.label(
            allow_single_file = True,
            mandatory = True,
        ),
    },
    executable = True,
)
