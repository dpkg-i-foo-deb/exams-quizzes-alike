import 'package:exams_quizzes_alike/network/teacher_requests.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:exams_quizzes_alike/models/teacher.dart';

void main() {
  test('there should be a teacher', () async {
    Teacher teacher = const Teacher(login: 'dpkg');

    teacher = await TeacherRequests().isTeacher(teacher);

    expect(teacher.login, "dpkg");
  });
}
