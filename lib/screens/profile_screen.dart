import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';

class ProfileScreen_Bagas extends StatefulWidget {
  final String currentUserNim_Bagas;

  const ProfileScreen_Bagas({super.key, required this.currentUserNim_Bagas});

  @override
  State<ProfileScreen_Bagas> createState() => _ProfileScreen_BagasState();
}

class _ProfileScreen_BagasState extends State<ProfileScreen_Bagas> {
  final AuthService_Rizwar _authService = AuthService_Rizwar();

  void _showEditProfileDialog(String currentName) {
    final TextEditingController nameController = TextEditingController(
      text: currentName,
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Profil"),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: "Nama Lengkap"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () async {
                if (nameController.text.trim().isNotEmpty) {
                  bool success = await _authService.updateUserProfile_Rizwar(
                    widget.currentUserNim_Bagas,
                    nameController.text.trim(),
                  );
                  if (context.mounted) {
                    Navigator.pop(context);
                    if (success) {
                      setState(() {}); // Refresh UI
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Profil berhasil diperbarui!"),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Gagal memperbarui profil."),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                }
              },
              child: const Text("Simpan"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Fetch current data first to pre-fill dialog
              FirebaseFirestore.instance
                  .collection('Users')
                  .doc(widget.currentUserNim_Bagas)
                  .get()
                  .then((snapshot) {
                    if (snapshot.exists) {
                      final data = snapshot.data() as Map<String, dynamic>;
                      _showEditProfileDialog(data['full name'] ?? '');
                    }
                  });
            },
          ),
        ],
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('Users')
            .doc(widget.currentUserNim_Bagas)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text("Terjadi kesalahan saat memuat data."),
            );
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text("Data pengguna tidak ditemukan."));
          }

          final userData = snapshot.data!.data() as Map<String, dynamic>;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Color.fromARGB(255, 75, 213, 255),
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.person_outline),
                          title: const Text("Nama Lengkap"),
                          subtitle: Text(userData['full name'] ?? '-'),
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.badge_outlined),
                          title: const Text("NIM"),
                          subtitle: Text(userData['user_id'] ?? '-'),
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.email_outlined),
                          title: const Text("Email"),
                          subtitle: Text(userData['email'] ?? '-'),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      await _authService.signOut_Rizwar();
                      if (context.mounted) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen_Bagas(),
                          ),
                          (route) => false,
                        );
                      }
                    },
                    icon: const Icon(Icons.logout),
                    label: const Text("Logout"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}