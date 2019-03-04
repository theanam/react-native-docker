# User ID
USER_ID=`id -u`

# include .env variables
-include .env
export $(shell sed 's/=.*//' .env)

DOCKERCOMPO = USER_ID=$(USER_ID) docker-compose -p $(COMPOSE_PROJECT_NAME)
DOCKERCORRM = ${DOCKERCOMPO} run --rm --service-ports react-native
DOCKERYARN = ${DOCKERCORRM} yarn

# Help
.SILENT:
.PHONY: help

help: ## Display this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


##########
# Docker #
##########
docker-build:
	@echo "--> Building docker image"
	$(DOCKERCOMPO) build
docker-down:
	@echo "--> Stopping docker services"
	$(DOCKERCOMPO) down
# docker-run-android:
# 	@echo "--> Run Android app"
# 	$(DOCKERYARN) mobile:android:run
docker-run:
	@echo "--> Run Docker container"
	$(DOCKERCORRM) bash
