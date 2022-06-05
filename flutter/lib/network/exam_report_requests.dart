import 'package:exams_quizzes_alike/exceptions/exam_report_exception.dart';
import 'package:exams_quizzes_alike/models/exam_report.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ExamReportRequests {
  Future<List<ExamReport>> getExamReports() async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/exam-report'));

    if (response.statusCode == 204) {
      throw ExamReportException('No reports found');
    }

    if (response.statusCode == 200) {
      List<ExamReport> reports = (json.decode(response.body) as List)
          .map((data) => ExamReport.fromJson(data))
          .toList();

      return reports;
    }

    throw ExamReportException('Something went wrong');
  }
}
