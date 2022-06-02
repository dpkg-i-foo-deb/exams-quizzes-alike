import 'package:exams_quizzes_alike/models/teacher.dart';
import 'package:exams_quizzes_alike/screens/exam/components/create/create_exam_body.dart';
import 'package:exams_quizzes_alike/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

class CreateExamPage extends StatefulWidget {
  const CreateExamPage({Key? key, required this.teacher}) : super(key: key);

  final Teacher teacher;

  @override
  State<CreateExamPage> createState() => _CreateExamPageState();
}

class _CreateExamPageState extends State<CreateExamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MainAppBar(),
        body: SingleChildScrollView(
            child: CreateExamBody(
          teacher: widget.teacher,
        )));
  }
}
