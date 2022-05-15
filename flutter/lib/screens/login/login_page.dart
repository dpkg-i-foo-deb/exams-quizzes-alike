import 'package:exams_quizzes_alike/exceptions/login_excepcion.dart';
import 'package:exams_quizzes_alike/exceptions/teacher_exception.dart';
import 'package:exams_quizzes_alike/network/teacher_requests.dart';
import 'package:exams_quizzes_alike/network/user_requests.dart';
import 'package:flutter/material.dart';

import '../../models/teacher.dart';
import '../../models/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(25),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromARGB(255, 191, 238, 183),
                Color.fromARGB(255, 215, 244, 210),
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              Image.asset(
                'images/logo.png',
                height: 130,
                width: 130,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Exams And Quizzes Alike',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                constraints: const BoxConstraints(
                    maxHeight: double.infinity, maxWidth: double.infinity),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Hello',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Please log in to your account',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: "Username"),
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
                            decoration:
                                const InputDecoration(labelText: "Password"),
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
                                  } on LoginException catch (e) {
                                    message = e.cause;
                                  }
                                  // Validate returns true if the form is valid, or false otherwise.

                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(message)));

                                  //If this user is a teacher...
                                  if (isTeacher) {
                                    Navigator.pushNamed(context, '/teacher');
                                  }

                                  isTeacher = true;
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
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
