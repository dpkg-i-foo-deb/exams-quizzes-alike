import 'dart:convert';

import 'package:exams_quizzes_alike/exceptions/course_exception.dart';
import 'package:exams_quizzes_alike/models/teacher.dart';
import 'package:http/http.dart' as http;
import '../models/course.dart';
import '../models/teacher.dart';

class CourseRequests {
  Future<List<Course>> getCoursesByTeacher(Teacher teacher) async {
    List<Course> courses = List.empty();

    final response = await http.post(
        Uri.parse('http://localhost:3000/courses-by-teacher'),
        body: teacher.toJson());

    if (response.statusCode == 204) {
      throw CourseException('The teacher has no courses');
    }

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      for (var element in data) {
        courses.add(Course.fromJson(element));
      }

      return courses;
    }

    throw CourseException('Something went wrong');
  }
}
