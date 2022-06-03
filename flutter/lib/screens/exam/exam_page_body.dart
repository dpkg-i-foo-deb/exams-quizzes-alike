import 'package:exams_quizzes_alike/models/exam.dart';
import 'package:flutter/material.dart';

class ExamPageBody extends StatefulWidget {
  const ExamPageBody({Key? key, required this.exam}) : super(key: key);

  final Exam exam;

  @override
  State<ExamPageBody> createState() => _ExamBodyState();
}

class _ExamBodyState extends State<ExamPageBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  constraints: const BoxConstraints(
                      maxHeight: 200, maxWidth: double.infinity),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 237, 231, 246),
                      borderRadius: BorderRadius.circular(20)),
                  child: Align(
                    child: Text(widget.exam.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'ZenLoop',
                          fontSize: 70,
                          color: Colors.black,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            )));
  }
}
