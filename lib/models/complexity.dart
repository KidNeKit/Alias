import 'package:alias/models/enums/difficulty_level.dart';

class Complexity {
  DifficultyLevel level;
  Set<String> words;

  Complexity({required this.level, required this.words});

  static Complexity fromJson(Map<String, dynamic> json) {
    return Complexity(
        level: DifficultyLevel.getLevelByName(json['level']),
        words: (json['words'] as List).map((e) => e.toString()).toSet());
  }

  @override
  String toString() {
    return 'level: $level, words: $words';
  }
}
