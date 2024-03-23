import 'package:hive/hive.dart';

part 'emotion.g.dart';

@HiveType(typeId: 0)
enum Emotion {
  @HiveField(0)
  good('assets/icons/face_good.svg', 'I like it'),
  @HiveField(1)
  decent('assets/icons/face_decent.svg', 'I don\'t care'),
  @HiveField(2)
  bad('assets/icons/face_bad.svg', 'I don\'t like it');

  final String assetPath;
  final String description;

  const Emotion(this.assetPath, this.description);
}
