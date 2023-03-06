import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

import '../models/enums/difficulty_level.dart';
import '../models/enums/win_points.dart';
import '../models/pack.dart';
import '../models/team_memory.dart';
import '../models/team_playing.dart';
import '../repositories/teams_repository.dart';

class GameViewModel with ChangeNotifier {
  WinPoints? _winPoints;
  Pack? _pack;
  DifficultyLevel? _level;
  List<TeamPlaying>? _teams;

  int _turn = 0;
  int _playingTeamIndex = 0;
  bool _isGameEnded = false;
  bool _isLastTurn = false;

  PublishSubject turnResults = PublishSubject();
  final TeamsRepository _teamsRepository = TeamsRepository();

  GameViewModel.initial() {
    log('created subscription');
  }

  GameViewModel({
    required List<TeamPlaying> teams,
    required Pack pack,
    required DifficultyLevel level,
    required WinPoints winPoints,
  })  : _teams = teams,
        _pack = pack,
        _level = level,
        _winPoints = winPoints {
    setDefaultValues();

    turnResults.listen((value) {
      log('message received: $value');
      playingTeam.addPoints(value);
      if (playingTeam.points >= _winPoints!.value) {
        _isLastTurn = true;
      }
      nextTeamTurn();
    });
  }

  WinPoints? get winPoints => _winPoints;
  DifficultyLevel? get level => _level;
  int get teamQuantity => _teams!.length;
  int get turn => _turn;
  Pack get selectedPack => _pack!;
  bool get isGameEnded => _isGameEnded;
  TeamPlaying get playingTeam => _teams![_playingTeamIndex];
  List<TeamPlaying> get teams => _teams!;
  List<String> get packWords =>
      _pack!.levels.firstWhere((element) => element.level == level!).words;

  TeamPlaying get winner {
    int maxPoints = _teams!.map((e) => e.points).reduce(math.max);
    return _teams!.firstWhere((element) => element.points == maxPoints);
  }

  set setTurn(int turn) => _turn = turn;

  void setDefaultValues() {
    _turn = 1;
    _playingTeamIndex = 0;
    _isGameEnded = false;
    _isLastTurn = false;
    for (var e in _teams!) {
      e.setPoints = 0;
    }
  }

  void increasePlayingTeamIndex() {
    if (_playingTeamIndex == teamQuantity - 1) {
      _playingTeamIndex = 0;
    } else {
      _playingTeamIndex++;
    }
  }

  void nextTeamTurn() {
    if (_playingTeamIndex == _teams!.length - 1) {
      if (!_isLastTurn) {
        _playingTeamIndex = 0;
        _turn++;
      } else {
        _saveResults();
      }
    } else {
      _playingTeamIndex++;
    }
  }

  void _saveResults() async {
    _isGameEnded = true;
    TeamMemory teamWinner = await _teamsRepository.getTeamById(winner.id);
    teamWinner.markAsWinner();
    var savedWinner = await _teamsRepository.updateTeam(teamWinner);
    log(savedWinner.toString());
    [..._teams!]
      ..removeWhere((element) => element.id == teamWinner.id)
      ..forEach((element) async {
        TeamMemory teamLoser = await _teamsRepository.getTeamById(element.id);
        teamLoser.markAsLoser();
        var savedLoser = await _teamsRepository.updateTeam(teamLoser);
        log(savedLoser.toString());
      });
  }

  bool isRequiredFieldsFilled() {
    return _winPoints != null &&
        _level != null &&
        _teams != null &&
        _pack != null;
  }

  @override
  String toString() {
    return {
      'winPoints': _winPoints,
      'level': _level,
      'teams': _teams,
      'pack': _pack?.name ?? 'empty',
      'turn': _turn,
      'playingTeamIndex': _playingTeamIndex,
      'isGameEnded': _isGameEnded,
      'isLastTurn': _isLastTurn,
    }.toString();
  }
}
