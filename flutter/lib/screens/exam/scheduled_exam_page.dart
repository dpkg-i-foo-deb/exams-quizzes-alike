import 'package:d_chart/d_chart.dart';
import 'package:exams_quizzes_alike/models/exam_report.dart';
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
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                constraints: const BoxConstraints(
                    maxHeight: 200, maxWidth: double.infinity),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 237, 231, 246),
                    borderRadius: BorderRadius.circular(20)),
                child: Align(
                  child: Text('Exam Report - ' + widget.examReport.examName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'ZenLoop',
                        fontSize: 70,
                        color: Colors.black,
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartPie(
                  data: [
                    {
                      'domain': 'Correct Answers',
                      'measure': int.parse(widget.examReport.correctAnswers)
                    },
                    {
                      'domain': 'Incorrect Answers',
                      'measure': int.parse(widget.examReport.incorrectAnswers)
                    },
                  ],
                  fillColor: (pieData, index) {
                    switch (pieData['domain']) {
                      case 'Correct Answers':
                        return Colors.green;
                      case 'Incorrect Answers':
                        return Colors.red;
                      default:
                        return Colors.orange;
                    }
                  },
                  pieLabel: (pieData, index) {
                    return "${pieData['domain']}:\n${pieData['measure']}";
                  },
                  labelPosition: PieLabelPosition.auto,
                ),
              ),
            ),
          ],
        ));
  }
}
