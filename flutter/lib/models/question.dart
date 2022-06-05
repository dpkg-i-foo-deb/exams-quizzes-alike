class Question {
  final String code;
  final String isPublic;
  final String isFather;
  final String type;
  final String weight;
  final String literal;
  final String subQuestionCode;
  final String teacherLogin;
  final String topicCode;

  Question({
    required this.code,
    required this.isPublic,
    required this.isFather,
    required this.type,
    required this.weight,
    required this.literal,
    required this.subQuestionCode,
    required this.teacherLogin,
    required this.topicCode,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      code: json['codigo_pregunta'].toString(),
      isPublic: json['isPublic'].toString(),
      isFather: json['isFather'].toString(),
      type: json['tipo'],
      weight: json['peso'],
      literal: json['enunciado'],
      subQuestionCode: json['codigo_subpregunta'].toString(),
      teacherLogin: json['codigo_docente'],
      topicCode: json['codigo_tema'].toString(),
    );
  }
}
