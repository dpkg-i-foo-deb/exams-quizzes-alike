import 'dart:convert';
import 'package:exams_quizzes_alike/exceptions/login_excepcion.dart';
import 'package:http/http.dart' as http;
import '../models/teacher.dart';

class TeacherRequests {
  Future<Teacher> isTeacher(Teacher teacher) async {
    final response = await http.post(
        Uri.parse('http://localhost:3000/is-teacher'),
        body: teacher.toJson());
  }
}
