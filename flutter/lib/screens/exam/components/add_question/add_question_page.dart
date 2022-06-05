import 'package:exams_quizzes_alike/models/exam.dart';
import 'package:exams_quizzes_alike/screens/exam/components/add_question/add_question_body.dart';
import 'package:exams_quizzes_alike/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

class AddQuestionPage extends StatefulWidget {
  const AddQuestionPage({Key? key, required this.exam}) : super(key: key);

  final Exam exam;

  @override
  State<AddQuestionPage> createState() => _AddQuestionPageState();
}

class _AddQuestionPageState extends State<AddQuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MainAppBar(),
        body: SingleChildScrollView(
          child: AddQuestionBody(
            exam: widget.exam,
          ),
        ));
  }
}
