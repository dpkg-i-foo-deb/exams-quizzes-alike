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
  List<GlobalKey<QuestionWidgetState>> questionWidgetStates = [];

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
                        GlobalKey<QuestionWidgetState> key = GlobalKey();
                        questionWidgetStates.add(key);
                        return QuestionWidget(
                            key: key, question: displayQuestions[index]);
                      });
                }),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 178, 59, 59),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () async {
                  await gradeExam();
                },
                child: const Text('Submit'))
          ]),
        ));
  }

  Future<void> buildExam() async {
    //Step 0, clear the questions list in case of a reload

    examQuestions = [];
    displayQuestions = [];
    questionWidgetStates.clear();
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

  Future<void> gradeExam() async {
    bool isCorrect = false;

    //Step 0 get the max  and min grade according to the exam
    double maxGrade = widget.exam.maxGrade.toDouble();
    double grade = widget.exam.minGrade.toDouble();

    //Step 1, cycle through every displayed question state
    for (var value in questionWidgetStates) {
      //Set 2, grade this question according to its type
      switch (value.currentState?.widget.question.type ?? '') {
        case 'unica-respuesta':
          isCorrect = value.currentState?.solve() ?? false;
          break;
        case 'multiple-respuesta':
          isCorrect = value.currentState?.solve() ?? false;
          break;

        case 'completar':
          isCorrect = value.currentState?.solve() ?? false;
          break;

        case 'emparejar':
          isCorrect = value.currentState?.solve() ?? false;
          break;

        case 'falso-verdadero':
          isCorrect = value.currentState?.solve() ?? false;
          break;

        case 'ordenar':
          isCorrect = value.currentState?.solve() ?? false;

          break;

        default:
          isCorrect = false;
      }
      if (isCorrect) {
        grade +=
            double.parse(value.currentState?.widget.question.weight ?? '0');
      }
    }
  }
}
