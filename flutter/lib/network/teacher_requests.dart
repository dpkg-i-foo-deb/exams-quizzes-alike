import 'dart:convert';
import 'package:exams_quizzes_alike/exceptions/teacher_exception.dart';
import 'package:http/http.dart' as http;
import '../models/teacher.dart';

class TeacherRequests {
  Future<Teacher> isTeacher(Teacher teacher) async {
    final response = await http.post(
        Uri.parse('http://localhost:3000/is-teacher'),
        body: teacher.toJson());

    if (response.statusCode == 204) {
      throw TeacherException('This user is not a teacher');
    }

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      return Teacher.fromJson(data[0]);
    }

    throw TeacherException('Something went wrong');
  }
}
