<?php
session_start();

// Pastikan request menggunakan POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Ambil data JSON dari request
    $data = json_decode(file_get_contents('php://input'), true);

    // Pastikan ada data status dan user_id yang diterima
    if (isset($data['status']) && isset($_SESSION['user_id'])) {
        $status = $data['status'];  // 'active' atau 'inactive'
        $user_id = $_SESSION['user_id'];

        // Validasi status untuk memastikan hanya 'active' atau 'inactive' yang diterima
        if ($status === 'active' || $status === 'inactive') {
            // Hubungkan ke database
            $conn = new mysqli('localhost', 'root', '', 'jagocoding');
            if ($conn->connect_error) {
                die('Connection failed: ' . $conn->connect_error);
            }

            // Perbarui status face recognition di database
            $stmt = $conn->prepare("UPDATE face_recognition SET status = ? WHERE user_id = ?");
            $stmt->bind_param('si', $status, $user_id);

            if ($stmt->execute()) {
                echo json_encode(['message' => 'Face recognition status updated successfully']);
            } else {
                echo json_encode(['message' => 'Failed to update status']);
            }

            $stmt->close();
            $conn->close();
        } else {
            echo json_encode(['message' => 'Invalid status']);
        }
    } else {
        echo json_encode(['message' => 'No status or user_id data received']);
    }
} else {
    echo json_encode(['message' => 'Invalid request']);
}
?>
