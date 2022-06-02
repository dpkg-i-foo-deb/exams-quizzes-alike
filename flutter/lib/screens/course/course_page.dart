import 'package:exams_quizzes_alike/models/course.dart';
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
                              builder: (context) => null!,
                            ))),
                    const Text(
                      'Schedule an Exam for This Course',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
          ]),
        )));
  }
}
