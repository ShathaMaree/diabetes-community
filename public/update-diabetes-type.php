<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
error_log("=== Diabetes Type Update Script Called ===");

// Get POST data
$input = file_get_contents('php://input');
error_log("Raw input: " . $input);

$data = json_decode($input, true);
error_log("Decoded data: " . print_r($data, true));

if (!isset($data['user_id']) || !isset($data['diabetes_type'])) {
    error_log("Missing required fields");
    http_response_code(400);
    echo json_encode(['error' => 'Missing user_id or diabetes_type']);
    exit;
}

// Include Flarum's config
try {
    $config = include '../config.php';
    error_log("Config loaded successfully");
} catch (Exception $e) {
    error_log("Config load error: " . $e->getMessage());
    http_response_code(500);
    echo json_encode(['error' => 'Config load failed']);
    exit;
}

$dbConfig = $config['database'];

// Connect to database
try {
    $pdo = new PDO(
        "mysql:host={$dbConfig['host']};port={$dbConfig['port']};dbname={$dbConfig['database']};charset={$dbConfig['charset']}",
        $dbConfig['username'],
        $dbConfig['password']
    );
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    error_log("Database connected successfully");
} catch (PDOException $e) {
    error_log("Database connection failed: " . $e->getMessage());
    http_response_code(500);
    echo json_encode(['error' => 'Database connection failed']);
    exit;
}

$userId = $data['user_id'];
$diabetesType = $data['diabetes_type'];

// Update the user's diabetes type
try {
    $stmt = $pdo->prepare("UPDATE users SET diabetes_type = ? WHERE id = ?");
    $result = $stmt->execute([$diabetesType, $userId]);
    error_log("Update executed. Result: " . ($result ? 'success' : 'failed'));
    error_log("Rows affected: " . $stmt->rowCount());
    
    echo json_encode(['success' => true, 'message' => 'Diabetes type updated']);
} catch (PDOException $e) {
    error_log("Update failed: " . $e->getMessage());
    http_response_code(500);
    echo json_encode(['error' => 'Failed to update diabetes type: ' . $e->getMessage()]);
}
?>