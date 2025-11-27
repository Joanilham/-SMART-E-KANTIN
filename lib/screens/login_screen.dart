
import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'home_screen.dart';
import 'register_screen.dart';

class LoginScreen_Bagas extends StatefulWidget {
  const LoginScreen_Bagas({super.key});

  @override
  State<LoginScreen_Bagas> createState() => _LoginScreen_BagasState();
}

class _LoginScreen_BagasState extends State<LoginScreen_Bagas> {
  final _formKey_Bagas = GlobalKey<FormState>();
  final TextEditingController _emailController_Bagas = TextEditingController();
  final TextEditingController _passwordController_Bagas =
      TextEditingController();
  final AuthService_Rizwar _authService_Riz = AuthService_Rizwar();
  bool _isLoading_Bagas = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login E-Kantin")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey_Bagas,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                  controller: _emailController_Bagas,
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
                  controller: _passwordController_Bagas,
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
              const SizedBox(height: 20),
              _isLoading_Bagas
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey_Bagas.currentState!.validate()) {
                            setState(() => _isLoading_Bagas = true);
                            final user = await _authService_Riz.signInUser_R(
                              _emailController_Bagas.text,
                              _passwordController_Bagas.text,
                            );
                            setState(() => _isLoading_Bagas = false);

                            if (user != null) {
                              // Ambil NIM dari Firestore berdasarkan email
                              String? nim = await _authService_Riz
                                  .getUserNimByEmail_Rizwar(
                                    _emailController_Bagas.text,
                                  );

                              // Jika NIM tidak ketemu (data lama/error), fallback ke parsing email (atau handle error)
                              nim ??= _emailController_Bagas.text.split('@')[0];

                              if (mounted) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen_Bagas(
                                      currentUserNim_Bagas: nim!,
                                    ),
                                  ),
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Login Gagal! Periksa Email/Password.",
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
                        child: const Text("Login"),
                      ),
                    ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen_Rizwar(),
                    ),
                  );
                },
                child: const Text("Belum punya akun? Daftar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
