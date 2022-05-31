import 'dart:convert';
import 'package:exams_quizzes_alike/exceptions/exam_category_exception.dart';
import 'package:http/http.dart' as http;
import 'package:exams_quizzes_alike/models/exam_category.dart';

class ExamCategoryRequests {
  Future<List<ExamCategory>> getCategories() async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/exams/categories'));
    if (response.statusCode == 200) {
      List<ExamCategory> categories = (json.decode(response.body) as List)
          .map((data) => ExamCategory.fromJson(data))
          .toList();

      return categories;
    } else {
      throw ExamCategoryException('Something failed');
    }
  }
}
