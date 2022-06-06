import 'package:exams_quizzes_alike/models/available_exam.dart';
import 'package:exams_quizzes_alike/models/exam.dart';
import 'package:exams_quizzes_alike/screens/login/login_page.dart';
import 'package:exams_quizzes_alike/screens/student/grade_exam/grade_exam_body.dart';
import 'package:exams_quizzes_alike/widgets/grid_item.dart';
import 'package:flutter/material.dart';

class StudentExamItem implements GridItem {
  final Exam exam;
  final AvailableExam availableExam;

  StudentExamItem(this.exam, this.availableExam);

  @override
  Widget buildItem(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 73, 89, 154),
      child: InkWell(
        splashColor: Colors.white,
        onTap: () => Navigator.push(
            //TODO PRESENT EXAM PAGE
            context,
            MaterialPageRoute(builder: ((context) => LoginPage()))),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            exam.name + "\n\n" + "Due " + availableExam.maxDate,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        )),
      ),
    );
  }
}
