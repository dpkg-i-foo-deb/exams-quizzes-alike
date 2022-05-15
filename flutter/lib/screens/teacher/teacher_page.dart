import 'package:flutter/material.dart';

import '../../models/teacher.dart';

class TeacherPage extends StatefulWidget {
  const TeacherPage({Key? key, required this.teacher}) : super(key: key);
  final Teacher teacher;

  @override
  State<TeacherPage> createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
