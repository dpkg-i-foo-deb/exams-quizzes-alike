import 'package:exams_quizzes_alike/exceptions/exam_category_exception.dart';
import 'package:exams_quizzes_alike/models/exam_category.dart';
import 'package:exams_quizzes_alike/network/exam_category_requests.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class ExamForm extends StatefulWidget {
  const ExamForm({Key? key}) : super(key: key);

  @override
  State<ExamForm> createState() => _ExamFormState();
}

class _ExamFormState extends State<ExamForm> {
  final _formKey = GlobalKey<FormState>();
  TimeOfDay pickedTime = TimeOfDay.now();
  TextEditingController presentationTimeController = TextEditingController();
  TextEditingController maxHourController = TextEditingController(text: "0");
  TextEditingController maxMinuteController = TextEditingController(text: "0");
  int maxHour = 0;
  int maxMinute = 0;
  List<ExamCategory> categories = List.empty();
  String examCategory = "";

  @override
  void initState() {
    super.initState();
    getCategoriesFuture();
  }

  getCategoriesFuture() async {
    await getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          //TODO validator
          //TODO on saved
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Exam Name",
                hintText: "This Exam will be Called...",
                prefixIcon: Icon(Icons.document_scanner)),
          ),
          //TODO validator
          //TODO on saved
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Description",
                hintText: "Its Description Is:",
                prefixIcon: Icon(Icons.description)),
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
            onChanged: (int? value) {},
          ),
          const SizedBox(height: 15),
          Row(children: [
            Expanded(
                child: TextFormField(
              controller: maxHourController,
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
                          primary: const Color.fromARGB(255, 73, 89, 154),
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
                          primary: const Color.fromARGB(255, 73, 89, 154),
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
                          primary: const Color.fromARGB(255, 73, 89, 154),
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
                          primary: const Color.fromARGB(255, 73, 89, 154),
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
          //TODO validator
          //TODO on saved
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Max Grade",
                hintText: "Students Cannot Score More Than...",
                prefixIcon: Icon(Icons.grade)),
            keyboardType: TextInputType.number,
            //TODO on saved
            //TODO validator
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Min Grade",
                hintText: "They Cannot Score Less Than...",
                prefixIcon: Icon(Icons.warning)),
            keyboardType: TextInputType.number,
            //TODO on saved
            //TODO validator
          ),
          //TODO on saved
          //TODO validator
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Exam Weight",
                hintText: "Its Weight on the Course is...",
                prefixIcon: Icon(Icons.dashboard_customize_outlined)),
            keyboardType: TextInputType.number,
          ),
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
}
