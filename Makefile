.EXPORT_ALL_VARIABLES:
APP_VERSION			= $(shell git describe --abbrev=0 --tags)
APP_NAME				= fluentd-kafka-elastic
DOCKER_ID_USER	= dmi7ry

all:
	build

build:
	docker build . -t $(DOCKER_ID_USER)/$(APP_NAME):$(APP_VERSION)

release:
	docker publish $(DOCKER_ID_USER)/$(APP_NAME):$(APP_VERSION)
