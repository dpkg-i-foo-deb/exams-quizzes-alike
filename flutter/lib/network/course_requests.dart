import 'dart:convert';

import 'package:exams_quizzes_alike/exceptions/course_exception.dart';
import 'package:exams_quizzes_alike/models/teacher.dart';
import 'package:http/http.dart' as http;
import '../models/course.dart';
import '../models/teacher.dart';

class CourseRequests {
  Future<List<Course>> getCoursesByTeacher(Teacher teacher) async {
    final response = await http.post(
        Uri.parse('http://localhost:3000/courses-by-teacher'),
        body: teacher.toJson());

    if (response.statusCode == 204) {
      throw CourseException('The teacher has no courses');
    }

    if (response.statusCode == 200) {
      List<Course> courses = (jsonDecode(response.body) as List)
          .map((data) => Course.fromJson(data))
          .toList();

      return courses;
    }

    throw CourseException('Something went wrong');
  }
}
