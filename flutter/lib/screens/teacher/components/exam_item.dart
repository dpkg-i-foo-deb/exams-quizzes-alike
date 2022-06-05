import 'package:exams_quizzes_alike/models/exam.dart';
import 'package:exams_quizzes_alike/screens/exam/exam_page.dart';
import 'package:exams_quizzes_alike/widgets/grid_item.dart';
import 'package:flutter/material.dart';

class ExamItem implements GridItem {
  final Exam exam;

  ExamItem(this.exam);

  @override
  Widget buildItem(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 73, 89, 154),
      child: InkWell(
        splashColor: Colors.white,
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => ExamPage(
                      exam: exam,
                    )))),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            exam.name,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        )),
      ),
    );
  }
}
