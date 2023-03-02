import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/team_memory.dart';
import 'base_teams_repository.dart';

class TeamsRepository extends BaseTeamsRepository {
  @override
  Future<TeamMemory> getTeamById(String id) async {
    var prefs = await SharedPreferences.getInstance();
    String team = prefs.getString('teams') ?? '';
    List<dynamic> jsonList = team.isEmpty ? [] : jsonDecode(team);
    return jsonList
        .map((e) => TeamMemory.fromJson(e))
        .firstWhere((element) => element.id == id);
  }

  @override
  Future<List<TeamMemory>> getTeams() async {
    var prefs = await SharedPreferences.getInstance();
    String team = prefs.getString('teams') ?? '';
    List<dynamic> jsonList = team.isEmpty ? [] : jsonDecode(team);
    List<TeamMemory> teams =
        jsonList.map((e) => TeamMemory.fromJson(e)).toList();
    return teams;
  }

  @override
  Future<TeamMemory> createTeam(TeamMemory team) async {
    var prefs = await SharedPreferences.getInstance();
    List<TeamMemory> teams = await getTeams();
    teams.add(team);
    log(jsonEncode(teams));
    await prefs
        .setString('teams', jsonEncode(teams))
        .then((isSuccessed) => log('is success: $isSuccessed'));
    return team;
  }

  @override
  Future<TeamMemory> updateTeam(TeamMemory team) async {
    return TeamMemory.initial();
  }
}
