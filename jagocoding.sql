-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for jagocoding
CREATE DATABASE IF NOT EXISTS `jagocoding` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jagocoding`;

-- Dumping structure for table jagocoding.challenge
CREATE TABLE IF NOT EXISTS `challenge` (
  `id` int NOT NULL AUTO_INCREMENT,
  `materi_id` int NOT NULL,
  `judul_challenge` varchar(100) NOT NULL,
  `pertanyaan` text NOT NULL,
  `jawaban1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `jawaban2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `jawaban_benar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `materi_id` (`materi_id`),
  CONSTRAINT `challenge_ibfk_1` FOREIGN KEY (`materi_id`) REFERENCES `materi` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jagocoding.challenge: ~27 rows (approximately)
INSERT INTO `challenge` (`id`, `materi_id`, `judul_challenge`, `pertanyaan`, `jawaban1`, `jawaban2`, `jawaban_benar`) VALUES
	(1, 1, 'List', 'Buatlah program Python yang meminta pengguna memasukkan 5 angka, menyimpan angka tersebut dalam list, lalu mencetak angka terbesar.', 'angka = []\r\nfor _ in range(5):\r\n    angka.append(int(input("Masukkan angka: ")))\r\nprint("Angka terbesar adalah:", max(angka))\r\n\r\n', 'Tidak menggunakan fungsi max.', '1'),
	(2, 2, 'Loop dan List', 'Diberikan list buah [\'apple\', \'cherry\', \'mango\']. Tulislah kode Python untuk:\r\n- Menambahkan buah "pisang" ke akhir daftar.\r\n- Menghapus buah "cherry" dari list.\r\n- Mengurutkan list buah secara alfabet.\r\n- Menampilkan buah pertama dan terakhir dalam list.\r\n', 'Jawaban Benar :[\'apple\', \'cherry\', \'mango\']', 'Jawaban Salah :[\'mango\', \'apple\', \'cherry\']', '1'),
	(3, 3, 'Fungsi dengan Daftar', 'Buatlah sebuah fungsi Python yang menghitung rata-rata dari sekumpulan bilangan yang diberikan dalam bentuk daftar. \r\nTerapkan fungsi ini pada daftar bilangan [25, 35, 28, 32] dan pastikan hasilnya adalah 30.0.', 'Rata-rata: 30.0', 'Rata-rata: 25.0', '1'),
	(4, 4, 'loop', 'Membuat program Python untuk mencetak bilangan genap dari 1 hingga 20 menggunakan ganda.', 'Output: 2 4 6 8 10 12 14 16 18 20', 'Output: 1 3 5 7 9 11 13 15 17 19', '1'),
	(5, 5, 'Manipulasi Data dengan Pandas', 'Buatlah kode Python untuk membaca file CSV "data.csv" ke dalam DataFrame Pandas. Asumsikan file CSV memiliki header. Tampilkan 5 baris pertama dari DataFrame tersebut.', 'import pandas as pd\r\n\r\n# Membaca data CSV\r\ndf = pd.read_csv("data.csv")\r\n\r\n# Menampilkan 5 baris pertama\r\nprint(df.head())', '# Tidak mengimport Pandas\r\nimport numpy as np\r\n\r\n# ... (sisa kode yang salah)', '1'),
	(6, 6, 'Pemrograman Berorientasi Objek (OOP)', 'Buatlah sebuah kelas Mobil dengan atribut merk, model, dan tahun. Tambahkan metode start() yang mencetak pesan "Mobil sedang dinyalakan" dan metode stop() yang mencetak pesan "Mobil sedang dimatikan".', 'class Mobil:\r\n    def __init__(self, merk, model, tahun):\r\n        self.merk = merk\r\n        self.model = model\r\n        self.tahun = tahun\r\n\r\n    def start(self):\r\n        print("Mobil sedang dinyalakan")\r\n\r\n    def stop(self):\r\n        print("Mobil sedang dimatikan")\r\n\r\n# Membuat objek mobil\r\nmobil1 = Mobil("Toyota", "Innova", 2022)', 'class Mobil:\r\n  def __init__(self, merk, model, tahun):\r\n    merk = merk  # Salah, harus self.merk\r\n    model = model\r\n    tahun = tahun\r\n\r\n  # ...\r\n', '1'),
	(7, 7, 'Pengolahan Data Kompleks', 'Jika koordinatnya adalah [(1, 2), (3, 4), (6, 8), (2, 1)], apa koordinat dengan jarak terjauh dari (0, 0)?', '(6, 8)', '(3, 4)', '1'),
	(8, 8, 'Sorting dengan Kriteria Khusus', 'Jika daftar nama adalah ["Alice", "Bob", "Charlotte", "Daniel"], apa hasil setelah diurutkan berdasarkan panjang huruf?', '[\'Bob\', \'Alice\', \'Daniel\', \'Charlotte\']', '[\'Alice\', \'Bob\', \'Charlotte\', \'Daniel\']', '1'),
	(9, 9, 'rekursi', 'Membuat program Python untuk menghitung faktorial dari sebuah bilangan menggunakan rekursi.', 'Masukkan nomor: 5\r\nOutput:Faktorial: 120', 'Masukkan nomor: 5\r\nOutput:Faktorial: 25', '1'),
	(10, 10, 'java', 'Tuliskan program Java untuk mencetak "Hello, World!" ke layar.', 'Output:Hello, World!', 'Output:Hello World', '1'),
	(11, 11, 'if-else dan modulus operator (%)', 'Tuliskan program untuk memeriksa apakah suatu bilangan yang dimasukkan pengguna adalah bilangan genap atau ganjil.', 'import java.util.Scanner;\r\n\r\npublic class GenapGanjil {\r\n    public static void main(String[] args) {\r\n        Scanner scanner = new Scanner(System.in);\r\n\r\n        System.out.print("Masukkan angka: ");\r\n        int angka = scanner.nextInt();\r\n\r\n        if (angka % 2 == 0) {\r\n            System.out.println(angka + " adalah bilangan genap.");\r\n              } else {\r\n            System.out.println(angka + " adalah bilangan ganjil.");\r\n        }\r\n    }\r\n}\r\n\r\n', 'public class GenapGanjil {\r\n    public static void main(String[] args) {\r\n        int angka = 10; // Tidak menerima input dari pengguna\r\n        System.out.println(angka + " adalah bilangan genap."); // Tidak ada kondisi\r\n    }\r\n}\r\n', '1'),
	(12, 12, 'Operasi aritmatika sederhana', 'Tuliskan program yang meminta pengguna untuk memasukkan panjang dan lebar, lalu menghitung luas persegi panjang.', 'import java.util.Scanner;\r\n\r\npublic class LuasPersegiPanjang {\r\n    public static void main(String[] args) {\r\n        Scanner scanner = new Scanner(System.in);\r\n\r\n        System.out.print("Masukkan panjang: ");\r\n        int panjang = scanner.nextInt();\r\n\r\n        System.out.print("Masukkan lebar: ");\r\n        int lebar = scanner.nextInt();\r\n\r\n        int luas = panjang * lebar;\r\n        System.out.println("Luas persegi panjang adalah: " + luas);\r\n    }\r\n}\r\n', 'public class LuasPersegiPanjang {\r\n    public static void main(String[] args) {\r\n        int panjang = 10; // Panjang dan lebar tidak dinamis\r\n        int lebar = 5;\r\n\r\n        System.out.println("Luas persegi panjang adalah: " + panjang + lebar); // Salah operasi (penjumlahan)\r\n    }\r\n}\r\n\r\n', '1'),
	(13, 13, 'array', 'Buat program Java untuk menemukan elemen terbesar dalam sebuah array.', 'Output:Elemen terbesar: 40', 'Output:Elemen terbesar: 10', '1'),
	(14, 14, 'Polimorfisme', 'Buat sebuah kelas Mainyang membuat array dari tipe Animal. Isi array tersebut dengan objek Dogdan Cat, kemudian iterasi array tersebut untuk memanggil metode sound().', 'public class Main {\r\n    public static void main(String[] args) {\r\n        Animal[] animals = new Animal[2];\r\n        animals[0] = new Dog(); // Polimorfisme: Dog sebagai Animal\r\n        animals[1] = new Cat(); // Polimorfisme: Cat sebagai Animal\r\n\r\n        for (Animal animal : animals) {\r\n            animal.sound(); // Memanggil metode sound() sesuai dengan jenis objek\r\n        }\r\n    }\r\n}\r\n\r\n \r\n', 'public class Main {\r\n    public static void main(String[] args) {\r\n        Animal[] animals = new Animal[2];\r\n        animals[0] = new Dog();\r\n        animals[1] = new Cat();\r\n\r\n        // Salah: Memanggil metode langsung dari kelas Animal\r\n        for (Animal animal : animals) {\r\n            System.out.println(animal.sound()); // Tidak ada return untuk sound()\r\n        }\r\n    }\r\n}\r\n', '2'),
	(15, 15, 'OOP (Inheritance dan Polymorphism)', 'Buatlah program Java yang memiliki dua kelas: BangunDatarsebagai superclass dan Persegisebagai subclass. \r\nKelas BangunDatarmemiliki metode hitungLuas()yang akan ditimpa oleh kelas Persegi. \r\nImplementasikan program untuk menghitung luas persegi dengan sisi yang diberikan.', 'Keluaran :Luas Persegi: 25.0', 'outputnya adalah 0', '1'),
	(16, 16, 'ArrayList dan Comparator', 'Jika data siswa adalah:\r\nJawa\r\nSalin kode\r\n[\r\n    {"name": "Alice", "score": 85},\r\n    {"name": "Bob", "score": 90},\r\n    {"name": "Charlie", "score": 88}\r\n]\r\n\r\nSiapa siswa dengan nilai tertinggi?\r\n', 'Bob', 'Charlie', '1'),
	(17, 17, 'abstract ', 'Membuat program Java menggunakan kelas abstrak untuk menghitung luas berbagai bentuk geometri (lingkaran dan persegi).', 'Luas Lingkaran: 153.93804002589985\r\n  \r\nLuas Persegi: 25.0\r\n', 'Luas Lingkaran: 49.0 \r\n \r\nLuas Persegi: 35.0\r\n', '1'),
	(18, 18, 'Menghitung Rata-Rata', 'Jika nilai siswa adalah {85, 90, 88}, berapa rata-rata nilai siswa tersebut?', '87.67', '85.00', '1'),
	(19, 19, 'array ', 'Apa keluaran dari kode berikut?\r\nbahasa inggris\r\nSalin kode\r\n$fruits = ["Apple", "Banana", "Cherry", "Durian", "Grape"];\r\nforeach ($fruits as $fruit) {\r\n    echo $fruit . "\\n";', 'Apple Banana Cherry Durian Grape', 'Apple Banana Cherry Grape', '1'),
	(20, 20, 'Variabel dan Output', 'Lengkapi kode berikut agar menghasilkan output:\r\nNama saya adalah Budi dan umur saya 25 tahun.\r\n<?php\r\n$nama = "Budi";\r\n$umur = 25;\r\n// Lengkapi kode di bawah ini\r\n________;\r\n?>\r\n', 'echo "Nama saya adalah $nama dan umur saya $umur tahun.";', 'print("Nama saya adalah Budi dan umur saya tahun.");', '1'),
	(21, 21, 'If-Else', 'Lengkapi kode berikut agar menghasilkan output "Lulus" jika nilai lebih dari atau sama dengan 60.     <?php\r\n$nilai = 65;\r\n// Lengkapi kode di bawah ini\r\nif (_______) {\r\n    echo "Lulus";\r\n} else {\r\n    echo "Tidak Lulus";\r\n}\r\n?>', 'if ($nilai >= 60)', 'if ($nilai > 70)', '1'),
	(22, 22, 'Rekursi dan bilangan fibonacci', 'Membuat program PHP untuk mencetak semua kunci dan nilai dari array asosiatif.', 'Nama: Ali  \r\nJurusan: Informatika  \r\nIPK: 3.75\r\n', 'Nama: Ali, Jurusan: Informatika, IPK: 3.75', '1'),
	(23, 23, 'Array dan Looping', 'Membuat program PHP untuk menghitung jumlah bilangan ganjil dalam sebuah array yang diinputkan oleh pengguna.', 'Jumlah bilangan ganjil dalam array adalah: 3', 'Jumlah bilangan ganjil dalam array adalah: 2\r\n', '1'),
	(24, 24, 'Fungsi dan Manipulasi String', 'Membuat program PHP untuk menghitung jumlah kata dalam sebuah kalimat yang diinputkan oleh pengguna dan menampilkan kata-kata tersebut secara terbalik.', 'Jumlah kata: 4\r\nKata-kata secara terbalik: PHP belajar sedang Saya', 'Jumlah kata: 3\r\nKata-kata secara terbalik: belajar Saya sedang PHP', '1'),
	(25, 25, 'algoritma fibonacci', 'Membuat program PHP untuk menghitung bilangan Fibonacci menggunakan fungsi rekursif.', 'Output:0 1 1 2 3 5 8 13 21 34', 'Output:1 2 3 5 8 13 21 34', '1'),
	(26, 26, 'Manipulasi File dengan fopen(), fwrite(), danfclose(', 'Apa hasil dari kode berikut jika file example.txttidak ada sebelumnya?\r\nbahasa inggris\r\nSalin kode\r\n$file = fopen("example.txt", "w");\r\nfwrite($file, "This is a test file.");\r\nfclose($file);\r\necho "Teks telah ditulis ke file.";\r\n', 'Teks telah ditulis ke file.(dan file example.txtakan berisi "Ini adalah file tes.")', 'Tidak ada file yang dibuat', '1'),
	(27, 27, 'Fungsiarray_merge()', 'Apa hasil dari kode berikut?\r\nbahasa inggris\r\nSalin kode\r\n$group1 = ["Alice", "Bob", "Charlie"];\r\n$group2 = ["David", "Eva", "Frank"];\r\n$mergedGroup = array_merge($group1, $group2);\r\nprint_r($mergedGroup);', 'Array ( [0] => Alice [1] => Bob [2] => Charlie [3] => David [4] => Eva [5] => Frank )', 'Array ( [0] => Alice [1] => Bob [2] => Charlie )', '1');

