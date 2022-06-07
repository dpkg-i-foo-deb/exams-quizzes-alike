import 'package:exams_quizzes_alike/models/presentation_question.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PresentationQuestionRequests {
  Future<PresentationQuestion> createPresentationQuestion(
      PresentationQuestion presentationQuestion) async {
    final response = await http.post(
        Uri.parse('http://localhost:3000/set-presentation-question'),
        body: presentationQuestion.toJson());

    if (response.statusCode == 200) {
      var data = json.decode(response.body)[0];
      return PresentationQuestion.fromJson(data);
    }

    throw Exception('Something went wrong');
  }
}
