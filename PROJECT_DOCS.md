# Dokumentasi Proyek: SMART-E-KANTIN

## 1. Latar Belakang (Background)

Di era digital saat ini, efisiensi dan kecepatan menjadi kebutuhan utama dalam berbagai aspek kehidupan, termasuk dalam lingkungan kampus. Kantin kampus sebagai tempat utama bagi mahasiswa untuk membeli makanan dan minuman seringkali menghadapi kendala operasional. Masalah klasik seperti antrean panjang saat jam makan siang, kesalahan dalam perhitungan pembayaran manual, serta ketidakjelasan informasi mengenai ketersediaan stok makanan menjadi hambatan yang mengurangi kenyamanan mahasiswa.

Selain itu, metode pemesanan konvensional belum memanfaatkan potensi teknologi untuk memberikan pengalaman yang lebih personal dan menarik bagi pengguna. Oleh karena itu, diperlukan sebuah solusi berbasis teknologi mobile yang dapat mendigitalkan proses pemesanan di kantin.

Proyek "Smart E-Kantin" hadir sebagai solusi untuk mengatasi permasalahan tersebut. Aplikasi ini dirancang menggunakan framework Flutter untuk antarmuka pengguna yang responsif dan Firebase sebagai backend untuk pengelolaan data secara real-time. Aplikasi ini tidak hanya mendigitalkan proses pemesanan, tetapi juga memperkenalkan fitur unik berbasis Nomor Induk Mahasiswa (NIM) untuk memberikan penawaran khusus (diskon atau gratis ongkir) secara otomatis, sehingga meningkatkan efisiensi transaksi dan kepuasan pengguna.

## 2. Rumusan Masalah (Problem Formulation)

Berdasarkan latar belakang di atas, rumusan masalah dalam pengembangan aplikasi ini adalah:

1.  Bagaimana cara mengurangi waktu antrean dan mempercepat proses pemesanan makanan di kantin kampus?
2.  Bagaimana mengelola stok makanan secara _real-time_ untuk mencegah pemesanan menu yang sudah habis?
3.  Bagaimana mengimplementasikan sistem perhitungan harga otomatis yang terintegrasi dengan logika bisnis berbasis atribut mahasiswa (NIM)?
4.  Bagaimana membangun aplikasi mobile yang aman dan mudah digunakan untuk transaksi pemesanan makanan menggunakan teknologi Flutter dan Firebase?

## 3. Abstrak (Abstract)

**Judul:** Rancang Bangun Aplikasi Smart E-Kantin Berbasis Mobile Menggunakan Flutter dan Firebase

**Abstrak:**

Proyek ini bertujuan untuk mengembangkan aplikasi mobile "Smart E-Kantin" guna meningkatkan efisiensi layanan kantin di lingkungan kampus. Metode pengembangan perangkat lunak yang digunakan berfokus pada integrasi framework Flutter untuk sisi _frontend_ dan Google Firebase untuk layanan _backend_ (Authentication dan Firestore).

Aplikasi ini memungkinkan pengguna untuk melihat daftar menu, mengecek ketersediaan stok secara _real-time_, dan melakukan pemesanan melalui keranjang belanja digital. Salah satu fitur unggulan dari sistem ini adalah logika penentuan harga dinamis berdasarkan digit terakhir Nomor Induk Mahasiswa (NIM). Sistem secara otomatis mendeteksi NIM pengguna dan menerapkan aturan bisnis: mahasiswa dengan NIM ganjil mendapatkan diskon 5% dengan biaya pengiriman tetap, sedangkan mahasiswa dengan NIM genap mendapatkan fasilitas gratis ongkos kirim.

Hasil pengujian menunjukkan bahwa aplikasi berhasil menangani proses autentikasi pengguna, manajemen keranjang belanja, dan pengurangan stok otomatis saat _checkout_. Implementasi ini diharapkan dapat menjadi solusi efektif dalam mengurangi antrean fisik, meminimalisir kesalahan transaksi, dan memberikan pengalaman kuliner yang lebih modern bagi mahasiswa.

**Kata Kunci:** Flutter, Firebase, E-Kantin, Aplikasi Mobile, Manajemen Stok, Logika Bisnis NIM.
