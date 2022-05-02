import 'package:flutter/material.dart';

import 'widgets/login_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.purple),
    debugShowCheckedModeBanner: false,
    home: const LoginPage(),
  ));
}
