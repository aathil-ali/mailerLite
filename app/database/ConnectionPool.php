<?php

require_once '../app/config/database.php';

class ConnectionPool
{
    private static $pool = [];
    private static $maxConnections = MAX_CONNECTIONS;

    public static function getConnection()
    {
        if (count(self::$pool) < self::$maxConnections) {
            $connection = new mysqli(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);

            if ($connection->connect_error) {
                die("Connection failed: " . $connection->connect_error);
            }

            return $connection;
        } else {
            return null; // Pool is full
        }
    }

    public static function releaseConnection($connection)
    {
        $connection->close();
    }
}
