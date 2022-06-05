class ExamCategory {
  final int examCategoryCode;
  final String examCategoryDescription;

  const ExamCategory({
    required this.examCategoryCode,
    required this.examCategoryDescription,
  });

  factory ExamCategory.fromJson(Map<String, dynamic> json) {
    return ExamCategory(
      examCategoryCode: json['codigo_categoria'],
      examCategoryDescription: json['descripcion'],
    );
  }
}
