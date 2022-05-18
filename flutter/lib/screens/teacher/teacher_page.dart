import 'package:exams_quizzes_alike/screens/teacher/components/course_item.dart';
import 'package:flutter/material.dart';

import '../../models/teacher.dart';

class TeacherPage extends StatefulWidget {
  const TeacherPage({Key? key, required this.teacher}) : super(key: key);
  final Teacher teacher;

  @override
  State<TeacherPage> createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(25),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromARGB(255, 191, 238, 183),
                Color.fromARGB(255, 215, 244, 210),
              ])),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return CourseItem(
                      int.parse('$index'), 'Curso $index', 'Profe $index')
                  .buildItem(context);
            },
          )),
    ));
  }
}
