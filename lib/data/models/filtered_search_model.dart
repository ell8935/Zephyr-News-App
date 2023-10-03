import 'package:equatable/equatable.dart';

class FilteredSearchEntity extends Equatable {
  final String keywords;
  // final String sortBy;
  // final String to;
  // final String from;

  const FilteredSearchEntity({
    required this.keywords,
    // required this.sortBy,
    // required this.to,
    // required this.from,
  });

  FilteredSearchEntity copyWith({
    String? keywords,
    // String? sortBy,
    // String? to,
    // String? from,
  }) {
    return FilteredSearchEntity(
      keywords: keywords ?? this.keywords,
      // sortBy: sortBy ?? this.sortBy,
      // to: to ?? this.to,
      // from: from ?? this.from,
    );
  }

  factory FilteredSearchEntity.fromJson(Map<String, dynamic> json) {
    return FilteredSearchEntity(
      keywords: json['keywords'] ?? "",
      // sortBy: json['sortBy'] ?? "",
      // to: json['to'] ?? "",
      // from: json['from'] ?? "",
    );
  }

  @override
  List<Object?> get props => [
        keywords,
        // sortBy,
        // to,
        // from,
      ];
}
