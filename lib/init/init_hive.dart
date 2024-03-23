import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies/data/emotion.dart';
import 'package:movies/data/movie.dart';
import 'package:movies/main.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(EmotionAdapter());
  Hive.registerAdapter(MovieAdapter());
  movieBox = await Hive.openBox('stocks');
}
