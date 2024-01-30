<?php


use PHPUnit\Framework\TestCase;


class ApiTest extends TestCase
{
    public function testCreateSubscriber()
    {
        // Simulate a POST request to create a subscriber
        $_SERVER['REQUEST_METHOD'] = 'POST';
        $_SERVER['PATH_INFO'] = '/subscribers/create';

        // You may need to set additional headers and request data depending on your implementation

        // Capture the output of the API
        ob_start();
        require_once __DIR__ . '/../routes/api.php'; 
        $output = ob_get_clean();

        // Assuming your API returns a success response
        $this->assertStringContainsString('Success', $output);
    }

    public function testGetSubscriber()
    {
        // Simulate a GET request to get a subscriber
        $_SERVER['REQUEST_METHOD'] = 'GET';
        $_SERVER['PATH_INFO'] = '/subscribers/getByEmail';
        $_GET['email'] = 'test@example.com'; // Provide a valid email for testing

        // Capture the output of the API
        ob_start();
        require '../routes/api.php';
        $output = ob_get_clean();

        // Assuming your API returns a success response
        $this->assertStringContainsString('Success', $output);
    }

    public function testGetAllSubscribers()
    {
        // Simulate a GET request to get all subscribers
        $_SERVER['REQUEST_METHOD'] = 'GET';
        $_SERVER['PATH_INFO'] = '/subscribers';

        // Capture the output of the API
        ob_start();
        require '../routes/api.php';
        $output = ob_get_clean();

        // Assuming your API returns a success response
        $this->assertStringContainsString('Success', $output);
    }
}
