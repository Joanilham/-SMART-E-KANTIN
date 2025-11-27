// File: lib/services/auth_service_Rizwar.dart

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Watermark Code diterapkan pada nama Class
class AuthService_Rizwar {
  // Inisialisasi Firebase Auth dan Firestore dengan Watermark
  final FirebaseAuth _auth_Riz = FirebaseAuth.instance;
  final FirebaseFirestore _firestore_Riz = FirebaseFirestore.instance;

  // 1. Fungsi Validasi Email Domain Kampus (Watermark Code R)
  String? validateEmail_Rizwar(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong';
    }

    // Perbaikan: Menggunakan RegExp untuk validasi format email + domain wajib
    // Ganti @kampus\.ac\.id$ dengan domain kampus Anda
    const String campusDomain_R = r'@gmail\.com$';
    final RegExp emailRegex_R = RegExp(r'^[a-zA-Z0-9.]+' + campusDomain_R);

    if (!emailRegex_R.hasMatch(value)) {
      return 'Wajib gunakan format email yang valid dan domain kampus (ex: @gmail.com)!';
    }
    return null;
  }

  // 2. Fungsi Validasi Password (> 6 Char) (Watermark Code R)
  String? validatePassword_R(String? value) {
    if (value == null || value.length <= 6) {
      // Memastikan length > 6
      return 'Password harus lebih dari 6 karakter (Min. 7 Karakter)';
    }
    return null;
  }

  // 3. Logika Login (Watermark Code R)
  Future<User?> signInUser_R(String email, String password) async {
    try {
      UserCredential userCredential_R = await _auth_Riz
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential_R.user;
    } catch (e) {
      print("Error Login: $e");
      return null;
    }
  }

  // 4. Logika Register (Watermark Code R)
  Future<User?> registerUser_R({
    required String email,
    required String password,
    required String nim,
    required String fullName,
  }) async {
    try {
      // 1. Buat Akun Auth
      UserCredential userCredential_R = await _auth_Riz
          .createUserWithEmailAndPassword(email: email, password: password);
      final user_R = userCredential_R.user;

      if (user_R != null) {
        // 2. Simpan Data ke Firestore (Collection: Users)
        await _firestore_Riz.collection('Users').doc(nim).set({
          'user_id': nim,
          'email': email,
          'full name': fullName,
          'password': password, // Disimpan sesuai Data Dictionary
        });
      }
      return user_R;
    } catch (e) {
      print("Error Register: $e");
      return null;
    }
  }

  // 5. Ambil NIM berdasarkan Email (Watermark Code R)
  Future<String?> getUserNimByEmail_Rizwar(String email) async {
    try {
      final querySnapshot = await _firestore_Riz
          .collection('Users')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Karena Doc ID adalah NIM, kita bisa ambil ID-nya atau field 'user_id'
        return querySnapshot.docs.first.id;
      }
      return null;
    } catch (e) {
      print("Error getting NIM: $e");
      return null;
    }
  }
}
