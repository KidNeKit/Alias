import 'dart:developer';

import 'package:alias/models/team.dart';
import 'package:alias/repositories/team_repository.dart';
import 'package:flutter/material.dart';

class TeamViewModel with ChangeNotifier {
  final TeamRepository _teamRepository = TeamRepository();
  final List<Team> _teams = [
    Team.initial(),
    Team.initial(),
  ];

  int get teamQuantity => _teams.length;

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
}
