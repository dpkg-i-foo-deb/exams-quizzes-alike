class Exam {
  final int? code;
  final int maxGrade;
  final int minGrade;
  final double weight;
  final int numbQuestions;
  final String name;
  final String description;
  final String limitTime;
  final int categoryCode;
  final String teacherEmail;
  int? topic;

  Exam({
    required this.maxGrade,
    required this.minGrade,
    required this.weight,
    required this.numbQuestions,
    required this.name,
    required this.description,
    required this.limitTime,
    required this.categoryCode,
    required this.teacherEmail,
    this.topic,
    this.code,
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
      maxGrade: int.parse(json['nota_maxima']),
      minGrade: int.parse(json['nota_minima']),
      weight: double.parse(json['peso_examen']),
      numbQuestions: json['cantidad_preguntas'],
      name: json['nombre'],
      description: json['descripcion'],
      limitTime: json['tiempo_limite'],
      categoryCode: json['codigo_categoria'],
      teacherEmail: json['codigo_docente'],
      code: json['codigo_examen'],
    );
  }

  Map<String, dynamic> toJson() => {
        'maxGrade': maxGrade.toString(),
        'minGrade': minGrade.toString(),
        'weight': weight.toString(),
        'numbQuestions': numbQuestions.toString(),
        'name': name,
        'description': description,
        'limitTime': limitTime,
        'categoryCode': categoryCode.toString(),
        'teacherEmail': teacherEmail,
        'exam_code': code.toString(),
      };
}
