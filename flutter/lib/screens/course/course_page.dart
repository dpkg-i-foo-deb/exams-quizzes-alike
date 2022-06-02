import 'package:exams_quizzes_alike/models/course.dart';
import 'package:exams_quizzes_alike/screens/exam/components/schedule/schedule_exam_page.dart';
import 'package:exams_quizzes_alike/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key, required this.course}) : super(key: key);

  final Course course;

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MainAppBar(),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20),
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
            Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            maximumSize: const Size(225, 700),
                            shape: const CircleBorder(),
                            primary: const Color.fromARGB(255, 73, 89, 154)),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 40,
                        ),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ScheduleExamPage(course: widget.course),
                            ))),
                    const Text(
                      'Schedule an Exam for This Course',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
              constraints: const BoxConstraints(
                  maxHeight: 200, maxWidth: double.infinity),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 237, 231, 246),
                  borderRadius: BorderRadius.circular(20)),
              child: Align(
                  child: Column(
                children: const [
                  SizedBox(
                    height: 20,
                  ),
                  Text('Coming soon...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'ZenLoop',
                        fontSize: 70,
                        color: Colors.black,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Cannot see anything? Schedule a new one!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'ZenLoop',
                        fontSize: 40,
                        color: Colors.grey,
                      )),
                ],
              )),
            ),
          ]),
        )));
  }
}
