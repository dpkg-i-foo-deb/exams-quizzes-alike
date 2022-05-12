import 'package:exams_quizzes_alike/network/person_requests.dart';
import 'package:test/test.dart';
import 'package:exams_quizzes_alike/models/person.dart';

void main() {
  test('Login should be correct', (() async {
    Person person = const Person(
      login: 'dpkg',
      password: 'michi',
      fullName: '',
    );

    person = await PersonRequests().login(person);

    expect(person.fullName, "Mateo Estrada");
  }));
}
