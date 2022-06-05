class ScheduledExam {
  final String code;
  final String examCode;
  final String courseCode;
  final String date;

  const ScheduledExam(
      {required this.code,
      required this.examCode,
      required this.courseCode,
      required this.date});

  factory ScheduledExam.fromJson(Map<String, dynamic> json) {
    return ScheduledExam(
      code: json['codigo_curso_examen'].toString(),
      examCode: json['codigo_examen'].toString(),
      courseCode: json['codigo_curso'].toString(),
      date: json['fecha_presentacion'],
    );
  }
}
