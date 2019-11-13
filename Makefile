.PHONY: install start test build sh
RUNNER := docker-compose run --rm -u $(shell id -u):$(shell id -g) pr

install start test build:
	${RUNNER} yarn $@
sh:
	${RUNNER} $@
server:
	cd build; python3 -m http.server
