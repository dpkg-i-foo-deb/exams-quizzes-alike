import 'package:exams_quizzes_alike/models/option.dart';
import 'package:exams_quizzes_alike/network/option_requests.dart';
import 'package:exams_quizzes_alike/network/question_requests.dart';
import 'package:exams_quizzes_alike/utils/callbacks/option_callback.dart';
import 'package:flutter/material.dart';

class OptionWidget extends StatefulWidget {
  const OptionWidget(
      {Key? key,
      required this.option,
      required this.type,
      required this.callback})
      : super(key: key);

  final Option option;
  final String type;
  final OptionCallback callback;

  @override
  State<OptionWidget> createState() => OptionWidgetState();
}

class OptionWidgetState extends State<OptionWidget> {
  bool checkboxValue = false;
  List<Option> pairs = List.empty();
  List<Option> sequenceOptions = List.empty();
  String selectedPair = " ";
  var fillController = TextEditingController();
  var pairController = GlobalKey<FormFieldState>();
  var sortController = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case "unica-respuesta":
        return Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                Checkbox(
                  value: checkboxValue,
                  activeColor: Colors.indigo,
                  onChanged: (value) {
                    setState(() {});
                    checkboxValue = value!;
                    widget.callback(widget.option.description);
                  },
                ),
                const SizedBox(width: 10),
                Text(widget.option.description),
              ],
            ));
      case 'multiple-respuesta':
        return Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                Checkbox(
                  value: checkboxValue,
                  activeColor: Colors.deepPurple,
                  onChanged: (value) {
                    setState(() {
                      checkboxValue = value!;
                    });
                  },
                ),
                const SizedBox(width: 10),
                Text(widget.option.description),
              ],
            ));

      case 'completar':
        return Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                Flexible(
                    child: TextField(
                  controller: fillController,
                  decoration: InputDecoration(
                    hintText: widget.option.description,
                    prefixIcon: const Icon(
                      Icons.text_fields,
                    ),
                    focusColor: Colors.deepPurple,
                  ),
                  onChanged: (value) {},
                )),
              ],
            ));

      case 'emparejar':
        return Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(flex: 1, child: Text(widget.option.description)),
                    FutureBuilder(
                        future: getPairs(),
                        builder: (context, snapshot) {
                          return Expanded(
                            flex: 1,
                            child: DropdownButtonFormField<String>(
                              key: pairController,
                              isExpanded: true,
                              icon: (const Icon(Icons.category)),
                              items: pairs.map((data) {
                                return DropdownMenuItem(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text(data.pair),
                                    ),
                                    value: data.pair);
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  selectedPair = value!.toString();
                                });
                              },
                            ),
                          );
                        })
                  ],
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ));

      case 'falso-verdadero':
        return Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: checkboxValue,
                      activeColor: Colors.green,
                      onChanged: (value) {
                        setState(() {
                          checkboxValue = value!;
                        });
                      },
                    ),
                    const SizedBox(width: 10),
                    Flexible(child: Text(widget.option.description)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ));

      case ('ordenar'):
        return Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(flex: 1, child: Text(widget.option.description)),
                    FutureBuilder(
                        future: getSequenceOptions(),
                        builder: (context, snapshot) {
                          return Expanded(
                            flex: 1,
                            child: DropdownButtonFormField<String>(
                              isExpanded: true,
                              key: sortController,
                              icon: (const Icon(Icons.category)),
                              items: sequenceOptions.map((data) {
                                return DropdownMenuItem(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text(data.description),
                                    ),
                                    value: data.description);
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  //TODO validate correctly
                                  selectedPair = value!.toString();
                                });
                              },
                            ),
                          );
                        })
                  ],
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ));
      default:
        return const Text('Tipo de pregunta no encontrado');
    }
  }

  bool isMarked() {
    switch (widget.type) {
      case 'unica-respuesta':
        return checkboxValue;

      case 'multiple-respuesta':
        return checkboxValue;

      case 'falso-verdadero':
        return checkboxValue;
      default:
        return false;
    }
  }

  String getAnswer() {
    switch (widget.type) {
      case 'unica-respuesta':
        return widget.option.description;

      case 'completar':
        return fillController.text;

      case 'emparejar':
        return pairController.currentState?.value;

      case 'ordenar':
        return sortController.currentState?.value ?? '';

      default:
        return '';
    }
  }

  String getCorrectAnswer() {
    switch (widget.type) {
      case 'unica-respuesta':
        return widget.option.correctAnswer;

      case 'completar':
        return widget.option.missingWord;

      case 'emparejar':
        return widget.option.pair;

      case 'ordenar':
        return widget.option.sortOrder;
      default:
        return '';
    }
  }

  void setCheckboxValue(bool value) {
    checkboxValue = value;
  }

  String getOptionDescription() {
    return widget.option.description;
  }

  Future<void> getPairs() async {
    pairs = await OptionRequests().getOptions(int.parse(widget.option.code));
  }

  Future<void> getSequenceOptions() async {
    sequenceOptions =
        await OptionRequests().getOptions(int.parse(widget.option.code));
  }
}
