<?php
session_start();
require 'koneksi.php';

// If the user is not logged in, redirect to the login page
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JagoeCoding - Help</title>
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
            min-height: 100vh;
            color: #FFFFFF;
        }

        /* Sidebar (reuse styles) */
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

        .settings {
            margin-top: 20px;
            border-top: 1px solid #282048;
            padding-top: 15px;
        }

        /* Main Content Styles */
        .main-content {
            flex: 1;
            padding: 30px;
        }

        header h1 {
            font-size: 30px;
            margin-bottom: 10px;
        }

        header p {
            margin-bottom: 30px;
        }

        .faq-section {
            background-color: #28285a;
            padding: 20px;
            border-radius: 10px;
        }

        .faq-item {
            margin-bottom: 20px;
            cursor: pointer;
        }

        .faq-item h5 {
            font-size: 20px;
            margin-bottom: 10px;
            transition: color 0.3s;
        }

        .faq-item h5:hover {
            color: #928EFF;
        }

        .faq-item p {
            font-size: 16px;
            color: #C2C2C2;
            display: none;
            margin-top: 10px;
        }

        .contact-support {
            margin-top: 30px;
            display: block;
            background-color: #6c63ff;
            color: #FFFFFF;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            text-align: center;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .contact-support:hover {
            background-color: #8f85ff;
        }
    </style>
</head>

<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div>
            <h1>JagoeCoding</h1>
            <ul>
                <li><a href="dashboard.php"><img src="element-icon/dashboard.png" alt="Dashboard Icon">Dashboard</a></li>
                <li><a href="course.php"><img src="element-icon/course.png" alt="Course Icon">Course</a></li>
                <li><a href="leaderboard.php"><img src="element-icon/leaderboard.png" alt="Leaderboard Icon">Leaderboard</a></li>
                <li><a href="profil.php"><img src="element-icon/profil.png" alt="Profile Icon">Profile</a></li>
            </ul>
        </div>
        <div class="settings">
            <ul>
                <li><a href="settings.php"><img src="element-icon/setting.png" alt="Settings Icon">Settings</a></li>
                <li><a href="help.php"><img src="element-icon/help.png" alt="Help Icon">Help</a></li>
                <li><a href="login.php"><img src="element-icon/logout.png" alt="Log Out Icon">Log Out</a></li>
            </ul>
        </div>
    </div>

    <!-- Main Content -->
    <main class="main-content">
        <header>
            <h1>Bantuan</h1>
            <p>Pilih pertanyaan berikut untuk melihat jawaban yang relevan.</p>
        </header>

        <section class="faq-section">
            <div class="faq-item">
                <h5>Apa itu JagoeCoding?</h5>
                <p>JagoeCoding adalah platform pembelajaran online untuk meningkatkan keterampilan coding kamu dengan berbagai course menarik.</p>
            </div>
            <div class="faq-item">
                <h5>Bagaimana cara mengikuti course?</h5>
                <p>Kamu bisa memilih course yang tersedia di menu "Course", lalu klik "Lanjutkan course" untuk memulai perjalananmu.</p>
            </div>
            <div class="faq-item">
                <h5>Bagaimana cara menghubungi bantuan?</h5>
                <p>Klik tombol "Contact Support" di bawah ini atau kirim email ke <a href="mailto:jagoecoding@gmail.com" style="color: #928EFF;">jagoecoding@gmail.com</a>.</p>
            </div>
        </section>

        <a href="contact.php" class="contact-support">Contact Support</a>
    </main>

    <script>
        // Script untuk menampilkan jawaban ketika pertanyaan diklik
        document.querySelectorAll('.faq-item h5').forEach(item => {
            item.addEventListener('click', () => {
                const answer = item.nextElementSibling;
                if (answer.style.display === 'block') {
                    answer.style.display = 'none';
                } else {
                    answer.style.display = 'block';
                }
            });
        });
    </script>
</body>

</html>