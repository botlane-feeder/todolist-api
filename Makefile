#Makefile
SHELL := /bin/bash
include .env
export VERSION
export NAME
export REGISTRY_NAME

# Cible par défaut
all: help

# Section des tests
ex-tests: 
	@docker exec -it todolist-api-php-fpm-1 ./vendor/bin/phpunit tests/TryingTest.php
test: 
	@docker exec -it todolist-api-php-fpm-1 ./vendor/bin/phpunit tests/AppTest.php

# Section Build et Push
build:
	@docker build --tag ${REGISTRY_NAME}${NAME}:${VERSION} --file configs/php-fpm/Dockerfile .
	@docker build --tag ${REGISTRY_NAME}${NAME}:latest --file configs/php-fpm/Dockerfile .

push: build
	@docker push ${REGISTRY_NAME}${NAME}:${VERSION}
	@docker push ${REGISTRY_NAME}${NAME}:latest


version:
	source .env ; \
        echo ${VERSION}

# Section d'aide Help				
help:
	@echo "Help section WIP"
