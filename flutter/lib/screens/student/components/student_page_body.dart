import 'package:exams_quizzes_alike/models/course.dart';
import 'package:exams_quizzes_alike/models/course_student.dart';
import 'package:exams_quizzes_alike/models/student.dart';
import 'package:exams_quizzes_alike/network/course_requests.dart';
import 'package:exams_quizzes_alike/network/course_student_requests.dart';
import 'package:exams_quizzes_alike/screens/teacher/components/course_item.dart';
import 'package:flutter/material.dart';

class StudentPageBody extends StatefulWidget {
  const StudentPageBody({Key? key, required this.student}) : super(key: key);

  final Student student;

  @override
  State<StudentPageBody> createState() => _StudentPageBodyState();
}

class _StudentPageBodyState extends State<StudentPageBody> {
  List<Course> courses = [];
  List<CourseStudent> coursesStudent = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              maxWidth: MediaQuery.of(context).size.width),
          child: Column(children: [
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
            FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const CircularProgressIndicator();
                  }
                  return Flexible(
                      flex: 1,
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio:
                              MediaQuery.of(context).size.height / 800,
                          crossAxisSpacing: 15,
                        ),
                        itemCount: courses.length,
                        padding: const EdgeInsets.all(1),
                        itemBuilder: (BuildContext context, int index) {
                          return CourseItem(courses[index]).buildItem(context);
                        },
                      ));
                })
          ]),
        ));
  }

  Future<void> getData() async {
    await getCoursesByStudent();
    await getCourses();
  }

  Future<void> getCoursesByStudent() async {
    coursesStudent =
        await CourseStudentRequests().getCoursesByStudent(widget.student.login);
  }

  Future<void> getCourses() async {
    for (var value in coursesStudent) {
      courses
          .add(await CourseRequests().getCourse(int.parse(value.courseCode)));
    }
  }
}
