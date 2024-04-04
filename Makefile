RUN := run --rm
DOCKER_COMPOSE_RUN := docker-compose $(RUN) web
args := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))

setup:
	@make build
	@make yarn_install
	@make dbcreate
	@make dbmigrate
	@make dbseed

build:
	docker-compose build

up:
	docker-compose up

up_d:
	docker-compose up -d

down:
	docker-compose down

bundle_install:
	${DOCKER_COMPOSE_RUN} bundle install

yarn_install:
	${DOCKER_COMPOSE_RUN} yarn install

console:
	${DOCKER_COMPOSE_RUN} rails c

dbcreate:
	${DOCKER_COMPOSE_RUN} rails db:create

dbmigrate:
	${DOCKER_COMPOSE_RUN} rails db:migrate

dbseed:
	${DOCKER_COMPOSE_RUN} rails db:seed

dbreset:
	${DOCKER_COMPOSE_RUN} rails db:migrate:reset
	@make dbseed

dbrollback:
	${DOCKER_COMPOSE_RUN} rails db:rollback

rails:
	${DOCKER_COMPOSE_RUN} rails $(args)

rspec:
	${DOCKER_COMPOSE_RUN} rspec

standard:
	${DOCKER_COMPOSE_RUN} standardrb

standard_fix:
	${DOCKER_COMPOSE_RUN}  standardrb --fix

erblint:
	${DOCKER_COMPOSE_RUN} erblint --lint-all

erblint_fix:
	${DOCKER_COMPOSE_RUN} erblint --lint-all -a

brakeman:
	${DOCKER_COMPOSE_RUN} brakeman
