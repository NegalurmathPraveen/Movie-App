// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      title: json['title'] as String,
      year: (json['year'] as num).toInt(),
      cast: json['cast'] as List<dynamic>,
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      href: json['href'] as String?,
      extract: json['extract'] as String?,
      thumbnail: json['thumbnail'] as String?,
      thumbnailWidth: (json['thumbnailWidth'] as num?)?.toInt(),
      thumbnailHeight: (json['thumbnailHeight'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'year': instance.year,
      'cast': instance.cast,
      'genres': instance.genres,
      'href': instance.href,
      'extract': instance.extract,
      'thumbnail': instance.thumbnail,
      'thumbnailWidth': instance.thumbnailWidth,
      'thumbnailHeight': instance.thumbnailHeight,
    };
