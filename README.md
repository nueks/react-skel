```bash
docker run --rm -it -v ${PWD}:/work node:12.13-alpine nxp create-react-app app
```

```bash
docker run --rm -it -v ${PWD}:/work node:12.13-alpine sh
chown -R 11002:11002 app
```

```yaml
version: '3.5'
services:
  app:
    image: node:12.13-alpine
    container_name: app.dev
  volumes:
    - .:/app
  working_dir: /app
  environment:
    - HOME=/app
    - NODE_ENV=development
```

```bash
docker-compose run --rm -u $UID:$GID app yarn install
docker-compose run --rm -u $UID:$GID app yarn start
```

```makefile
.PHONY: install start test build sh server
RUNNER := docker-compose run --rm -u $(shell id -u):$(shell id -g) pr
install start test build:
	${RUNNER} yarn $@
sh:
	${RUNNER} $@
server:
	cd build; python3 -m http.server
```

```bash
make build
make server
```
