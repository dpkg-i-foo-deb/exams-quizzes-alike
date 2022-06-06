import 'package:exams_quizzes_alike/models/available_exam.dart';
import 'package:exams_quizzes_alike/models/course_student.dart';
import 'package:exams_quizzes_alike/models/exam.dart';
import 'package:exams_quizzes_alike/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:exams_quizzes_alike/screens/student/exam/student_solve_exam_body.dart';

class StudentSolveExamPage extends StatefulWidget {
  const StudentSolveExamPage({
    Key? key,
    required this.exam,
    required this.availableExam,
    required this.courseStudent,
  }) : super(key: key);

  final Exam exam;
  final AvailableExam availableExam;
  final CourseStudent courseStudent;

  @override
  State<StudentSolveExamPage> createState() => _StudentSolveExamPageState();
}

class _StudentSolveExamPageState extends State<StudentSolveExamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: SingleChildScrollView(
          child: Container(
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width),
        child: StudentSolveExamBody(
          exam: widget.exam,
          availableExam: widget.availableExam,
          courseStudent: widget.courseStudent,
        ),
      )),
    );
  }
}
