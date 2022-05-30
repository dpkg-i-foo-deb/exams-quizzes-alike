import 'package:exams_quizzes_alike/screens/course/course_page.dart';
import 'package:exams_quizzes_alike/widgets/grid_item.dart';
import 'package:flutter/material.dart';

class CourseItem implements GridItem {
  final String courseName;
  final String courseTeacher;
  final int courseCode;

  CourseItem(this.courseCode, this.courseName, this.courseTeacher);

  @override
  Widget buildItem(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 73, 89, 154),
      child: InkWell(
        splashColor: Colors.white,
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => CoursePage(
                      courseName: courseName,
                      courseCode: courseCode,
                      courseTeacher: courseTeacher,
                    )))),
        child: Center(
            child: Text(
          courseName,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
        )),
      ),
    );
  }
}
