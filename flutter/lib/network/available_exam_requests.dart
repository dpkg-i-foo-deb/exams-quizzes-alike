import 'package:exams_quizzes_alike/exceptions/available_exam_exception.dart';
import 'package:exams_quizzes_alike/models/available_exam.dart';
import 'package:exams_quizzes_alike/models/utils/course_utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AvailableExamRequests {
  Future<List<AvailableExam>> getAvailableExams(int courseCode) async {
    Map<String, dynamic> jsonObject = CourseUtils().getCourseJson(courseCode);
    final response = await http.post(
        Uri.parse('http://localhost:3000/available-exams'),
        body: jsonObject);

    if (response.statusCode == 204) {
      throw AvailableExamException('There are no exams available');
    }

    if (response.statusCode == 200) {
      List<AvailableExam> exams = (json.decode(response.body) as List)
          .map((data) => AvailableExam.fromJson(data))
          .toList();

      return exams;
    }

    throw AvailableExamException('Something went wrong');
  }
}
