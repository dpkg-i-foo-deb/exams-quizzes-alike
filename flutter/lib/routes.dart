import 'package:exams_quizzes_alike/screens/login/login_page.dart';
import 'package:exams_quizzes_alike/screens/teacher/teacher_page.dart';
import 'package:exams_quizzes_alike/screens/student/student_page.dart';
import 'package:flutter/widgets.dart';

//We use this file to define out app's routes
final Map<String, WidgetBuilder> routes = {
  '/': (context) => const LoginPage(),
  '/teacher': (context) => const TeacherPage(),
};
