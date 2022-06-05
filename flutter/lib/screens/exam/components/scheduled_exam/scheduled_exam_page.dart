import 'package:d_chart/d_chart.dart';
import 'package:exams_quizzes_alike/models/reports/exam_report.dart';
import 'package:exams_quizzes_alike/screens/exam/components/scheduled_exam/scheduled_exam_body.dart';
import 'package:exams_quizzes_alike/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

class ScheduledExamPage extends StatefulWidget {
  const ScheduledExamPage({Key? key, required this.examReport})
      : super(key: key);

  final ExamReport examReport;

  @override
  State<ScheduledExamPage> createState() => _ScheduledExamPageState();
}

class _ScheduledExamPageState extends State<ScheduledExamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MainAppBar(),
        body: SingleChildScrollView(
          child: ScheduledExamBody(
            examReport: widget.examReport,
          ),
        ));
  }
}
