.PHONY: build
build:
	@echo "Building the frontend image"
	docker build -t $(DOCKER_REGISTRY)/frontend:$(shell git rev-parse --short HEAD) .

.PHONY: run
run: build
	@echo "Running the frontend container"
	docker rm -f fed && docker run -d -p 3000:80 --name fed $(DOCKER_REGISTRY)/frontend:$(shell git rev-parse --short HEAD)

.PHONY: buildx
buildx:
	@echo "Building the frontend image"
	docker buildx build --platform linux/amd64,linux/arm64 -t $(DOCKER_REGISTRY)/frontend:$(shell git rev-parse --short HEAD) --push .
