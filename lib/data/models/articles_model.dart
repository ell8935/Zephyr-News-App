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

  ArticleEntity copyWith({
    String? url,
    String? title,
    String? author,
    String? content,
    String? urlToImage,
    String? publishedAt,
    String? description,
  }) {
    return ArticleEntity(
      url: url ?? this.url,
      title: title ?? this.title,
      author: author ?? this.author,
      content: content ?? this.content,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      description: description ?? this.description,
    );
  }

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
