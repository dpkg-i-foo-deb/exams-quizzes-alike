class Student {
  final String login;

  const Student({
    required this.login,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(login: json['login_persona']);
  }

  Map<String, dynamic> toJson() => {'login': login};
}
