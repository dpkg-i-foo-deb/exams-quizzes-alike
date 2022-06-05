class CourseStudent {
  final String code;
  final String studentLogin;
  final String courseCode;

  const CourseStudent({
    required this.code,
    required this.studentLogin,
    required this.courseCode,
  });

  factory CourseStudent.fromJson(Map<String, dynamic> json) {
    return CourseStudent(
        code: json['codigo_matricula'].toString(),
        studentLogin: json['codigo_estudiante'],
        courseCode: json['codigo_curso'].toString());
  }

  //TODO to-json
}
