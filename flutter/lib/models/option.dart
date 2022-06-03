class Option {
  final String code;
  final String description;
  final String correctAnswer;
  final String missingWord;
  final String sortOrder;
  final String pair;

  Option({
    required this.code,
    required this.description,
    required this.correctAnswer,
    required this.missingWord,
    required this.pair,
    required this.sortOrder,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      code: json['codigo_opcion'].toString(),
      description: json['descripcion'],
      correctAnswer: json['respuesta_correcta'],
      missingWord: json['palabra_faltante'],
      sortOrder: json['orden'].toString(),
      pair: json['pareja'],
    );
  }
}
