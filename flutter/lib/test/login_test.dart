import 'package:exams_quizzes_alike/network/user_requests.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:exams_quizzes_alike/models/user.dart';

void main() {
  test('Login should be correct', (() async {
    User user = const User(
      login: 'dpkg',
      password: 'michi',
      fullName: '',
    );

    user = await UserRequests().login(user);

    expect(user.fullName, "Mateo Estrada");
  }));

  test('Login should not be correct', (() async {
    User user = const User(
      login: 'dpk',
      password: 'michi',
      fullName: '',
    );

    expect(
        () async => user = await UserRequests().login(user), throwsException);
  }));

  test('We should get users', (() async {
    List<User> user = await UserRequests().getUsers();

    expect(user.isNotEmpty, true);
  }));
}
