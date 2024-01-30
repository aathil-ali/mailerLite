<?php

require_once '../app/models/Subscriber.php';
require_once '../app/helpers/Response.php';
require_once '../app/helpers/Cache.php';

/**
 * Class SubscriberController
 *
 * Controller for handling subscriber-related actions.
 */


class SubscriberController
{
    /**
     * Constructor.
     * 
     * Initializes the SubscriberController class.
     */

    private $cache;

    public function __construct()
    {
        $this->cache = new Cache();
        // It provides a common pattern for organizing controller-related functionality.
    }

    /**
     * Create a new subscriber.
     *
     * @return void
     */
    public function create()
    {
        try {
            // Receive request data, validate, sanitize
            $get_data = json_decode(file_get_contents('php://input'), true);

            $data = $this->validateRequestData($get_data);

            if (isset($data['errors'])) {
                Response::sendError(400, $data['errors']); // Return validation errors
                return;
            }


            // Create or update subscriber using Subscriber model
            $result = Subscriber::create($data);
            $this->cache->deleteByPattern("all_subscribers:");
            //remove cache in order to reload subscrßiber result


            // Send success or error response
            Response::sendSuccess($result);
        } catch (Exception $e) {
            // Handle unexpected exceptions
            Response::sendError(500, ['message' => $e->getMessage()]);
        }
    }

    /**
     * Get subscriber information.
     *
     * @return void
     */
    public function get()
    {
        try {
            // Receive request data, validate, sanitize
            $data = $this->validateRequestData($_GET);

            // Extract email from the validated data
            $email = $data['email'];
            // Attempt to retrieve the result from cache
            $cachedResult = $this->cache->get("subscriber:$email");

            if ($cachedResult !== false) {
                // If cached result exists, send it as the response
                Response::sendSuccess($cachedResult);
            } else {
                // Otherwise, fetch from the database
                $subscriber = Subscriber::get($email);
                // Cache the result for future use
                $this->cache->set("subscriber:$email", $subscriber);
                Response::sendSuccess($subscriber);
            }
        } catch (Exception $e) {
            // Handle unexpected exceptions
            Response::sendError(500, ['message' => $e->getMessage()]);
        }
    }

    /**
     * Get all subscribers.
     *
     * @return void
     */
    public function getAllSubscribers()
    {

        try {


            $page = $_GET['page'];
            // Attempt to retrieve the result from cache
            $cachedResult = $this->cache->get("all_subscribers:$page");

            if ($cachedResult !== false) {
                // If cached result exists, send it as the response
                Response::sendSuccess($cachedResult);
            } else {
                // Otherwise, fetch from the database

                $perPage = 5;
                $subscribers = Subscriber::getAllSubscribers($page, $perPage);

                // Cache the result for future use
                $this->cache->set("all_subscribers:$page", $subscribers);

                Response::sendSuccess($subscribers);
            }
        } catch (Exception $e) {
            // Handle unexpected exceptions
            Response::sendError(500, ['message' => $e->getMessage()]);
        }
    }


    /**
     * Validate request data.
     *
     * @param array $data The data to be validated.
     *
     * @return array The validated data.
     */
    private function validateRequestData($data)
    {
        $errors = [];

        // Check if 'name' field exists and is not empty
        if (!isset($data['name']) || empty($data['name'])) {
            $errors[] = 'Name is required';
        }

        // Check if 'last_name' field exists and is not empty
        if (!isset($data['last_name']) || empty($data['last_name'])) {
            $errors[] = 'Last name is required';
        }

        // Check if 'email' field exists and is a valid email address
        if (!isset($data['email']) || empty($data['email']) || !filter_var($data['email'], FILTER_VALIDATE_EMAIL)) {
            $errors[] = 'Email is required and must be a valid email address';
        }

        // Return validated data or throw an exception with errors
        if (empty($errors)) {
            return $data;
        } else {
            // You can throw an exception with errors if you prefer
            // throw new Exception(implode(', ', $errors));

            // For simplicity, you can return the errors array
            return ['errors' => $errors];
        }
    }
}
