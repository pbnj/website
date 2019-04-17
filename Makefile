SHELL := /bin/bash

.PHONY: serve
serve: ## serves site on localhost:1313
	hugo server --buildDrafts --bind=0.0.0.0

.PHONY: build
build: ## builds site
	hugo

.PHONY: publish
DATE := $(shell date '+%Y-%m-%dT%H:%M:%S')
publish: build ## publishes content
	cd public && git add -A . && git commit -m "Published $(DATE)" && git push origin master

.PHONY: docker-build
docker-build: ## builds development docker image
	docker build -t website:dev .

.PHONY: dev
dev: ## runs dev container
	docker run --rm -it -v $(PWD):/website -w /website website:dev
