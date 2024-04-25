run:
	@echo "Running the program"
	go run server.go

build:
	@echo "Building the program"
	go build -o demoapi server.go

.PHONY: build
build:
	@echo "Building the backend image"
	docker build -t $(DOCKER_REGISTRY)/backend:$(shell git rev-parse --short HEAD) .

.PHONY: buildx
buildx:
	@echo "Building the backend image"
	docker buildx build --platform linux/amd64,linux/arm64 -t $(DOCKER_REGISTRY)/backend:$(shell git rev-parse --short HEAD) --push .

.PHONY: run
run: build
	@echo "Running the backend container"
	docker rm -f bed && docker run -d -p 8080:8080 --name bed $(DOCKER_REGISTRY)/backend:$(shell git rev-parse --short HEAD)