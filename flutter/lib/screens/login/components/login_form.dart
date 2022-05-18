import 'package:exams_quizzes_alike/exceptions/login_excepcion.dart';
import 'package:exams_quizzes_alike/exceptions/teacher_exception.dart';
import 'package:exams_quizzes_alike/models/teacher.dart';
import 'package:exams_quizzes_alike/models/user.dart';
import 'package:exams_quizzes_alike/network/teacher_requests.dart';
import 'package:exams_quizzes_alike/network/user_requests.dart';
import 'package:exams_quizzes_alike/screens/teacher/teacher_page.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String userValue = '';

  String passwordValue = '';

  String message = '';

  User? user;

  Teacher? teacher;

  bool isTeacher = true;

  bool isStudent = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(labelText: "Username"),
            keyboardType: TextInputType.number,
            onSaved: (value) {
              userValue = value!;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "This field is mandatory";
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "Password"),
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            onSaved: (value) {
              passwordValue = value!;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "This field is mandatory";
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  try {
                    user = await validateAndLogin();
                    message = 'Welcome back! ' + user!.fullName;

                    //If this user is a teacher...
                    if (isTeacher) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  TeacherPage(teacher: teacher!))));
                    }

                    isTeacher = true;
                  } on LoginException catch (e) {
                    message = e.cause;
                  }
                  // Validate returns true if the form is valid, or false otherwise.

                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(message)));
                }
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text('Log in'),
            ),
          )
        ],
      ),
    );
  }

  Future<User?> validateAndLogin() async {
    final form = _formKey.currentState;

    if (form!.validate()) {
      form.save();

      user = User(
        fullName: ' ',
        login: userValue,
        password: passwordValue,
      );

      //Step 1, does this user exist? Are credentials valid?
      try {
        user = await UserRequests().login(user!);
      } on LoginException {
        rethrow;
      }

      //Step 2, is this user a teacher?
      teacher = Teacher(login: user!.login);

      try {
        teacher = await TeacherRequests().isTeacher(teacher!);
      } on TeacherException {
        isTeacher = !isTeacher;
      }

      return user;
    } else {
      throw LoginException('Something went wrong');
    }
  }
}
