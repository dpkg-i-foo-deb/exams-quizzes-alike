import 'dart:math';

import 'package:exams_quizzes_alike/models/available_exam.dart';
import 'package:exams_quizzes_alike/models/course_student.dart';
import 'package:exams_quizzes_alike/models/exam.dart';
import 'package:exams_quizzes_alike/models/question.dart';
import 'package:exams_quizzes_alike/network/question_requests.dart';
import 'package:exams_quizzes_alike/widgets/question_widget.dart';
import 'package:flutter/material.dart';

class StudentSolveExamBody extends StatefulWidget {
  const StudentSolveExamBody({
    Key? key,
    required this.exam,
    required this.availableExam,
    required this.courseStudent,
  }) : super(key: key);

  final Exam exam;
  final AvailableExam availableExam;
  final CourseStudent courseStudent;

  @override
  State<StudentSolveExamBody> createState() => _StudentSolveExamBodyState();
}

class _StudentSolveExamBodyState extends State<StudentSolveExamBody> {
  List<Question> examQuestions = [];
  List<Question> displayQuestions = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(children: [
            FutureBuilder(
                future: buildExam(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const CircularProgressIndicator();
                  }
                  return ListView.builder(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      itemCount: displayQuestions.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return QuestionWidget(
                            question: displayQuestions[index]);
                      });
                }),
          ]),
        ));
  }

  Future<void> buildExam() async {
    //Step 0, clear the questions list in case of a reload

    examQuestions = [];
    displayQuestions = [];
    //Step 1, get the exam questions
    examQuestions = await QuestionRequests()
        .getExamQuestions(widget.exam.code!, widget.exam.teacherEmail);

    //Step 2, shuffle the questions
    examQuestions.shuffle(Random());

    //Step 3, build a subset of questions according to the ammount the teacher
    // wants the student to see
    for (int index = 0;
        index < widget.exam.numbQuestions &&
            examQuestions.length >= widget.exam.numbQuestions;
        index++) {
      displayQuestions.add(examQuestions[index]);
    }
  }
}
