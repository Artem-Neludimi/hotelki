class CategoryStoryData {
  CategoryStoryData({
    required this.name,
    required this.description,
    required this.link,
    required this.isImportant,
    required this.imageUrls,

  });

  final String name;
  final String description;
  final String link;
  final bool isImportant;
  final List<String> imageUrls;
}
