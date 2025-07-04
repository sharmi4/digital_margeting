class GeneratedContent {
  final List<String> titles;
  final String description;
  final List<String> hashtags;

  GeneratedContent({
    required this.titles,
    required this.description,
    required this.hashtags,
  });

  factory GeneratedContent.fromRawText(String rawText) {
    final lines = rawText.split('\n');
    // Extract all lines that contain 'title:'
    final titles = lines
        .where((line) => line.toLowerCase().contains('title:'))
        .map((line) => line.replaceAll(RegExp(r'\*?Title:\*?\s*', caseSensitive: false), '').trim())
        .toList();

    final descriptionLine = lines.firstWhere(
      (line) => line.toLowerCase().contains('description:'),
      orElse: () => '',
    );
    final description = descriptionLine.replaceAll(RegExp(r'\*?Description:\*?\s*', caseSensitive: false), '').trim();

    final hashtagLine = lines.firstWhere((line) => line.contains('#'), orElse: () => '');
    final hashtags = hashtagLine.split(' ').where((word) => word.startsWith('#')).toList();

    return GeneratedContent(
      titles: titles,
      description: description,
      hashtags: hashtags,
    );
  }
}
