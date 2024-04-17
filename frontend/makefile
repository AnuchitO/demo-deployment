.PHONY: build
build:
	@echo "Building the frontend image"
	docker build -t frontend:$(shell git rev-parse --short HEAD) .

.PHONY: run
run: build
	@echo "Running the frontend container"
	docker rm -f fed && docker run -d -p 3000:80 --name fed frontend:$(shell git rev-parse --short HEAD)