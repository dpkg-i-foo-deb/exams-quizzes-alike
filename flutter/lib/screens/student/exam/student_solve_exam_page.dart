import 'package:exams_quizzes_alike/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

class StudentSolveExamPage extends StatefulWidget {
  const StudentSolveExamPage({
    Key? key,
  }) : super(key: key);

  @override
  State<StudentSolveExamPage> createState() => _StudentSolveExamPageState();
}

class _StudentSolveExamPageState extends State<StudentSolveExamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
    );
  }
}
