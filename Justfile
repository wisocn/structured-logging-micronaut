# Strict mode
set shell := ["bash", "-euo", "pipefail", "-c"]

# Globals
export GIT_SHA := `git rev-parse --short HEAD`

[private]
default:
	@ just --list --unsorted

build:
	gradle clean build -xtest

run: build
	docker-compose up -d 

