class Course {
  final String teacherLogin;
  final String? courseDescription;
  final int? courseCode;

  const Course({
    required this.teacherLogin,
    this.courseDescription,
    this.courseCode,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      teacherLogin: json['codigo_docente'],
      courseCode: json['codigo_curso'],
      courseDescription: json['descripcion'],
    );
  }

  Map<String, dynamic> toJson() => {
        'codigo_curso': courseCode,
        'descripcion': courseDescription,
        'codigo_docente': teacherLogin,
      };
}
