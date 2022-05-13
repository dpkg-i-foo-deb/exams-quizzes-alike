import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserRequests {
  Future<User> login(User person) async {
    final response = await http.post(Uri.parse('http://localhost:3000/login'),
        body: person.toJson());

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      if (data.isEmpty) {
        throw Exception("Username or password incorrect");
      }

      return User.fromJson(data[0]);
    } else {
      throw Exception("Login failed");
    }
  }

  Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse('http://localhost:3000/users'));

    if (response.statusCode == 200) {
      List<User> users = (json.decode(response.body) as List)
          .map((data) => User.fromJson(data))
          .toList();

      return users;
    } else {
      throw Exception("Something failed");
    }
  }
}
