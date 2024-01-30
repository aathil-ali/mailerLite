# Project Configuration Guide

This guide provides instructions on configuring and running the project. Make sure to follow these steps to ensure a smooth setup.

## Prerequisites

- MySQL running on port 3306
- Redis running on port 6379

## Configure MySQL and Redis

1. **Check MySQL and Redis:**
   Ensure that your MySQL is running on port 3306, and Redis is running on port 6379.

2. **Edit `app/config/database.php`:**
   Open the `app/config/database.php` file and update the database connection details:
   ```php
   $db_host = "localhost";
   $db_user = "username";
   $db_pass = "password";
   $db_name = "database";
   ```

## Start the Server

1. **PHP Server:**
   Run the PHP server using the following command:
   ```bash
   php -S localhost:8000
   ```
   Place the `web/` folder in your Apache server.

2. **Initialize Database:**
   Run the following commands to initialize the database:
   ```bash
   mysql -h hostname -u username -ppassword
   mysql> use database;
   mysql> source app/sql/subscriber.sql;
   ```

## Run the Project

### Run PHP Server

1. **Install Dependencies:**
   Run the following command to install PHP dependencies:
   ```bash
   composer install
   ```

2. **Start PHP Server:**
   ```bash
   php -S localhost:8000
   ```

### Run Frontend

1. **Set Environment:**
   Run the following commands to set up the environment for the frontend:
   ```bash
   npm install
   npm run dev
   ```

### Run through Docker Recomended

1. **Build and Run Docker:**
   Run the following command to build and run the project using Docker:
   ```bash
   docker-compose up --build -d
   ```

## Test API

- Access the following API endpoints:
  - `/subscribers`
  - `/subscribers/create`

Make sure to replace placeholder values such as `localhost`, `username`, `password`, and `database` with your actual configuration. Adjust other commands and paths based on your project structure and also in Docker Config.
