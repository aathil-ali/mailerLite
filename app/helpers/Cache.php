<?php

require_once '../app/helpers/RedisManager.php';

/**
 * Class Cache
 *
 * Simple caching class using Redis.
 */
class Cache
{
    private $redis;

    /**
     * Cache constructor.
     */
    public function __construct()
    {
        $this->redis = RedisManager::getClient();
    }

    /**
     * Get data from the cache.
     *
     * @param string $key The key to retrieve data.
     *
     * @return mixed|false The cached data or false if not found.
     */
    public function get($key)
    {
        $cachedResult = $this->redis->get($key);

        return $cachedResult !== null ? unserialize($cachedResult) : false;
    }

    /**
     * Set data in the cache.
     *
     * @param string $key   The key to store data.
     * @param mixed  $value The data to be stored.
     *
     * @return void
     */
    public function set($key, $value)
    {
        $serializedValue = serialize($value);
        $this->redis->set($key, $serializedValue);
    }

    /**
     * Clear data from the cache.
     *
     * @param string $key The key to clear from the cache.
     *
     * @return void
     */
    public function clear($key)
    {
        $this->redis->del($key);
    }

    /**
     * Clear data  by pattern from the cache.
     *
     * @param string $key The key to clear from the cache.
     *
     * @return void
     */

    public function deleteByPattern($pattern)
    {
        // Use the KEYS command to get all keys matching the pattern
        $keysToDelete = $this->redis->keys($pattern . '*');

        // Use the DEL command to delete the keys
        if (!empty($keysToDelete)) {
            call_user_func_array([$this->redis, 'del'], $keysToDelete);
        }
    }
}