<?php
session_start();

// Pastikan request menggunakan POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Ambil data JSON dari request
    $data = json_decode(file_get_contents('php://input'), true);

    // Pastikan ada data gambar dan email yang diterima
    if (isset($data['image']) && isset($data['email'])) {
        $imageData = $data['image'];
        $email = $data['email'];  // Ambil email dari request
        $imageData = str_replace('data:image/png;base64,', '', $imageData);
        $imageData = str_replace(' ', '+', $imageData);
        $decodedData = base64_decode($imageData);

        // Ambil user_id dari sesi
        $user_id = $_SESSION['user_id'];  // Ambil user_id dari session

        if (isset($user_id)) {
            // Tentukan path file gambar menggunakan email sebagai nama file
            $filename = 'uploads/' . $email . '.png'; // Simpan dengan nama email

            // Simpan gambar ke file
            if (file_put_contents($filename, $decodedData)) {
                // Hubungkan ke database
                $conn = new mysqli('localhost', 'root', '', 'jagocoding');

                if ($conn->connect_error) {
                    die('Connection failed: ' . $conn->connect_error);
                }

                // Simpan path gambar dan user_id ke database
                $stmt = $conn->prepare("INSERT INTO face_recognition (image_path, email, user_id) VALUES (?, ?, ?)");
                $stmt->bind_param('ssi', $filename, $email, $user_id); // Menyertakan user_id

                if ($stmt->execute()) {
                    // Update status face recognition untuk pengguna
                    $updateStmt = $conn->prepare("UPDATE face_recognition SET face_status = 1 WHERE user_id = ?");
                    $updateStmt->bind_param('i', $user_id);
                    $updateStmt->execute();
                    $updateStmt->close();

                    echo json_encode(['message' => 'Image saved successfully and face recognition activated']);
                } else {
                    echo json_encode(['message' => 'Failed to save image to database']);
                }

                $stmt->close();
                $conn->close();
            } else {
                echo json_encode(['message' => 'Failed to save image file']);
            }
        } else {
            echo json_encode(['message' => 'User ID is missing in session']);
        }
    } else {
        echo json_encode(['message' => 'No image or email data received']);
    }
} else {
    echo json_encode(['message' => 'Invalid request']);
}
?>
