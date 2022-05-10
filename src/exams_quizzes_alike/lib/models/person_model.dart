import 'package:exams_quizzes_alike/database/app_database.dart';

//This class is used to access the database class
class PersonModel {
  String result = '';
  //Create
  Future<String> createPerson(
      String login, String password, String name) async {
    result = await AppDatabase().createPerson(login, password, name);
    return result;
  }

  //Login
  Future<String> login(String username, String password) async {
    String personName = '';
    List<Map<String, Map<String, dynamic>>> queryResult =
        await AppDatabase().login(username, password);

    for (final row in queryResult) {
      personName = row["persona"]!["nombre"];
    }

    return personName;
  }
}
