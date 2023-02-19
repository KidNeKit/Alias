import 'enums/difficulty_level.dart';

class Pack {
  final String _id;
  final String _name;
  final DifficultyLevel _level;
  final Set<String> _words;

  Pack(
      {required String id,
      required String name,
      required DifficultyLevel level,
      required Set<String> words})
      : _id = id,
        _name = name,
        _level = level,
        _words = words;

  String get id => _id;
  String get name => _name;
  DifficultyLevel get level => _level;
  Set<String> get words => _words;
}
