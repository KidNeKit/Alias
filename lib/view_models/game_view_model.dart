import 'package:flutter/material.dart';

import '../models/enums/difficulty_level.dart';
import '../models/enums/win_points.dart';
import '../models/pack.dart';

class GameViewModel with ChangeNotifier {
  WinPoints? _winPoints;
  Pack? _pack;
  DifficultyLevel? _level;

  WinPoints? get winPoints => _winPoints;
  Pack? get pack => _pack;
  DifficultyLevel? get level => _level;

  set setWinPoints(WinPoints points) {
    _winPoints = points;
    notifyListeners();
  }

  set setPack(Pack pack) => _pack = pack;

  set setLevel(DifficultyLevel level) {
    _level = level;
    notifyListeners();
  }
}
