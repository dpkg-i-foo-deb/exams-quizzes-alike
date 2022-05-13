import 'package:exams_quizzes_alike/network/user_requests.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:exams_quizzes_alike/models/user.dart';

void main() {
  test('Login should be correct', (() async {
    User person = const User(
      login: 'dpkg',
      password: 'michi',
      fullName: '',
    );

    person = await UserRequests().login(person);

    expect(person.fullName, "Mateo Estrada");
  }));

  test('Login should not be correct', (() async {
    User person = const User(
      login: 'dpk',
      password: 'michi',
      fullName: '',
    );

    expect(() async => person = await UserRequests().login(person),
        throwsException);
  }));

  test('We should get people', (() async {
    List<User> people = await UserRequests().getUsers();

    expect(people.isNotEmpty, true);
  }));
}
