import 'package:exams_quizzes_alike/models/available_exam.dart';
import 'package:exams_quizzes_alike/models/course_student.dart';
import 'package:exams_quizzes_alike/models/exam.dart';
import 'package:exams_quizzes_alike/screens/student/exam/student_solve_exam_page.dart';
import 'package:exams_quizzes_alike/widgets/grid_item.dart';
import 'package:flutter/material.dart';

class StudentExamItem implements GridItem {
  final Exam exam;
  final AvailableExam availableExam;
  final CourseStudent courseStudent;

  StudentExamItem(this.exam, this.availableExam, this.courseStudent);

  @override
  Widget buildItem(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 73, 89, 154),
      child: InkWell(
        splashColor: Colors.white,
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Are you sure?'),
                  content: const Text('Once you start, you cannot go back!'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => StudentSolveExamPage(
                                        exam: exam,
                                        availableExam: availableExam,
                                        courseStudent: courseStudent,
                                      )))).then(
                              (value) => {Navigator.pop(context)});
                        },
                        child: const Text('Start!')),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('No! Go back!'))
                  ],
                );
              });
        },
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            exam.name + "\n\n" + "Due " + availableExam.maxDate,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        )),
      ),
    );
  }
}
