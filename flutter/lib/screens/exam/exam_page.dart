import 'package:exams_quizzes_alike/models/course.dart';
import 'package:exams_quizzes_alike/screens/exam/components/exam_body.dart';
import 'package:exams_quizzes_alike/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

class ExamPage extends StatefulWidget {
  const ExamPage({
    Key? key,
    required this.course,
  }) : super(key: key);

  final Course course;

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MainAppBar(),
        body: SingleChildScrollView(
            child: ExamBody(
          course: widget.course,
        )));
  }
}
