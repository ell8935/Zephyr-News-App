import 'package:equatable/equatable.dart';

class FilteredSearchEntity extends Equatable {
  final String? keywords;
  final String? from;
  final String? to;
  final String? sortBy;

  const FilteredSearchEntity({
    this.keywords,
    this.from,
    this.to,
    this.sortBy,
  });

  // Add a copyWith method to create a new instance with updated values
  FilteredSearchEntity copyWith({
    String? keywords,
    String? from,
    String? to,
    String? sortBy,
  }) {
    return FilteredSearchEntity(
      keywords: keywords ?? this.keywords,
      from: from ?? this.from,
      to: to ?? this.to,
      sortBy: sortBy ?? this.sortBy,
    );
  }

  factory FilteredSearchEntity.fromJson(Map<String, dynamic> json) {
    return FilteredSearchEntity(
      keywords: json['keywords'] ?? "",
      sortBy: json['sortBy'] ?? "",
      to: json['to'] ?? "",
      from: json['from'] ?? "",
    );
  }

  @override
  List<Object?> get props => [keywords, sortBy, to, from];
}
