import 'package:exams_quizzes_alike/models/option.dart';
import 'package:exams_quizzes_alike/models/question.dart';
import 'package:exams_quizzes_alike/models/solved_option.dart';
import 'package:exams_quizzes_alike/network/option_requests.dart';
import 'package:exams_quizzes_alike/widgets/option_widget.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({Key? key, required this.question}) : super(key: key);

  final Question question;

  @override
  State<QuestionWidget> createState() => QuestionWidgetState();
}

class QuestionWidgetState extends State<QuestionWidget> {
  List<Option> options = List.empty();
  String literalValue = "";
  List<GlobalKey<OptionWidgetState>> optionStates = [];
  List<SolvedOption> solvedOptions = [];

  @override
  void initState() {
    literalValue = widget.question.literal;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Column(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(literalValue,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(getFormattedType(),
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                )),
          ),
          const SizedBox(
            height: 10,
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
                      GlobalKey<OptionWidgetState> key = GlobalKey();
                      optionStates.add(key);
                      return OptionWidget(
                        option: options[index],
                        type: widget.question.type,
                        key: key,
                        callback: (String value) {
                          uncheckOptions(value);
                        },
                      );
                    });
              }),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Future<void> getOptions() async {
    options =
        await OptionRequests().getOptions(int.parse(widget.question.code));
  }

  String getFormattedType() {
    switch (widget.question.type) {
      case ('unica-respuesta'):
        return "Única Respuesta";

      case ('multiple-respuesta'):
        return ("Múltiple Respuesta");

      case ('completar'):
        return ('Completar la Palabra Faltante');

      case ('emparejar'):
        return ('Emparejar los Conceptos');

      case ('ordenar'):
        return ('Ordenar la secuencia');

      case ('falso-verdadero'):
        return ('Falso o Verdadero');

      default:
        return "Tipo de Pregunta no Encontrado";
    }
  }

  void uncheckOptions(String description) {
    for (var value in optionStates) {
      if (value.currentState!.getOptionDescription() != description) {
        value.currentState!.checkboxValue = false;
        value.currentState!.setState(() {});
        value.currentState!.setCheckboxValue(false);
      }
    }
  }

  List<SolvedOption> getSolvedOptions() {
    return solvedOptions;
  }

  //Used to solve this question and get if it was correct or not
  bool solve() {
    String sort = '';
    String expectedSort = '';
    //As every question is different, we need to solve according to its type
    switch (widget.question.type) {
      case 'unica-respuesta':
        //If the question is marked, check if it is the correct answer
        for (var value in optionStates) {
          if (value.currentState?.isMarked() ?? false) {
            if (value.currentState?.getAnswer() ==
                value.currentState?.getCorrectAnswer()) {
              solvedOptions.add(SolvedOption(
                  answer: value.currentState!.getAnswer(),
                  optionCode: value.currentState!.widget.option.code.toString(),
                  optionDescription:
                      value.currentState!.widget.option.description.toString(),
                  question: widget.question));
              return true;
            } else {
              solvedOptions.add(SolvedOption(
                  answer: value.currentState!.getAnswer(),
                  optionCode: value.currentState!.widget.option.code.toString(),
                  optionDescription:
                      value.currentState!.widget.option.description.toString(),
                  question: widget.question));
              return false;
            }
          }
        }

        return false;

      case 'multiple-respuesta':
        //Check every single question wether or not it is marked
        for (var value in optionStates) {
          if (value.currentState?.widget.option.description !=
              value.currentState?.widget.option.correctAnswer) {
            if (value.currentState?.isMarked() ?? false) {
              solvedOptions = [];
              solvedOptions.add(SolvedOption(
                  answer: value.currentState!.getAnswer(),
                  optionCode: value.currentState!.widget.option.code.toString(),
                  optionDescription:
                      value.currentState!.widget.option.description.toString(),
                  question: widget.question));
              return false;
            }
          }

          if (value.currentState?.widget.option.description ==
              value.currentState?.widget.option.correctAnswer) {
            if (!(value.currentState?.isMarked() ?? false)) {
              solvedOptions.add(SolvedOption(
                  answer: ' ',
                  optionCode: value.currentState!.widget.option.code.toString(),
                  optionDescription:
                      value.currentState!.widget.option.description.toString(),
                  question: widget.question));
              return false;
            }
          }

          if (value.currentState?.widget.option.description ==
              value.currentState?.widget.option.correctAnswer) {
            if ((value.currentState?.isMarked() ?? false)) {
              solvedOptions.add(SolvedOption(
                  answer: value.currentState!.getAnswer(),
                  optionCode: value.currentState!.widget.option.code.toString(),
                  optionDescription:
                      value.currentState!.widget.option.description.toString(),
                  question: widget.question));
            }
          }
        }
        return true;

      case 'completar':
        //Check if the completed word is correct
        for (var value in optionStates) {
          if (value.currentState?.getAnswer() !=
              value.currentState?.getCorrectAnswer()) {
            solvedOptions = [];
            solvedOptions.add(SolvedOption(
                answer: value.currentState!.getAnswer(),
                optionCode: value.currentState!.widget.option.code.toString(),
                optionDescription:
                    value.currentState!.widget.option.description.toString(),
                question: widget.question));
            return false;
          } else {
            solvedOptions.add(SolvedOption(
                answer: value.currentState!.getAnswer(),
                optionCode: value.currentState!.widget.option.code.toString(),
                optionDescription:
                    value.currentState!.widget.option.description.toString(),
                question: widget.question));
          }
        }
        return true;

      case 'emparejar':
        //Check if the selected option matches the description
        for (var value in optionStates) {
          if (value.currentState?.getAnswer() !=
              value.currentState?.getCorrectAnswer()) {
            solvedOptions = [];
            solvedOptions.add(SolvedOption(
                answer: value.currentState!.getAnswer(),
                optionCode: value.currentState!.widget.option.code.toString(),
                optionDescription:
                    value.currentState!.widget.option.description.toString(),
                question: widget.question));
            return false;
          } else {
            solvedOptions.add(SolvedOption(
                answer: value.currentState!.getAnswer(),
                optionCode: value.currentState!.widget.option.code.toString(),
                optionDescription:
                    value.currentState!.widget.option.description.toString(),
                question: widget.question));
          }
        }
        return true;

      case 'falso-verdadero':
        //Check if all selected options match the expected value
        for (var value in optionStates) {
          if (value.currentState?.widget.option.correctAnswer == 'falso') {
            if (value.currentState?.isMarked() ?? false) {
              solvedOptions = [];
              solvedOptions.add(SolvedOption(
                  answer: 'verdadero',
                  optionCode: value.currentState!.widget.option.code.toString(),
                  optionDescription:
                      value.currentState!.widget.option.description.toString(),
                  question: widget.question));
              return false;
            }
          }

          if (value.currentState?.widget.option.correctAnswer == 'verdadero') {
            if (!(value.currentState?.isMarked() ?? false)) {
              solvedOptions = [];
              solvedOptions.add(SolvedOption(
                  answer: 'falso',
                  optionCode: value.currentState!.widget.option.code.toString(),
                  optionDescription:
                      value.currentState!.widget.option.description.toString(),
                  question: widget.question));

              return false;
            }
            solvedOptions.add(SolvedOption(
                answer: value.currentState!.getAnswer(),
                optionCode: value.currentState!.widget.option.code.toString(),
                optionDescription:
                    value.currentState!.widget.option.description.toString(),
                question: widget.question));
          }
        }

        return true;

      case 'ordenar':
        //Check get every single value, if no text is detected, the question is wrong
        for (var value in optionStates) {
          //save expected sort value
          expectedSort = value.currentState?.getCorrectAnswer() ?? 'invalid';

          if (value.currentState?.getAnswer() == '') {
            solvedOptions.add(SolvedOption(
                answer: sort,
                optionCode: value.currentState!.widget.option.code.toString(),
                optionDescription:
                    value.currentState!.widget.option.description.toString(),
                question: widget.question));
            return false;
          }
          //Build the sort according to each value
          sort += value.currentState?.getAnswer()[0] ?? '';
        }

        //If the sequence is not the same as the expected one, the answer is wrong
        if (sort != expectedSort) {
          for (var value in optionStates) {
            solvedOptions.add(SolvedOption(
                answer: sort,
                optionCode: value.currentState!.widget.option.code.toString(),
                optionDescription:
                    value.currentState!.widget.option.description.toString(),
                question: widget.question));
          }
          return false;
        }
        for (var value in optionStates) {
          solvedOptions.add(SolvedOption(
              answer: sort,
              optionCode: value.currentState!.widget.option.code.toString(),
              optionDescription:
                  value.currentState!.widget.option.description.toString(),
              question: widget.question));
        }
        return true;

      default:
        return false;
    }
  }
}
