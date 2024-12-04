<?php
session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Face Recognition Login</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: radial-gradient(circle at top left, #1c1c3c, #000);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: white;
        }

        .verification-container {
            background: #1e1e3f;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 30px rgba(255, 255, 255, 0.1), 0 0 15px rgba(106, 90, 205, 0.5);
            text-align: center;
            width: 320px;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        video {
            margin: 15px auto;
            border-radius: 15px;
            border: 2px solid #6a5acd;
        }

        .verification-container button {
            width: 120px;
            padding: 10px;
            border: none;
            border-radius: 20px;
            font-size: 1em;
            cursor: pointer;
            transition: background 0.3s;
            margin: 5px;
        }

        .activate-btn {
            background: #6a5acd;
            color: white;
        }

        .activate-btn:hover {
            background: #5a4abc;
        }

        #loading {
            font-size: 1.2em;
            color: #6a5acd;
            animation: blink 1.5s infinite;
            margin-top: 10px;
        }

        @keyframes blink {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.5; }
        }
    </style>
</head>
<body>
    <div class="verification-container">
        <h2>Login with Face</h2>
        <video id="camera" autoplay playsinline width="300" height="200"></video>
        <canvas id="snapshot" style="display:none;"></canvas>
        <button class="activate-btn" onclick="captureImage()">Capture</button>
        <div id="loading" style="display: none;">Processing...</div>
    </div>

    <script>
        const video = document.getElementById('camera');
        const canvas = document.getElementById('snapshot');
        const ctx = canvas.getContext('2d');
        const loading = document.getElementById('loading');

        function initializeCamera() {
            navigator.mediaDevices.getUserMedia({ video: true })
                .then((stream) => {
                    video.srcObject = stream;
                })
                .catch((error) => {
                    alert('Unable to access the camera: ' + error.message);
                });
        }

        initializeCamera();

        function captureImage() {
            loading.style.display = 'block'; // Tampilkan loading

            canvas.width = video.videoWidth;
            canvas.height = video.videoHeight;
            ctx.drawImage(video, 0, 0, canvas.width, canvas.height);

            const imageData = canvas.toDataURL('image/png');
            uploadImage(imageData);
        }

        function uploadImage(imageData) {
            fetch('http://127.0.0.1:5000/verify_face', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ image: imageData.split(',')[1] })
            })
            .then(response => response.json())
            .then(data => {
                loading.style.display = 'none'; // Sembunyikan loading setelah proses selesai

                if (data.status === 'success') {
                    // Kirim email ke PHP untuk login
                    fetch('process_login.php', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json' },
                        body: JSON.stringify({ email: data.email })
                    })
                    .then(response => response.json())
                    .then(result => {
                        if (result.status === 'success') {
                            window.location.href = 'dashboard.php'; // Redirect to dashboard
                        } else {
                            alert(result.message);
                        }
                    });
                } else {
                    alert('Face not recognized.');
                }
            })
            .catch(error => {
                loading.style.display = 'none'; // Sembunyikan loading jika terjadi error
                alert('Verification failed.');
                console.error(error);
            });
        }
    </script>
</body>
</html>
