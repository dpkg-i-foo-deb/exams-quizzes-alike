class AvailableExam {
  final String examCode;
  final String courseCode;
  final String maxDate;

  const AvailableExam({
    required this.examCode,
    required this.courseCode,
    required this.maxDate,
  });

  factory AvailableExam.fromJson(Map<String, dynamic> json) {
    return AvailableExam(
      examCode: json['codigo_examen'].toString(),
      courseCode: json['codigo_curso'].toString(),
      maxDate: json['fecha_maxima'],
    );
  }
}
