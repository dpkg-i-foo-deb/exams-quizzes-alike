import 'dart:ffi';

class Exam {
  final int maxGrade;
  final int minGrade;
  final String hour;
  final int weight;
  final int numbQuestions;
  final String name;
  final String description;
  final String limitTime;
  final int categoryCode;
  final String teacherEmail;

  const Exam({
    required this.maxGrade,
    required this.minGrade,
    required this.hour,
    required this.weight,
    required this.numbQuestions,
    required this.name,
    required this.description,
    required this.limitTime,
    required this.categoryCode,
    required this.teacherEmail,
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
      maxGrade: json['nota_maxima'],
      minGrade: json['nota_minima'],
      hour: json['hora'],
      weight: json['peso_examen'],
      numbQuestions: json['cantidad_preguntas'],
      name: json['nombre'],
      description: json['descripcion'],
      limitTime: json['tiempo_limite'],
      categoryCode: json['codigo_categoria'],
      teacherEmail: json['codigo_docente'],
    );
  }

  Map<String, dynamic> toJson() => {
        'nota_maxima': maxGrade,
        'nota_minima': minGrade,
        'hora': hour,
        'peso_examen': weight,
        'cantidad_preguntas': numbQuestions,
        'nombre': name,
        'descripcion': description,
        'tiempo_limite': limitTime,
        'codigo_categoria': categoryCode,
        'codigo_docente': teacherEmail,
      };
}
