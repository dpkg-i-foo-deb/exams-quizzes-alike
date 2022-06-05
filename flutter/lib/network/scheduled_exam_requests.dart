import 'dart:convert';

import 'package:exams_quizzes_alike/exceptions/scheduled_exam_exception.dart';
import 'package:exams_quizzes_alike/models/scheduled_exam.dart';
import 'package:exams_quizzes_alike/models/scheduled_exam_utils.dart';
import 'package:http/http.dart' as http;

class ScheduledExamRequests {
  Future<List<ScheduledExam>> getScheduledExams(int courseCode) async {
    Map<String, dynamic> jsonBody =
        ScheduledExamUtils().buildScheduledExamsQueryJson(courseCode);
    final response = await http.post(
        Uri.parse('http://localhost:3000/scheduled-exams'),
        body: jsonBody);

    if (response.statusCode == 200) {
      List<ScheduledExam> scheduledExams = (jsonDecode(response.body) as List)
          .map((data) => ScheduledExam.fromJson(data))
          .toList();
      return scheduledExams;
    }
    throw ScheduledExamException('Something went wrong');
  }
}
