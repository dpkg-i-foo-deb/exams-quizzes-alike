class Person {
  final String? login;
  final String? password;
  final String fullName;

  const Person({
    this.login,
    this.password,
    required this.fullName,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
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
