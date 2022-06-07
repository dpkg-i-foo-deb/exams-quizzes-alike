class CourseUtils {
  Map<String, dynamic> getCourseJson(int code) {
    Map<String, dynamic> json = {
      'course_code': code.toString(),
    };

    return json;
  }
}