-- Dumping structure for table jagocoding.face_recognition
CREATE TABLE IF NOT EXISTS `face_recognition` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `face_status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_email` (`email`),
  KEY `fk_user_id` (`user_id`),
  CONSTRAINT `fk_email` FOREIGN KEY (`email`) REFERENCES `users` (`email`) ON DELETE CASCADE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jagocoding.face_recognition: ~8 rows (approximately)
INSERT INTO `face_recognition` (`id`, `image_path`, `created_at`, `email`, `user_id`, `face_status`) VALUES
	(25, 'uploads/billa@gmail.com.png', '2024-11-24 16:05:51', 'billa@gmail.com', 3, 1),
	(26, 'uploads/siti@gmail.com.png', '2024-11-24 16:49:21', 'siti@gmail.com', 5, 1),
	(27, 'uploads/billa@gmail.com.png', '2024-11-24 17:49:04', 'billa@gmail.com', 3, 1),
	(28, 'uploads/siti@gmail.com.png', '2024-11-25 00:57:04', 'siti@gmail.com', 5, 1),
	(29, 'uploads/siti@gmail.com.png', '2024-11-25 00:58:50', 'siti@gmail.com', 5, 1),
	(30, 'uploads/febri@gmail.com.png', '2024-11-25 01:01:41', 'febri@gmail.com', 9, 1),
	(31, 'uploads/billa@gmail.com.png', '2024-12-01 14:07:20', 'billa@gmail.com', 3, 1),
	(32, 'uploads/zuyyin@gmail.com.png', '2024-12-02 13:54:14', 'zuyyin@gmail.com', 11, 1);

