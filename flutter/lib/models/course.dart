class Course {
  final String teacher_login;
  final String? course_description;
  final int? course_code;

  const Course({
    required this.teacher_login,
    this.course_description,
    this.course_code,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      teacher_login: json['codigo_docente'],
      course_code: json['codigo_curso'],
      course_description: json['descripcion'],
    );
  }

  Map<String, dynamic> toJson() => {
        'codigo_curso': course_code,
        'descripcoin': course_description,
        teacher_login: teacher_login,
      };
}
