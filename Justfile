# Strict mode
set shell := ["bash", "-euo", "pipefail", "-c"]

# Globals
export GIT_SHA := `git rev-parse --short HEAD`

[private]
default:
	@ just --list --unsorted

load-test:
    ab -n 10000 -c 100 http://localhost:8080/log/test12351/

build:
	gradle clean build -xtest

run: build
	gradle run
