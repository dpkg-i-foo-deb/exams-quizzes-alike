import 'package:exams_quizzes_alike/models/option.dart';
import 'package:flutter/material.dart';

class OptionWidget extends StatefulWidget {
  const OptionWidget({Key? key, required this.option, required this.type})
      : super(key: key);

  final Option option;
  final String type;

  @override
  State<OptionWidget> createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget> {
  bool checkboxValue = false;
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

      default:
        return Text('otra cosa');
    }
  }
}
