# Strict mode
set shell := ["bash", "-euo", "pipefail", "-c"]

# Globals
export GIT_SHA := `git rev-parse --short HEAD`

[private]
default:
	@just --list --unsorted

load-test:
   ab -n 10000 -c 100 http://localhost:8080/log/test12351/

build:
	./gradlew clean build -xtest

run: build
  ./gradlew run

teardown:
	docker-compose down

restart: teardown package start

start:
	docker-compose up -d

package: build
	docker-compose build --no-cache

