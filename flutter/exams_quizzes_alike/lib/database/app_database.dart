import 'package:exams_quizzes_alike/database/person_queries.dart';
import 'package:postgres/postgres.dart';

//Initial database connection, here's where you set your username, password and
//database name
class AppDatabase {
  PostgreSQLConnection? connection;

  PostgreSQLResult? result;

  AppDatabase() {
    connection = (connection == null || connection!.isClosed == true
        ? PostgreSQLConnection(
            // for external device like mobile phone use domain.com or
            // your computer machine IP address (i.e,192.168.0.1,etc)
            // when using AVD add this IP 10.0.2.2
            'localhost',
            5432,
            'institucion',
            username: 'institucion_admin',
            password: 'institucion_admin',
            timeoutInSeconds: 30,
            queryTimeoutInSeconds: 30,
            timeZone: 'UTC',
            useSSL: false,
            isUnixSocket: false,
          )
        : connection);
  }

  Future<String> createPerson(
      String login, String password, String name) async {
    return PersonQueries(connection!).createPerson(login, password, name);
  }

  Future<List<Map<String, Map<String, dynamic>>>> login(
      String username, String password) async {
    return PersonQueries(connection!).login(username, password);
  }
}
