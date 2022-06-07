import 'package:exams_quizzes_alike/exceptions/student_exam_report_exception.dart';
import 'package:exams_quizzes_alike/models/reports/student_exam_report.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StudentExamReportRequests {
  Future<List<StudentExamReport>> getStudentExamReports() async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/student-exam-report'));

    if (response.statusCode == 204) {
      throw StudentExamReportException('No reports found');
    }

    if (response.statusCode == 200) {
      List<StudentExamReport> reports = (json.decode(response.body) as List)
          .map((data) => StudentExamReport.fromJson(data))
          .toList();

      return reports;
    }

    throw StudentExamReportException('Something went wrong');
  }
}
