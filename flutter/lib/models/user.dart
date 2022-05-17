class User {
  final String login;
  final String? password;
  final String fullName;

  const User({
    required this.login,
    this.password,
    required this.fullName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      login: json['login'],
      fullName: json['nombre'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        'username': login,
        'password': password,
      };
}
