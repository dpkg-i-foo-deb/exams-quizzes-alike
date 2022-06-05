import 'package:exams_quizzes_alike/models/exam_category.dart';
import 'package:exams_quizzes_alike/network/exam_category_requests.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('We should get categories', (() async {
    List<ExamCategory> categories = List.empty();

    categories = await ExamCategoryRequests().getCategories();

    expect(false, categories.isEmpty);
  }));
}
