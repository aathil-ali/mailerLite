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

Got it. Here's the updated section for starting the PHP server after changing the directory:


Make sure to execute these commands in the specified order. Adjust the paths according to your project structure.

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


2. **Change Directory:**
   Navigate to the `public/` folder within your project directory:
   ```bash
   cd /path/to/your/project/public/
   ```

3. **Start PHP Server:**
   Run the PHP server from the `public/` directory:
   ```bash
   php -S localhost:8000
   ```

### Run Frontend

1. **Change Directory to Frontend:**
   Navigate to the `frontend/` folder within your project directory:
   ```bash
   cd /path/to/your/project/frontend/
   ```

2. **Set Environment:**
   Configure the environment for the frontend:
   ```bash
   npm install
   npm run dev
   
## Run through Docker Recommended

1. **Build and Run Docker:**
   Execute the following command from your project root directory to build and run the project using Docker:
   ```bash
   docker-compose up --build -d
   ```

2. **Import SQL Data:**
   After Docker is running, import SQL data by running the following command:
   ```bash
   docker exec -i your_mysql_container_name mysql -h localhost -u username -ppassword database < app/sql/subscriber.sql
   ```
   Replace `your_mysql_container_name`, `username`, `password`, and `database` with your MySQL container name, username, password, and database name.

3. **Clear Redis Cache:**
   To ensure updated results, clear Redis cache by running:
   ```bash
   docker exec -it your_redis_container_name redis-cli FLUSHALL
   ```
   Replace `your_redis_container_name` with your Redis container name.

4. **Test API:**
   Access the following API endpoints:
   - `/subscribers`
   - `/subscribers/create`

Make sure to replace placeholder values and adjust container names, usernames, passwords, and paths according to your actual configuration. Run these commands in the specified order to ensure proper setup and data import after running Docker.
