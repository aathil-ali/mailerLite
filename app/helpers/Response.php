<?php

/**
 * Class Response
 * 
 * Helper class for handling JSON responses.
 */
class Response
{
    /**
     * Send a success response.
     *
     * @param mixed $data The data to be included in the response.
     * 
     * @return void
     */
    public static function sendSuccess($data)
    {
        // Build the success response array
        $response = [
            "success" => true,
            "data"    => $data,
        ];

        // Encode and output the JSON response
        echo json_encode($response);
    }

    /**
     * Send an error response.
     *
     * @param string $error The error message to be included in the response.
     * 
     * @return void
     */
    public static function sendError($statusCode, $error)
    {

        // Set the HTTP status code
        http_response_code($statusCode);

        // Build the error response array
        $response = [
            "success" => false,
            "error"   => $error,
        ];

        // Encode and output the JSON response
        echo json_encode($response);
    }
}
