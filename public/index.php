<?php
// Load configuration

// Enable CORS
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Origin: http://localhost:8081');
header('Access-Control-Allow-Methods: POST, GET, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');
header('Access-Control-Allow-Credentials: true'); // Allow credentials (cookies, HTTP authentication)

require_once '../app/config/database.php';

// Define routes
$routes = require_once '../app/routes/api.php';
