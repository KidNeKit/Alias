import '../models/team_memory.dart';

abstract class BaseTeamsRepository {
  Future<List<TeamMemory>> getTeams();

  Future<TeamMemory> createTeam(TeamMemory team);

  Future<TeamMemory> updateTeam(TeamMemory team);
}
