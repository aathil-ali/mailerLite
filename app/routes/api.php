<?php

require_once '../app/helpers/Throttle.php';


$throttleHelper = new Throttle();

CONST throttleLimit = 1000; // Adjust according to your requirements
CONST throttlePeriod = 60; // Adjust according to your requirements
/**
 * Creates a subscriber using the SubscriberController.
 */
function createSubscriber()
{
    require_once '../app/controllers/SubscriberController.php';
    (new SubscriberController())->create();
}

/**
 * Retrieves a subscriber using the SubscriberController.
 */
function getSubscriber()
{
    require_once '../app/controllers/SubscriberController.php';
    (new SubscriberController())->get();
}

/**
 * Retrieves all subscribers using the SubscriberController.
 */
function getAllSubscribers()
{
    require_once '../app/controllers/SubscriberController.php';
    (new SubscriberController())->getAllSubscribers();
}

// Extract the request URI

$request_uri = $_SERVER['PATH_INFO'];

// Define routes and their corresponding handlers
$routes = [
    '/subscribers'          => 'getAllSubscribers',
    '/subscribers/create'   => 'createSubscriber',
    '/subscribers/getByEmail' => 'getSubscriber', // This route expects an email parameter
];

$handler_fn = null;

// Find the appropriate handler based on the request URI
foreach ($routes as $pattern => $handler) {
    if (preg_match("~^$pattern$~", $request_uri)) {
        $handler_fn = $handler; // Use the matched handler directly
        break;
    }
}

// Execute the handler if found and callable
if ($handler_fn !== null && is_callable($handler_fn)) {

     // Implement throttling logic using the helper class
     $clientIP = $_SERVER['REMOTE_ADDR'];

     if (!$throttleHelper->throttleRequest($clientIP, throttleLimit, throttlePeriod)) {
         header('HTTP/1.1 429 Too Many Requests');
         echo 'Too Many Requests';
         exit;
     }


    $handler_fn();
} else {
    // Handle invalid handler or show a "Not found" message

    // Handle 404
    header('HTTP/1.1 404 Not Found');
    echo 'Not found';
}
