import 'package:exams_quizzes_alike/models/topic.dart';
import 'package:exams_quizzes_alike/network/topicRequests.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('We should get topics', () async {
    List<Topic> topics = List.empty();

    topics = await TopicRequests().getTopics();

    expect(false, topics.isEmpty);
  });
}
