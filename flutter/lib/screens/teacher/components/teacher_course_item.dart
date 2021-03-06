import 'package:exams_quizzes_alike/models/course.dart';
import 'package:exams_quizzes_alike/screens/teacher/course/teacher_course_page.dart';
import 'package:exams_quizzes_alike/widgets/grid_item.dart';
import 'package:flutter/material.dart';

class TeacherCourseItem implements GridItem {
  final Course course;

  TeacherCourseItem(this.course);

  @override
  Widget buildItem(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 73, 89, 154),
      child: InkWell(
        splashColor: Colors.white,
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => TeacherCoursePage(
                      course: course,
                    )))),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            course.courseDescription!,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        )),
      ),
    );
  }
}
