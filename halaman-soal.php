<?php
session_start();

if (!isset($_SESSION['user_id'])) {
  header("Location: login.php");
  exit;
}

$level = isset($_GET['level']) ? $_GET['level'] : 'easy';
$id_materi = isset($_GET['id']) ? $_GET['id'] : null;

$level_map = ['easy' => 1, 'medium' => 2, 'hard' => 3];

$id_jenis = isset($level) ? $level : 1;

include('koneksi.php');

$query = "SELECT materi.*, jenislevel.levell AS level_name
          FROM materi
          JOIN jenislevel ON materi.jenis_level_id = jenislevel.id
          WHERE materi.jenis_level_id = ? AND materi.id = ?";

$stmt = mysqli_prepare($conn, $query);
mysqli_stmt_bind_param($stmt, 'ii', $id_jenis, $id_materi);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);

if (mysqli_num_rows($result) > 0) {
  $challenge = mysqli_fetch_assoc($result);
} else {
  echo "Tantangan tidak ditemukan untuk level dan ID materi tersebut.";
  exit;
}

mysqli_close($conn);
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><?php echo htmlspecialchars($challenge['judul'] ?? 'Materi'); ?> - JagoeCoding</title>
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

    .main-content {
      flex: 1;
      padding: 30px;
    }

    .main-content h2 {
      font-size: 30px;
      margin-bottom: 20px;
    }

    .materi-text {
      font-weight: normal;
      font-size: 16px;
      line-height: 1.6;
    }

    .coding {
      font-family: 'Courier New', Courier, monospace;
      font-size: 16px;
      background-color: #1E1E2F;
      color: #D1D1D1;
      padding: 10px;
      border-radius: 8px;
      overflow-x: auto;
      white-space: pre-wrap;
      line-height: 1.5;
      margin: 15px 0;
    }

    .nav-buttons {
      display: flex;
      justify-content: center;
      align-items: center;
      margin-top: 250px;
    }

    .nav-button {
      width: 50px;
      height: 50px;
      border: none;
      background-color: #5B47E0;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      margin: 0 10px;
      transition: background-color 0.3s;
      cursor: pointer;
    }

    .nav-button img {
      width: 20px;
      height: 20px;
    }

    .nav-button:hover {
      background-color: #6A669D;
    }
  </style>
</head>

<body>
  <?php include('sidebar.php'); ?>
  <div class="main-content">
    <h2>Selamat datang di langkah pertama coding-mu!</h2>
    <p>Di sini, kamu akan memulai perjalanan seru dengan materi <?php echo htmlspecialchars($challenge['title'] ?? 'yang belum tersedia'); ?>. Siap buat program pertamamu? Yuk, kita mulai dari dasar dan lihat seberapa jauh kamu bisa melangkah!</p>
    <br><br>
    <div class="question">
      <h3>Bagian <?php echo htmlspecialchars($challenge['id'] ?? '') . ' : ' . htmlspecialchars($challenge['judul'] ?? 'Soal tidak tersedia'); ?></h3>
      <p class="materi-text">
        <?php echo nl2br(htmlspecialchars($challenge['deskripsi'], ENT_QUOTES, 'UTF-8')); ?>
      <pre class="coding"><?php echo htmlspecialchars($challenge['codingan'], ENT_QUOTES, 'UTF-8'); ?></pre>
    </div>

    <div class="nav-buttons">
      <button class="nav-button" id="next-button" onclick="window.location.href='halaman-jawaban-soal.php?id_materi=<?php echo $id_materi; ?>'">
        <img src="element-icon/next.png" alt="Next">
      </button>
    </div>
  </div>
</body>

</html>
