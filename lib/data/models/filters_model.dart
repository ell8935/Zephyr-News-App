import 'package:equatable/equatable.dart';

class FiltersEntity extends Equatable {
  final String? keywords;
  final String? from;
  final String? to;
  final String? sortBy;

  const FiltersEntity({
    this.keywords,
    this.from,
    this.to,
    this.sortBy,
  });

  // Add a copyWith method to create a new instance with updated values
  FiltersEntity copyWith({
    String? keywords,
    String? from,
    String? to,
    String? sortBy,
  }) {
    return FiltersEntity(
      keywords: keywords ?? this.keywords,
      from: from ?? this.from,
      to: to ?? this.to,
      sortBy: sortBy ?? this.sortBy,
    );
  }

  factory FiltersEntity.fromJson(Map<String, dynamic> json) {
    return FiltersEntity(
      keywords: json['keywords'] ?? "",
      sortBy: json['sortBy'] ?? "",
      to: json['to'] ?? "",
      from: json['from'] ?? "",
    );
  }

  @override
  List<Object?> get props => [keywords, sortBy, to, from];
}
