import 'package:exams_quizzes_alike/widgets/login_page.dart';
import 'package:exams_quizzes_alike/widgets/teacher_page.dart';
import 'package:exams_quizzes_alike/widgets/student_page.dart';
import 'package:flutter/widgets.dart';

//We use this file to define out app's routes
final Map<String, WidgetBuilder> routes = {
  '/': (context) => const LoginPage(),
};
