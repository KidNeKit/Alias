import 'dart:developer';

import 'package:flutter/material.dart';

import '../models/enums/difficulty_level.dart';
import '../models/enums/win_points.dart';
import '../models/pack.dart';
import '../models/team.dart';

class GameViewModel with ChangeNotifier {
  WinPoints? _winPoints;
  Pack? _selectedPack;
  DifficultyLevel? _level;
  final List<Team> _teams = [
    Team.initial(),
    Team.initial(),
  ];

  WinPoints? get winPoints => _winPoints;
  DifficultyLevel? get level => _level;
  int get teamQuantity => _teams.length;
  Pack? get selectedPack => _selectedPack;

  set setSelectedPack(Pack pack) {
    _selectedPack = pack;
    notifyListeners();
  }

  set setWinPoints(WinPoints points) {
    _winPoints = points;
    notifyListeners();
  }

  set setPack(Pack pack) {
    _selectedPack = pack;
    notifyListeners();
  }

  set setLevel(DifficultyLevel level) {
    _level = level;
    notifyListeners();
  }

  void clearPack() {
    _selectedPack = null;
    _level = null;
    notifyListeners();
  }

  void clearGameData() {
    _winPoints = null;
    _selectedPack = null;
    _level = null;
    notifyListeners();
  }

  bool isDataValid() {
    if (_selectedPack == null) {
      log('Please choose pack');
      return false;
    }
    if (_level == null) {
      log('Please choose difficulty level');
      return false;
    }
    if (_winPoints == null) {
      log('Please choose win points');
      return false;
    }
    log('All fields are valid!');
    return true;
  }

  void resetData() {
    Team.resetLastPosition();
    _teams
      ..clear()
      ..addAll([Team.initial(), Team.initial()]);
  }

  void addTeam() {
    if (teamQuantity < 4) {
      _teams.add(Team.initial());
      log(_teams.toString());
      notifyListeners();
    }
  }

  void removeTeam() {
    if (teamQuantity > 2) {
      _teams.removeLast();
      Team.reduceLastPosition();
      notifyListeners();
    }
  }

  void changeTeamName(int position, String name) {
    _teams[position].setName = name;
  }

  bool isTeamsValid() {
    return _teams.every((element) => element.name.isNotEmpty);
  }

  void clearSelectedPack() {
    _selectedPack = null;
    notifyListeners();
  }
}
