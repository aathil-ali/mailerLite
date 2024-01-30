
<?php

require_once '../app/helpers/RedisManager.php';

/**
 * Class Throttle
 *
 * Helper class for request throttling using Redis.
 */
class Throttle
{
    private $redis;

    /**
     * Throttle constructor.
     */
    public function __construct()
    {
        $this->redis = RedisManager::getClient();
    }

    /**
     * Throttle the request based on the client's IP address.
     *
     * @param string $ip The client's IP address.
     * @param int    $limit The maximum number of requests allowed within the period.
     * @param int    $period The time period in seconds.
     * @return bool True if the request is allowed, false otherwise.
     */
    public function throttleRequest($ip, $limit, $period)
    {
        $key = "throttle:$ip";
        $currentRequests = $this->redis->get($key);

        if ($currentRequests === null) {
            $currentRequests = 0;
        }

        if ($currentRequests < $limit) {
            $this->redis->incr($key);
            $this->redis->expire($key, $period);
            return true;
        }

        return false;
    }

    /**
     * Clear the request count for the client's IP address.
     *
     * @param string $ip The client's IP address.
     * @return void
     */
    public function clearThrottle($ip)
    {
        $key = "throttle:$ip";
        $this->redis->del($key);
    }
}