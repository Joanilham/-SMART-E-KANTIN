class UserModel_stefano {
  final String userId_stefano;
  final String email_stefano;
  final String fullName_stefano;
  final String password_stefano;

  UserModel_stefano({
    required this.userId_stefano,
    required this.email_stefano,
    required this.fullName_stefano,
    required this.password_stefano,
  });

  factory UserModel_stefano.fromJson(Map<String, dynamic> json) {
    return UserModel_stefano(
      userId_stefano: json['user_id'] ?? '',
      email_stefano: json['email'] ?? '',                                                   
      fullName_stefano: json['full name'] ?? '',
      password_stefano: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId_stefano,
      'email': email_stefano,
      'full name': fullName_stefano,
      'password': password_stefano,
    };
  }
}
