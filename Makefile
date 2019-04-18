SHELL := /bin/bash

.PHONY: serve
serve: ## serves site on localhost:1313
	hugo server \
	--buildDrafts \
	--bind=0.0.0.0

.PHONY: build
build: ## builds site
	hugo

.PHONY: build-docker
build-docker: ## builds site in docker
	docker run \
	--rm \
	-v $(PWD):/www \
	-w /www \
	website:dev hugo

.PHONY: build-image
build-image: ## builds development docker image
	docker build \
	-t website:dev \
	.

.PHONY: publish
DATE := $(shell date '+%Y-%m-%dT%H:%M:%S')
publish: build ## publishes content
	cd public \
	&& git add -A . \
	&& git commit -m "Published $(DATE)" \
	&& git push origin master

.PHONY: dev
dev: ## runs dev container
	docker run \
	--rm \
	-it \
	--volume $(PWD):/www \
	--workdir /www \
	--user $(id -u):$(id -g) \
	website:dev
