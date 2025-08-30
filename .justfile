#!/usr/bin/env -S just --justfile

set quiet := true
set shell := ['bash', '-eu', '-o', 'pipefail', '-c']

mod bootstrap '.just/bootstrap.just'
mod kube '.just/kube.just'
mod sync '.just/sync.just'
mod talos '.just/talos.just'

[private]
default:
    just --list

[positional-arguments]
[private]
log lvl msg *args:
    gum log -t rfc3339 -s -l "{{ lvl }}" "{{ msg }}" {{ args }}
