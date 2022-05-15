import 'package:exams_quizzes_alike/screens/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:exams_quizzes_alike/routes.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.green),
    debugShowCheckedModeBanner: false,
    home: const LoginPage(),
  ));
}
