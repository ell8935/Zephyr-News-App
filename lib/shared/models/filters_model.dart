import 'package:equatable/equatable.dart';

class FiltersEntity extends Equatable {
  final String? to;
  final String? from;
  final String? keywords;
  final String? category;

  const FiltersEntity({
    this.to,
    this.from,
    this.keywords,
    this.category,
  });

  FiltersEntity copyWith({
    String? to,
    String? from,
    String? keywords,
    String? category,
  }) {
    return FiltersEntity(
      to: to ?? this.to,
      from: from ?? this.from,
      keywords: keywords ?? this.keywords,
      category: category ?? this.category,
    );
  }

  @override
  List<Object?> get props => [keywords, to, from, category];
}
