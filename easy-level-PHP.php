<?php
session_start();

// Validasi sesi
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

// Koneksi ke database
include('koneksi.php');

// Ambil level dari URL dan validasi
$level = isset($_GET['level']) ? htmlspecialchars($_GET['level']) : 'easy';

// Pagination setup
$items_per_page = 8;
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$page = max($page, 1); // Pastikan halaman minimal 1
$offset = ($page - 1) * $items_per_page;

// Hitung total data
$total_query = "SELECT COUNT(*) AS total FROM materi WHERE jenis_level_id = ? AND id_kategori = 1";
$total_stmt = mysqli_prepare($conn, $total_query);
mysqli_stmt_bind_param($total_stmt, 's', $level);
mysqli_stmt_execute($total_stmt);
$total_result = mysqli_stmt_get_result($total_stmt);
$total_row = mysqli_fetch_assoc($total_result);
$total_items = $total_row['total'] ?? 0;
$total_pages = ceil($total_items / $items_per_page);

// Ambil data dengan pagination
$query = "SELECT m.*, COALESCE(p.status, '') AS status
  FROM materi m
  LEFT JOIN progres p ON m.id = p.materi_id AND p.user_id = ?
  WHERE m.jenis_level_id = ? AND m.id_kategori = 1
  LIMIT ? OFFSET ?";
$stmt = mysqli_prepare($conn, $query);
mysqli_stmt_bind_param($stmt, 'isii', $_SESSION['user_id'], $level, $items_per_page, $offset);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);
$challenges = mysqli_fetch_all($result, MYSQLI_ASSOC);

mysqli_close($conn);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JagoeCoding - <?php echo ucfirst($level); ?> Challenges</title>

    <style>
        /* General reset */
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

        /* Main Content Styles */
        .main-content {
            flex: 1;
            padding: 30px;
        }

        .main-content h1 {
            font-size: 30px;
            margin-bottom: 10px;
            color: #FFFFFF;
        }

        .main-content p {
            margin-bottom: 20px;
            color: #C2C2C2;
        }

        .section-title {
            font-size: 18px;
            font-weight: bold;
            margin: 0 auto 20px;
            padding: 10px 15px;
            background-color: #5B47E0;
            color: #FFFFFF;
            border-radius: 10px;
            display: inline-block;
            text-align: center;
        }

        .card-container {
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            justify-content: center;
        }

        .card {
            background-color: #8872e9;
            border-radius: 30px;
            padding: 30px;
            margin: 10px;
            width: 250px;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            box-shadow: 10px 10px 10px rgba(0, 0, 0, 0.5);
            overflow: hidden;
            transition: transform 0.3s;
        }

        .card:hover {
            transform: scale(1.05);
        }

        .card img {
            width: 70px;
            height: 70px;
            object-fit: cover;
        }

        .next-arrow {
            font-size: 15px;
            color: #FFFFFF;
            text-decoration: none;
            position: absolute;
            top: 50%;
            right: 40px;
            cursor: pointer;
            transform: translateY(-50%);
        }

        .next-arrowl {
            font-size: 15px;
            color: #FFFFFF;
            text-decoration: none;
            position: absolute;
            top: 50%;
            left: 320px;
            cursor: pointer;
            transform: translateY(-50%);
        }

        .card.disabled {
            background-color: #88C273;
            cursor: not-allowed;
            pointer-events: none;
        }

        .card.disabled img {
            filter: grayscale(100%);
            opacity: 0.7;
        }


        .next-arrow:hover {
            color: #928EFF;
        }
    </style>
</head>

<body>
    <?php include('sidebar.php'); ?>
    <!-- Main Content -->
    <div class="main-content">
        <h1><?php echo ucfirst($level); ?> Level - Yuk Mulai!</h1>
        <p>Belajar dasar coding dengan cara asik. Siap?</p>

        <!-- Section Title -->
        <div class="section-title"><?php echo ucfirst($level); ?> Challenges</div>
        <div class="card-container">
            <?php if (!empty($challenges)): ?>
                <?php foreach ($challenges as $challenge): ?>
                    <?php if ($challenge['status'] === 'selesai'): ?>
                        <div class="card disabled">
                            <img src="element-icon/centang.png" alt="Icon <?php echo htmlspecialchars($challenge['name'] ?? ''); ?>">
                            <p><?php echo htmlspecialchars($challenge['name'] ?? ''); ?> (Selesai)</p>
                        </div>
                    <?php else: ?>
                        <div class="card">
                            <a href="halaman-soal.php?level=<?php echo htmlspecialchars($challenge['jenis_level_id']); ?>&id=<?php echo htmlspecialchars($challenge['id']); ?>">
                                <img src="element-icon/game-code.png" alt="Icon <?php echo htmlspecialchars($challenge['name'] ?? ''); ?>">
                                <p><?php echo htmlspecialchars($challenge['name'] ?? ''); ?></p>
                            </a>
                        </div>
                    <?php endif; ?>
                <?php endforeach; ?>
            <?php else: ?>
                <p>Tidak ada tantangan untuk level ini.</p>
            <?php endif; ?>
        </div>

        <!-- Pagination -->
        <div class="pagination">
            <?php if ($page > 1): ?>
                <a class="next-arrowl" href="?level=<?php echo $level; ?>&page=<?php echo $page - 1; ?>">Sebelumnya</a>
            <?php endif; ?>

            <?php if ($page < $total_pages): ?>
                <a class="next-arrow" href="?level=<?php echo $level; ?>&page=<?php echo $page + 1; ?>">Berikutnya</a>
            <?php endif; ?>
        </div>
    </div>
</body>

</html>