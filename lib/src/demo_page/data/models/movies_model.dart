import 'package:json_annotation/json_annotation.dart';

part 'movies_model.g.dart';

@JsonSerializable()
class MovieModel {
  final String title;
  final int year;
  final List<dynamic> cast;
  final List<String> genres;
  final String? href;
  final String? extract;
  final String? thumbnail;
  final int? thumbnailWidth;
  final int? thumbnailHeight;

  MovieModel({
    required this.title,
    required this.year,
    required this.cast,
    required this.genres,
    this.href,
    this.extract,
    this.thumbnail,
    this.thumbnailWidth,
    this.thumbnailHeight,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
