enum DifficultyLevel {
  easy,
  medium,
  hard,
  insane;

  static DifficultyLevel getLevelByName(String name) {
    return values.firstWhere((element) => element.name == name);
  }
}
