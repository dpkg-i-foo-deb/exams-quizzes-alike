class Topic {
  final String code;
  final String description;
  final String unitCode;

  const Topic({
    required this.code,
    required this.description,
    required this.unitCode,
  });

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      code: json['codigo_tema'].toString(),
      description: json['descripcion'],
      unitCode: json['codigo_unidad'].toString(),
    );
  }
}
