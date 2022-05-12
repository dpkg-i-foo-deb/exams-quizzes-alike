import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/person.dart';

class Person_Requests {
  Future<Person> login(Person person) async {
    final response = await http.post(Uri.parse('localhost:3000/login'),
        body: person.toJson());

    if (response.statusCode == 200) {
      return Person.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Login failed");
    }
  }
}
