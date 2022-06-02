class ExamUtils {
  Map<String, dynamic> codeJson(int examCode) {
    Map<String, dynamic> json = {
      'exam_code': examCode.toString(),
    };
    return json;
  }

  Map<String, dynamic> examTopicToJson(int examCode, int topicCode) {
    Map<String, dynamic> json = {
      'exam_code': examCode.toString(),
      'topic_code': topicCode.toString(),
    };
    return json;
  }
}
