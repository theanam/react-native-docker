# User ID
export USER_ID=`id -u`

# include .env variables
-include .env
export $(shell sed 's/=.*//' .env)

DOCKERCOMPO = USER_ID=${USER_ID} docker-compose -p $(COMPOSE_PROJECT_NAME)
DOCKERCOMPORUN = ${DOCKERCOMPO} run
DOCKERRN = ${DOCKERCOMPORUN} react-native
DOCKERPROJECT = $(DOCKERCOMPORUN) -w /app/$(REACT_NATIVE_APP_NAME) react-native
DOCKERRNRM = ${DOCKERCOMPORUN} --rm react-native

# Help
.SILENT:
.PHONY: help

help: ## Display this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


##########
# Docker #
##########
docker-init:
	@echo "--> Init react-native project"
	$(DOCKERRN) react-native init $(REACT_NATIVE_APP_NAME)

docker-run-android:
	@echo "--> Run app on android devices"
	$(DOCKERPROJECT) react-native run-android

docker-down:
	@echo "--> Stopping docker services"
	docker-compose -p $(COMPOSE_PROJECT_NAME) down