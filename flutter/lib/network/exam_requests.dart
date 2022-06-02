import 'dart:convert';

import 'package:exams_quizzes_alike/exceptions/exam_exception.dart';
import 'package:exams_quizzes_alike/models/exam.dart';
import 'package:exams_quizzes_alike/models/exam_utils.dart';

import 'package:http/http.dart' as http;

class ExamRequests {
  Future<Exam> createExam(Exam exam) async {
    final response = await http.post(
        Uri.parse('http://localhost:3000/create-exam'),
        body: exam.toJson());

    if (response.statusCode != 200) {
      throw ExamException(
          'Something went wrong,it was not possible to create the exam');
    }
    if (response.statusCode == 200) {
      var data = json.decode(response.body)[0];
      var examCode = data['codigo_examen'];

      Exam returnedExam = await getExam(examCode);
      return returnedExam;
    }
    throw ExamException('Something went wrong');
  }

  Future<void> setTopic(int examCode, int topicCode) async {
    final response = await http.post(
        Uri.parse('http://localhost:3000/set-topic'),
        body: ExamUtils().examTopicToJson(examCode, topicCode));

    if (response.statusCode != 200) {
      throw ExamException('Could not set exam topic');
    }
  }

  Future<List<Exam>> getExams() async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/get-exams'));

    if (response.statusCode == 200) {
      List<Exam> exams = (json.decode(response.body) as List)
          .map((data) => Exam.fromJson(data))
          .toList();
      return exams;
    } else {
      throw Exception("Something failed");
    }
  }

  Future<Exam> getExam(int examCode) async {
    final response = await http.post(
        Uri.parse('http://localhost:3000/get-exam'),
        body: ExamUtils().codeJson(examCode));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return Exam.fromJson(data[0]);
    }
    throw ExamException('Something failed');
  }
}
