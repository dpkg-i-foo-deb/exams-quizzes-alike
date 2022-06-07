import 'package:exams_quizzes_alike/models/question.dart';

class SolvedOption {
  final String optionCode;
  final String answer;
  final String optionDescription;
  final Question? question;

  const SolvedOption(
      {required this.answer,
      required this.optionCode,
      required this.optionDescription,
      this.question});
}
