import 'package:alias/models/team_memory.dart';

class TeamPlaying {
  final String _teamId;
  final String _teamName;
  int _points;

  TeamPlaying({
    required String teamId,
    required String teamName,
  })  : _teamId = teamId,
        _teamName = teamName,
        _points = 0;

  TeamPlaying.fromTeam(TeamMemory team)
      : _teamId = team.id,
        _teamName = team.name,
        _points = 0;

  String get teamName => _teamName;
  int get points => _points;

  void addPoints(int points) => _points += points;
}
