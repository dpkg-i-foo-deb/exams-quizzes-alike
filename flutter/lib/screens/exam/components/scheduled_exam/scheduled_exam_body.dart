import 'package:d_chart/d_chart.dart';
import 'package:exams_quizzes_alike/models/exam_report.dart';
import 'package:flutter/material.dart';

class ScheduledExamBody extends StatefulWidget {
  const ScheduledExamBody({Key? key, required this.examReport})
      : super(key: key);

  final ExamReport examReport;

  @override
  State<ScheduledExamBody> createState() => _ScheduledExamBody();
}

class _ScheduledExamBody extends State<ScheduledExamBody> {
  @override
  Widget build(BuildContext context) {
    return DChartPie(
      data: [
        {'domain': 'Flutter', 'measure': 28},
        {'domain': 'React Native', 'measure': 27},
        {'domain': 'Ionic', 'measure': 20},
        {'domain': 'Cordova', 'measure': 15},
      ],
      fillColor: (pieData, index) => Colors.purple,
    );
  }
}
