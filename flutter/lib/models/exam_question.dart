class ExamQuestion {
  final String examCode;
  final String questionCode;
  final String? code;

  ExamQuestion({
    required this.examCode,
    required this.questionCode,
    this.code,
  });

  factory ExamQuestion.fromJson(Map<String, dynamic> json) {
    return ExamQuestion(
      code: json['codigo_pregunta_examen'].toString(),
      examCode: json['codigo_examen'].toString(),
      questionCode: json['codigo_pregunta'].toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        'exam_code': examCode,
        'question_code': questionCode,
        'code': code,
      };
}
