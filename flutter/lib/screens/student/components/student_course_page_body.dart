import 'package:exams_quizzes_alike/models/course.dart';
import 'package:flutter/material.dart';

class StudentCoursePageBody extends StatefulWidget {
  const StudentCoursePageBody({Key? key, required this.course})
      : super(key: key);

  final Course course;

  @override
  State<StudentCoursePageBody> createState() => _StudentCoursePageBodyState();
}

class _StudentCoursePageBodyState extends State<StudentCoursePageBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Container(
            constraints:
                const BoxConstraints(maxHeight: 200, maxWidth: double.infinity),
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
            constraints:
                const BoxConstraints(maxHeight: 60, maxWidth: double.infinity),
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
        ]));
  }
}
