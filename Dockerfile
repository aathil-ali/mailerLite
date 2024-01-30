# Use a multi-stage Dockerfile
FROM node:latest AS frontend-builder

# Set the working directory for the frontend code
WORKDIR /usr/src/app/frontend

# Copy frontend code into the container
COPY frontend /usr/src/app/frontend

# Install dependencies
RUN npm install

# Run build
RUN npm run build

# Stage 2: PHP with Apache
FROM php:8.0-apache

# Install necessary extensions and tools
RUN docker-php-ext-install pdo_mysql mysqli
RUN pecl install redis && docker-php-ext-enable redis

# Set the working directory for the PHP application
WORKDIR /var/www/html

# Copy the built frontend assets from the frontend-builder stage to the public directory
COPY --from=frontend-builder /usr/src/app/frontend/dist /var/www/html/public

# Copy the PHP application code
COPY app /var/www/html/app

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
