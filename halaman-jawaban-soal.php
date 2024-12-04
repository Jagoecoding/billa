<?php
session_start();

// Cek apakah pengguna sudah login
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

include('koneksi.php'); // Pastikan file koneksi di-include

// Validasi dan inisialisasi parameter
$user_id = $_SESSION['user_id'];
$id_materi = isset($_GET['id_materi']) ? (int)$_GET['id_materi'] : 0;
$status = isset($_GET['status']) ? htmlspecialchars($_GET['status'], ENT_QUOTES, 'UTF-8') : '';

// Pastikan ID materi valid
if ($id_materi <= 0) {
    echo "ID materi tidak valid.";
    exit;
}

// Jika status = benar, proses update atau insert ke tabel progres
if ($status === 'benar') {
    // Periksa apakah progres sudah ada
    $query_check = "SELECT * FROM progres WHERE user_id = ? AND materi_id = ?";
    $stmt_check = mysqli_prepare($conn, $query_check);
    mysqli_stmt_bind_param($stmt_check, 'ii', $user_id, $id_materi);
    mysqli_stmt_execute($stmt_check);
    $result_check = mysqli_stmt_get_result($stmt_check);

    if ($result_check && mysqli_num_rows($result_check) > 0) {
        // Jika progres sudah ada, update status menjadi selesai
        $query_update = "UPDATE progres SET status = 'selesai', tanggal_selesai = NOW() WHERE user_id = ? AND materi_id = ?";
        $stmt_update = mysqli_prepare($conn, $query_update);
        mysqli_stmt_bind_param($stmt_update, 'ii', $user_id, $id_materi);
        mysqli_stmt_execute($stmt_update);
        mysqli_stmt_close($stmt_update);
    } else {
        // Jika progres belum ada, tambahkan entri baru
        $query_insert = "INSERT INTO progres (user_id, materi_id, status, tanggal_selesai) VALUES (?, ?, 'selesai', NOW())";
        $stmt_insert = mysqli_prepare($conn, $query_insert);
        mysqli_stmt_bind_param($stmt_insert, 'ii', $user_id, $id_materi);
        mysqli_stmt_execute($stmt_insert);
        mysqli_stmt_close($stmt_insert);
    }

    mysqli_stmt_close($stmt_check);

    // Redirect ke halaman berikutnya
    header("Location: ?id_materi=$id_materi");
    exit;
}

// Query untuk mengambil data materi
$query1 = "SELECT m.*, k.nama_kategori, jl.levell 
            FROM materi m 
            LEFT JOIN kategori k ON m.id_kategori = k.id 
            LEFT JOIN jenislevel jl ON m.jenis_level_id = jl.id 
            WHERE m.id = ?";
$stmt1 = mysqli_prepare($conn, $query1);
if ($stmt1) {
    mysqli_stmt_bind_param($stmt1, 'i', $id_materi);
    mysqli_stmt_execute($stmt1);
    $result1 = mysqli_stmt_get_result($stmt1);

    if ($result1 && mysqli_num_rows($result1) > 0) {
        $materi = mysqli_fetch_assoc($result1);
    } else {
        echo "Data materi tidak ditemukan.";
        exit;
    }

    mysqli_stmt_close($stmt1);
} else {
    echo "Query Error: " . mysqli_error($conn);
    exit;
}

// Query untuk mengambil data soal berdasarkan ID materi
$query2 = "SELECT * FROM challenge WHERE materi_id = ?";
$stmt2 = mysqli_prepare($conn, $query2);
if ($stmt2) {
    mysqli_stmt_bind_param($stmt2, 'i', $id_materi);
    mysqli_stmt_execute($stmt2);
    $result2 = mysqli_stmt_get_result($stmt2);

    if ($result2 && mysqli_num_rows($result2) > 0) {
        $challenge = mysqli_fetch_assoc($result2);
    } else {
        echo "Soal tidak ditemukan untuk ID materi ini.";
        exit;
    }

    mysqli_stmt_close($stmt2);
} else {
    echo "Kesalahan pada query database untuk data soal.";
    exit;
}

