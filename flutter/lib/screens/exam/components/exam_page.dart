import 'package:exams_quizzes_alike/models/exam.dart';
import 'package:flutter/material.dart';

class ExamPage extends StatefulWidget {
  const ExamPage({Key? key, required this.exam}) : super(key: key);

  final Exam exam;

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
