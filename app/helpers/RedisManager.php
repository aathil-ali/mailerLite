<?php

// Include Predis autoloader only if it's not already included
if (!class_exists('Predis\Autoloader')) {
    require_once '../vendor/predis/predis/autoload.php';
}

CONST REDIS_PORT = 6379;
use Predis\Client;

/**
 * Class RedisManager
 *
 * Helper class for managing Redis connection.
 */
class RedisManager
{
    private static $redis;

    /**
     * Initialize Redis connection if not already done, and return the Redis client.
     *
     * @return Client Redis client instance.
     */
    public static function getClient()
    {
        if (self::$redis === null) {
            self::$redis = new Client([
                'scheme' => 'tcp',
                'host'   => 'redis',  // Use the container name
                'port'   => REDIS_PORT,
            ]);
        }

        return self::$redis;
    }
}
