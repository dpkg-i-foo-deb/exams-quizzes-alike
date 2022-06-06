import 'package:exams_quizzes_alike/models/course.dart';
import 'package:exams_quizzes_alike/screens/student/course/student_course_page_body.dart';
import 'package:exams_quizzes_alike/widgets/main_app_bar.dart';
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
    return Scaffold(
        appBar: const MainAppBar(),
        body: SingleChildScrollView(
          child: StudentCoursePageBody(course: widget.course),
        ));
  }
}
