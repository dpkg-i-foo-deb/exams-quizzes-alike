import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/person.dart';

class PersonRequests {
  Future<Person> login(Person person) async {
    final response = await http.post(Uri.parse('http://localhost:3000/login'),
        body: person.toJson());
    String full_name;

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Person.fromJson(data[0]);
    } else {
      throw Exception("Login failed");
    }
  }
}
