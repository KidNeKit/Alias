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
}
