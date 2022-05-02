import 'package:postgres/postgres.dart';

class PersonQueries {
  PostgreSQLConnection connection;

  PostgreSQLResult? result;

  PersonQueries(this.connection);

  Future<String> createPerson(
      String login, String password, String name) async {
    await connection.open();
    await connection.transaction((newPersonConnection) async {
      result = await newPersonConnection.query(
        'insert into persona(login, password, nombre) '
        'values(@login, @password, @name)',
        substitutionValues: {
          'login': login,
          'password': password,
          'name': name,
        },
        allowReuse: true,
        timeoutInSeconds: 30,
      );
    });

    return (result!.affectedRowCount > 0 ? 'reg' : 'nop');
  }
}
