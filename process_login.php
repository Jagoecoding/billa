<?php
session_start(); // Memulai session baru

include 'koneksi.php';

$request = file_get_contents('php://input');
$data = json_decode($request, true);

if (isset($data['email'])) {
    $email = $data['email'];

    // Query untuk memeriksa apakah email ada di tabel users
    $sql = "SELECT id, email FROM users WHERE email = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();

    // Jika email ditemukan di tabel users
    if ($stmt->num_rows > 0) {
        $stmt->bind_result($user_id, $email);
        $stmt->fetch();

        // Cari foto wajah pengguna di tabel face_recognition berdasarkan user_id
        $sql_face = "SELECT image_path FROM face_recognition WHERE user_id = ?";
        $stmt_face = $conn->prepare($sql_face);
        $stmt_face->bind_param("i", $user_id);
        $stmt_face->execute();
        $stmt_face->store_result();

        // Jika foto wajah ditemukan
        if ($stmt_face->num_rows > 0) {
            $stmt_face->bind_result($image_path);
            $stmt_face->fetch();

            // Perbandingan wajah dapat dilakukan dengan fungsi compare_faces() di sisi frontend
            // Jika perbandingan wajah cocok, lakukan login
            $_SESSION['email'] = $email;
            $_SESSION['user_id'] = $user_id;
            echo json_encode(['status' => 'success', 'message' => 'Login berhasil', 'redirect_url' => '/dashboard.php']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Foto wajah tidak ditemukan di database.']);
        }

        $stmt_face->close();
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Email tidak ditemukan di database.']);
    }

    $stmt->close();
    $conn->close();
} else {
    echo json_encode(['status' => 'error', 'message' => 'Email tidak ditemukan.']);
}
?>
