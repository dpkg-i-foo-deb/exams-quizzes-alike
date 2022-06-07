import 'package:exams_quizzes_alike/models/student.dart';
import 'package:exams_quizzes_alike/screens/student/student_page_body.dart';
import 'package:exams_quizzes_alike/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({Key? key, required this.student}) : super(key: key);

  final Student student;

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: SingleChildScrollView(
          child: StudentPageBody(student: widget.student)),
    );
  }
}
