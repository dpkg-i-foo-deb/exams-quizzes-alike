class ExamReport {
  final String code;
  final String examName;
  final String answeredQuestions;
  final String correctAnswers;
  final String incorrectAnswers;
  final String gradeAverage;
  final String maxGrade;
  final String minGrade;

  ExamReport({
    required this.code,
    required this.examName,
    required this.answeredQuestions,
    required this.correctAnswers,
    required this.incorrectAnswers,
    required this.gradeAverage,
    required this.maxGrade,
    required this.minGrade,
  });

  factory ExamReport.fromJson(Map<String, dynamic> json) {
    return ExamReport(
      code: json['codigo_curso_examen'].toString(),
      examName: json['nombre_examen'],
      answeredQuestions: json['cantidad_preguntas_respondidas'],
      correctAnswers: json['cantidad_respuestas_correctas'],
      incorrectAnswers: json['cantidad_respuestas_incorrectas'],
      maxGrade: json['nota_maxima'],
      minGrade: json['nota_minima'],
      gradeAverage: json['promedio_notas_examen'],
    );
  }
}
