import 'dart:developer';

import 'package:flutter/material.dart';

import '../models/team_memory.dart';
import '../repositories/teams_repository.dart';

class TeamsViewModel with ChangeNotifier {
  final TeamsRepository _teamsRepository = TeamsRepository();
  TeamMemory? _team;

  TeamMemory? get team => _team;

  Future<TeamMemory> getTeamById() async {
    return await _teamsRepository.getTeamById(_team!.id);
  }

  Future<List<TeamMemory>> getTeams() async {
    return await _teamsRepository.getTeams();
  }

  Future<TeamMemory> createTeam() async {
    return await _teamsRepository.createTeam(_team!);
  }

  void setEditableTeam({String? teamId}) async {
    if (teamId == null) {
      _team = TeamMemory.initial();
    } else {
      _team = await _teamsRepository.getTeamById(_team!.id);
    }
  }

  void wipeTeamChanges() {
    _team = null;
    notifyListeners();
  }

  void changeTeamName(String name) {
    _team?.setName = name;
    log('name changed: $name');
    notifyListeners();
  }
}
