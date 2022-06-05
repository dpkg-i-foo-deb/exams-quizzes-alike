import 'package:flutter/material.dart';

class AddQuestionBody extends StatefulWidget {
  const AddQuestionBody({Key? key}) : super(key: key);

  @override
  State<AddQuestionBody> createState() => _AddQuestionBodyState();
}

class _AddQuestionBodyState extends State<AddQuestionBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Container(
              constraints: const BoxConstraints(
                  maxHeight: 180, maxWidth: double.infinity),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 237, 231, 246),
                  borderRadius: BorderRadius.circular(20)),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Available Courses',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'ZenLoop',
                        fontSize: 70,
                        color: Colors.black,
                      )),
                ),
              )),
        )
      ],
    );
  }
}
