import 'dart:convert';
import 'package:exams_quizzes_alike/exceptions/login_excepcion.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserRequests {
  Future<User> login(User user) async {
    final response = await http.post(Uri.parse('http://localhost:3000/login'),
        body: user.toJson());

    if (response.statusCode == 204) {
      throw LoginException('Username or Password Incorrect');
    }

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      return User.fromJson(data[0]);
    }

    throw LoginException('Something went wrong');
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
