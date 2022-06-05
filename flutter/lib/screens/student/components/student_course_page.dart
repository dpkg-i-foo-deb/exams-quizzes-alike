import 'package:exams_quizzes_alike/models/course.dart';
import 'package:flutter/material.dart';

class StudentCoursePage extends StatefulWidget {
  const StudentCoursePage({Key? key, required this.course}) : super(key: key);

  final Course course;

  @override
  State<StudentCoursePage> createState() => _StudentCoursePageState();
}

class _StudentCoursePageState extends State<StudentCoursePage> {
  @override
  Widget build(BuildContext context) {
    return Text('oli');
  }
}
