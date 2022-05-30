import 'package:exams_quizzes_alike/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

class CoursePage extends StatefulWidget {
  const CoursePage(
      {Key? key,
      required this.courseName,
      required this.courseTeacher,
      required this.courseCode})
      : super(key: key);

  final String courseName;
  final String courseTeacher;
  final int courseCode;

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
                  maxHeight: 100, maxWidth: double.infinity),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 237, 231, 246),
                  borderRadius: BorderRadius.circular(20)),
              child: Align(
                child: Text(widget.courseName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'ZenLoop',
                      fontSize: 70,
                      color: Colors.black,
                    )),
              )),
        ]),
      )),
    );
  }
}
