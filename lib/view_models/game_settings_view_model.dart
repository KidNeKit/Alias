import 'package:flutter/material.dart';

import '../models/team_memory.dart';

class GameSettingsViewModel with ChangeNotifier {
  final List<TeamMemory> _teams = [];

  int get teamQuantity => _teams.length;

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

  void wipeGameSettings() {
    _teams.clear();
  }

  bool isTeamsValid() {
    return teamQuantity >= 2 && teamQuantity <= 4;
  }
}
