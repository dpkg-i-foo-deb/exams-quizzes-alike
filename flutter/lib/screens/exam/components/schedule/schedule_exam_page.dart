import 'package:exams_quizzes_alike/models/course.dart';
import 'package:exams_quizzes_alike/screens/exam/components/schedule/schedule_exam_body.dart';
import 'package:exams_quizzes_alike/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

class ScheduleExamPage extends StatefulWidget {
  const ScheduleExamPage({Key? key, required this.course}) : super(key: key);

  final Course course;

  @override
  State<ScheduleExamPage> createState() => _ScheduleExamState();
}

class _ScheduleExamState extends State<ScheduleExamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: SingleChildScrollView(
        child: ScheduleExamBody(course: widget.course),
      ),
    );
  }
}
