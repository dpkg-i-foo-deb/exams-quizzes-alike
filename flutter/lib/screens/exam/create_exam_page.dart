import 'package:exams_quizzes_alike/screens/exam/components/create/create_exam_body.dart';
import 'package:exams_quizzes_alike/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

class CreateExamPage extends StatefulWidget {
  const CreateExamPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateExamPage> createState() => _CreateExamPageState();
}

class _CreateExamPageState extends State<CreateExamPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: MainAppBar(),
        body: SingleChildScrollView(child: CreateExamBody()));
  }
}
