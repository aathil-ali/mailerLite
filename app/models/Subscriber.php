<?php

require_once '../app/config/database.php';
require_once '../app/database/ConnectionPool.php';


/**
 * Class Subscriber
 *
 * Model for handling subscriber-related database operations.
 */
class Subscriber
{
    private static $conn;

    /**
     * Initialize the database connection.
     */
    private static function initialize()
    {
        self::$conn = ConnectionPool::getConnection();
        if (!self::$conn) {
            die("Connection failed: " . mysqli_connect_error());
        }
    }

    /**
     * Create or update a subscriber in the database.
     *
     * @param array $data The data to be stored or updated.
     *
     * @return array An associative array containing a message about the operation result.
     */
    public static function create(array $data)
    {
        // Initialize the connection if not already done
        if (!self::$conn) {
            self::initialize();
        }
        // Check for existing subscriber
        $email = $data['email'];
        $sql = "SELECT 1 FROM subscribers WHERE email = '$email'";
        $result = self::$conn->query($sql);

        if (mysqli_num_rows($result) > 0) {
            // Update existing subscriber
            $sql = "UPDATE subscribers SET name='$data[name]', last_name='$data[last_name]', status='1' WHERE email='$email'";
            $result = self::$conn->query($sql);
            $message = 'Subscriber updated successfully';
        } else {
            // Insert new subscriber
            $sql = "INSERT INTO subscribers (email, name, last_name, status) VALUES ('$email', '$data[name]', '$data[last_name]', 1)";
            $result = self::$conn->query($sql);
            $message = 'Subscriber created successfully';
        }

        ConnectionPool::releaseConnection(self::$conn);

        return ['message' => $message];
    }

    /**
     * Get subscriber information from the database.
     *
     * @param string $email The email of the subscriber to retrieve.
     *
     * @return array|null An associative array representing the subscriber or null if not found.
     */
    public static function get(string $email)
    {
        // Initialize the connection if not already done
        if (!self::$conn) {
            self::initialize();
        }

        // Fetch subscriber by email
        $sql = "SELECT * FROM subscribers WHERE email='$email' ORDER BY id DESC";
        $result = self::$conn->query($sql);

        if ( $result && $result->num_rows > 0) {
            $subscriber = $result->fetch_assoc();
        } else {
            $subscriber = null;
        }

        ConnectionPool::releaseConnection(self::$conn);

        return $subscriber;
        
    }

    /**
     * Get subscriber information from the database.
     *
     * @param string $email The email of the subscriber to retrieve.
     *
     * @return array|null An associative array representing the subscriber or null if not found.
     */
    public static function getAllSubscribers($page = 1, $perPage = 5)
    {
        // Initialize the connection if not already done
        if (!self::$conn) {
            self::initialize();
        }

        // Calculate the offset
        $offset = ($page - 1) * $perPage;

        $totalPages = 0;

        // Fetch paginated subscribers
        $sql = "SELECT * FROM subscribers LIMIT $perPage OFFSET $offset";
        $result = self::$conn->query($sql);

        $subscribers = [];
        
        if ( $result &&  $result->fetch_assoc() ){
            while ($row =  $result->fetch_assoc()) {
                $subscribers[] = $row;
            }
            // Get the total number of subscribers
            $totalSubscribers = mysqli_num_rows(self::$conn->query("SELECT * FROM subscribers"));
    
            // Calculate the total number of pages
            $totalPages = ceil($totalSubscribers / $perPage);
    
        }
      
       
        // Prepare the response array
        $response = [
            'subscribers' => $subscribers,
            'page'        => $page,
            'perPage'     => $perPage,
            'totalPages'  => $totalPages,
        ];

        ConnectionPool::releaseConnection(self::$conn);

        return $response;
    }


    /**
     * Close the database connection.
     */
    public static function closeConnection()
    {
        if (self::$conn) {
            mysqli_close(self::$conn);
        }
    }
}
