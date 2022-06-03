import 'package:exams_quizzes_alike/exceptions/exam_exception.dart';
import 'package:exams_quizzes_alike/models/exam.dart';
import 'package:exams_quizzes_alike/models/scheduled_exam.dart';
import 'package:exams_quizzes_alike/network/exam_requests.dart';
import 'package:exams_quizzes_alike/widgets/grid_item.dart';
import 'package:flutter/material.dart';

class ScheduledExamItem implements GridItem {
  final ScheduledExam scheduledExam;
  Exam? exam;
  ScheduledExamItem(this.scheduledExam);

  @override
  Widget buildItem(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 73, 89, 154),
      child: InkWell(
        splashColor: Colors.white,
        //TODO enable this action
        onTap: null,
        child: Center(
            child: Padding(
                padding: const EdgeInsets.all(5),
                child: FutureBuilder(
                  future: getExam(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return const CircularProgressIndicator();
                    }
                    return Text(
                      exam!.name + "\n\n" + scheduledExam.date,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    );
                  },
                ))),
      ),
    );
  }

  Future<void> getExam() async {
    try {
      exam = await ExamRequests().getExam(int.parse(scheduledExam.examCode));
    } on ExamException {
      //TODO something when we cannot get the exam
      rethrow;
    }
  }
}
