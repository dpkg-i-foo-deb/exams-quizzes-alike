import 'package:exams_quizzes_alike/network/person_requests.dart';
import 'package:flutter_test/flutter_test.dart';
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

  test('Login should not be correct', (() async {
    Person person = const Person(
      login: 'dpk',
      password: 'michi',
      fullName: '',
    );

    expect(() async => person = await PersonRequests().login(person),
        throwsException);
  }));

  test('We should get people', (() async {
    List<Person> people = await PersonRequests().getUsers();

    expect(people.isNotEmpty, true);
  }));
}
