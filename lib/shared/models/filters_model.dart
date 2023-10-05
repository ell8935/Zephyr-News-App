import 'package:equatable/equatable.dart';

class FiltersEntity extends Equatable {
  final String? to;
  final String? from;
  final String? keywords;

  const FiltersEntity({
    this.to,
    this.from,
    this.keywords,
  });

  FiltersEntity copyWith({
    String? to,
    String? from,
    String? keywords,
  }) {
    return FiltersEntity(
      to: to ?? this.to,
      from: from ?? this.from,
      keywords: keywords ?? this.keywords,
    );
  }

  @override
  List<Object?> get props => [keywords, to, from];
}
