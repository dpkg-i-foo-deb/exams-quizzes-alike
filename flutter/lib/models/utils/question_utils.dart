class QuestionUtils {
  Map<String, dynamic> buildCompatibleQuestionsJson(
      int examCode, String teacherLogin) {
    Map<String, dynamic> json = {
      'teacher_login': teacherLogin,
      'exam_code': examCode.toString(),
    };

    return json;
  }

  Map<String, dynamic> buildOptionsJson(int questionCode) {
    Map<String, dynamic> json = {
      'question_code': questionCode.toString(),
    };

    return json;
  }
}
