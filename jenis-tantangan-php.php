<?php
session_start();
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
  <title>JagoeCoding - Settings</title>
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
      display: flex;
      flex-direction: column;
      justify-content: flex-start;
    }

    .main-content h1 {
      font-size: 30px;
      margin-bottom: 20px;
    }

    .main-content p {
      margin-bottom: 20px;
    }

    .card-container {
      display: flex;
      justify-content: space-between;
      flex-wrap: wrap;
    }

    .card {
      background-color: #1F183E;
      border-radius: 10px;
      padding: 20px;
      margin: 10px;
      width: calc(30% - 20px);
      display: flex;
      flex-direction: column;
      align-items: center;
      text-align: center;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
    }

    .card img {
      width: 100%;
      height: auto;
      max-height: 200px;
      object-fit: cover;
      border-radius: 5px;
      margin-bottom: 10px;
    }

    .card h3 {
      font-size: 20px;
      margin-bottom: 10px;
      color: #FFFFFF;
    }

    .card p {
      margin-bottom: 10px;
      color: #C2C2C2;
    }

    .card button {
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      background-color: #5B47E0;
      color: #FFFFFF;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    .card button:hover {
      background-color: #7261F1;
    }
  </style>
</head>

<body>
  <!-- Sidebar -->
  <?php include('sidebar.php'); ?>
  <!-- Main Content -->
  <div class="main-content">
    <h1>Tentukan tingkat kesulitan codingmu Di Bahasa PHP!</h1>
    <p>Mulai dari Easy, atau tantang dirimu di Medium dan Hard. Siap bermain dengan kode?</p>
    <div class="card-container">
      <div class="card">
        <h3>Easy</h3>
        <p>Cocok untuk pemula. Mulai dari dasar.</p>
        <img src="image/tantangan1.png" alt="Easy Level">
        <button onclick="location.href='easy-level-php.php?level=1'">Yuk, Mulai!</button>
      </div>
      <div class="card">
        <h3>Medium</h3>
        <p>Sedikit lebih menantang. Tingkatkan skill-mu.</p>
        <img src="image/tantangan2.png" alt="Medium Level">
        <button onclick="location.href='medium-level-php.php?level=2'">Yuk, Mulai!</button>
      </div>
      <div class="card">
        <h3>Hard</h3>
        <p>Siap diuji? Tantangan terbaik ada di sini.</p>
        <img src="image/tantangan3.png" alt="Hard Level">
        <button onclick="location.href='hard-level-php.php?level=3'">Yuk, Mulai!</button>
      </div>
    </div>
  </div>
</body>

</html>