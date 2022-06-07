import 'package:exams_quizzes_alike/screens/login/login_page.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: const Color.fromARGB(255, 121, 134, 203),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () => Navigator.of(context, rootNavigator: true)
                    .pushReplacement(MaterialPageRoute(
                        builder: (context) => const LoginPage())),
                child: const Text(
                  "Log Out",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 178, 59, 59),
                ),
              )),
          Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Go back",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 170, 182, 254),
                ),
              )),
        ]);
  }
}
