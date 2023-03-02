import 'dart:developer';

import 'package:flutter/material.dart';

import '../models/enums/difficulty_level.dart';
import '../models/enums/win_points.dart';
import '../models/pack.dart';
import '../models/team_memory.dart';

class GameSettingsViewModel with ChangeNotifier {
  final List<TeamMemory> _teams = [];
  Pack? _selectedPack;
  DifficultyLevel? _level;
  WinPoints? _winPoints;
  bool _isConfigured = false;

  int get teamQuantity => _teams.length;
  List<TeamMemory> get teams => _teams;
  Pack? get selectedPack => _selectedPack;
  DifficultyLevel? get level => _level;
  WinPoints? get winPoints => _winPoints;
  bool get isConfigured => _isConfigured;

  set setPack(Pack? pack) {
    _selectedPack = pack;
    if (pack == null) {
      _level = null;
    }
    notifyListeners();
  }

  set setLevel(DifficultyLevel level) {
    _level = level;
    notifyListeners();
  }

  set setWinPoints(WinPoints points) {
    _winPoints = points;
    notifyListeners();
  }

  bool isTeamSelected(String id) {
    return [..._teams].map((e) => e.id).contains(id);
  }

  void selectTeam(TeamMemory team) {
    if (_teams.where((element) => element.id == team.id).isNotEmpty) {
      _teams.removeWhere((element) => element.id == team.id);
    } else {
      if (_teams.length < 4) {
        _teams.add(team);
      }
    }
    notifyListeners();
  }

  void wipePack() {
    _selectedPack = null;
    _level = null;
    _winPoints = null;
  }

  void wipeTeams() {
    _teams.clear();
  }

  bool isTeamsValid() {
    return teamQuantity >= 2 && teamQuantity <= 4;
  }

  bool isPackValid() {
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
    _isConfigured = true;
    return true;
  }
}
