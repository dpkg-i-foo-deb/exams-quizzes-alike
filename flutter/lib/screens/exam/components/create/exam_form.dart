import 'package:exams_quizzes_alike/exceptions/exam_category_exception.dart';
import 'package:exams_quizzes_alike/exceptions/topic_exception.dart';
import 'package:exams_quizzes_alike/models/course.dart';
import 'package:exams_quizzes_alike/models/exam.dart';
import 'package:exams_quizzes_alike/models/exam_category.dart';
import 'package:exams_quizzes_alike/models/topic.dart';
import 'package:exams_quizzes_alike/network/exam_category_requests.dart';
import 'package:exams_quizzes_alike/network/exam_requests.dart';
import 'package:exams_quizzes_alike/network/topic_requests.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class ExamForm extends StatefulWidget {
  const ExamForm({Key? key, required this.course}) : super(key: key);
  final Course course;
  @override
  State<ExamForm> createState() => _ExamFormState();
}

class _ExamFormState extends State<ExamForm> {
  final _formKey = GlobalKey<FormState>();
  TimeOfDay pickedTime = TimeOfDay.now();
  TextEditingController presentationTimeController = TextEditingController();
  TextEditingController maxHourController = TextEditingController(text: "0");
  TextEditingController maxMinuteController = TextEditingController(text: "0");
  List<ExamCategory> categories = List.empty();
  List<Topic> topics = List.empty();
  //Every single exam attribute
  String examName = "";
  String examDescription = "";
  int examCategory = 0;
  int maxHour = 0;
  int maxMinute = 0;
  int maxGrade = 0;
  int minGrade = 0;
  double examWeight = 0;

  bool validForm = false;

  var selectedTopics = [];

  late Exam exam;

  @override
  void initState() {
    super.initState();
    getCategoriesFuture();
    getTopicsFuture();
  }

  getCategoriesFuture() async {
    await getCategories();
    setState(() {});
  }

