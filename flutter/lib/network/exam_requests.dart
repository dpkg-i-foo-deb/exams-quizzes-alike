import 'dart:convert';
import 'dart:ffi';

import 'package:exams_quizzes_alike/exceptions/exam_exception.dart';
import 'package:exams_quizzes_alike/models/exam.dart';

import 'package:http/http.dart' as http;

class ExamRequests {
  Future<void> createExam(Exam exam) async {
    final response = await http.post(
        Uri.parse('http://localhost:3000/create-exam'),
        body: exam.toJson());

    if (response.statusCode != 200) {
      throw ExamException(
          'Something went wrong,it was not possible to create the exam');
    }
  }

  Future<List<Exam>> getExam() async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/get-exam'));

    if (response.statusCode == 200) {
      List<Exam> exams = (json.decode(response.body) as List)
          .map((data) => Exam.fromJson(data))
          .toList();
      return exams;
    } else {
      throw Exception("Something failed");
    }
  }
}