-- Dumping structure for table jagocoding.jenislevel
CREATE TABLE IF NOT EXISTS `jenislevel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `levell` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jagocoding.jenislevel: ~3 rows (approximately)
INSERT INTO `jenislevel` (`id`, `levell`) VALUES
	(1, 'easy'),
	(2, 'medium'),
	(3, 'hard');

-- Dumping structure for table jagocoding.kategori
CREATE TABLE IF NOT EXISTS `kategori` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(50) NOT NULL,
  `deskripsi` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jagocoding.kategori: ~3 rows (approximately)
INSERT INTO `kategori` (`id`, `nama_kategori`, `deskripsi`, `created_at`, `updated_at`) VALUES
	(1, 'php', 'Belajar PHP dan buat situs web dinamis. Yuk, mulai sekarang!', '2024-11-23 17:59:09', '2024-11-23 20:14:17'),
	(2, 'Python', 'Serbaguna dan mudah dipelajari. Yuk, mulai coding!', '2024-11-23 17:59:45', '2024-11-23 18:01:22'),
	(3, 'Java', 'Kuasi Java dan buat aplikasi keren. Mulai sekarang!', '2024-11-23 18:00:01', '2024-11-23 18:01:26');

-- Dumping structure for table jagocoding.materi
CREATE TABLE IF NOT EXISTS `materi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jenis_level_id` int NOT NULL,
  `judul` varchar(255) NOT NULL,
  `deskripsi` text,
  `codingan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `title` varchar(255) DEFAULT NULL,
  `id_kategori` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jenis_level_id` (`jenis_level_id`),
  KEY `fk_kategori` (`id_kategori`),
  CONSTRAINT `fk_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materi_ibfk_1` FOREIGN KEY (`jenis_level_id`) REFERENCES `jenislevel` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jagocoding.materi: ~27 rows (approximately)
INSERT INTO `materi` (`id`, `jenis_level_id`, `judul`, `deskripsi`, `codingan`, `title`, `id_kategori`) VALUES
	(1, 1, 'Easy Level Python', '- List adalah struktur data Python yang dapat menyimpan banyak item dalam satu variabel.\n- List dapat menyimpan berbagai tipe data (string, integer, float, dll).\n- Operasi umum: penambahan item ( append()), penghapusan ( remove()), pengurutan ( sort()), dll', '# Contoh penggunaan List\nbuah = ["apel", "mangga", "jeruk"]\nbuah.append("anggur")  # Tambah item\nbuah.remove("mangga")  # Hapus item\nbuah.sort()  # Urutkan list\nprint(buah)  # Output: ["anggur", "apel", "jeruk"]', 'List', 2),
	(2, 1, 'Easy Level Python', 'Daftar mendukung operasi seperti penambahan item ( append()), penghapusan item ( remove()), dan pengurutan item ( sort())', 'Membuat program Python yang menambahkan beberapa item ke dalam list, menghapus item tertentu, dan mengurutkan list.\r\nular piton\r\nSalin kode\r\nfruits = ["apple", "banana", "cherry"]\r\nfruits.append("mango")\r\nfruits.remove("banana")\r\nfruits.sort()\r\nprint(fruits)\r\n', 'Loop dan List', 2),
	(3, 1, 'Easy Level Python', 'Fungsi dapat digunakan untuk memproses daftar, misalnya mencari rata-rata.', 'Membuat program Python yang menghitung rata-rata dari angka dalam sebuah list.\r\nular piton\r\nSalin kode\r\ndef hitung_rata_rata(numbers):\r\n    return sum(numbers) / len(numbers)\r\n\r\ndata = [10, 20, 30, 40, 50]\r\nprint("Rata-rata:", hitung_rata_rata(data))\r\n', 'Fungsi dengan Daftar', 2),
	(4, 2, 'Medium Level Python', 'Python mendukung pengulangan menggunakan perintah seperti fordan while. Pengulangan sering digunakan untuk memproses data dalam daftar, tuple, atau range angka.', '# Program untuk mencetak bilangan genap\r\nfor i in range(1, 21):\r\n    if i % 2 == 0:\r\n        print(i, end=" ")\r\n\r\n\r\n\r\n\r\n', 'loop', 2),
	(5, 2, 'Medium Level Python', 'Pandas adalah library Python yang sangat populer untuk analisis data. Soal ini akan menguji pemahaman Anda tentang manipulasi DataFrame, salah satu struktur data utama dalam Pandas.', '# Memilih kolom \'Nama\' dan \'Usia\'\r\ndata[[\'Nama\', \'Usia\']]\r\n\r\n# Memilih baris ke-3 sampai ke-5\r\ndata.iloc[2:5]\r\n\r\n# Memilih data dengan usia di atas 30\r\ndata[data[\'Usia\'] > 30]', 'Manipulasi Data dengan Pandas', 2),
	(6, 2, 'Medium Level Python', 'OOP adalah paradigma pemrograman yang sangat penting dalam Python. Soal ini akan menguji pemahaman Anda tentang konsep kelas, objek, atribut, dan metode.', 'class BankAccount:\r\n  def __init__(self, nama, saldo):\r\n    self.__nama = nama  # Atribut private\r\n    self.__saldo = saldo\r\n\r\n  def deposit(self, jumlah):\r\n    self.__saldo += jumlah\r\n    print(f"Saldo baru: {self.__saldo}")\r\n\r\n  def withdraw(self, jumlah):\r\n    if jumlah <= self.__saldo:\r\n      self.__saldo -= jumlah\r\n      print(f"Saldo baru: {self.__saldo}")\r\n    else:\r\n      print("Saldo tidak cukup")\r\n\r\n# Membuat objek rekening\r\nrekeningku = BankAccount("Andi", 1000000)\r\nrekeningku.deposit(500000)\r\nrekeningku.withdraw(200000)\r\n', 'Pemrograman Berorientasi Objek (OOP)', 2),
	(7, 3, 'Hard Level Python', 'List dapat digunakan untuk menyimpan dan mengolah data yang lebih kompleks seperti angka berpasangan.', 'Membuat program Python yang menerima koordinat (x, y), lalu mencetak koordinat dengan jarak terjauh dari (0, 0).\r\nular piton\r\nSalin kode\r\nimport math\r\n\r\ndef jarak_titik(titik):\r\n    x, y = titik\r\n    return math.sqrt(x**2 + y**2)\r\n\r\nkoordinat = [(1, 2), (3, 4), (6, 8), (2, 1)]\r\nterjauh = max(koordinat, key=jarak_titik)\r\nprint("Koordinat terjauh dari (0, 0):", terjauh)\r\n', 'Pengolahan Data Kompleks', 2),
	(8, 3, 'Hard Level Python', 'List dapat diurutkan menggunakan fungsi sorted() dengan kriteria khusus menggunakan parameter key.', 'Membuat program Python yang mengurutkan daftar nama berdasarkan panjang hurufnya.\r\nular piton\r\nSalin kode\r\nnames = ["Alice", "Bob", "Charlotte", "Daniel"]\r\nsorted_names = sorted(names, key=len)\r\nprint("Nama setelah diurutkan:", sorted_names)\r\n', 'Sorting dengan Kriteria Khusus', 2),
	(9, 3, 'Hard Level Python', 'Python mendukung rekursi, yaitu fungsi yang memanggil dirinya sendiri. Rekursi sering digunakan untuk memecahkan masalah kompleks seperti faktorial, bilangan Fibonacci, dan pencarian dalam pohon biner.', '# Program rekursi untuk menghitung faktorial\r\ndef faktorial(n):\r\n    if n == 0 or n == 1:\r\n        return 1\r\n    else:\r\n        return n * faktorial(n - 1)\r\n\r\nangka = int(input("Masukkan bilangan: "))\r\nprint("Faktorial:", faktorial(angka))\r\n\r\n', 'rekursi', 2),
	(10, 1, 'Easy Level Java', 'Java adalah bahasa pemrograman berorientasi objek dengan sintaks yang menyerupai bahasa C. Operasi dasar seperti input dan output dapat dilakukan menggunakan kelas seperti Scanner.', 'public class HelloWorld {\r\n    public static void main(String[] args) {\r\n        System.out.println("Hello, World!");\r\n    }\r\n}', 'java', 3),
	(11, 1, 'Easy Level Java', 'Untuk menentukan apakah suatu bilangan adalah genap atau ganjil:\r\n1. Gunakan modulus operator ( %) untuk mendapatkan sisa hasil bagi.\r\n2. Jika angka % 2 == 0, maka angka tersebut genap.\r\n3. Selain itu, angka tersebut ganjil.\r\n', 'public class GenapGanjil {\r\n    public static void main(String[] args) {\r\n        int angka = 10; // Ubah nilai untuk mencoba angka lain\r\n\r\n        if (angka % 2 == 0) {\r\n            System.out.println(angka + " adalah bilangan genap.");\r\n        } else {\r\n            System.out.println(angka + " adalah bilangan ganjil.");\r\n        }\r\n    }\r\n}', 'if-else dan modulus operator (%)', 3),
	(12, 1, 'Easy Level Java', 'Untuk menghitung luas persegi panjang:\r\n1. Gunakan rumus: luas = panjang * lebar.\r\n2. Ambil input panjangdan lebardari pengguna menggunakan Scanner.', 'public class LuasPersegiPanjang {\r\n    public static void main(String[] args) {\r\n        int panjang = 5;\r\n        int lebar = 3;\r\n\r\n        int luas = panjang * lebar;\r\n        System.out.println("Luas persegi panjang adalah: " + luas);\r\n    }\r\n}', 'Operasi aritmatika sederhana', 3),
	(13, 2, 'Medium Level Java', 'Java mendukung penggunaan array untuk menyimpan data dalam bentuk kumpulan nilai. Kita dapat mengakses nilai dalam array menggunakan indeks.', 'import java.util.Scanner;\r\n\r\npublic class MaxArray {\r\n    public static void main(String[] args) {\r\n        int[] angka = {10, 25, 8, 40, 15};\r\n        int max = angka[0];\r\n        for (int i = 1; i < angka.length; i++) {\r\n            if (angka[i] > max) {\r\n                max = angka[i];\r\n            }\r\n        }\r\n        System.out.println("Elemen terbesar: " + max);\r\n    }\r\n}\r\n', 'array', 3),
	(14, 2, 'Medium Level Java', 'Polimorfisme adalah kemampuan sebuah objek untuk mengambil berbagai bentuk. Di Jawa, polimorfisme biasanya diterapkan melalui pewarisan kelas dan metode overriding.', 'class Animal {\r\n    void sound() {\r\n        System.out.println("Some generic animal sound");\r\n    }\r\n}\r\n\r\nclass Dog extends Animal {\r\n    @Override\r\n    void sound() {\r\n        System.out.println("Woof! Woof!");\r\n    }\r\n}\r\n\r\nclass Cat extends Animal {\r\n    @Override\r\n    void sound() {\r\n        System.out.println("Meow! Meow!");\r\n    }\r\n}\r\n', 'Polimorfisme', 3),
	(15, 2, 'Medium Level Java', 'Pewarisan (warisan) memungkinkan sebuah kelas untuk mewarisi properti dan metode dari kelas lain. Kelas yang diwariskan disebut kelas anak (subclass), sedangkan kelas yang diwarisi disebut kelas induk (superclass).', 'class Animal {\r\n    void sound() {\r\n        System.out.println("Animals make sounds");\r\n    }\r\n}\r\n\r\nclass Dog extends Animal {\r\n    @Override\r\n    void sound() {\r\n        System.out.println("Dogs bark");\r\n    }\r\n}\r\n\r\n', 'OOP (Inheritance dan Polymorphism)', 3),
	(16, 3, 'Hard Level Java', 'Java menyediakan ArrayListdan Comparatoruntuk menyimpan dan mengolah data terstruktur seperti nama dan nilai siswa.', 'import java.util.ArrayList;\r\n\r\npublic class ContohArrayList {\r\n    public static void main(String[] args) {\r\n        // Membuat ArrayList untuk menyimpan bilangan bulat\r\n        ArrayList<Integer> angka = new ArrayList<>();\r\n\r\n        // Menambahkan elemen ke ArrayList\r\n        angka.add(10);\r\n        angka.add(20);\r\n        angka.add(15);\r\n\r\n        // Mengakses elemen\r\n        System.out.println(angka.get(0)); // Output: 10\r\n\r\n        // Mengubah elemen\r\n        angka.set(1, 30);\r\n\r\n        // Menghapus elemen\r\n        angka.remove (2);\r\n\r\n        // Menampilkan semua elemen\r\n        for (int i = 0; i < angka.size(); i++) {\r\n            System.out.println(angka.get(i));\r\n        }\r\n    }\r\n}\r\n\r\n\r\n', 'ArrayList dan Comparator', 3),
	(17, 3, 'Hard Level Java', 'Java mendukung konsep kelas abstrak untuk membuat kerangka dasar aplikasi. Kelas abstrak tidak bisa diinstansiasi langsung dan berfungsi sebagai cetak biru.', 'abstract class Bentuk {\r\n    abstract double hitungLuas();\r\n}\r\n\r\nclass Lingkaran extends Bentuk {\r\n    double radius;\r\n\r\n    Lingkaran(double radius) {\r\n        this.radius = radius;\r\n    }\r\n\r\n    @Override\r\n    double hitungLuas() {\r\n        return Math.PI * radius * radius;\r\n    }\r\n}\r\n\r\nclass Persegi extends Bentuk {\r\n    double sisi;\r\n\r\n    Persegi(double sisi) {\r\n        this.sisi = sisi;\r\n    }\r\n\r\n    @Override\r\n    double hitungLuas() {\r\n        return sisi * sisi;\r\n    }\r\n}\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        Lingkaran lingkaran = new Lingkaran(7);\r\n        Persegi persegi = new Persegi(5);\r\n\r\n        System.out.println("Luas Lingkaran: " + lingkaran.hitungLuas());\r\n        System.out.println("Luas Persegi: " + persegi.hitungLuas());\r\n    }\r\n}\r\n\r\n', 'abstract ', 3),
	(18, 3, 'Hard Level Java', 'Java menyediakan array untuk menyimpan data. Gunakan forloop untuk menghitung rata-rata nilai dari data yang disimpan dalam array.', 'Membuat program Java untuk menghitung rata-rata nilai siswa dari sebuah array.\r\nJawa\r\nSalin kode\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        int[] scores = {85, 90, 88};\r\n        int \r\n        sum = 0;\r\n\r\n        for (int score : scores) {\r\n            sum += score;\r\n        }\r\n\r\n        double average = (double) sum / scores.length;\r\n        System.out.println("Rata-rata nilai siswa: " + average);\r\n    }\r\n}\r\n', 'Menghitung Rata-Rata', 3),
	(19, 1, 'Easy Level PHP', 'PHP mendukung penggunaan array untuk menyimpan beberapa nilai dalam satu variabel.', 'Tulis program PHP yang menyimpan 5 nama buah dalam array dan mencetak semua nama buah tersebut.\r\nbahasa inggris\r\nSalin kode\r\n<?php\r\n$fruits = ["Apple", "Banana", "Cherry", "Durian", "Grape"];\r\nforeach ($fruits as $fruit) {\r\n    echo $fruit . "\\n";\r\n}\r\n?>\r\n', 'array ', 1),
	(20, 1, 'Easy Level PHP', 'Variabel : Tempat menyimpan nilai yang dapat diakses dan diubah.\r\nOutput : Digunakan untuk menampilkan teks atau data, biasanya dengan fungsi echo.', '<?php\r\n$nama = "Ali";\r\n$umur = 20;\r\necho "Nama saya adalah $nama dan umur saya $umur tahun.";\r\n?>', 'Variabel dan Output', 1),
	(21, 1, 'Easy Level PHP', 'If-Else digunakan untuk mengambil keputusan berdasarkan kondisi.\r\n\r\nStruktur dasar: if (kondisi) {\r\n    // kode jika kondisi benar\r\n} else {\r\n    // kode jika kondisi salah\r\n}\r\n', '<?php\r\n$nilai = 75;\r\nif ($nilai >= 70) {\r\n    echo "Lulus";\r\n} else {\r\n    echo "Tidak Lulus";\r\n}\r\n?>\r\n', 'If-Else', 1),
	(22, 2, 'Medium Level PHP', 'Rekursi adalah teknik pemrograman di mana suatu fungsi memanggil dirinya sendiri untuk menyelesaikan suatu masalah.\r\nDalam kasus ini, fungsi fibonacci()dipanggil berulang kali hingga mencapai kasus dasar.\r\n\r\n', '<?php\r\n$mahasiswa = array("Nama" => "Ali", "Jurusan" => "Informatika", "IPK" => 3.75);\r\n\r\nforeach ($mahasiswa as $kunci => $nilai) {\r\n    echo "$kunci: $nilai<br>";\r\n}\r\n?>\r\n', 'rekursi dan bilangan fibonacci', 1),
	(23, 2, 'Medium Level PHP', 'Array : Struktur data yang dapat menyimpan beberapa nilai sekaligus. Dalam PHP, array dapat dideklarasikan menggunakan array()atau tanda kurung siku [].\r\nLooping : Proses iterasi atau penghentian untuk memproses data dalam array. Dalam PHP, kita dapat menggunakan loop seperti foreachuntuk mengakses elemen-elemen array.\r\nModulo (%) : Operator untuk mendapatkan sisa hasil bagi. Bilangan ganjil memiliki sisa 1 ketika dibagi dengan 2.\r\n\r\n', '<?php\r\n// Fungsi untuk menghitung jumlah bilangan ganjil dalam array\r\nfunction hitungBilanganGanjil($array) {\r\n    $jumlahGanjil = 0;\r\n    foreach ($array as $nilai) {\r\n        if ($nilai % 2 != 0) {\r\n            $jumlahGanjil++;\r\n        }\r\n    }\r\n    return \r\n$jumlahGanjil;\r\n}\r\n\r\n// Input array dari pengguna\r\necho "Masukkan elemen array (pisahkan dengan spasi): ";\r\n$input = trim(fgets(STDIN));\r\n$arrayInput = explode(" ", $input);\r\n\r\n// Konversi ke integer\r\n$array = array_map(\'intval\', $arrayInput);\r\n\r\n// Hitung jumlah bilangan ganjil\r\n$jumlahGanjil = hitungBilanganGanjil($array);\r\n\r\n// Output hasil\r\necho "Jumlah bilangan ganjil dalam array adalah: $jumlahGanjil\\n";\r\n?>\r\n', 'Array dan Looping', 1),
	(24, 2, 'Medium Level PHP', 'Fungsi bawaan PHP :\r\n1. explode(): Mengubah string array menjadi berdasarkan pemisahan tertentu.\r\n2. count(): Menghitung jumlah elemen dalam array.\r\n3. array_reverse(): Membalikkan urutan elemen dalam array.\r\n4. implode(): Menggabungkan elemen array menjadi string dengan pemisah tertentu.\r\nManipulasi String :\r\nProgram ini menggunakan fungsi string untuk memisahkan dan menggabungkan kata dalam kalimat.\r\nInput dan Output :\r\nProgram menerima input dari pengguna melalui fgets(STDIN)dan memproses kalimat tersebut.\r\n\r\n', '<?php\r\n// Fungsi untuk menghitung jumlah kata dan menampilkan kata-kata secara terbalik\r\nfunction prosesKalimat($kalimat) {\r\n    // Memisahkan kalimat menjadi array kata\r\n    $kataArray = explode(" ", $kalimat);\r\n     // Hitung jumlah kata\r\n    $jumlahKata = count($kataArray);\r\n\r\n    // Balik urutan kata\r\n    $kataTerbalik = array_reverse($kataArray);\r\n\r\n    // Hasil\r\n    echo "Jumlah kata: $jumlahKata\\n";\r\n    echo "Kata-kata secara terbalik: " . implode(" ", $kataTerbalik) . "\\n";\r\n}\r\n\r\n// Input dari pengguna\r\necho "Masukkan sebuah kalimat: ";\r\n$kalimat = trim(fgets(STDIN));\r\n\r\n// Proses dan tampilkan hasil\r\nprosesKalimat($kalimat);\r\n?>\r\n', 'Fungsi dan Manipulasi String', 1),
	(25, 3, 'Hard Level PHP', 'PHP mendukung penggunaan fungsi rekursif, yaitu fungsi yang memanggil dirinya sendiri. Ini sering digunakan untuk masalah seperti faktorial atau pengolahan struktur data hierarki.', '<?php\r\nfunction fibonacci($n) {\r\n    if ($n == 0) return 0;\r\n    if ($n == 1) return 1;\r\n    return fibonacci($n - 1) + fibonacci($n - 2);\r\n}\r\n\r\nfor ($i = 0; $i < 10; $i++) {\r\n    echo fibonacci($i) . " ";\r\n}\r\n?>\r\n', 'algoritma fibonacci', 1),
	(26, 3, 'Hard Level PHP', 'PHP menyediakan fungsi untuk menangani file, termasuk membuka file dengan fopen(), menulis ke file dengan fwrite(), dan menutup file dengan fclose(). Fungsinya fopen()memungkinkan kita membuka file dalam berbagai mode (seperti baca atau tulis), fwrite()digunakan untuk menulis data ke file, dan fclose()digunakan untuk menutup file setelah operasi selesai.', 'Tulis program PHP yang membuka file teks, menulis beberapa teks ke dalam file, dan menutupnya.\r\nbahasa inggris\r\nSalin kode\r\n<?php\r\n$file = fopen("example.txt", "w");\r\nfwrite($file, "This is a test file.");\r\nfclose($file);\r\necho "Teks telah ditulis ke file.";\r\n?>\r\n', 'Manipulasi File dengan fopen(), fwrite(), danfclose()', 1),
	(27, 3, 'Hard Level PHP', 'Fungsi array_merge()digunakan untuk menggabungkan dua atau lebih array menjadi satu array baru. Jika ada elemen dengan kunci yang sama, nilai-nilai yang digabungkan akan dimasukkan dalam urutan yang sesuai. Fungsi ini sangat berguna saat kita perlu menggabungkan data dari beberapa sumber.', 'Tulis program PHP yang menggabungkan dua array berisi nama siswa dan mencetak gabungannya.\r\nbahasa inggris\r\nSalin kode\r\n<?php\r\n$group1 = ["Alice", "Bob", "Charlie"];\r\n$group2 = ["David", "Eva", "Frank"];\r\n$mergedGroup = array_merge($group1, $group2);\r\nprint_r($mergedGroup);\r\n?>\r\n', 'Fungsiarray_merge()', 1);

-- Dumping structure for table jagocoding.progres
CREATE TABLE IF NOT EXISTS `progres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `materi_id` int NOT NULL,
  `status` enum('belum','selesai') DEFAULT 'belum',
  `tanggal_selesai` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`materi_id`),
  KEY `materi_id` (`materi_id`),
  CONSTRAINT `progres_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `progres_ibfk_2` FOREIGN KEY (`materi_id`) REFERENCES `materi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jagocoding.progres: ~0 rows (approximately)

