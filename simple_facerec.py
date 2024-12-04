import face_recognition
import cv2
import glob
import os

class SimpleFacerec:
    def __init__(self):
        self.known_face_encodings = []
        self.known_face_names = []

    def load_encoding_images(self, images_path):
        """
        Load encoding images from path
        :param images_path: path folder yang berisi gambar wajah
        """
        # Load Images
        images_path = glob.glob(os.path.join(images_path, "*.*"))

        print("{} encoding images found.".format(len(images_path)))

        # Store image encoding and names
        for img_path in images_path:
            img = cv2.imread(img_path)
            rgb_img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)

            # Get encoding
            face_encodings = face_recognition.face_encodings(rgb_img)

            if len(face_encodings) > 0:
                img_encoding = face_encodings[0]  # Ambil encoding wajah pertama
                # Store file name and file encoding
                basename = os.path.basename(img_path)
                (filename, ext) = os.path.splitext(basename)
                self.known_face_encodings.append(img_encoding)
                self.known_face_names.append(filename)
            else:
                print(f"Tidak ada wajah terdeteksi dalam gambar {img_path}")

    def detect_known_faces(self, frame):
        """
        Mendeteksi wajah yang terdaftar dalam frame yang diberikan
        :param frame: gambar atau video frame untuk deteksi wajah
        :return: lokasi wajah dan nama wajah terdeteksi
        """
        small_frame = cv2.resize(frame, (0, 0), fx=0.25, fy=0.25)
        rgb_small_frame = cv2.cvtColor(small_frame, cv2.COLOR_BGR2RGB)
        face_locations = face_recognition.face_locations(rgb_small_frame)
        face_encodings = face_recognition.face_encodings(rgb_small_frame, face_locations)

        face_names = []
        for face_encoding in face_encodings:
            matches = face_recognition.compare_faces(self.known_face_encodings, face_encoding)
            name = "Unknown"

            face_distances = face_recognition.face_distance(self.known_face_encodings, face_encoding)
            best_match_index = np.argmin(face_distances)
            if matches[best_match_index]:
                name = self.known_face_names[best_match_index]
            face_names.append(name)

        return face_locations, face_names
