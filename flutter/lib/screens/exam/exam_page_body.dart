import 'package:exams_quizzes_alike/models/exam.dart';
import 'package:exams_quizzes_alike/models/question.dart';
import 'package:exams_quizzes_alike/network/question_requests.dart';
import 'package:exams_quizzes_alike/widgets/question_widget.dart';
import 'package:flutter/material.dart';

class ExamPageBody extends StatefulWidget {
  const ExamPageBody({Key? key, required this.exam}) : super(key: key);

  final Exam exam;

  @override
  State<ExamPageBody> createState() => _ExamBodyState();
}

class _ExamBodyState extends State<ExamPageBody> {
  List<Question> questions = List.empty();
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
                  height: 25,
                ),
                Container(
                  constraints: const BoxConstraints(
                      maxHeight: 100, maxWidth: double.infinity),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 237, 231, 246),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Align(
                    child: Text('Questions Added to This Exam',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'ZenLoop',
                          fontSize: 40,
                          color: Colors.black,
                        )),
                  ),
                ),
                FutureBuilder(
                    future: getQuestions(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return const CircularProgressIndicator();
                      }
                      return ListView.builder(
                          itemCount: questions.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return QuestionWidget(question: questions[index]);
                          });
                    })
              ],
            )));
  }

  Future<void> getQuestions() async {
    questions = await QuestionRequests()
        .getExamQuestions(widget.exam.code!, widget.exam.teacherEmail);
  }
}
