class CourseStudentUtils {
  Map<String, dynamic> courseStudentRequestJson(String login) {
    Map<String, dynamic> json = {
      'login': login,
    };
    return json;
  }
}
