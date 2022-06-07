import 'package:d_chart/d_chart.dart';
import 'package:exams_quizzes_alike/models/reports/exam_report.dart';
import 'package:exams_quizzes_alike/models/reports/student_exam_report.dart';
import 'package:flutter/material.dart';

class GradeExamBody extends StatefulWidget {
  const GradeExamBody({Key? key, required this.studentExamReport})
      : super(key: key);

  final StudentExamReport studentExamReport;

  @override
  State<GradeExamBody> createState() => _SolveExamBody();
}

class _SolveExamBody extends State<GradeExamBody> {
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
              child: Text('Exam Report - ' + widget.studentExamReport.name,
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
          padding: const EdgeInsets.all(20),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: DChartBar(
              data: [
                {
                  'id': 'Bar',
                  'data': [
                    {
                      'domain': 'Correct Answers',
                      'measure':
                          int.parse(widget.studentExamReport.correctAnswers)
                    },
                    {
                      'domain': 'Incorrect Answers',
                      'measure':
                          int.parse(widget.studentExamReport.incorrectAnswers)
                    },
                  ],
                },
              ],
              domainLabelPaddingToAxisLine: 16,
              axisLineTick: 2,
              axisLinePointTick: 2,
              axisLinePointWidth: 10,
              axisLineColor: Colors.black,
              measureLabelPaddingToAxisLine: 16,
              barColor: (barData, index, id) {
                switch (barData['domain']) {
                  case 'Correct Answers':
                    return Colors.green;

                  case 'Incorrect Answers':
                    return Colors.red;

                  default:
                    return Colors.orange;
                }
              },
              showBarValue: true,
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
                  'Answered Questions: ' +
                      widget.studentExamReport.answeredQuestions,
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
                  'Correct Answers Percentage: ' +
                      widget.studentExamReport.correctAnswersPercentage,
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
