class ExamPresentation {
  final String courseStudentCode;
  final String examCode;
  final String grade;
  String? code;
  final String date;
  final String time;
  String? ipAddr;

  ExamPresentation({
    required this.courseStudentCode,
    this.code,
    this.ipAddr,
    //required this.code,
    required this.grade,
    required this.date,
    required this.time,
    required this.examCode,
    //required this.ipAddr,
  });

  factory ExamPresentation.fromJson(Map<String, dynamic> json) {
    return ExamPresentation(
      code: json['codigo_matricula'].toString(),
      examCode: json['codigo_examen'].toString(),
      grade: json['nota_examen'],
      date: json['fecha_presentacion'],
      time: json['tiempo_presentacion'],
      ipAddr: json['ip'],
      courseStudentCode: json['codigo_matricula'],
    );
  }

  Map<String, dynamic> toJson() => {
        'course_student_code': courseStudentCode,
        'exam_code': examCode,
        'grade': grade,
        'date': date,
        'time': time,
      };
}
