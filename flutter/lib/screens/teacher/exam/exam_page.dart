import 'package:exams_quizzes_alike/models/exam.dart';
import 'package:exams_quizzes_alike/screens/teacher/exam/exam_page_body.dart';
import 'package:exams_quizzes_alike/widgets/main_app_bar.dart';
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
    return Scaffold(
      appBar: const MainAppBar(),
      body: ExamPageBody(exam: widget.exam),
    );
  }
}
