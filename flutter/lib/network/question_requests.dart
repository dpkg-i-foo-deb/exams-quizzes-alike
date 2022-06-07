import 'dart:convert';

import 'package:exams_quizzes_alike/exceptions/question_exception.dart';
import 'package:exams_quizzes_alike/models/question.dart';
import 'package:exams_quizzes_alike/models/utils/question_utils.dart';
import 'package:http/http.dart' as http;

class QuestionRequests {
  Future<List<Question>> getCompatibleQuestions(
      String teacherLogin, int examCode) async {
    Map<String, dynamic> jsonObject =
        QuestionUtils().buildCompatibleQuestionsJson(examCode, teacherLogin);

    final response = await http.post(
        Uri.parse('http://localhost:3000/compatible-questions'),
        body: jsonObject);

    if (response.statusCode == 204) {
      throw QuestionException('No questions Found');
    }

    if (response.statusCode == 200) {
      List<Question> questions = (jsonDecode(response.body) as List)
          .map((data) => Question.fromJson(data))
          .toList();

      return questions;
    }

    throw QuestionException('Something went wrong');
  }

  Future<List<Question>> getExamQuestions(
      int examCode, String teacherLogin) async {
    Map<String, dynamic> jsonObject =
        QuestionUtils().buildCompatibleQuestionsJson(examCode, teacherLogin);
    final response = await http.post(
        Uri.parse('http://localhost:3000/get-exam-questions'),
        body: jsonObject);

    if (response.statusCode == 200) {
      List<Question> questions = (jsonDecode(response.body) as List)
          .map((data) => Question.fromJson(data))
          .toList();

      return questions;
    }

    if (response.statusCode == 204) {
      throw QuestionException('This exam has no questions');
    }

    throw QuestionException('Something went wrong');
  }
}
