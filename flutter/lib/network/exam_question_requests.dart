import 'package:exams_quizzes_alike/exceptions/exam_question_exception.dart';
import 'package:exams_quizzes_alike/models/exam_question.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ExamQuestionRequests {
  Future<ExamQuestion> getExamQuestion(ExamQuestion examQuestion) async {
    final response = await http.post(
        Uri.parse('http://localhost:3000/get-exam-question-code'),
        body: examQuestion.toJson());

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return ExamQuestion.fromJson(data[0]);
    }

    throw ExamQuestionException('Something went wrong');
  }
}