mysqli_close($conn);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JagoeCoding - Tantangan Kode</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background-color: #0F0A2C;
            display: flex;
            height: 100vh;
            color: #FFFFFF;
        }

        .sidebar {
            width: 250px;
            background-color: #161030;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .sidebar h1 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 30px;
            color: #FFFFFF;
        }

        .main-content {
            flex: 1;
            padding: 30px;
        }

        .main-content h2 {
            font-size: 30px;
            margin-bottom: 20px;
        }

        .code-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .code-block {
            background-color: #020015;
            padding: 20px;
            border-radius: 10px;
            margin-right: 10px;
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .code-block:last-child {
            margin-right: 0;
        }

        .section-title {
            font-size: 18px;
            font-weight: normal; /* Font tidak tebal */
            margin: 30px auto 20px;
            padding: 15px 15px;
            background-color: #5B47E0;
            color: #FFFFFF;
            border-radius: 10px;
            display: inline-block;
            text-align: center;
        }

        .code-block pre {
            font-family: 'Courier New', Consolas, monospace; /* Font khusus untuk coding */
            color: #E8E8E8;
            font-size: 15px;
            line-height: 1.5;
        }

        .button {
            background-color: #FFFFFF;
            color: rgb(10, 10, 10);
            padding: 10px 10px;
            text-align: center;
            display: inline-block;
            font-size: 16px;
            margin: 10px 0 0;
            cursor: pointer;
            border: none;
            border-radius: 20px;
            transition: background-color 0.3s;
        }

        .button:hover {
            background-color: #9090FF;
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
        }

        .modal-content {
            position: relative;
            background-color: #fff;
            margin: 5% auto;
            padding: 20px;
            border-radius: 10px;
            width: 50%;
            text-align: center;
        }

        .modal p {
            color: #333;
            font-size: 20px;
            margin-bottom: 20px;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            background-color: #161030;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .sidebar h1 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 30px;
            color: #FFFFFF;
        }

        .sidebar ul {
            list-style: none;
        }

        .sidebar li {
            margin: 15px 0;
        }

        .sidebar li a {
            text-decoration: none;
            color: #C2C2C2;
            font-size: 16px;
            display: flex;
            align-items: center;
            padding: 8px 0;
            transition: color 0.3s;
        }

        .sidebar li a img {
            margin-right: 10px;
            width: 24px;
            height: 24px;
        }

        .sidebar li a:hover {
            color: #928EFF;
        }

        .sidebar .settings {
            margin-top: 20px;
            border-top: 1px solid #282048;
            padding-top: 15px;
        }


        .modal-emoji {
            width: 80px;
            height: 80px;
            margin-bottom: 20px;
        }
    </style>
</head>

<body>
    <?php include('sidebar.php'); ?>
    <div class="main-content">
        <h2>Tantangan : <?php echo htmlspecialchars($materi['title']); ?>!</h2>
        <p>Sekarang, saatnya uji pemahamanmu! Pilih yang paling benar:</p>
        <h3 class="section-title">
            <?php echo nl2br(htmlspecialchars($challenge['pertanyaan'], ENT_QUOTES, 'UTF-8')); ?>     
        </h3>
        <div class="code-container">
            <div class="code-block">
                <pre><?php echo nl2br(htmlspecialchars($challenge['jawaban1'], ENT_QUOTES, 'UTF-8')); ?></pre>
                <button class="button" onclick="selectAnswer(1)">Pilih Kode Ini</button>
            </div>
            <div class="code-block">
                <pre><?php echo nl2br(htmlspecialchars($challenge['jawaban2'], ENT_QUOTES, 'UTF-8')); ?></pre>
                <button class="button" onclick="selectAnswer(2)">Pilih Kode Ini</button>
            </div>
        </div>
    </div>

    <div id="myModal" class="modal">
        <div class="modal-content">
            <p id="modalMessage"></p>
            <img id="modalEmoji" class="modal-emoji" src="" alt="Emoji">
            <br>
            <button class="button" id="modalButton" onclick="continueChallenge()">Lanjut</button>
        </div>
    </div>

    <script>
        function selectAnswer(selectedAnswer) {
            const modal = document.getElementById("myModal");
            const message = document.getElementById("modalMessage");
            const emoji = document.getElementById("modalEmoji");
            const modalButton = document.getElementById("modalButton");

            // Ambil jawaban yang benar dari database
            const correctAnswer = <?php echo $challenge['jawaban_benar']; ?>;

            if (selectedAnswer === correctAnswer) {
                message.textContent = "Good job! Kamu memilih kode yang benar.";
                emoji.src = "element-icon/senang1.png";
                modalButton.textContent = "Lanjut";
                modalButton.onclick = continueChallenge; // Fungsi menuju URL berikutnya
            } else {
                message.textContent = "Oops! Coba lagi, kode yang kamu pilih salah.";
                emoji.src = "element-icon/sedih.png";
                modalButton.textContent = "Coba Lagi";
                modalButton.onclick = () => modal.style.display = "none";
            }

            modal.style.display = "block";
        }

        function continueChallenge() {
            // Arahkan ke URL tujuan
            window.location.href = "<?php echo htmlspecialchars($materi['levell'] ?? ''); ?>-level-<?php echo htmlspecialchars($materi['nama_kategori'] ?? ''); ?>.php?level=<?php echo htmlspecialchars($materi['jenis_level_id'] ?? ''); ?>";
        }
    </script>
</body>

</html>
