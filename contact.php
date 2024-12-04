<?php
if (isset($_SESSION['status'])) {
    echo "<p style='color: #fff; background-color: #6c63ff; padding: 10px; border-radius: 5px; text-align: center;'>" . $_SESSION['status'] . "</p>";
    unset($_SESSION['status']);
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JagoeCoding - Contact Support</title>
    <style>
        body {
            background-color: #0F0A2C;
            color: #FFFFFF;
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .contact-container {
            background-color: #28285a;
            padding: 20px;
            border-radius: 10px;
            width: 400px;
            text-align: center;
        }

        .contact-container h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .contact-container form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .contact-container input,
        .contact-container textarea {
            width: 95%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
        }

        .contact-container button {
            background-color: #6c63ff;
            color: #FFFFFF;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .contact-container button:hover {
            background-color: #8f85ff;
        }
    </style>
</head>

<body>
    <div class="contact-container">
        <h1>Contact Support</h1>
        <form method="POST" action="send_message.php">
            <input type="text" name="name" placeholder="Your Name" required>
            <input type="email" name="email" placeholder="Your Email" required>
            <textarea name="message" placeholder="Your Message" rows="5" required></textarea>
            <button type="submit">Send Message</button>
        </form>
    </div>
</body>

</html>
