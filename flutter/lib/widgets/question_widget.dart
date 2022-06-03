import 'package:exams_quizzes_alike/models/option.dart';
import 'package:exams_quizzes_alike/models/question.dart';
import 'package:exams_quizzes_alike/network/option_requests.dart';
import 'package:exams_quizzes_alike/widgets/option_widget.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({Key? key, required this.question}) : super(key: key);

  final Question question;

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  List<Option> options = List.empty();
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Column(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(widget.question.literal,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          FutureBuilder(
              future: getOptions(),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const CircularProgressIndicator();
                }
                return ListView.builder(
                    itemCount: options.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return OptionWidget(
                          option: options[index], type: widget.question.type);
                    });
              })
        ],
      ),
    );
  }

  Future<void> getOptions() async {
    options =
        await OptionRequests().getOptions(int.parse(widget.question.code));
  }
}
