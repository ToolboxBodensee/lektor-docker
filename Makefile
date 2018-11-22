IMAGE=toolboxbodensee/lektor:latest

build:
	docker build -t $(IMAGE) .