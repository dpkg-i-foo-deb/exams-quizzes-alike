import 'dart:html';

class PresentationQuestion {
  final String presentationCode;
  final String examQuestionCode;
  final String optionCode;
  final String optionDescription;
  final String answer;
  final String? code;

  const PresentationQuestion(
      {required this.presentationCode,
      required this.examQuestionCode,
      required this.optionCode,
      required this.answer,
      required this.optionDescription,
      this.code});

  factory PresentationQuestion.fromJson(Map<String, dynamic> json) {
    return PresentationQuestion(
      code: json['codigo_pregunta_presentacion'].toString(),
      answer: json['respuesta'].toString(),
      optionCode: json['codigo_opcion'].toString(),
      optionDescription: json['descripcion_opcion'].toString(),
      examQuestionCode: json['codigo_pregunta_exmen'].toString(),
      presentationCode: json['codigo_presentacion'].toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        'presentation_code': presentationCode,
        'exam_question_code': examQuestionCode,
        'option_code': optionCode,
        'answer': answer,
        'option_description': optionDescription,
        'code': code,
      };
}
