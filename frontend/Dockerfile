# Base image (choose an appropriate Node.js version)
FROM node:21-alpine3.18 AS builder

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock)
COPY package*.json ./

# Install dependencies (use npm or yarn depending on your project)
RUN npm install

# Copy the rest of the project files (exclude node_modules)
COPY . .

# Build stage (optional, if needed for complex builds)
FROM node:21-alpine3.18 AS build-stage
WORKDIR /app

# Copy production dependencies (if applicable)
COPY package*.json ./
RUN npm install --only=production

# Copy the rest of the project files (exclude node_modules)
COPY . .

# Build the React app (adjust the command for your build process)
RUN npm run build

# Final image (slim base image for production)
FROM nginx:1.25.4-alpine

# Set working directory
WORKDIR /usr/share/nginx/html

# Copy the built React app from the build stage
COPY --from=build-stage /app/build .

# Expose port 80 (adjust if needed)
EXPOSE 80

# Default configuration for Nginx (replace with your own if needed)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
