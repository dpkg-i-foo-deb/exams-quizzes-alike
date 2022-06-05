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

  Map<String, dynamic> examCourseToJson(
      int examCode, int courseCode, String date) {
    Map<String, dynamic> json = {
      'exam_code': examCode.toString(),
      'course_code': courseCode.toString(),
      'date': date,
    };
    return json;
  }

  Map<String, dynamic> buildSetQuestionJson(int examCode, int questionCode) {
    Map<String, dynamic> json = {
      'exam_code': examCode.toString(),
      'question_code': questionCode.toString(),
    };

    return json;
  }
}
