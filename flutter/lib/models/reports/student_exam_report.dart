class StudentExamReport {
  final String login;
  final String name;
  final String code;
  final String answeredQuestions;
  final String correctAnswers;
  final String incorrectAnswers;
  final String correctAnswersPercentage;

  StudentExamReport({
    required this.login,
    required this.name,
    required this.code,
    required this.answeredQuestions,
    required this.correctAnswers,
    required this.incorrectAnswers,
    required this.correctAnswersPercentage,
  });

  factory StudentExamReport.fromJson(Map<String, dynamic> json) {
    return StudentExamReport(
        login: json['login'],
        name: json['nombre'],
        code: json['codigo_presentacion'].toString(),
        answeredQuestions: json['preguntas_respondidas'],
        correctAnswers: json['respuestas_correctas'],
        incorrectAnswers: json['respuestas_incorrectas'],
        correctAnswersPercentage: json['porcentaje_correctas']);
  }
}
