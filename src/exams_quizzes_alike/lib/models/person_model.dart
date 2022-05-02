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
}
