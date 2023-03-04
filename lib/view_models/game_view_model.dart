import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

import '../models/enums/difficulty_level.dart';
import '../models/enums/win_points.dart';
import '../models/pack.dart';
import '../models/team_playing.dart';

class GameViewModel with ChangeNotifier {
  WinPoints? _winPoints;
  Pack? _pack;
  DifficultyLevel? _level;
  List<TeamPlaying>? _teams;

  late int _turn;
  late int _playingTeamIndex;
  late bool _isGameEnded;
  late bool _isLastTurn;

  PublishSubject turnResults = PublishSubject();

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
        _isGameEnded = true;
      }
    } else {
      _playingTeamIndex++;
    }
  }

  @override
  String toString() {
    return '';
  }
}
