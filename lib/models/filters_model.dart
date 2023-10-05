import 'package:equatable/equatable.dart';

class FiltersEntity extends Equatable {
  final String? to;
  final String? from;
  final String? sortBy;
  final String? keywords;

  const FiltersEntity({
    this.to,
    this.from,
    this.sortBy,
    this.keywords,
  });

  FiltersEntity copyWith({
    String? to,
    String? from,
    String? sortBy,
    String? keywords,
  }) {
    return FiltersEntity(
      to: to ?? this.to,
      from: from ?? this.from,
      sortBy: sortBy ?? this.sortBy,
      keywords: keywords ?? this.keywords,
    );
  }

  @override
  List<Object?> get props => [keywords, sortBy, to, from];
}
