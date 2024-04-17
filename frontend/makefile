# build the image fron Dockerfile frontend nextjs and tag it as frontend with git commit hash
build:
	@echo "Building the frontend image"
	docker build -t frontend:$(shell git rev-parse --short HEAD) .

run:
	@echo "Running the frontend container"
	docker rm -f fed && docker run -d -p 3000:80 -e REACT_APP_BACKEND_URL=http://localhost:8080 --name fed frontend:$(shell git rev-parse --short HEAD)