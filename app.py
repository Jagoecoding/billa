import os
import face_recognition
from flask import Flask, request, jsonify
import base64
import numpy as np
import cv2
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

UPLOAD_FOLDER = 'uploads'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER)

ALLOWED_EXTENSIONS = {'.png', '.jpg', '.jpeg'}

def decode_image(image_data):
    try:
        img_data = np.frombuffer(base64.b64decode(image_data), dtype=np.uint8)
        image = cv2.imdecode(img_data, cv2.IMREAD_COLOR)
        image = cv2.resize(image, (300, 300))
        print("[DEBUG] Gambar berhasil didekode dan diubah ukurannya.")
        return image
    except Exception as e:
        print(f"[ERROR] Gagal mendekode gambar: {e}")
        raise ValueError("Gambar tidak valid atau rusak.")

def compare_faces(image_path, captured_image):
    try:
        uploaded_image = face_recognition.load_image_file(image_path)
        uploaded_encodings = face_recognition.face_encodings(uploaded_image)

        if len(uploaded_encodings) == 0:
            print("[DEBUG] Tidak ada wajah terdeteksi pada gambar terdaftar.")
            return False

        captured_encodings = face_recognition.face_encodings(captured_image)
        if len(captured_encodings) == 0:
            print("[DEBUG] Tidak ada wajah terdeteksi pada gambar yang diunggah.")
            return False

        results = face_recognition.compare_faces([uploaded_encodings[0]], captured_encodings[0])
        print(f"[DEBUG] Hasil perbandingan wajah: {results[0]}")
        return results[0]
    except Exception as e:
        print(f"[ERROR] Kesalahan saat membandingkan wajah: {e}")
        return False

def allowed_file(filename):
    return os.path.splitext(filename)[1].lower() in ALLOWED_EXTENSIONS

@app.route('/verify_face', methods=['POST'])
def verify_face():
    try:
        data = request.get_json()
        if 'image' not in data:
            return jsonify(status='error', message='Data gambar tidak ditemukan'), 400

        image_data = data['image']
        print("[DEBUG] Gambar diterima.")

        # Decode image dari frontend
        captured_image = decode_image(image_data)
        print("[DEBUG] Gambar didekode dan diubah ukurannya.")

        # Iterasi file di folder 'uploads'
        for filename in os.listdir(app.config['UPLOAD_FOLDER']):
            if not allowed_file(filename):
                continue

            image_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)

            if compare_faces(image_path, captured_image):
                user_email = os.path.splitext(filename)[0]
                print(f"[DEBUG] Wajah cocok, email: {user_email}")
                return jsonify(status='success', email=user_email, redirect_url='/dashboard')

        return jsonify(status='error', message='Wajah tidak dikenali'), 404

    except Exception as e:
        print(f"[ERROR] {e}")
        return jsonify(status='error', message='Terjadi kesalahan pada server'), 500

if __name__ == '__main__':
    app.run(debug=True)
