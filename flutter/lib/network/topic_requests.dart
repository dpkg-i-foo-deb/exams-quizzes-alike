import 'package:exams_quizzes_alike/exceptions/topic_exception.dart';
import 'package:exams_quizzes_alike/models/topic.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TopicRequests {
  Future<List<Topic>> getTopics() async {
    final response = await http.get(Uri.parse('http://localhost:3000/topics'));

    if (response.statusCode == 200) {
      List<Topic> topics = (json.decode(response.body) as List)
          .map((data) => Topic.fromJson(data))
          .toList();

      return topics;
    } else {
      throw TopicException('Something failed');
    }
  }
}
