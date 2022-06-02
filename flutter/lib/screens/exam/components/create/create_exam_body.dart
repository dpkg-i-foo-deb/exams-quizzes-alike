import 'package:exams_quizzes_alike/models/course.dart';
import 'package:exams_quizzes_alike/models/teacher.dart';
import 'package:exams_quizzes_alike/screens/exam/components/create/exam_form.dart';
import 'package:flutter/material.dart';

class CreateExamBody extends StatefulWidget {
  const CreateExamBody({Key? key, required this.teacher}) : super(key: key);

  final Teacher teacher;

  @override
  State<CreateExamBody> createState() => _CreateExamBodyState();
}

class _CreateExamBodyState extends State<CreateExamBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            constraints: const BoxConstraints(
                maxHeight: double.infinity, maxWidth: double.infinity),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Creating a New Exam',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Please Fill in the Form',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),
                ExamForm(
                  teacher: widget.teacher,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
