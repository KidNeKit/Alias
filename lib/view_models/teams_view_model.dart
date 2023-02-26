import 'package:flutter/cupertino.dart';

import '../models/team_memory.dart';
import '../repositories/teams_repository.dart';

class TeamsViewModel with ChangeNotifier {
  final TeamsRepository _teamsRepository = TeamsRepository();

  Future<List<TeamMemory>> getTeams() async {
    return await _teamsRepository.getTeams();
  }

  Future<TeamMemory> createTeam() async {
    return await _teamsRepository.createTeam(TeamMemory.initial());
  }
}
