class SeoTask {
  final String title;
  final String instructions;
  final String youtube;
  final String category;

  SeoTask({
    required this.title,
    required this.instructions,
    required this.youtube,
    required this.category
  });

  factory SeoTask.fromJson(Map<String, dynamic> json) {
    return SeoTask(
      title: json['title'] ?? '',
      instructions: json['instructions'] ?? '',
      youtube: json['youtube'] ?? '', 
      category:json["category"]?? '',
    );
  }
}
