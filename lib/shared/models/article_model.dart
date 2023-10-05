import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final String url;
  final String title;
  final String author;
  final String content;
  final String urlToImage;
  final String publishedAt;
  final String description;

  const ArticleEntity({
    required this.url,
    required this.title,
    required this.author,
    required this.content,
    required this.urlToImage,
    required this.publishedAt,
    required this.description,
  });

  factory ArticleEntity.fromJson(Map<String, dynamic> json) {
    return ArticleEntity(
      url: json['url'] ?? "",
      title: json['title'] ?? "",
      author: json['author'] ?? "",
      content: json['content'] ?? "",
      urlToImage: json['urlToImage'] ?? "",
      publishedAt: json['publishedAt'] ?? "",
      description: json['description'] ?? "",
    );
  }

  @override
  List<Object?> get props => [
        url,
        title,
        author,
        content,
        urlToImage,
        publishedAt,
        description,
      ];
}
