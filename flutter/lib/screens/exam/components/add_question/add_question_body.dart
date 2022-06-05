import 'package:exams_quizzes_alike/models/exam.dart';
import 'package:exams_quizzes_alike/models/question.dart';
import 'package:exams_quizzes_alike/network/question_requests.dart';
import 'package:exams_quizzes_alike/widgets/question_widget.dart';
import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class AddQuestionBody extends StatefulWidget {
  const AddQuestionBody({Key? key, required this.exam}) : super(key: key);

  final Exam exam;

  @override
  State<AddQuestionBody> createState() => _AddQuestionBodyState();
}

class _AddQuestionBodyState extends State<AddQuestionBody> {
  final _formKey = GlobalKey<FormState>();
  List<Question> compatibleQuestions = [];
  var selectedQuestions = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
              constraints: const BoxConstraints(
                  maxHeight: 180, maxWidth: double.infinity),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 237, 231, 246),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(widget.exam.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'ZenLoop',
                        fontSize: 70,
                        color: Colors.black,
                      )),
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
              constraints: const BoxConstraints(
                  maxHeight: 120, maxWidth: double.infinity),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 237, 231, 246),
                  borderRadius: BorderRadius.circular(20)),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Select the questions you want to add',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      )),
                ),
              )),
        ),
        const SizedBox(
          height: 20,
        ),
        FutureBuilder(
            future: getCompatibleQuestions(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const CircularProgressIndicator();
              }
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: MultiSelectFormField(
                    title: const Text('Compatible Questions'),
                    validator: (value) {
                      if (value == null || value.length == 0) {
                        return 'Please select one or more';
                      }
                      return null;
                    },
                    autovalidate: AutovalidateMode.disabled,
                    chipBackGroundColor:
                        const Color.fromARGB(255, 115, 138, 230),
                    chipLabelStyle: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                    dialogTextStyle:
                        const TextStyle(fontWeight: FontWeight.bold),
                    checkBoxCheckColor: Colors.white,
                    dialogShapeBorder: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    dataSource: compatibleQuestions
                        .map((data) {
                          return {
                            "display": data.literal,
                            "value": data.code,
                          };
                        })
                        .toList()
                        .cast<dynamic>(),
                    textField: 'display',
                    valueField: 'value',
                    okButtonLabel: 'Ok',
                    cancelButtonLabel: 'Cancel',
                    hintWidget: const Text('Please choose one or more'),
                    initialValue: selectedQuestions,
                    onSaved: (value) {
                      if (value == null) return;
                      setState(() {
                        selectedQuestions = value;
                      });
                    },
                  ),
                ),
              );
            }),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
              constraints: const BoxConstraints(
                  maxHeight: 90, maxWidth: double.infinity),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 237, 231, 246),
                  borderRadius: BorderRadius.circular(20)),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Questions Preview',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      )),
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
              future: getCompatibleQuestions(),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const CircularProgressIndicator();
                }
                return ListView.builder(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    itemCount: compatibleQuestions.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return QuestionWidget(
                          question: compatibleQuestions[index]);
                    });
              }),
        )
      ],
    );
  }

  Future<void> getCompatibleQuestions() async {
    compatibleQuestions = await QuestionRequests()
        .getCompatibleQuestions(widget.exam.teacherEmail, widget.exam.code!);
  }
}
