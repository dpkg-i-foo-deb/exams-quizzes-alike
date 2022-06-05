import 'package:exams_quizzes_alike/exceptions/course_student_exception.dart';
import 'package:exams_quizzes_alike/models/course_student.dart';
import 'package:exams_quizzes_alike/models/utils/course_student_utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CourseStudentRequests {
  Future<List<CourseStudent>> getCoursesByStudent(String login) async {
    Map<String, dynamic> jsonObject =
        CourseStudentUtils().courseStudentRequestJson(login);
    final response = await http.post(
        Uri.parse('http://localhost:3000/courses-by-student'),
        body: jsonObject);

    if (response.statusCode == 204) {
      throw CourseStudentException('This student has no courses');
    }

    if (response.statusCode == 200) {
      List<CourseStudent> courses = (jsonDecode(response.body) as List)
          .map((data) => CourseStudent.fromJson(data))
          .toList();
      return courses;
    }

    throw CourseStudentException('Something went wrong');
  }
}
