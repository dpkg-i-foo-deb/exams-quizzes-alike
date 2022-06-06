import 'package:exams_quizzes_alike/models/available_exam.dart';
import 'package:exams_quizzes_alike/models/course.dart';
import 'package:exams_quizzes_alike/models/exam.dart';
import 'package:exams_quizzes_alike/network/available_exam_requests.dart';
import 'package:exams_quizzes_alike/network/exam_requests.dart';
import 'package:exams_quizzes_alike/screens/student/components/student_exam_item.dart';
import 'package:exams_quizzes_alike/screens/teacher/components/teacher_exam_item.dart';
import 'package:flutter/material.dart';

class StudentCoursePageBody extends StatefulWidget {
  const StudentCoursePageBody({Key? key, required this.course})
      : super(key: key);

  final Course course;

  @override
  State<StudentCoursePageBody> createState() => _StudentCoursePageBodyState();
}

class _StudentCoursePageBodyState extends State<StudentCoursePageBody> {
  List<AvailableExam> availableExams = [];
  List<Exam> exams = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: Column(children: [
            Container(
              constraints: const BoxConstraints(
                  maxHeight: 200, maxWidth: double.infinity),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 237, 231, 246),
                  borderRadius: BorderRadius.circular(20)),
              child: Align(
                child: Text(widget.course.courseDescription!,
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
            ),
            Container(
              constraints: const BoxConstraints(
                  maxHeight: 60, maxWidth: double.infinity),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 237, 231, 246),
                  borderRadius: BorderRadius.circular(20)),
              child: const Align(
                child: Text('Available Exams',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const CircularProgressIndicator();
                  }
                  return Flexible(
                      flex: 2,
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio:
                              MediaQuery.of(context).size.height / 800,
                          crossAxisSpacing: 15,
                        ),
                        itemCount: exams.length,
                        padding: const EdgeInsets.all(1),
                        itemBuilder: (BuildContext context, int index) {
                          return StudentExamItem(
                                  exams[index], availableExams[index])
                              .buildItem(context);
                        },
                      ));
                })
          ])),
    );
  }

  Future<void> getData() async {
    await getAvailableExams();
    await getExams();
  }

  Future<void> getAvailableExams() async {
    availableExams = [];
    availableExams = await AvailableExamRequests()
        .getAvailableExams(widget.course.courseCode!);
  }

  Future<void> getExams() async {
    exams = [];
    for (var value in availableExams) {
      exams.add(await ExamRequests().getExam(int.parse(value.examCode)));
    }
  }
}
