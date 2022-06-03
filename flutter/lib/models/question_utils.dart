class QuestionUtils {
  Map<String, dynamic> buildCompatibleQuestionsJson(
      int examCode, String teacherLogin) {
    Map<String, dynamic> json = {
      'teacher_login': teacherLogin,
      'exam_code': examCode.toString(),
    };

    return json;
  }
}