-- Dumping structure for table jagocoding.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `confirmPassword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bio` text COLLATE utf8mb4_general_ci,
  `profile_picture` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table jagocoding.users: ~9 rows (approximately)
INSERT INTO `users` (`id`, `username`, `email`, `password`, `confirmPassword`, `name`, `phone`, `bio`, `profile_picture`, `image_path`) VALUES
	(1, 'FebriFanisa', 'fanisafebri02@gmail.com', '$2y$10$uRP6Wiq2P3PmeJZorZpaZurlrx4y0MvFW2G5myUYqkwyikeoQ1D/.', '$2y$10$uRP6Wiq2P3PmeJZorZpaZurlrx4y0MvFW2G5myUYqkwyikeoQ1D/.', NULL, NULL, NULL, NULL, NULL),
	(2, 'vidya', 'tyas@gmail.com', '$2y$10$GAkcjP0P0JNq7lyqb6kU4.hIXMjUUWCB.Ua7.LcPvgqU7ODDuZClm', '$2y$10$GAkcjP0P0JNq7lyqb6kU4.hIXMjUUWCB.Ua7.LcPvgqU7ODDuZClm', NULL, NULL, NULL, NULL, NULL),
	(3, 'billa', 'billa@gmail.com', '$2y$10$tVN.g22KFNjKgWWobQ3MsuS8b03ZuJ.gwH6jSzoLlsvs4dWId1j3q', NULL, 'cut evana', '', '', NULL, NULL),
	(4, 'cutbilla', 'cutbilla@gmail.com', '$2y$10$M7GKFFhSS6Z27bDkUQii8.g1wrXNVRhPn5VuYn89hQwp4O5Ab4g9W', NULL, 'cut billa', '', '', 'profile/673f455cd3198_totoro025.jpg', NULL),
	(5, 'siti', 'siti@gmail.com', '$2y$10$Svt5HMN20GtbK8RVpSss5ukuaavNgVNk/7Jk4Cxx.RyB3Dkm7MYLS', NULL, NULL, NULL, NULL, NULL, NULL),
	(7, 'blable', 'blabla@gmail.com', '$2y$10$u6NzIcNXmF0xeCOzip586.ZzR3PyLPGvgHz3qxZgHkVBttpM35fIu', NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 'febrifanisa_', 'febri@gmail.com', '$2y$10$HqWC4Z8O4xv8hXHl1/LhRelOAe0DcGNY6ET7EcJ8Sip.E9ic22wXO', NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 'aca', 'aca@gmail.com', '$2y$10$3lmS9XoW0DD1CgPoO/1LdObd3EZPLE9lWNk7a4mWFvO3mEZyjXKHu', NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 'zuyyin', 'zuyyin@gmail.com', '$2y$10$AEaim15in883S9fyYndmQOzhVfMlZogbDDA/qyCoKm/8L5KDSKBTe', NULL, NULL, NULL, NULL, NULL, NULL);

-- Dumping structure for table jagocoding.user_settings
CREATE TABLE IF NOT EXISTS `user_settings` (
  `user_id` int NOT NULL,
  `challenge_update` tinyint(1) DEFAULT '0',
  `complete_level` tinyint(1) DEFAULT '0',
  `new_milestone` tinyint(1) DEFAULT '0',
  `programming_tip` tinyint(1) DEFAULT '0',
  `profile_update` tinyint(1) DEFAULT '0',
  `face_recognition_enabled` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `user_settings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jagocoding.user_settings: ~5 rows (approximately)
INSERT INTO `user_settings` (`user_id`, `challenge_update`, `complete_level`, `new_milestone`, `programming_tip`, `profile_update`, `face_recognition_enabled`) VALUES
	(3, 0, 0, 0, 0, 0, 0),
	(4, 0, 0, 0, 0, 0, 0),
	(5, 0, 0, 0, 0, 0, 0),
	(10, 0, 0, 0, 0, 0, 0),
	(11, 0, 0, 0, 0, 0, 0);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
