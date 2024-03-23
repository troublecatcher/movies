import 'package:hive/hive.dart';
import 'package:movies/data/emotion.dart';

part 'movie.g.dart';

@HiveType(typeId: 1)
class Movie {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String director;
  @HiveField(2)
  final Emotion emotion;
  @HiveField(3)
  final String? comment;
  @HiveField(4)
  final int? rate;

  Movie({
    required this.title,
    required this.director,
    required this.emotion,
    this.comment,
    this.rate,
  });

  Movie copyWith({
    String? title,
    String? director,
    Emotion? emotion,
    String? comment,
    int? rate,
  }) {
    return Movie(
      title: title ?? this.title,
      director: director ?? this.director,
      emotion: emotion ?? this.emotion,
      comment: comment ?? this.comment,
      rate: rate ?? this.rate,
    );
  }
}
