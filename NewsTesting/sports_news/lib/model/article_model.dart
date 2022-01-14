class ArticleModel {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlImage;
  final String content;
  final DateTime? publishedAt;

  ArticleModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlImage,
    required this.content,
    this.publishedAt,
  });
}
