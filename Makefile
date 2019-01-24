.EXPORT_ALL_VARIABLES:
APP_VERSION			= $(shell git describe --abbrev=0 --tags)
APP_NAME				= custom-fluentd
DOCKER_ID_USER	= dmi7ry

all: build

build:
	docker build . -t $(DOCKER_ID_USER)/$(APP_NAME):$(APP_VERSION)
push:
	docker push $(DOCKER_ID_USER)/$(APP_NAME):$(APP_VERSION)

release:
	docker build . -t $(DOCKER_ID_USER)/$(APP_NAME):latest
push-latest:
	docker push $(DOCKER_ID_USER)/$(APP_NAME):latest

publish: build release push push-latest
