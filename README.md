# Smart E-Kantin

**Rancang Bangun Aplikasi Smart E-Kantin Berbasis Mobile Menggunakan Flutter dan Firebase**

## Tentang Proyek (About)

Proyek "Smart E-Kantin" bertujuan untuk meningkatkan efisiensi layanan kantin di lingkungan kampus dengan mendigitalkan proses pemesanan. Aplikasi ini mengatasi masalah antrean panjang dan pengelolaan stok manual dengan menyediakan platform mobile yang responsif dan _real-time_.

## Fitur Utama (Key Features)

- **Manajemen Stok Real-time**: Mencegah pemesanan menu yang sudah habis dengan sinkronisasi langsung ke database.
- **Logika Bisnis Berbasis NIM**: Penawaran khusus otomatis berdasarkan digit terakhir Nomor Induk Mahasiswa (NIM):
  - **NIM Ganjil**: Diskon 5% + Biaya Pengiriman Tetap.
  - **NIM Genap**: Gratis Ongkos Kirim (Free Shipping).
- **Keranjang Belanja Digital**: Memudahkan pengguna memilih dan mengelola pesanan sebelum checkout.
- **Autentikasi Aman**: Login dan registrasi pengguna yang aman menggunakan Firebase Authentication.

## Teknologi yang Digunakan (Tech Stack)

- **Frontend**: [Flutter](https://flutter.dev/) (Dart)
- **Backend**: [Firebase](https://firebase.google.com/)
  - **Authentication**: Manajemen pengguna.
  - **Cloud Firestore**: Database NoSQL untuk data menu, pesanan, dan pengguna.

## Cara Menjalankan (Getting Started)

Ikuti langkah-langkah berikut untuk menjalankan aplikasi di lingkungan lokal Anda:

1.  **Prasyarat**: Pastikan Flutter SDK sudah terinstal.

    ```bash
    flutter doctor
    ```

2.  **Clone Repository**:

    ```bash
    git clone <repository-url>
    cd -SMART-E-KANTIN
    ```

3.  **Install Dependencies**:

    ```bash
    flutter pub get
    ```

4.  **Konfigurasi Firebase**:

    - Pastikan file konfigurasi Firebase (`google-services.json` untuk Android / `GoogleService-Info.plist` untuk iOS) sudah ditempatkan di folder yang sesuai.

5.  **Jalankan Aplikasi**:
    ```bash
    flutter run
    ```

## Dokumentasi Lengkap

Untuk detail lebih lanjut mengenai latar belakang dan rumusan masalah, silakan lihat [PROJECT_DOCS.md](PROJECT_DOCS.md).
