import 'dart:convert';

import 'package:exams_quizzes_alike/exceptions/course_exception.dart';
import 'package:exams_quizzes_alike/models/teacher.dart';
import 'package:exams_quizzes_alike/models/utils/course_utils.dart';
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

  Future<Course> getCourse(int code) async {
    Map<String, dynamic> jsonObject = CourseUtils().getCourseJson(code);

    final response = await http
        .post(Uri.parse('http://localhost:3000/get-course'), body: jsonObject);

    if (response.statusCode == 204) {
      throw CourseException('No such course found');
    }

    if (response.statusCode == 200) {
      List<Course> courses = (jsonDecode(response.body) as List)
          .map((data) => Course.fromJson(data))
          .toList();
      return courses[0];
    }

    throw CourseException('Something went wrong');
  }
}
