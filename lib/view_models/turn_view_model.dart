import 'dart:async';
import 'dart:developer';

import 'package:alias/view_models/game_view_model.dart';
import 'package:flutter/material.dart';

import '../models/team.dart';

class TurnViewModel with ChangeNotifier {
  List<String> _words = [];
  Team? _team;
  int _secondsLeft = 0;
  String? _showedWord;
  bool _isTurnBlocked = false;
  int _wordIndex = 0;

  List<String> _shownWords = [];
  List<String> _correctWords = [];

  GameViewModel? _gameViewModel;

  List<String> get words => _words;
  String get showedWord => _showedWord ?? 'Skibidi loading';
  int get secondsLeft => _secondsLeft;
  bool get isTurnBlocked => _isTurnBlocked;

  TurnViewModel({GameViewModel? gameViewModel})
      : _gameViewModel = gameViewModel {
    if (_gameViewModel != null) {
      _team = _gameViewModel!.playingTeam;
      _words = _gameViewModel!.packWords;
    }
  }

  void startTurn() {
    _secondsLeft = 60;
    _showedWord = _words[_wordIndex];
    _shownWords.add(_words[_wordIndex]);
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (secondsLeft == 1) {
          _isTurnBlocked = true;
          timer.cancel();
          log('answered correct: $_correctWords');
        }
        _secondsLeft--;
        notifyListeners();
      },
    );
  }

  void markWordAsCorrect() {
    _correctWords.add(_showedWord!);
    nextWord();
  }

  void markWordAsSkiped() {}

  void nextWord() {
    _showedWord = _words[++_wordIndex];
    notifyListeners();
  }
}
