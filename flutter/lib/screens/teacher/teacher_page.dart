import 'package:exams_quizzes_alike/exceptions/course_exception.dart';
import 'package:exams_quizzes_alike/exceptions/exam_exception.dart';
import 'package:exams_quizzes_alike/models/course.dart';
import 'package:exams_quizzes_alike/network/course_requests.dart';
import 'package:exams_quizzes_alike/network/exam_requests.dart';
import 'package:exams_quizzes_alike/screens/exam/create_exam_page.dart';
import 'package:exams_quizzes_alike/screens/teacher/components/course_item.dart';
import 'package:exams_quizzes_alike/screens/teacher/components/exam_item.dart';
import 'package:exams_quizzes_alike/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

import '../../models/exam.dart';
import '../../models/teacher.dart';

class TeacherPage extends StatefulWidget {
  const TeacherPage({Key? key, required this.teacher}) : super(key: key);
  final Teacher teacher;

  @override
  State<TeacherPage> createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  List<Course> courses = List.empty();
  List<Exam> exams = List.empty();

  @override
  void initState() {
    super.initState();

    getCoursesFuture();
    getExamsFuture();
  }

  getCoursesFuture() async {
    courses = await getCourses();
  }

  getExamsFuture() async {
    exams = await getExams();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: getCourses(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(25),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 170, 182, 254)),
                      child: Column(
                        children: [
                          Container(
                            constraints: const BoxConstraints(
                                maxHeight: 180, maxWidth: double.infinity),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 237, 231, 246),
                                borderRadius: BorderRadius.circular(20)),
                            child: Align(
                                child: Column(
                              children: const [
                                SizedBox(
                                  height: 20,
                                ),
                                Text('Available Courses',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontFamily: 'ZenLoop',
                                      fontSize: 70,
                                      color: Colors.black,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Please select one of them',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontFamily: 'ZenLoop',
                                      fontSize: 50,
                                      color: Colors.grey,
                                    )),
                              ],
                            )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Flexible(
                              flex: 1,
                              child: GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio:
                                      MediaQuery.of(context).size.height / 800,
                                  crossAxisSpacing: 15,
                                ),
                                itemCount: courses.length,
                                padding: const EdgeInsets.all(1),
                                itemBuilder: (BuildContext context, int index) {
                                  return CourseItem(courses[index])
                                      .buildItem(context);
                                },
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            constraints: const BoxConstraints(
                                maxHeight: 230, maxWidth: double.infinity),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 237, 231, 246),
                                borderRadius: BorderRadius.circular(20)),
                            child: Align(
                                child: Column(
                              children: const [
                                SizedBox(
                                  height: 20,
                                ),
                                Text('Available Exams',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontFamily: 'ZenLoop',
                                      fontSize: 70,
                                      color: Colors.black,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    'Please select one of them or create a new one',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'ZenLoop',
                                      fontSize: 50,
                                      color: Colors.grey,
                                    )),
                              ],
                            )),
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
                                        primary: const Color.fromARGB(
                                            255, 73, 89, 154)),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CreateExamPage(
                                              teacher: widget.teacher),
                                        )),
                                  ),
                                  const Text(
                                    'Create New Exam',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Flexible(
                              flex: 2,
                              child: GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio:
                                      MediaQuery.of(context).size.height / 800,
                                  crossAxisSpacing: 15,
                                ),
                                itemCount: exams.length,
                                padding: const EdgeInsets.all(1),
                                itemBuilder: (BuildContext context, int index) {
                                  return ExamItem(exams[index])
                                      .buildItem(context);
                                },
                              )),
                        ],
                      ));
                }),
          ],
        ),
      ),
    );
  }

  Future<List<Course>> getCourses() async {
    try {
      return CourseRequests().getCoursesByTeacher(widget.teacher);
    } on CourseException {
      //TODO do something if the teacher has no courses
      rethrow;
    }
  }

  Future<List<Exam>> getExams() async {
    try {
      return ExamRequests().getExams(widget.teacher.login);
    } on ExamException {
      //TODO something if the teacher has no exams
      rethrow;
    }
  }
}
