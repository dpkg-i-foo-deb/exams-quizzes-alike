import 'package:exams_quizzes_alike/models/exam.dart';
import 'package:exams_quizzes_alike/network/exam_requests.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('An exam should be created', (() {
    Exam exam = Exam(
      maxGrade: 5,
      minGrade: 0,
      weight: 20,
      numbQuestions: 0,
      name: "Examencito",
      description: "Algo",
      limitTime: "2:2",
      categoryCode: 1,
      teacherEmail: "trivi",
    );

    ExamRequests().createExam(exam);
  }));
}
