import 'package:exams_quizzes_alike/screens/login/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.deepPurple),
    debugShowCheckedModeBanner: true,
    home: const LoginPage(),
  ));
}
