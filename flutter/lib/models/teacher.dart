class Teacher {
  final String login;

  const Teacher({
    required this.login,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(login: json['login_persona']);
  }

  Map<String, dynamic> toJson() => {'login_persona': login};
}
