
import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'home_screen.dart';

class RegisterScreen_Rizwar extends StatefulWidget {
  const RegisterScreen_Rizwar({super.key});

  @override
  State<RegisterScreen_Rizwar> createState() => _RegisterScreen_RizwarState();
}

class _RegisterScreen_RizwarState extends State<RegisterScreen_Rizwar> {
  final _formKey_Rizwar = GlobalKey<FormState>();
  final TextEditingController _nimController_Rizwar = TextEditingController();
  final TextEditingController _nameController_Rizwar = TextEditingController();
  final TextEditingController _emailController_Rizwar = TextEditingController();
  final TextEditingController _passwordController_Rizwar =
      TextEditingController();
  final TextEditingController _confirmPasswordController_Rizwar =
      TextEditingController();
  final AuthService_Rizwar _authService_Riz = AuthService_Rizwar();
  bool _isLoading_Rizwar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Akun")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey_Rizwar,
            child: Column(
              children: [
                // NIM (User ID) - bubble style
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: _nimController_Rizwar,
                    decoration: const InputDecoration(
                      labelText: "NIM (User ID)",
                      filled: true,
                      fillColor: Colors.transparent,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? "NIM wajib diisi" : null,
                  ),
                ),
                const SizedBox(height: 10),

                // Nama Lengkap - bubble style
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: _nameController_Rizwar,
                    decoration: const InputDecoration(
                      labelText: "Nama Lengkap",
                      filled: true,
                      fillColor: Colors.transparent,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? "Nama wajib diisi" : null,
                  ),
                ),
                const SizedBox(height: 10),

                // Email - bubble style
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: _emailController_Rizwar,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      filled: true,
                      fillColor: Colors.transparent,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: _authService_Riz.validateEmail_Rizwar,
                  ),
                ),
                const SizedBox(height: 10),

                // Password - bubble style
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: _passwordController_Rizwar,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      filled: true,
                      fillColor: Colors.transparent,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    obscureText: true,
                    validator: _authService_Riz.validatePassword_R,
                  ),
                ),
                const SizedBox(height: 10),

                // Konfirmasi Password - bubble style
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: _confirmPasswordController_Rizwar,
                    decoration: const InputDecoration(
                      labelText: "Konfirmasi Password",
                      filled: true,
                      fillColor: Colors.transparent,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Konfirmasi password wajib diisi";
                      }
                      if (value != _passwordController_Rizwar.text) {
                        return "Password tidak sama";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                _isLoading_Rizwar
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey_Rizwar.currentState!.validate()) {
                              setState(() => _isLoading_Rizwar = true);
                              final user = await _authService_Riz
                                  .registerUser_R(
                                    email: _emailController_Rizwar.text,
                                    password: _passwordController_Rizwar.text,
                                    nim: _nimController_Rizwar.text,
                                    fullName: _nameController_Rizwar.text,
                                  );
                              setState(() => _isLoading_Rizwar = false);

                              if (user != null) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen_Bagas(
                                      currentUserNim_Bagas:
                                          _nimController_Rizwar.text,
                                    ),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Registrasi Gagal! Coba lagi.",
                                    ),
                                    behavior: SnackBarBehavior.floating,
                                    margin: EdgeInsets.only(
                                      bottom: 150,
                                      left: 16,
                                      right: 16,
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              75,
                              213,
                              255,
                            ),
                            foregroundColor: Colors.white,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          child: const Text("Daftar"),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
