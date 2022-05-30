import 'package:exams_quizzes_alike/exceptions/course_exception.dart';
import 'package:exams_quizzes_alike/models/course.dart';
import 'package:exams_quizzes_alike/network/course_requests.dart';
import 'package:exams_quizzes_alike/screens/teacher/components/course_item.dart';
import 'package:exams_quizzes_alike/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

import '../../models/teacher.dart';

class TeacherPage extends StatefulWidget {
  const TeacherPage({Key? key, required this.teacher}) : super(key: key);
  final Teacher teacher;

  @override
  State<TeacherPage> createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  List<Course> courses = List.empty();

  @override
  void initState() {
    super.initState();

    getCoursesFuture();
  }

  getCoursesFuture() async {
    courses = await getCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MainAppBar(),
        body: SingleChildScrollView(
          child: FutureBuilder(
              future: getCourses(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(25),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 170, 182, 254)),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 7 / 6,
                        crossAxisSpacing: 20,
                      ),
                      itemCount: courses.length,
                      padding: const EdgeInsets.all(1),
                      itemBuilder: (BuildContext context, int index) {
                        return CourseItem(courses[index]).buildItem(context);
                      },
                    ));
              }),
        ));
  }

  Future<List<Course>> getCourses() async {
    try {
      return CourseRequests().getCoursesByTeacher(widget.teacher);
    } on CourseException {
      //TODO do something if the teacher has no courses
      rethrow;
    }
  }
}
