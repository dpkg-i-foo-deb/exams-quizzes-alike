import 'dart:convert';

import 'package:exams_quizzes_alike/exceptions/option_exception.dart';
import 'package:exams_quizzes_alike/models/option.dart';
import 'package:exams_quizzes_alike/models/question_utils.dart';
import 'package:http/http.dart' as http;

class OptionRequests {
  Future<List<Option>> getOptions(int questionCode) async {
    Map<String, dynamic> jsonObject =
        QuestionUtils().buildOptionsJson(questionCode);

    final response = await http
        .post(Uri.parse('http://localhost:3000/get-options'), body: jsonObject);

    if (response.statusCode == 200) {
      List<Option> options = (jsonDecode(response.body) as List)
          .map((data) => Option.fromJson(data))
          .toList();

      return options;
    }

    if (response.statusCode == 204) {
      throw OptionException('This question has no options');
    }

    throw OptionException('Something went wrong');
  }
}
