class ScheduledExamUtils {
  Map<String, dynamic> buildScheduledExamsQueryJson(int courseCode) {
    Map<String, dynamic> json = {
      'course_code': courseCode.toString(),
    };

    return json;
  }
}
