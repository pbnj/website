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

.PHONY: setup
setup: ## sets up environment with all required packages/dependencies
	hugo version
	npm install -g autoprefixer postcss-cli
