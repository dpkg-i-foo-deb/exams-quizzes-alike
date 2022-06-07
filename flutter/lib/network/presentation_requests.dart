import 'package:exams_quizzes_alike/exceptions/exam_presentation_exception.dart';
import 'package:exams_quizzes_alike/models/exam_presentation.dart';
import 'package:exams_quizzes_alike/models/utils/exam_presentation_utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PresentationRequests {
  Future<ExamPresentation> createPresentation(
      ExamPresentation presentation) async {
    final response = await http.post(
        Uri.parse('http://localhost:3000/create-presentation'),
        body: presentation.toJson());

    if (response.statusCode != 200) {
      throw ExamPresentationException(
          'Something went wrong, it was not possible to create the presentation');
    }

    if (response.statusCode == 200) {
      var data = json.decode(response.body)[0];
      var code = data['codigo_presentacion'];

      ExamPresentation returnedPresentation = await getPresentation(code);
      return returnedPresentation;
    }

    throw ExamPresentationException('Something went wrong');
  }

  Future<ExamPresentation> getPresentation(String code) async {
    final response = await http.post(
        Uri.parse('http://localhost:3000/get-presentation'),
        body: ExamPresentationUtils().codeJson(code));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return ExamPresentation.fromJson(data[0]);
    }

    if (response.statusCode != 200) {
      throw ExamPresentationException('Something went wrong');
    }

    throw ExamPresentationException('Something went wrong');
  }
}
