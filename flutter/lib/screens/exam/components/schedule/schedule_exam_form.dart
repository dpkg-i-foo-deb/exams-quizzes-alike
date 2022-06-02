import 'package:exams_quizzes_alike/exceptions/exam_exception.dart';
import 'package:exams_quizzes_alike/models/course.dart';
import 'package:exams_quizzes_alike/models/exam.dart';
import 'package:exams_quizzes_alike/network/exam_requests.dart';
import 'package:flutter/material.dart';

class ScheduleExamForm extends StatefulWidget {
  const ScheduleExamForm({Key? key, required this.course}) : super(key: key);

  final Course course;

  @override
  State<ScheduleExamForm> createState() => _ScheduleExamFormState();
}

class _ScheduleExamFormState extends State<ScheduleExamForm> {
  final _formKey = GlobalKey<FormState>();
  var validForm = false;
  List<Exam> exams = List.empty();
  int selectedExam = 0;
  TextEditingController examScheduleTimeController = TextEditingController();
  TimeOfDay pickedTime = TimeOfDay.now();
  TextEditingController examScheduleDateController = TextEditingController();
  DateTime pickedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    getExamsFuture();
  }

  getExamsFuture() async {
    await getExams();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.file_present),
              labelText: 'I want to schedule the exam',
              hintText: 'Please Select one...'),
          items: exams.map((data) {
            return DropdownMenuItem(
              child: Text(data.name),
              value: data.code,
            );
          }).toList(),
          onChanged: (value) {
            selectedExam = value! as int;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Flexible(
              child: TextFormField(
                controller: examScheduleDateController,
                decoration: const InputDecoration(
                    labelText: "On...",
                    hintText: "Please choose a date...",
                    prefixIcon: Icon(Icons.calendar_today)),
                onTap: () async {
                  pickedDate = (await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(4000)))!;
                  String formattedDate = '';
                  formattedDate = pickedDate.year.toString();
                  formattedDate += '-';
                  formattedDate += pickedDate.month.toString();
                  formattedDate += '-';
                  formattedDate += pickedDate.day.toString();
                  setState(() {
                    examScheduleDateController.text = formattedDate;
                  });
                },
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            Flexible(
              child: TextFormField(
                controller: examScheduleTimeController,
                decoration: const InputDecoration(
                    labelText: "At...",
                    hintText: "Please choose a time...",
                    prefixIcon: Icon(Icons.alarm)),
                onTap: () async {
                  pickedTime = (await showTimePicker(
                      context: context, initialTime: TimeOfDay.now()))!;
                  String formattedTime = pickedTime.format(context);
                  setState(() {
                    examScheduleTimeController.text = formattedTime;
                  });
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 73, 89, 154),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {
              validateAndSend();
            },
            child: const Text('Schedule'))
      ]),
    );
  }

  Future<void> getExams() async {
    try {
      exams = await ExamRequests().getExams(widget.course.teacherLogin);
    } on ExamException {
      //TODO something when we cannot get the exams
    }
  }

  Future<void> validateAndSend() async {
    final form = _formKey.currentState;

    if (form!.validate()) {
      validForm = true;
      form.save();

      String formattedDate = "";

      formattedDate = "" + pickedDate.year.toString();
      formattedDate += "-";
      formattedDate += pickedDate.month.toString();
      formattedDate += "-";
      formattedDate += pickedDate.day.toString();
      formattedDate += " ";
      formattedDate += pickedTime.hour.toString();
      formattedDate += ":";
      formattedDate += pickedTime.minute.toString();

      try {
        ExamRequests().scheduleExam(
            selectedExam, widget.course.courseCode!, formattedDate);
      } on ExamException {
        //TODO something when we fail to schedule the exam
      }
    }
    validForm = false;
  }
}
