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
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Container(
                  constraints: const BoxConstraints(
                      maxHeight: 250, maxWidth: double.infinity),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 237, 231, 246),
                      borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Expanded(
                    child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [Text(widget.courseName)]),
                  )),
            )
          ]),
        ));
  }
}
