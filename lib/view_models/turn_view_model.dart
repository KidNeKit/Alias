import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../models/team.dart';
import 'game_view_model.dart';

class TurnViewModel with ChangeNotifier {
  static const int _initialTurnTime = 3;
  final List<String> _packWords = [];
  final List<String> _shownWords = [];
  final List<String> _correctWords = [];

  bool _isTurnBlocked = false;
  int _secondsLeft = _initialTurnTime;
  int _wordIndex = 0;

  late Team _currentTeam;
  late Sink _streamSink;

  String get currentWord => _packWords[_wordIndex];
  int get secondsLeft => _secondsLeft;
  double get secondsLeftPercentage => _secondsLeft / _initialTurnTime * 100;
  bool get isTurnBlocked => _isTurnBlocked;
  List<String> get correctWords => _correctWords;
  List<String> get shownWords => _shownWords;

  set setGameViewModel(GameViewModel? gameViewModel) {
    if (gameViewModel != null) {
      _packWords.addAll([...gameViewModel.packWords]);
      _currentTeam = gameViewModel.playingTeam;
      _streamSink = gameViewModel.turnResults.sink;
    }
  }

  void _refreshState() {
    _secondsLeft = _initialTurnTime;
    _wordIndex = 0;
    _isTurnBlocked = false;
    _packWords.shuffle();
    _shownWords.clear();
    _correctWords.clear();
  }

  void startTurn() {
    log('start turn');
    _refreshState();
    _shownWords.add(currentWord);
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        _secondsLeft--;
        if (_secondsLeft == 0) {
          _isTurnBlocked = true;
          timer.cancel();
        }
        notifyListeners();
      },
    );
  }

  void markWordAsCorrect() {
    _correctWords.add(currentWord);
    nextWord();
  }

  void nextWord() {
    if (!_isTurnBlocked) {
      _wordIndex++;
      _shownWords.add(currentWord);
      notifyListeners();
    } else {
      log('turn ended');
    }
  }

  void endTurn() {
    _streamSink.add(_correctWords.length);
    //_streamSink.close();
  }

  @override
  String toString() {
    return '$shownWords';
  }
}
