import 'package:exams_quizzes_alike/widgets/grid_item.dart';
import 'package:flutter/material.dart';

class CourseItem implements GridItem {
  final String courseName;
  final String courseTeacher;
  final int courseCode;

  CourseItem(this.courseCode, this.courseName, this.courseTeacher);

  @override
  Widget buildItem(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(25),
      decoration: const BoxDecoration(color: Colors.teal),
    );
  }
}
