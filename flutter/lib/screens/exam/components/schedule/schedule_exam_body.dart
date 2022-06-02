import 'package:exams_quizzes_alike/models/course.dart';
import 'package:exams_quizzes_alike/screens/exam/components/schedule/schedule_exam_form.dart';
import 'package:flutter/material.dart';

class ScheduleExamBody extends StatefulWidget {
  const ScheduleExamBody({Key? key, required this.course}) : super(key: key);

  final Course course;

  @override
  State<ScheduleExamBody> createState() => _ScheduleExamBodyState();
}

class _ScheduleExamBodyState extends State<ScheduleExamBody> {
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
          const Text(
            'Creating a New Exam',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Please Fill in the Form',
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
          SizedBox(
            height: 20,
          ),
          ScheduleExamForm(course: widget.course),
        ]));
  }
}
