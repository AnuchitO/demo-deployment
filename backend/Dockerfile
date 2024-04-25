# Define build stage
FROM golang:1.22-alpine AS builder

# Set working directory
WORKDIR /app

# Copy go.mod and download dependencies
COPY go.mod ./
RUN go mod download

# Copy source code
COPY . .

# Build the Go application (replace "demoapi" with your actual binary name)
RUN CGO_ENABLED=0 go build -o demoapi .

# Define final stage
FROM alpine:3.19.1 AS final

# Set working directory
WORKDIR /app

# Copy only the application binary
COPY --from=builder /app/demoapi .

# Expose port (replace 8080 with your actual port if needed)
EXPOSE 8080

# Set command to run the application
CMD ["./demoapi"]
