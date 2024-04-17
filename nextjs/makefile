# build the image fron Dockerfile frontend nextjs and tag it as frontend with git commit hash
build:
	@echo "Building the frontend image"
	# docker build with replace existing image
	docker build -t frontend:$(shell git rev-parse --short HEAD) .

run:
	@echo "Running the frontend container"
	# run nextjs app
	docker rm -f fed && docker run -d -p 3000:3000 --name fed frontend:$(shell git rev-parse --short HEAD)