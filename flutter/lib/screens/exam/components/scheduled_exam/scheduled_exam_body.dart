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
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            constraints:
                const BoxConstraints(maxHeight: 200, maxWidth: double.infinity),
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
          padding: const EdgeInsets.all(16),
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
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
          child: Container(
            constraints:
                const BoxConstraints(maxHeight: 50, maxWidth: double.infinity),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 237, 231, 246),
                borderRadius: BorderRadius.circular(20)),
            child: Align(
              child: Text(
                  'Answered Questions: ' + widget.examReport.answeredQuestions,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  )),
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
          child: Container(
            constraints:
                const BoxConstraints(maxHeight: 50, maxWidth: double.infinity),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 237, 231, 246),
                borderRadius: BorderRadius.circular(20)),
            child: Align(
              child: Text('Max Scored Grade: ' + widget.examReport.maxGrade,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  )),
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
          child: Container(
            constraints:
                const BoxConstraints(maxHeight: 50, maxWidth: double.infinity),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 237, 231, 246),
                borderRadius: BorderRadius.circular(20)),
            child: Align(
              child: Text('Min Scored Grade: ' + widget.examReport.minGrade,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  )),
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
          child: Container(
            constraints:
                const BoxConstraints(maxHeight: 50, maxWidth: double.infinity),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 237, 231, 246),
                borderRadius: BorderRadius.circular(20)),
            child: Align(
              child: Text(
                  'Grade Average: ' +
                      double.parse(widget.examReport.gradeAverage).toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