  getTopicsFuture() async {
    await getTopics();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Exam Name",
                hintText: "This Exam will be Called...",
                prefixIcon: Icon(Icons.document_scanner)),
            validator: (value) {
              if (value!.isEmpty) {
                return 'This field is mandatory';
              }
              return null;
            },
            onSaved: (value) {
              examName = value!;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Description",
                hintText: "Its Description Is:",
                prefixIcon: Icon(Icons.description)),
            validator: (value) {
              if (value!.isEmpty) {
                return 'This field is mandatory';
              }
              return null;
            },
            onSaved: (value) {
              examDescription = value!;
            },
          ),
          DropdownButtonFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.category),
              labelText: "Category",
              hintText: 'Select a Category',
            ),
            items: categories.map((data) {
              return DropdownMenuItem(
                child: Text(data.examCategoryDescription),
                value: data.examCategoryCode,
              );
            }).toList(),
            onChanged: (value) {
              examCategory = value! as int;
            },
            validator: (value) {
              if (value == null) {
                return 'this field is mandatory';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          Row(children: [
            Expanded(
                child: TextFormField(
              controller: maxHourController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'This field is mandatory';
                }
                return null;
              },
              onSaved: (value) {
                maxHour = int.parse(value!);
              },
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(
                    RegExp(r'[0-9]+[,.]{0,1}[0-9]*'))
              ],
              decoration: const InputDecoration(
                  labelText: "Max Hours", prefixIcon: Icon(Icons.lock_clock)),
            )),
            const SizedBox(
              width: 25,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: ElevatedButton(
                      onPressed: (() {
                        maxHour = int.parse(maxHourController.text);
                        maxHour = maxHour + 1;
                        maxHourController.text = maxHour.toString();
                      }),
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 115, 138, 230),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Icon(Icons.arrow_upward_rounded)),
                ),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: ElevatedButton(
                      onPressed: ((() {
                        maxHour = int.parse(maxHourController.text);
                        maxHour = maxHour - 1;
                        maxHourController.text = maxHour.toString();
                      })),
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 115, 138, 230),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Icon(Icons.arrow_downward_rounded)),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "Max Minutes",
                    prefixIcon: Icon(Icons.lock_clock)),
                controller: maxMinuteController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is mandatory';
                  }
                  return null;
                },
                onSaved: (value) {
                  maxMinute = int.parse(value!);
                },
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: ElevatedButton(
                      onPressed: (() {
                        maxMinute = int.parse(maxMinuteController.text);
                        maxMinute = maxMinute + 1;
                        maxMinuteController.text = maxMinute.toString();
                      }),
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 115, 138, 230),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Icon(Icons.arrow_upward_rounded)),
                ),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: ElevatedButton(
                      onPressed: ((() {
                        maxHour = int.parse(maxMinuteController.text);
                        maxHour = maxHour - 1;
                        maxMinuteController.text = maxHour.toString();
                      })),
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 115, 138, 230),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Icon(Icons.arrow_downward_rounded)),
                ),
              ],
            ),
          ]),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'This field is mandatory';
              }
              return null;
            },
            onSaved: (value) {
              maxGrade = int.parse(value!);
            },
            decoration: const InputDecoration(
                labelText: "Max Grade",
                hintText: "Students Cannot Score More Than...",
                prefixIcon: Icon(Icons.grade)),
            keyboardType: TextInputType.number,
          ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "This field is mandatory";
              }
              return null;
            },
            onSaved: (value) {
              maxGrade = int.parse(value!);
            },
            decoration: const InputDecoration(
                labelText: "Min Grade",
                hintText: "They Cannot Score Less Than...",
                prefixIcon: Icon(Icons.warning)),
            keyboardType: TextInputType.number,
          ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'This field is mandatory';
              }
              return null;
            },
            onSaved: (value) {
              minGrade = int.parse(value!);
            },
            decoration: const InputDecoration(
                labelText: "Exam Weight",
                hintText: "Its Weight on the Course is...",
                prefixIcon: Icon(Icons.dashboard_customize_outlined)),
            keyboardType: TextInputType.number,
          ),
          MultiSelectFormField(
            title: const Text('Exam Topics'),
            validator: (value) {
              if (value == null || value.length == 0) {
                return 'Please select one or more options';
              }
              return null;
            },
            autovalidate: AutovalidateMode.disabled,
            chipBackGroundColor: const Color.fromARGB(255, 115, 138, 230),
            chipLabelStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
            dialogTextStyle: const TextStyle(fontWeight: FontWeight.bold),
            checkBoxCheckColor: Colors.white,
            dialogShapeBorder: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            dataSource: topics
                .map((data) {
                  return {
                    "display": data.description,
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
            initialValue: selectedTopics,
            onSaved: (value) {
              if (value == null) return;
              setState(() {
                selectedTopics = value;
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 73, 89, 154),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                validateAndSend();
                if (validForm) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Please wait...'),
                    duration: Duration(seconds: 1),
                  ));
                  Navigator.pop(context);
                }
              },
              child: const Text('Submit'))
        ],
      ),
    );
  }

  Future<void> getCategories() async {
    try {
      categories = await ExamCategoryRequests().getCategories();
    } on ExamCategoryException {
      //TODO do something when there are no categories
      rethrow;
    }
  }

  Future<void> getTopics() async {
    try {
      topics = await TopicRequests().getTopics();
    } on TopicException {
      //TODO do something when there are no topics
      rethrow;
    }
  }

  Future<void> validateAndSend() async {
    final form = _formKey.currentState;

    if (form!.validate()) {
      validForm = true;
      form.save();

      String formattedTime = "";

      formattedTime = "" + maxHour.toString();
      formattedTime += ":";
      formattedTime += maxMinute.toString();

      exam = Exam(
          maxGrade: maxGrade,
          minGrade: minGrade,
          weight: examWeight,
          numbQuestions: 0,
          name: examName,
          description: examDescription,
          limitTime: formattedTime,
          categoryCode: examCategory,
          teacherEmail: widget.course.teacherLogin);

      Exam createdExam = await ExamRequests().createExam(exam);

      for (var count = 0; count < selectedTopics.length; count++) {
        ExamRequests()
            .setTopic(createdExam.code!, int.parse(selectedTopics[count]));
      }
    } else {
      validForm = false;
    }
  }
}
