import 'package:exams_quizzes_alike/models/student.dart';
import 'package:flutter/material.dart';

class StudentPageBody extends StatefulWidget {
  const StudentPageBody({Key? key, required this.student}) : super(key: key);

  final Student student;

  @override
  State<StudentPageBody> createState() => _StudentPageBodyState();
}

class _StudentPageBodyState extends State<StudentPageBody> {
  @override
  Widget build(BuildContext context) {
    return Text('oli');
  }
}
