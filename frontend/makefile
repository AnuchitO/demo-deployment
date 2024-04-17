# build the image fron Dockerfile frontend nextjs and tag it as frontend with git commit hash
build:
	@echo "Building the frontend image"
	# build nextjs app
	docker build -t frontend:$(shell git rev-parse --short HEAD) .

run:
	@echo "Running the frontend container"
	# run nextjs app
	docker run -d -p 3000:3000 frontend:$(shell git rev-parse --short HEAD)