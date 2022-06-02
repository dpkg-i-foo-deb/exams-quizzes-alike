import 'package:exams_quizzes_alike/models/course.dart';
import 'package:flutter/material.dart';

class ScheduleExamBody extends StatefulWidget {
  const ScheduleExamBody({Key? key, required this.course}) : super(key: key);

  final Course course;

  @override
  State<ScheduleExamBody> createState() => _ScheduleExamBodyState();
}

class _ScheduleExamBodyState extends State<ScheduleExamBody> {
  @override
  Widget build(BuildContext context) {
    return Text('oli');
  }
}
